module Cenzor(clock, start, reset, badLetterIn, badLetterProcess, badLetterEnable, letterIn, letterProcess, letterEnable, letterOut);

parameter integer numberOfWords = 10;
parameter integer defaultWordLength = 10;

input clock;
input start;
input reset;
input reg [7:0] badLetterIn;
input reg badLetterProcess;
output reg badLetterEnable;
input reg letterProcess;
output reg letterEnable;
input reg [7:0] letterIn;
output reg [7:0] letterOut;

reg [defaultWordLength-1:0][7:0] shiftRegister ;
reg [(defaultWordLength * numberOfWords)-1:0][7:0] badWords;
reg [numberOfWords-1:0][defaultWordLength-1:0] compare;

reg doBadLetterProcess = 0;
reg doLetterProcess = 0;

integer i = 0;
integer j = 0;
genvar t;

always @ (posedge clock)
begin
    if(reset==1'b1)
    begin
        shiftRegister <= "";
        badWords <= "";
        letterOut <= " ";
        doBadLetterProcess = 0;
        doLetterProcess = 0;
    end
    else
    begin
        if(badLetterProcess == 0)
        begin
            badLetterEnable <= 1;
            doBadLetterProcess = 1;
        end
        else if (badLetterProcess == 1 && doBadLetterProcess == 1)
        begin
            badLetterEnable <= 0;
            badWords[(defaultWordLength * numberOfWords)-2:0] <= badWords[(defaultWordLength * numberOfWords)-1:1];
            badWords[(defaultWordLength * numberOfWords)-1] <= badLetterIn;
            doBadLetterProcess = 0;
        end 
        
        if(letterProcess == 0)
        begin
            letterEnable <= 1;
            doLetterProcess = 1;
        end
        else if (letterProcess == 1 && doLetterProcess == 1)
        begin
            letterEnable <= 0;
            if(start)
            begin
                for ( i = 0; i < defaultWordLength; i++)
                begin
                    for ( j = 0; j < numberOfWords; j++)
                    begin
                        if(compare[j][i] == 1)
                        begin
                            shiftRegister[i] = "#";
                        end
                    end 
                end 
            
                letterOut <= shiftRegister[0];
                shiftRegister[defaultWordLength-2:0] <= shiftRegister[defaultWordLength-1:1];
                shiftRegister[defaultWordLength-1] <= letterIn;
            end 
            doLetterProcess = 0;
        end
    end
end

generate for (t=0; t<numberOfWords; t=t+1)
begin
    Word_Comparator #(defaultWordLength) UnitUnderTest(start, reset, badWords[(defaultWordLength * (numberOfWords-t))-1:(defaultWordLength * (numberOfWords-t-1))], shiftRegister, compare[t][defaultWordLength-1:0]);
end
endgenerate
endmodule