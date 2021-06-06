`timescale 1ns / 1ps

module mb_design_tb();

reg clk_n, clk_p;
wire [7:0] letter;
wire [7:0] badLetter;
wire [7:0] letterOut;

reg reset, reset_n;

initial
begin
    reset = 1'b1;
    reset_n = 1'b0;
    #10 reset = 1'b0;
    reset_n = 1'b1;
end
// Clocks stimulus
initial
begin
    clk_n = 1'b0; //set clk to 0
    clk_p = 1'b1;
end
always
begin
    #5 clk_n = ~clk_n; //toggle clk every 5 time units
    clk_p = ~clk_p; //toggle clk every 5 time units
end

mb_design_wrapper mb_design_inst (clk_n, clk_p, badLetter, letterOut, letter, reset, reset_n);

endmodule
