//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun May 30 22:07:07 2021
//Host        : DESKTOP-16K0HKR running 64-bit major release  (build 9200)
//Command     : generate_target mb_design_wrapper.bd
//Design      : mb_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb_design_wrapper
   (clock_clk_n,
    clock_clk_p,
    gpio_bad_letter_tri_io,
    gpio_letter_out_tri_io,
    gpio_letter_tri_io,
    reset,
    reset_n);
  input clock_clk_n;
  input clock_clk_p;
  inout [7:0]gpio_bad_letter_tri_io;
  inout [7:0]gpio_letter_out_tri_io;
  inout [7:0]gpio_letter_tri_io;
  input reset;
  input reset_n;

  wire clock_clk_n;
  wire clock_clk_p;
  wire [0:0]gpio_bad_letter_tri_i_0;
  wire [1:1]gpio_bad_letter_tri_i_1;
  wire [2:2]gpio_bad_letter_tri_i_2;
  wire [3:3]gpio_bad_letter_tri_i_3;
  wire [4:4]gpio_bad_letter_tri_i_4;
  wire [5:5]gpio_bad_letter_tri_i_5;
  wire [6:6]gpio_bad_letter_tri_i_6;
  wire [7:7]gpio_bad_letter_tri_i_7;
  wire [0:0]gpio_bad_letter_tri_io_0;
  wire [1:1]gpio_bad_letter_tri_io_1;
  wire [2:2]gpio_bad_letter_tri_io_2;
  wire [3:3]gpio_bad_letter_tri_io_3;
  wire [4:4]gpio_bad_letter_tri_io_4;
  wire [5:5]gpio_bad_letter_tri_io_5;
  wire [6:6]gpio_bad_letter_tri_io_6;
  wire [7:7]gpio_bad_letter_tri_io_7;
  wire [0:0]gpio_bad_letter_tri_o_0;
  wire [1:1]gpio_bad_letter_tri_o_1;
  wire [2:2]gpio_bad_letter_tri_o_2;
  wire [3:3]gpio_bad_letter_tri_o_3;
  wire [4:4]gpio_bad_letter_tri_o_4;
  wire [5:5]gpio_bad_letter_tri_o_5;
  wire [6:6]gpio_bad_letter_tri_o_6;
  wire [7:7]gpio_bad_letter_tri_o_7;
  wire [0:0]gpio_bad_letter_tri_t_0;
  wire [1:1]gpio_bad_letter_tri_t_1;
  wire [2:2]gpio_bad_letter_tri_t_2;
  wire [3:3]gpio_bad_letter_tri_t_3;
  wire [4:4]gpio_bad_letter_tri_t_4;
  wire [5:5]gpio_bad_letter_tri_t_5;
  wire [6:6]gpio_bad_letter_tri_t_6;
  wire [7:7]gpio_bad_letter_tri_t_7;
  wire [0:0]gpio_letter_out_tri_i_0;
  wire [1:1]gpio_letter_out_tri_i_1;
  wire [2:2]gpio_letter_out_tri_i_2;
  wire [3:3]gpio_letter_out_tri_i_3;
  wire [4:4]gpio_letter_out_tri_i_4;
  wire [5:5]gpio_letter_out_tri_i_5;
  wire [6:6]gpio_letter_out_tri_i_6;
  wire [7:7]gpio_letter_out_tri_i_7;
  wire [0:0]gpio_letter_out_tri_io_0;
  wire [1:1]gpio_letter_out_tri_io_1;
  wire [2:2]gpio_letter_out_tri_io_2;
  wire [3:3]gpio_letter_out_tri_io_3;
  wire [4:4]gpio_letter_out_tri_io_4;
  wire [5:5]gpio_letter_out_tri_io_5;
  wire [6:6]gpio_letter_out_tri_io_6;
  wire [7:7]gpio_letter_out_tri_io_7;
  wire [0:0]gpio_letter_out_tri_o_0;
  wire [1:1]gpio_letter_out_tri_o_1;
  wire [2:2]gpio_letter_out_tri_o_2;
  wire [3:3]gpio_letter_out_tri_o_3;
  wire [4:4]gpio_letter_out_tri_o_4;
  wire [5:5]gpio_letter_out_tri_o_5;
  wire [6:6]gpio_letter_out_tri_o_6;
  wire [7:7]gpio_letter_out_tri_o_7;
  wire [0:0]gpio_letter_out_tri_t_0;
  wire [1:1]gpio_letter_out_tri_t_1;
  wire [2:2]gpio_letter_out_tri_t_2;
  wire [3:3]gpio_letter_out_tri_t_3;
  wire [4:4]gpio_letter_out_tri_t_4;
  wire [5:5]gpio_letter_out_tri_t_5;
  wire [6:6]gpio_letter_out_tri_t_6;
  wire [7:7]gpio_letter_out_tri_t_7;
  wire [0:0]gpio_letter_tri_i_0;
  wire [1:1]gpio_letter_tri_i_1;
  wire [2:2]gpio_letter_tri_i_2;
  wire [3:3]gpio_letter_tri_i_3;
  wire [4:4]gpio_letter_tri_i_4;
  wire [5:5]gpio_letter_tri_i_5;
  wire [6:6]gpio_letter_tri_i_6;
  wire [7:7]gpio_letter_tri_i_7;
  wire [0:0]gpio_letter_tri_io_0;
  wire [1:1]gpio_letter_tri_io_1;
  wire [2:2]gpio_letter_tri_io_2;
  wire [3:3]gpio_letter_tri_io_3;
  wire [4:4]gpio_letter_tri_io_4;
  wire [5:5]gpio_letter_tri_io_5;
  wire [6:6]gpio_letter_tri_io_6;
  wire [7:7]gpio_letter_tri_io_7;
  wire [0:0]gpio_letter_tri_o_0;
  wire [1:1]gpio_letter_tri_o_1;
  wire [2:2]gpio_letter_tri_o_2;
  wire [3:3]gpio_letter_tri_o_3;
  wire [4:4]gpio_letter_tri_o_4;
  wire [5:5]gpio_letter_tri_o_5;
  wire [6:6]gpio_letter_tri_o_6;
  wire [7:7]gpio_letter_tri_o_7;
  wire [0:0]gpio_letter_tri_t_0;
  wire [1:1]gpio_letter_tri_t_1;
  wire [2:2]gpio_letter_tri_t_2;
  wire [3:3]gpio_letter_tri_t_3;
  wire [4:4]gpio_letter_tri_t_4;
  wire [5:5]gpio_letter_tri_t_5;
  wire [6:6]gpio_letter_tri_t_6;
  wire [7:7]gpio_letter_tri_t_7;
  wire reset;
  wire reset_n;

  IOBUF gpio_bad_letter_tri_iobuf_0
       (.I(gpio_bad_letter_tri_o_0),
        .IO(gpio_bad_letter_tri_io[0]),
        .O(gpio_bad_letter_tri_i_0),
        .T(gpio_bad_letter_tri_t_0));
  IOBUF gpio_bad_letter_tri_iobuf_1
       (.I(gpio_bad_letter_tri_o_1),
        .IO(gpio_bad_letter_tri_io[1]),
        .O(gpio_bad_letter_tri_i_1),
        .T(gpio_bad_letter_tri_t_1));
  IOBUF gpio_bad_letter_tri_iobuf_2
       (.I(gpio_bad_letter_tri_o_2),
        .IO(gpio_bad_letter_tri_io[2]),
        .O(gpio_bad_letter_tri_i_2),
        .T(gpio_bad_letter_tri_t_2));
  IOBUF gpio_bad_letter_tri_iobuf_3
       (.I(gpio_bad_letter_tri_o_3),
        .IO(gpio_bad_letter_tri_io[3]),
        .O(gpio_bad_letter_tri_i_3),
        .T(gpio_bad_letter_tri_t_3));
  IOBUF gpio_bad_letter_tri_iobuf_4
       (.I(gpio_bad_letter_tri_o_4),
        .IO(gpio_bad_letter_tri_io[4]),
        .O(gpio_bad_letter_tri_i_4),
        .T(gpio_bad_letter_tri_t_4));
  IOBUF gpio_bad_letter_tri_iobuf_5
       (.I(gpio_bad_letter_tri_o_5),
        .IO(gpio_bad_letter_tri_io[5]),
        .O(gpio_bad_letter_tri_i_5),
        .T(gpio_bad_letter_tri_t_5));
  IOBUF gpio_bad_letter_tri_iobuf_6
       (.I(gpio_bad_letter_tri_o_6),
        .IO(gpio_bad_letter_tri_io[6]),
        .O(gpio_bad_letter_tri_i_6),
        .T(gpio_bad_letter_tri_t_6));
  IOBUF gpio_bad_letter_tri_iobuf_7
       (.I(gpio_bad_letter_tri_o_7),
        .IO(gpio_bad_letter_tri_io[7]),
        .O(gpio_bad_letter_tri_i_7),
        .T(gpio_bad_letter_tri_t_7));
  IOBUF gpio_letter_out_tri_iobuf_0
       (.I(gpio_letter_out_tri_o_0),
        .IO(gpio_letter_out_tri_io[0]),
        .O(gpio_letter_out_tri_i_0),
        .T(gpio_letter_out_tri_t_0));
  IOBUF gpio_letter_out_tri_iobuf_1
       (.I(gpio_letter_out_tri_o_1),
        .IO(gpio_letter_out_tri_io[1]),
        .O(gpio_letter_out_tri_i_1),
        .T(gpio_letter_out_tri_t_1));
  IOBUF gpio_letter_out_tri_iobuf_2
       (.I(gpio_letter_out_tri_o_2),
        .IO(gpio_letter_out_tri_io[2]),
        .O(gpio_letter_out_tri_i_2),
        .T(gpio_letter_out_tri_t_2));
  IOBUF gpio_letter_out_tri_iobuf_3
       (.I(gpio_letter_out_tri_o_3),
        .IO(gpio_letter_out_tri_io[3]),
        .O(gpio_letter_out_tri_i_3),
        .T(gpio_letter_out_tri_t_3));
  IOBUF gpio_letter_out_tri_iobuf_4
       (.I(gpio_letter_out_tri_o_4),
        .IO(gpio_letter_out_tri_io[4]),
        .O(gpio_letter_out_tri_i_4),
        .T(gpio_letter_out_tri_t_4));
  IOBUF gpio_letter_out_tri_iobuf_5
       (.I(gpio_letter_out_tri_o_5),
        .IO(gpio_letter_out_tri_io[5]),
        .O(gpio_letter_out_tri_i_5),
        .T(gpio_letter_out_tri_t_5));
  IOBUF gpio_letter_out_tri_iobuf_6
       (.I(gpio_letter_out_tri_o_6),
        .IO(gpio_letter_out_tri_io[6]),
        .O(gpio_letter_out_tri_i_6),
        .T(gpio_letter_out_tri_t_6));
  IOBUF gpio_letter_out_tri_iobuf_7
       (.I(gpio_letter_out_tri_o_7),
        .IO(gpio_letter_out_tri_io[7]),
        .O(gpio_letter_out_tri_i_7),
        .T(gpio_letter_out_tri_t_7));
  IOBUF gpio_letter_tri_iobuf_0
       (.I(gpio_letter_tri_o_0),
        .IO(gpio_letter_tri_io[0]),
        .O(gpio_letter_tri_i_0),
        .T(gpio_letter_tri_t_0));
  IOBUF gpio_letter_tri_iobuf_1
       (.I(gpio_letter_tri_o_1),
        .IO(gpio_letter_tri_io[1]),
        .O(gpio_letter_tri_i_1),
        .T(gpio_letter_tri_t_1));
  IOBUF gpio_letter_tri_iobuf_2
       (.I(gpio_letter_tri_o_2),
        .IO(gpio_letter_tri_io[2]),
        .O(gpio_letter_tri_i_2),
        .T(gpio_letter_tri_t_2));
  IOBUF gpio_letter_tri_iobuf_3
       (.I(gpio_letter_tri_o_3),
        .IO(gpio_letter_tri_io[3]),
        .O(gpio_letter_tri_i_3),
        .T(gpio_letter_tri_t_3));
  IOBUF gpio_letter_tri_iobuf_4
       (.I(gpio_letter_tri_o_4),
        .IO(gpio_letter_tri_io[4]),
        .O(gpio_letter_tri_i_4),
        .T(gpio_letter_tri_t_4));
  IOBUF gpio_letter_tri_iobuf_5
       (.I(gpio_letter_tri_o_5),
        .IO(gpio_letter_tri_io[5]),
        .O(gpio_letter_tri_i_5),
        .T(gpio_letter_tri_t_5));
  IOBUF gpio_letter_tri_iobuf_6
       (.I(gpio_letter_tri_o_6),
        .IO(gpio_letter_tri_io[6]),
        .O(gpio_letter_tri_i_6),
        .T(gpio_letter_tri_t_6));
  IOBUF gpio_letter_tri_iobuf_7
       (.I(gpio_letter_tri_o_7),
        .IO(gpio_letter_tri_io[7]),
        .O(gpio_letter_tri_i_7),
        .T(gpio_letter_tri_t_7));
  mb_design mb_design_i
       (.clock_clk_n(clock_clk_n),
        .clock_clk_p(clock_clk_p),
        .gpio_bad_letter_tri_i({gpio_bad_letter_tri_i_7,gpio_bad_letter_tri_i_6,gpio_bad_letter_tri_i_5,gpio_bad_letter_tri_i_4,gpio_bad_letter_tri_i_3,gpio_bad_letter_tri_i_2,gpio_bad_letter_tri_i_1,gpio_bad_letter_tri_i_0}),
        .gpio_bad_letter_tri_o({gpio_bad_letter_tri_o_7,gpio_bad_letter_tri_o_6,gpio_bad_letter_tri_o_5,gpio_bad_letter_tri_o_4,gpio_bad_letter_tri_o_3,gpio_bad_letter_tri_o_2,gpio_bad_letter_tri_o_1,gpio_bad_letter_tri_o_0}),
        .gpio_bad_letter_tri_t({gpio_bad_letter_tri_t_7,gpio_bad_letter_tri_t_6,gpio_bad_letter_tri_t_5,gpio_bad_letter_tri_t_4,gpio_bad_letter_tri_t_3,gpio_bad_letter_tri_t_2,gpio_bad_letter_tri_t_1,gpio_bad_letter_tri_t_0}),
        .gpio_letter_out_tri_i({gpio_letter_out_tri_i_7,gpio_letter_out_tri_i_6,gpio_letter_out_tri_i_5,gpio_letter_out_tri_i_4,gpio_letter_out_tri_i_3,gpio_letter_out_tri_i_2,gpio_letter_out_tri_i_1,gpio_letter_out_tri_i_0}),
        .gpio_letter_out_tri_o({gpio_letter_out_tri_o_7,gpio_letter_out_tri_o_6,gpio_letter_out_tri_o_5,gpio_letter_out_tri_o_4,gpio_letter_out_tri_o_3,gpio_letter_out_tri_o_2,gpio_letter_out_tri_o_1,gpio_letter_out_tri_o_0}),
        .gpio_letter_out_tri_t({gpio_letter_out_tri_t_7,gpio_letter_out_tri_t_6,gpio_letter_out_tri_t_5,gpio_letter_out_tri_t_4,gpio_letter_out_tri_t_3,gpio_letter_out_tri_t_2,gpio_letter_out_tri_t_1,gpio_letter_out_tri_t_0}),
        .gpio_letter_tri_i({gpio_letter_tri_i_7,gpio_letter_tri_i_6,gpio_letter_tri_i_5,gpio_letter_tri_i_4,gpio_letter_tri_i_3,gpio_letter_tri_i_2,gpio_letter_tri_i_1,gpio_letter_tri_i_0}),
        .gpio_letter_tri_o({gpio_letter_tri_o_7,gpio_letter_tri_o_6,gpio_letter_tri_o_5,gpio_letter_tri_o_4,gpio_letter_tri_o_3,gpio_letter_tri_o_2,gpio_letter_tri_o_1,gpio_letter_tri_o_0}),
        .gpio_letter_tri_t({gpio_letter_tri_t_7,gpio_letter_tri_t_6,gpio_letter_tri_t_5,gpio_letter_tri_t_4,gpio_letter_tri_t_3,gpio_letter_tri_t_2,gpio_letter_tri_t_1,gpio_letter_tri_t_0}),
        .reset(reset),
        .reset_n(reset_n));
endmodule
