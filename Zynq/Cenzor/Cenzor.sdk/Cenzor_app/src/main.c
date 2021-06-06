/*
 * main.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"

#include "xparameters.h"
#include "Cenzor_ip.h"

#define CENZOR_BASE_ADDR XPAR_CENZOR_IP_0_S00_AXI_BASEADDR

const int badWordsMaxNumber = 10;
const int wordLength = 15;
int readLetters = 0;
int badWordsNumber = 0;
char badWords[150];

char text[1000];

char dc = '#';

int state = 0;

u32 read1DigitDecVal()
{
	u32 ret = 0;
	char8 c;
    outbyte ( c = inbyte() );
    ret += (c - '0');
    return ret;
}

u32 read2DigitDecVal()
{
	u32 ret = 0;
	char8 c;
    outbyte ( c = inbyte() );
    ret += 10 * (c - '0');
    outbyte ( c = inbyte() );
    ret += (c - '0');
    return ret;
}

void read15char(int wordNumber)
{
	char8 c;

    for (int i=0;i<wordLength;i++)
    {
    	outbyte ( c = inbyte() );
    	badWords[wordLength * wordNumber + i] = c;
    }
}

void doCredencials()
{
	print("----------------------------------------------\n\r");
	print("       ____                     _  _          \n\r");
	print("      / ___| ___  _ __   ____ _| || |_  _ __  \n\r");
	print("     | |    / _ \\| '_ \\ |_  /|_  ..  _|| '__| \n\r");
	print("     | |___|  __/| | | | / / |_  ..  _|| |    \n\r");
	print("      \\____|\\___||_| |_|/___|  |_||_|  |_|    \n\r");
	print("\n\r");
	print("                      by:\n\r");
	print("                Michal Czwornog\n\r");
	print("                 Szymon Adamus\n\r");
	print("\n\r");
	print("\n\r");
}

void runMainMenu()
{
	doCredencials();

	print("1. Cenzuruj tekst\n\r");
	print("2. Pokaz slowa zabronione\n\r");
	print("3. Zmien slowa zabronione\n\r");

	int a = 0;
	print("Podaj odpowiednia opcje:\n\r");
	a = read1DigitDecVal();

	switch (a)
	{
	case 1:
		state = 1;
		break;

	case 2:
		state = 2;
		break;

	case 3:
		state = 3;
		break;

	default:
		break;
	}

}

void runShowWords()
{
	doCredencials();

	print("Zabronione slowa to:\n\r");

	for (int i = 0; i < badWordsNumber; i++)
	{
		xil_printf("%d. ", i + 1);

		for (int j = 0; j < wordLength; j++)
		{
			xil_printf("%c", badWords[j + wordLength * i]);
		}
		print("\n\r");
	}

	print("Nacisnj dowolny klawisz by kontynlowac...\n\r");
	read1DigitDecVal();
	state = 0;
}

void updateBadWords()
{
	for (int i=0;i<badWordsNumber;i++)
	{
		for (int j=0;j<wordLength;j++)
		{
			while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, badWords[i * wordLength + j]);
			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, (1 << 8) + badWords[i * wordLength + j]);
			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, badWords[i * wordLength + j]);
		}
	}

	for (int i=0;i<badWordsMaxNumber - badWordsNumber;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

		for (int j=0;j<wordLength;j++)
		{
			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, dc);
			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, (1 << 8) + dc);
			CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, dc);
		}

	}

	while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, dc);
}

void runChangeWords()
{
	doCredencials();

	print("Jak duzo bedzie zabronionych slow (00 - 10): ");
	badWordsNumber = read2DigitDecVal();
	if (badWordsNumber > badWordsMaxNumber)  badWordsNumber = badWordsMaxNumber;
	if (badWordsNumber < 0)  badWordsNumber = 0;

	print("\n\rWpisz slowa:\n\r");
	for (int i = 0; i < badWordsNumber; i++)
	{
		xil_printf("%d. ", i + 1);

		read15char(i);

		print("\n\r");
	}

	updateBadWords();

	state = 0;
}

void cenzorText(int letterNumber)
{

	readLetters = 0;

	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG0_OFFSET, 1);

	for (int i=0;i<letterNumber + wordLength + 1;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 2) != 2);

		u32 result = CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET);

		readLetters++;

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, text[i]);
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, (1 << 8) + text[i]);
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, text[i]);

		if(readLetters > wordLength + 1) xil_printf("%c", result >> 2);

	}

	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG0_OFFSET, 0);

}

void runCenzorAlgo()
{
	doCredencials();

	print("Prosze podac tekst do cenzorowania (enter zakonczy podawanie tekstu):\n\r");

	char8 c;
	int k=0;
	do
	{
		outbyte(c = inbyte());
		text[k] = c;
		k++;
	} while ((int)c != 13);

	print("\n\r\n\r");

	cenzorText(k);

	print("\n\r\n\rNacisnj dowolny klawisz by kontynlowac...\n\r");
	read1DigitDecVal();

	state = 0;
}

void runCenzor()
{
	while (1)
	{
		switch (state)
		{
		case 0:
			runMainMenu();
			break;

		case 1:
			runCenzorAlgo();
			break;

		case 2:
			runShowWords();
			break;

		case 3:
			runChangeWords();
			break;

		default:
			break;
		}
	}
}

int main()
{
    init_platform();

	updateBadWords();

    runCenzor();

}
