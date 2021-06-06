/*
 * main.c
 *
 *  Created on: 25.05.2021
 *      Author: Michal
 */

#include "xparameters.h"
#include "xgpio.h"
#include "Cenzor_ip.h"

#define CHANNEL 1

#define CENZOR_BASE_ADDR XPAR_CENZOR_IP_0_S00_AXI_BASEADDR


XGpio letterGpio, badLetterGpio, letterOutGpio;

char badWords2[30] = "jest###########randomowy######";
char badWords1[30] = "To#############powinien#######";
char myString[80] = "How are you. To jest jakis randomowy tekst, ktory powinien sluzyc jako przyklad.";

char dc = '&';

void updateBadWords()
{
	for (int i=0;i<30;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

		XGpio_DiscreteWrite(&badLetterGpio, CHANNEL, badWords1[i]);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, badWords1[i]);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, (1 << 8) + badWords1[i]);

		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 0);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, badWords1[i]);

	}

	for (int i=30;i<150;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

		XGpio_DiscreteWrite(&badLetterGpio, CHANNEL, dc);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, dc);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, (1 << 8) + dc);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET,dc);

	}

	while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 1) != 1);

	XGpio_DiscreteWrite(&badLetterGpio, CHANNEL, ' ');
	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG1_OFFSET, ' ');
}

void cenzorText()
{
	for (int i=0;i<80;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 2) != 2);

		u32 result = CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET);

		XGpio_DiscreteWrite(&letterOutGpio, CHANNEL, result >> 2);

		XGpio_DiscreteWrite(&letterGpio, CHANNEL, myString[i]);

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, myString[i]);
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, (1 << 8) + myString[i]);
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, myString[i]);
	}

	for (int i=0;i<20;i++)
	{
		while( (CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET) & 2) != 2);

		u32 result = CENZOR_IP_mReadReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG3_OFFSET);

		XGpio_DiscreteWrite(&letterOutGpio, CHANNEL, result >> 2);

		XGpio_DiscreteWrite(&letterGpio, CHANNEL, '-');

		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, '-');
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, (1 << 8) + '-');
		CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG2_OFFSET, '-');
	}
}

int main()
{
	int status;

	status = XGpio_Initialize(&letterGpio, XPAR_AXI_GPIO_LETTER_DEVICE_ID);
	if (status != XST_SUCCESS)
	{
		goto FAILURE;
	}
	XGpio_SetDataDirection(&letterGpio, CHANNEL, 0x0000);

	status = XGpio_Initialize(&badLetterGpio, XPAR_AXI_GPIO_BAD_LETTER_DEVICE_ID);
	if (status != XST_SUCCESS)
	{
		goto FAILURE;
	}
	XGpio_SetDataDirection(&badLetterGpio, CHANNEL, 0x0000);

	status = XGpio_Initialize(&letterOutGpio, XPAR_AXI_GPIO_LETTER_OUT_DEVICE_ID);
	if (status != XST_SUCCESS)
	{
		goto FAILURE;
	}
	XGpio_SetDataDirection(&letterOutGpio, CHANNEL, 0x0000);

	updateBadWords();

	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG0_OFFSET, 1);

	cenzorText();

	CENZOR_IP_mWriteReg(CENZOR_BASE_ADDR, CENZOR_IP_S00_AXI_SLV_REG0_OFFSET, 0);


	FAILURE:
		while(1);
}
