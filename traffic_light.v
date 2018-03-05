module COMPM8_HXILINX_Trafic_Light_Final (GT, LT, A, B);
    

   output GT;
   output LT;

   input  [7:0] A;
   input  [7:0] B;


   assign GT = A > B  ;
   assign LT = A < B  ;

endmodule
`timescale  100 ps / 10 ps

module M2_1_HXILINX_Trafic_Light_Final (O, D0, D1, S0);
    

   output O;

   input  D0;
   input  D1;
   input  S0;

   reg O;

   always @ ( D0 or D1 or S0)
   begin
      case(S0)
      1'b0 : O <= D0;
      1'b1 : O <= D1;
      endcase
   end
    
endmodule
`timescale 100 ps / 10 ps

module CB8CLED_HXILINX_Trafic_Light_Final(CEO, Q, TC, C, CE, CLR, D, L, UP);

   parameter TERMINAL_COUNT_UP = 8'b1111_1111;
   parameter TERMINAL_COUNT_DOWN = 8'b0000_0000;
   
   output             CEO;
   output [7:0]       Q;
   output             TC;
   
   input 	      C;
   input 	      CE;
   input 	      CLR;
   input  [7:0]       D;
   input 	      L;	
   input 	      UP;	
   
   reg    [7:0]       Q;
   
   always @(posedge C or posedge CLR)
     begin
	if (CLR)
	  Q <= 8'b0000_0000;
	else if (L)
	  Q <= D;
	else if (CE)
	  begin
	     if (UP)
	       Q <= Q + 1;
	     else if (!UP)
	       Q <= Q - 1;
	  end
     end
   
   assign CEO = TC & CE;
   assign TC = CLR ? 1'b0 : ( (Q == TERMINAL_COUNT_UP && UP) || (Q == TERMINAL_COUNT_DOWN && !UP) );
   
endmodule
`timescale 1ns / 1ps

module Bit_wise_TL_MUSER_Trafic_Light_Final(Green_input, 
                                            Red_input, 
                                            Yellow_input, 
                                            GREEN, 
                                            RED, 
                                            YELLOW);

    input [7:0] Green_input;
    input [7:0] Red_input;
    input [7:0] Yellow_input;
   output GREEN;
   output RED;
   output YELLOW;
   
   wire [7:0] XLXN_1;
   wire [7:0] XLXN_2;
   wire [7:0] XLXN_3;
   
   assign XLXN_1 = 8'h00;
   assign XLXN_2 = 8'h00;
   assign XLXN_3 = 8'h00;
   (* HU_SET = "XLXI_1_0" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_1 (.A(Red_input[7:0]), 
                                             .B(XLXN_1[7:0]), 
                                             .GT(RED), 
                                             .LT());
   (* HU_SET = "XLXI_2_1" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_2 (.A(Yellow_input[7:0]), 
                                             .B(XLXN_2[7:0]), 
                                             .GT(YELLOW), 
                                             .LT());
   (* HU_SET = "XLXI_3_2" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_3 (.A(Green_input[7:0]), 
                                             .B(XLXN_3[7:0]), 
                                             .GT(GREEN), 
                                             .LT());
endmodule
`timescale 1ns / 1ps

