`timescale 1ns / 1ps

module Cenzor_TB;

localparam integer numberOfWords = 2;
localparam integer defaultWordLength = 15;
localparam integer numberOfBadWords = 1;
localparam integer myStringLength = 80;

reg clock;
reg reset;
reg start=1'b0;
reg [7:0] badLetterIn;
reg badLetterProcess;
reg badLetterEnable;
reg [7:0] letterIn;
reg letterProcess;
reg letterEnable;
reg [7:0] letterOut;

reg [(defaultWordLength * numberOfWords)-1:0][7:0] badWord = "jest###########randomowy######";
reg [myStringLength-1:0][7:0] myString = "How are you. To jest jakis randomowy tekst, ktory powinien sluzyc jako przyklad.";

integer myStringCounter = myStringLength-1;
integer badWordCounter = defaultWordLength*numberOfWords-1;

Cenzor #(numberOfWords, defaultWordLength) UnitUnderTest(clock, start, reset, badLetterIn, badLetterProcess, badLetterEnable, letterIn, letterProcess, letterEnable, letterOut);

// Clock 
initial
  clock <= 1'b1;
always
  #5 clock <= ~clock;
  
// Reset
initial
begin
    reset <= 1'b1;
    #12 reset <= 1'b0;
    //#2988 reset <= 1'b1;
    //#12 reset <= 1'b0;
end


always_ff @ (posedge clock)
begin
    if (reset == 1'b0 && start == 1'b1) 
    begin
   
        if (myStringCounter < 0 && myStringCounter >= -1 * defaultWordLength - 10 && letterEnable)
        begin
            letterIn <= "";
            myStringCounter--;
            letterProcess <= 1'b1;
        end
        else if (myStringCounter < -1 * defaultWordLength - 3)
        begin
            letterIn <= "";
            start <= 1'b0;
            letterProcess <= 1'b0;
            badWord = "To#############powinien#######";
            myStringCounter = myStringLength-1;
            badWordCounter = defaultWordLength*numberOfWords-1;
        end
        else if (myStringCounter>=0 && letterEnable)
        begin
            letterIn <= myString[myStringCounter];
            myStringCounter--;
            letterProcess <= 1'b1;
        end
        else
        begin
            letterProcess <= 1'b0;
        end
    end
end

always_ff @ (posedge clock)
begin
    if (reset == 1'b0) 
    begin
        if (badWordCounter<0)
        begin
            badLetterIn <= "";
            badLetterProcess <= 1'b0;
            start <= 1'b1;
        end
        else if (badWordCounter>=0 && badLetterEnable)
        begin
            badLetterIn <= (badWord[badWordCounter] == "X" ? "#" : badWord[badWordCounter]);
            badWordCounter--;
            badLetterProcess <= 1'b1;
        end
        else
        begin
            badLetterProcess <= 1'b0;
        end
    end
end

endmodule