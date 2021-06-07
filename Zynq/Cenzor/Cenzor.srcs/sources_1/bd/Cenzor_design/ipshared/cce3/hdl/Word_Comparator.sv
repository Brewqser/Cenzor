`timescale 1ns / 1ps

module Word_Comparator(start, reset, badWord, word_In, compare);

parameter integer defaultWordLength = 10;

input start;
input reset;
input reg [defaultWordLength-1:0][7:0] badWord ;
input reg [defaultWordLength-1:0][7:0] word_In ;
output reg [defaultWordLength-1:0] compare ;

integer i;
integer sameCounter;

always @*
begin
    sameCounter = 0;
    for ( i = 0; i < defaultWordLength; i++)
    begin
        if(badWord[i] == "#" || badWord[i] == word_In[i])
        begin
            sameCounter++;
        end
    end 
    
    if (sameCounter == defaultWordLength)
    begin
        for ( i = 0; i < defaultWordLength; i++)
        begin
            if(badWord[i] == "#")
            begin
                compare[i] <= 1'b0;
            end
            else
            begin
                compare[i] <= 1'b1;
            end
        end
    end 
    else
    begin
        for ( i = 0; i < defaultWordLength; i++)
        begin
            compare[i] <= 1'b0;
        end 
    end
end

endmodule