module level_2_MUSER_Trafic_Light_Final(clk, 
                                        clr, 
                                        Din, 
                                        Dout);

    input clk;
    input clr;
    input [7:0] Din;
   output [7:0] Dout;
   
   wire XLXN_1;
   wire XLXN_2;
   wire [7:0] XLXN_3;
   wire XLXN_4;
   wire XLXN_6;
   wire XLXN_10;
   wire [7:0] Dout_DUMMY;
   
   assign XLXN_3 = 8'h00;
   assign Dout[7:0] = Dout_DUMMY[7:0];
   (* HU_SET = "XLXI_1_3" *) 
   CB8CLED_HXILINX_Trafic_Light_Final  XLXI_1 (.C(clk), 
                                              .CE(XLXN_10), 
                                              .CLR(clr), 
                                              .D(Din[7:0]), 
                                              .L(XLXN_6), 
                                              .UP(XLXN_4), 
                                              .CEO(), 
                                              .Q(Dout_DUMMY[7:0]), 
                                              .TC());
   (* HU_SET = "XLXI_2_4" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_2 (.A(Dout_DUMMY[7:0]), 
                                             .B(XLXN_3[7:0]), 
                                             .GT(XLXN_2), 
                                             .LT(XLXN_1));
   NOR2  XLXI_3 (.I0(XLXN_1), 
                .I1(XLXN_2), 
                .O(XLXN_6));
   GND  XLXI_5 (.G(XLXN_4));
   VCC  XLXI_6 (.P(XLXN_10));
endmodule
`timescale 1ns / 1ps

module level_1_MUSER_Trafic_Light_Final(greater_a, 
                                        greater_b, 
                                        less_a, 
                                        less_b, 
                                        x);

    input [7:0] greater_a;
    input [7:0] greater_b;
    input [7:0] less_a;
    input [7:0] less_b;
   output x;
   
   wire XLXN_1;
   wire XLXN_2;
   
   (* HU_SET = "XLXI_1_5" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_1 (.A(less_a[7:0]), 
                                             .B(less_b[7:0]), 
                                             .GT(), 
                                             .LT(XLXN_1));
   (* HU_SET = "XLXI_2_6" *) 
   COMPM8_HXILINX_Trafic_Light_Final  XLXI_2 (.A(greater_a[7:0]), 
                                             .B(greater_b[7:0]), 
                                             .GT(XLXN_2), 
                                             .LT());
   NAND2  XLXI_3 (.I0(XLXN_2), 
                 .I1(XLXN_1), 
                 .O(x));
endmodule
`timescale 1ns / 1ps

module m_MUSER_Trafic_Light_Final(D0, 
                                  D1, 
                                  S0, 
                                  O);

    input [7:0] D0;
    input [7:0] D1;
    input S0;
   output [7:0] O;
   
   
   (* HU_SET = "XLXI_1_7" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_1 (.D0(D0[0]), 
                                           .D1(D1[0]), 
                                           .S0(S0), 
                                           .O(O[0]));
   (* HU_SET = "XLXI_2_8" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_2 (.D0(D0[1]), 
                                           .D1(D1[1]), 
                                           .S0(S0), 
                                           .O(O[1]));
   (* HU_SET = "XLXI_3_9" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_3 (.D0(D0[2]), 
                                           .D1(D1[2]), 
                                           .S0(S0), 
                                           .O(O[2]));
   (* HU_SET = "XLXI_4_10" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_4 (.D0(D0[3]), 
                                           .D1(D1[3]), 
                                           .S0(S0), 
                                           .O(O[3]));
   (* HU_SET = "XLXI_5_11" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_5 (.D0(D0[4]), 
                                           .D1(D1[4]), 
                                           .S0(S0), 
                                           .O(O[4]));
   (* HU_SET = "XLXI_6_12" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_6 (.D0(D0[5]), 
                                           .D1(D1[5]), 
                                           .S0(S0), 
                                           .O(O[5]));
   (* HU_SET = "XLXI_7_13" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_7 (.D0(D0[6]), 
                                           .D1(D1[6]), 
                                           .S0(S0), 
                                           .O(O[6]));
   (* HU_SET = "XLXI_8_14" *) 
   M2_1_HXILINX_Trafic_Light_Final  XLXI_8 (.D0(D0[7]), 
                                           .D1(D1[7]), 
                                           .S0(S0), 
                                           .O(O[7]));
endmodule
`timescale 1ns / 1ps

module level_3_0_MUSER_Trafic_Light_Final(clk, 
                                          clr, 
                                          Dout, 
                                          R1, 
                                          R2, 
                                          R3, 
                                          R4);

    input clk;
    input clr;
   output [7:0] Dout;
   output [7:0] R1;
   output [7:0] R2;
   output [7:0] R3;
   output [7:0] R4;
   
   wire XLXN_13;
   wire XLXN_14;
   wire XLXN_15;
   wire XLXN_16;
   wire XLXN_17;
   wire XLXN_18;
   wire XLXN_30;
   wire XLXN_31;
   wire XLXN_32;
   wire XLXN_33;
   wire XLXN_34;
   wire XLXN_35;
   wire [7:0] XLXN_36;
   wire [7:0] XLXN_37;
   wire [7:0] XLXN_38;
   wire [7:0] XLXN_39;
   wire [7:0] XLXN_40;
   wire [7:0] XLXN_41;
   wire [7:0] XLXN_42;
   wire [7:0] XLXN_43;
   wire [7:0] XLXN_44;
   wire [7:0] XLXN_45;
   wire [7:0] XLXN_46;
   wire [7:0] XLXN_47;
   wire [7:0] XLXN_48;
   wire [7:0] XLXN_49;
   wire [7:0] XLXN_50;
   wire [7:0] XLXN_51;
   wire [7:0] XLXN_52;
   wire [7:0] XLXN_53;
   wire [7:0] XLXN_54;
   wire [7:0] XLXN_55;
   wire [7:0] XLXN_56;
   wire [7:0] XLXN_59;
   wire [7:0] XLXN_60;
   wire [7:0] Dout_DUMMY;
   
   assign XLXN_36 = 8'h78;
   assign XLXN_37 = 8'h5B;
   assign XLXN_38 = 8'h00;
   assign XLXN_39 = 8'h79;
   assign XLXN_40 = 8'h59;
   assign XLXN_41 = 8'h3D;
   assign XLXN_42 = 8'h00;
   assign XLXN_43 = 8'h79;
   assign XLXN_44 = 8'h3B;
   assign XLXN_45 = 8'h1F;
   assign XLXN_46 = 8'h00;
   assign XLXN_47 = 8'h79;
   assign XLXN_48 = 8'h1D;
   assign XLXN_49 = 8'h5A;
   assign XLXN_50 = 8'h5A;
   assign XLXN_51 = 8'h3C;
   assign XLXN_52 = 8'h5A;
   assign XLXN_53 = 8'h1E;
   assign XLXN_54 = 8'h5A;
   assign Dout[7:0] = Dout_DUMMY[7:0];
   level_1_MUSER_Trafic_Light_Final  XLXI_1 (.greater_a(Dout_DUMMY[7:0]), 
                                            .greater_b(XLXN_38[7:0]), 
                                            .less_a(Dout_DUMMY[7:0]), 
                                            .less_b(XLXN_37[7:0]), 
                                            .x(XLXN_18));
   level_2_MUSER_Trafic_Light_Final  XLXI_2 (.clk(clk), 
                                            .clr(clr), 
                                            .Din(XLXN_36[7:0]), 
                                            .Dout(Dout_DUMMY[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_3 (.clk(clk), 
                                            .clr(XLXN_30), 
                                            .Din(XLXN_54[7:0]), 
                                            .Dout(R1[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_4 (.clk(clk), 
                                            .clr(XLXN_31), 
                                            .Din(XLXN_53[7:0]), 
                                            .Dout(XLXN_55[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_5 (.clk(clk), 
                                            .clr(XLXN_32), 
                                            .Din(XLXN_52[7:0]), 
                                            .Dout(XLXN_56[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_6 (.clk(clk), 
                                            .clr(XLXN_33), 
                                            .Din(XLXN_51[7:0]), 
                                            .Dout(XLXN_59[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_7 (.clk(clk), 
                                            .clr(XLXN_34), 
                                            .Din(XLXN_50[7:0]), 
                                            .Dout(XLXN_60[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_8 (.clk(clk), 
                                            .clr(XLXN_35), 
                                            .Din(XLXN_49[7:0]), 
                                            .Dout(R4[7:0]));
   level_1_MUSER_Trafic_Light_Final  XLXI_9 (.greater_a(Dout_DUMMY[7:0]), 
                                            .greater_b(XLXN_40[7:0]), 
                                            .less_a(Dout_DUMMY[7:0]), 
                                            .less_b(XLXN_39[7:0]), 
                                            .x(XLXN_17));
   level_1_MUSER_Trafic_Light_Final  XLXI_10 (.greater_a(Dout_DUMMY[7:0]), 
                                             .greater_b(XLXN_42[7:0]), 
                                             .less_a(Dout_DUMMY[7:0]), 
                                             .less_b(XLXN_41[7:0]), 
                                             .x(XLXN_16));
   level_1_MUSER_Trafic_Light_Final  XLXI_11 (.greater_a(Dout_DUMMY[7:0]), 
                                             .greater_b(XLXN_44[7:0]), 
                                             .less_a(Dout_DUMMY[7:0]), 
                                             .less_b(XLXN_43[7:0]), 
                                             .x(XLXN_15));
   level_1_MUSER_Trafic_Light_Final  XLXI_12 (.greater_a(Dout_DUMMY[7:0]), 
                                             .greater_b(XLXN_46[7:0]), 
                                             .less_a(Dout_DUMMY[7:0]), 
                                             .less_b(XLXN_45[7:0]), 
                                             .x(XLXN_14));
   level_1_MUSER_Trafic_Light_Final  XLXI_13 (.greater_a(Dout_DUMMY[7:0]), 
                                             .greater_b(XLXN_48[7:0]), 
                                             .less_a(Dout_DUMMY[7:0]), 
                                             .less_b(XLXN_47[7:0]), 
                                             .x(XLXN_13));
   OR2  XLXI_14 (.I0(XLXN_18), 
                .I1(clr), 
                .O(XLXN_30));
   OR2  XLXI_15 (.I0(XLXN_17), 
                .I1(clr), 
                .O(XLXN_31));
   OR2  XLXI_16 (.I0(XLXN_16), 
                .I1(clr), 
                .O(XLXN_32));
   OR2  XLXI_17 (.I0(XLXN_15), 
                .I1(clr), 
                .O(XLXN_33));
   OR2  XLXI_18 (.I0(XLXN_14), 
                .I1(clr), 
                .O(XLXN_34));
   OR2  XLXI_19 (.I0(XLXN_13), 
                .I1(clr), 
                .O(XLXN_35));
   m_MUSER_Trafic_Light_Final  XLXI_39 (.D0(XLXN_55[7:0]), 
                                       .D1(XLXN_56[7:0]), 
                                       .S0(XLXN_17), 
                                       .O(R2[7:0]));
   m_MUSER_Trafic_Light_Final  XLXI_40 (.D0(XLXN_59[7:0]), 
                                       .D1(XLXN_60[7:0]), 
                                       .S0(XLXN_15), 
                                       .O(R3[7:0]));
endmodule
`timescale 1ns / 1ps

module level_4_MUSER_Trafic_Light_Final(clk, 
                                        clr, 
                                        G1, 
                                        G2, 
                                        G3, 
                                        G4, 
                                        R1, 
                                        R2, 
                                        R3, 
                                        R4, 
                                        Y1, 
                                        Y2, 
                                        Y3, 
                                        Y4);

    input clk;
    input clr;
   output [7:0] G1;
   output [7:0] G2;
   output [7:0] G3;
   output [7:0] G4;
   output [7:0] R1;
   output [7:0] R2;
   output [7:0] R3;
   output [7:0] R4;
   output [7:0] Y1;
   output [7:0] Y2;
   output [7:0] Y3;
   output [7:0] Y4;
   
   wire [7:0] XLXN_1;
   wire [7:0] XLXN_2;
   wire [7:0] XLXN_3;
   wire [7:0] XLXN_4;
   wire [7:0] XLXN_5;
   wire [7:0] XLXN_6;
   wire [7:0] XLXN_7;
   wire [7:0] XLXN_8;
   wire [7:0] XLXN_9;
   wire [7:0] XLXN_10;
   wire [7:0] XLXN_11;
   wire [7:0] XLXN_12;
   wire [7:0] XLXN_13;
   wire [7:0] XLXN_14;
   wire [7:0] XLXN_15;
   wire [7:0] XLXN_17;
   wire XLXN_24;
   wire XLXN_25;
   wire XLXN_26;
   wire XLXN_28;
   wire XLXN_29;
   wire XLXN_30;
   wire XLXN_31;
   wire XLXN_32;
   wire XLXN_33;
   wire XLXN_34;
   wire XLXN_36;
   wire XLXN_37;
   wire XLXN_39;
   wire XLXN_40;
   wire XLXN_41;
   wire XLXN_43;
   wire [7:0] XLXN_44;
   wire [7:0] XLXN_45;
   wire [7:0] XLXN_46;
   wire [7:0] XLXN_47;
   wire [7:0] XLXN_48;
   wire [7:0] XLXN_49;
   wire [7:0] XLXN_50;
   wire [7:0] XLXN_51;
   wire [7:0] XLXN_72;
   
   assign XLXN_1 = 8'h79;
   assign XLXN_2 = 8'h59;
   assign XLXN_3 = 8'h5B;
   assign XLXN_4 = 8'h3B;
   assign XLXN_5 = 8'h3D;
   assign XLXN_6 = 8'h1F;
   assign XLXN_7 = 8'h00;
   assign XLXN_8 = 8'h1D;
   assign XLXN_9 = 8'h5F;
   assign XLXN_10 = 8'h59;
   assign XLXN_11 = 8'h41;
   assign XLXN_12 = 8'h3B;
   assign XLXN_13 = 8'h23;
   assign XLXN_14 = 8'h1D;
   assign XLXN_15 = 8'h05;
   assign XLXN_17 = 8'h00;
   assign XLXN_44 = 8'h04;
   assign XLXN_45 = 8'h04;
   assign XLXN_46 = 8'h04;
   assign XLXN_47 = 8'h04;
   assign XLXN_48 = 8'h1E;
   assign XLXN_49 = 8'h1E;
   assign XLXN_50 = 8'h1E;
   assign XLXN_51 = 8'h1E;
   level_3_0_MUSER_Trafic_Light_Final  XLXI_1 (.clk(clk), 
                                              .clr(clr), 
                                              .Dout(XLXN_72[7:0]), 
                                              .R1(R1[7:0]), 
                                              .R2(R2[7:0]), 
                                              .R3(R3[7:0]), 
                                              .R4(R4[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_2 (.clk(clk), 
                                            .clr(XLXN_32), 
                                            .Din(XLXN_49[7:0]), 
                                            .Dout(G1[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_3 (.clk(clk), 
                                            .clr(XLXN_31), 
                                            .Din(XLXN_50[7:0]), 
                                            .Dout(G2[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_4 (.clk(clk), 
                                            .clr(XLXN_30), 
                                            .Din(XLXN_51[7:0]), 
                                            .Dout(G3[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_5 (.clk(clk), 
                                            .clr(XLXN_29), 
                                            .Din(XLXN_48[7:0]), 
                                            .Dout(G4[7:0]));
   level_1_MUSER_Trafic_Light_Final  XLXI_6 (.greater_a(XLXN_72[7:0]), 
                                            .greater_b(XLXN_2[7:0]), 
                                            .less_a(XLXN_72[7:0]), 
                                            .less_b(XLXN_1[7:0]), 
                                            .x(XLXN_24));
   level_1_MUSER_Trafic_Light_Final  XLXI_7 (.greater_a(XLXN_72[7:0]), 
                                            .greater_b(XLXN_4[7:0]), 
                                            .less_a(XLXN_72[7:0]), 
                                            .less_b(XLXN_3[7:0]), 
                                            .x(XLXN_25));
   level_1_MUSER_Trafic_Light_Final  XLXI_8 (.greater_a(XLXN_72[7:0]), 
                                            .greater_b(XLXN_8[7:0]), 
                                            .less_a(XLXN_72[7:0]), 
                                            .less_b(XLXN_5[7:0]), 
                                            .x(XLXN_26));
   level_1_MUSER_Trafic_Light_Final  XLXI_9 (.greater_a(XLXN_72[7:0]), 
                                            .greater_b(XLXN_7[7:0]), 
                                            .less_a(XLXN_72[7:0]), 
                                            .less_b(XLXN_6[7:0]), 
                                            .x(XLXN_28));
   level_1_MUSER_Trafic_Light_Final  XLXI_10 (.greater_a(XLXN_72[7:0]), 
                                             .greater_b(XLXN_10[7:0]), 
                                             .less_a(XLXN_72[7:0]), 
                                             .less_b(XLXN_9[7:0]), 
                                             .x(XLXN_39));
   level_1_MUSER_Trafic_Light_Final  XLXI_11 (.greater_a(XLXN_72[7:0]), 
                                             .greater_b(XLXN_12[7:0]), 
                                             .less_a(XLXN_72[7:0]), 
                                             .less_b(XLXN_11[7:0]), 
                                             .x(XLXN_43));
   level_1_MUSER_Trafic_Light_Final  XLXI_12 (.greater_a(XLXN_72[7:0]), 
                                             .greater_b(XLXN_14[7:0]), 
                                             .less_a(XLXN_72[7:0]), 
                                             .less_b(XLXN_13[7:0]), 
                                             .x(XLXN_40));
   level_1_MUSER_Trafic_Light_Final  XLXI_13 (.greater_a(XLXN_72[7:0]), 
                                             .greater_b(XLXN_17[7:0]), 
                                             .less_a(XLXN_72[7:0]), 
                                             .less_b(XLXN_15[7:0]), 
                                             .x(XLXN_41));
   level_2_MUSER_Trafic_Light_Final  XLXI_14 (.clk(clk), 
                                             .clr(XLXN_33), 
                                             .Din(XLXN_44[7:0]), 
                                             .Dout(Y1[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_15 (.clk(clk), 
                                             .clr(XLXN_34), 
                                             .Din(XLXN_45[7:0]), 
                                             .Dout(Y2[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_16 (.clk(clk), 
                                             .clr(XLXN_36), 
                                             .Din(XLXN_46[7:0]), 
                                             .Dout(Y3[7:0]));
   level_2_MUSER_Trafic_Light_Final  XLXI_17 (.clk(clk), 
                                             .clr(XLXN_37), 
                                             .Din(XLXN_47[7:0]), 
                                             .Dout(Y4[7:0]));
   OR2  XLXI_18 (.I0(clr), 
                .I1(XLXN_24), 
                .O(XLXN_32));
   OR2  XLXI_19 (.I0(clr), 
                .I1(XLXN_25), 
                .O(XLXN_31));
   OR2  XLXI_20 (.I0(clr), 
                .I1(XLXN_26), 
                .O(XLXN_30));
   OR2  XLXI_21 (.I0(clr), 
                .I1(XLXN_28), 
                .O(XLXN_29));
   OR2  XLXI_22 (.I0(clr), 
                .I1(XLXN_39), 
                .O(XLXN_33));
   OR2  XLXI_23 (.I0(clr), 
                .I1(XLXN_43), 
                .O(XLXN_34));
   OR2  XLXI_24 (.I0(clr), 
                .I1(XLXN_40), 
                .O(XLXN_36));
   OR2  XLXI_25 (.I0(clr), 
                .I1(XLXN_41), 
                .O(XLXN_37));
endmodule
`timescale 1ns / 1ps

module Trafic_Light_Final(Clear, 
                          Clock, 
                          East_Green, 
                          East_Red, 
                          East_Yellow, 
                          E_Green, 
                          E_Red, 
                          E_Yellow, 
                          North_Green, 
                          North_Red, 
                          North_Yellow, 
                          N_Green, 
                          N_Red, 
                          N_Yellow, 
                          South_Green, 
                          South_Red, 
                          South_Yellow, 
                          S_Green, 
                          S_Red, 
                          S_Yellow, 
                          West_Green, 
                          West_Red, 
                          West_Yellow, 
                          W_Green, 
                          W_Red, 
                          W_Yellow);

    input Clear;
    input Clock;
   output [7:0] East_Green;
   output [7:0] East_Red;
   output [7:0] East_Yellow;
   output E_Green;
   output E_Red;
   output E_Yellow;
   output [7:0] North_Green;
   output [7:0] North_Red;
   output [7:0] North_Yellow;
   output N_Green;
   output N_Red;
   output N_Yellow;
   output [7:0] South_Green;
   output [7:0] South_Red;
   output [7:0] South_Yellow;
   output S_Green;
   output S_Red;
   output S_Yellow;
   output [7:0] West_Green;
   output [7:0] West_Red;
   output [7:0] West_Yellow;
   output W_Green;
   output W_Red;
   output W_Yellow;
   
   wire [7:0] East_Green_DUMMY;
   wire [7:0] North_Red_DUMMY;
   wire [7:0] West_Yellow_DUMMY;
   wire [7:0] South_Green_DUMMY;
   wire [7:0] South_Red_DUMMY;
   wire [7:0] East_Yellow_DUMMY;
   wire [7:0] West_Green_DUMMY;
   wire [7:0] East_Red_DUMMY;
   wire [7:0] West_Red_DUMMY;
   wire [7:0] South_Yellow_DUMMY;
   wire [7:0] North_Yellow_DUMMY;
   wire [7:0] North_Green_DUMMY;
   
   assign East_Green[7:0] = East_Green_DUMMY[7:0];
   assign East_Red[7:0] = East_Red_DUMMY[7:0];
   assign East_Yellow[7:0] = East_Yellow_DUMMY[7:0];
   assign North_Green[7:0] = North_Green_DUMMY[7:0];
   assign North_Red[7:0] = North_Red_DUMMY[7:0];
   assign North_Yellow[7:0] = North_Yellow_DUMMY[7:0];
   assign South_Green[7:0] = South_Green_DUMMY[7:0];
   assign South_Red[7:0] = South_Red_DUMMY[7:0];
   assign South_Yellow[7:0] = South_Yellow_DUMMY[7:0];
   assign West_Green[7:0] = West_Green_DUMMY[7:0];
   assign West_Red[7:0] = West_Red_DUMMY[7:0];
   assign West_Yellow[7:0] = West_Yellow_DUMMY[7:0];
   level_4_MUSER_Trafic_Light_Final  XLXI_1 (.clk(Clock), 
                                            .clr(Clear), 
                                            .G1(North_Green_DUMMY[7:0]), 
                                            .G2(East_Green_DUMMY[7:0]), 
                                            .G3(South_Green_DUMMY[7:0]), 
                                            .G4(West_Green_DUMMY[7:0]), 
                                            .R1(North_Red_DUMMY[7:0]), 
                                            .R2(East_Red_DUMMY[7:0]), 
                                            .R3(South_Red_DUMMY[7:0]), 
                                            .R4(West_Red_DUMMY[7:0]), 
                                            .Y1(North_Yellow_DUMMY[7:0]), 
                                            .Y2(East_Yellow_DUMMY[7:0]), 
                                            .Y3(South_Yellow_DUMMY[7:0]), 
                                            .Y4(West_Yellow_DUMMY[7:0]));
   Bit_wise_TL_MUSER_Trafic_Light_Final  XLXI_11 
         (.Green_input(North_Green_DUMMY[7:0]), 
                                                 
         .Red_input(North_Red_DUMMY[7:0]), 
                                                 
         .Yellow_input(North_Yellow_DUMMY[7:0]), 
                                                 .GREEN(N_Green), 
                                                 .RED(N_Red), 
                                                 .YELLOW(N_Yellow));
   Bit_wise_TL_MUSER_Trafic_Light_Final  XLXI_12 
         (.Green_input(East_Green_DUMMY[7:0]), 
                                                 
         .Red_input(East_Red_DUMMY[7:0]), 
                                                 
         .Yellow_input(East_Yellow_DUMMY[7:0]), 
                                                 .GREEN(E_Green), 
                                                 .RED(E_Red), 
                                                 .YELLOW(E_Yellow));
   Bit_wise_TL_MUSER_Trafic_Light_Final  XLXI_13 
         (.Green_input(West_Green_DUMMY[7:0]), 
                                                 
         .Red_input(West_Red_DUMMY[7:0]), 
                                                 
         .Yellow_input(West_Yellow_DUMMY[7:0]), 
                                                 .GREEN(W_Green), 
                                                 .RED(W_Red), 
                                                 .YELLOW(W_Yellow));
   Bit_wise_TL_MUSER_Trafic_Light_Final  XLXI_14 
         (.Green_input(South_Green_DUMMY[7:0]), 
                                                 
         .Red_input(South_Red_DUMMY[7:0]), 
                                                 
         .Yellow_input(South_Yellow_DUMMY[7:0]), 
                                                 .GREEN(S_Green), 
                                                 .RED(S_Red), 
                                                 .YELLOW(S_Yellow));
endmodule
