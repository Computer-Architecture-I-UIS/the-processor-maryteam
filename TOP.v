module InstDeco(
  input  [31:0] io_instruc,
  output [4:0]  io_rd,
  output [4:0]  io_rs1,
  output [4:0]  io_rs2,
  output [31:0] io_imm
);
  wire [6:0] opcode = io_instruc[6:0]; // @[InstDeco.scala 56:27]
  wire [2:0] funct3 = io_instruc[14:12]; // @[InstDeco.scala 58:27]
  wire [6:0] funct7 = io_instruc[31:25]; // @[InstDeco.scala 61:27]
  wire  _T_7 = 7'h37 == opcode; // @[Conditional.scala 37:30]
  wire [31:0] _T_10 = {io_instruc[31:12],12'h0}; // @[InstDeco.scala 80:76]
  wire  _T_11 = 7'h17 == opcode; // @[Conditional.scala 37:30]
  wire  _T_15 = 7'h6f == opcode; // @[Conditional.scala 37:30]
  wire [20:0] _T_24 = {io_instruc[31],io_instruc[19:12],io_instruc[20],io_instruc[30:21],1'h0}; // @[InstDeco.scala 89:123]
  wire  _T_25 = 7'h67 == opcode; // @[Conditional.scala 37:30]
  wire [11:0] _T_27 = io_instruc[31:20]; // @[InstDeco.scala 94:61]
  wire  _T_28 = 7'h63 == opcode; // @[Conditional.scala 37:30]
  wire [12:0] _T_37 = {io_instruc[31],io_instruc[7],io_instruc[30:25],io_instruc[11:8],1'h0}; // @[InstDeco.scala 99:121]
  wire  _T_38 = 3'h0 == funct3; // @[Conditional.scala 37:30]
  wire  _T_39 = 3'h1 == funct3; // @[Conditional.scala 37:30]
  wire  _T_40 = 3'h4 == funct3; // @[Conditional.scala 37:30]
  wire  _T_41 = 3'h5 == funct3; // @[Conditional.scala 37:30]
  wire  _T_42 = 3'h6 == funct3; // @[Conditional.scala 37:30]
  wire  _T_43 = 3'h7 == funct3; // @[Conditional.scala 37:30]
  wire  _T_44 = 7'h3 == opcode; // @[Conditional.scala 37:30]
  wire  _T_49 = 3'h2 == funct3; // @[Conditional.scala 37:30]
  wire  _T_52 = 7'h23 == opcode; // @[Conditional.scala 37:30]
  wire [11:0] _T_56 = {funct7,io_instruc[11:7]}; // @[InstDeco.scala 146:83]
  wire  _T_60 = 7'h13 == opcode; // @[Conditional.scala 37:30]
  wire  _T_65 = 3'h3 == funct3; // @[Conditional.scala 37:30]
  wire [4:0] _T_71 = io_instruc[24:20]; // @[InstDeco.scala 187:77]
  wire [11:0] _GEN_16 = _T_41 ? $signed({{7{_T_71[4]}},_T_71}) : $signed(_T_27); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_18 = _T_39 ? $signed({{7{_T_71[4]}},_T_71}) : $signed(_GEN_16); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_21 = _T_43 ? $signed(_T_27) : $signed(_GEN_18); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_23 = _T_42 ? $signed(_T_27) : $signed(_GEN_21); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_25 = _T_40 ? $signed(_T_27) : $signed(_GEN_23); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_27 = _T_65 ? $signed(_T_27) : $signed(_GEN_25); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_29 = _T_49 ? $signed(_T_27) : $signed(_GEN_27); // @[Conditional.scala 39:67]
  wire [11:0] _GEN_31 = _T_38 ? $signed(_T_27) : $signed(_GEN_29); // @[Conditional.scala 40:58]
  wire  _T_77 = 7'h33 == opcode; // @[Conditional.scala 37:30]
  wire  _T_104 = 7'h73 == opcode; // @[Conditional.scala 37:30]
  wire [31:0] _T_107 = {20'h0,io_instruc[31:20]}; // @[InstDeco.scala 320:68]
  wire [31:0] _GEN_65 = _T_104 ? $signed(_T_107) : $signed(32'sh0); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_68 = _T_77 ? $signed(32'sh0) : $signed(_GEN_65); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_69 = _T_60 ? $signed({{20{_GEN_31[11]}},_GEN_31}) : $signed(_GEN_68); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_71 = _T_52 ? $signed({{20{_T_56[11]}},_T_56}) : $signed(_GEN_69); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_73 = _T_44 ? $signed({{20{_T_27[11]}},_T_27}) : $signed(_GEN_71); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_75 = _T_28 ? $signed({{19{_T_37[12]}},_T_37}) : $signed(_GEN_73); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_78 = _T_25 ? $signed({{20{_T_27[11]}},_T_27}) : $signed(_GEN_75); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_80 = _T_15 ? $signed({{11{_T_24[20]}},_T_24}) : $signed(_GEN_78); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_82 = _T_11 ? $signed(_T_10) : $signed(_GEN_80); // @[Conditional.scala 39:67]
  assign io_rd = io_instruc[11:7]; // @[InstDeco.scala 65:14]
  assign io_rs1 = io_instruc[19:15]; // @[InstDeco.scala 68:15]
  assign io_rs2 = io_instruc[24:20]; // @[InstDeco.scala 70:15]
  assign io_imm = _T_7 ? $signed(_T_10) : $signed(_GEN_82); // @[InstDeco.scala 72:15 InstDeco.scala 80:39 InstDeco.scala 84:39 InstDeco.scala 89:39 InstDeco.scala 94:39 InstDeco.scala 99:39 InstDeco.scala 124:39 InstDeco.scala 146:39 InstDeco.scala 162:39 InstDeco.scala 187:55 InstDeco.scala 191:63 InstDeco.scala 320:31]
endmodule
module ALU(
  input  [31:0] io_instruc,
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  output [31:0] io_out
);
  wire [6:0] opcode = io_instruc[6:0]; // @[ALU.scala 17:27]
  wire [2:0] funct3 = io_instruc[14:12]; // @[ALU.scala 19:27]
  wire [6:0] funct7 = io_instruc[31:25]; // @[ALU.scala 21:27]
  wire  _T_3 = opcode == 7'h37; // @[ALU.scala 24:20]
  wire  _T_4 = opcode == 7'h17; // @[ALU.scala 25:25]
  wire  _T_5 = opcode == 7'h13; // @[ALU.scala 26:25]
  wire  _T_6 = funct3 == 3'h0; // @[ALU.scala 27:28]
  wire [31:0] _T_8 = io_in1 + io_in2; // @[ALU.scala 27:82]
  wire  _T_9 = funct3 == 3'h2; // @[ALU.scala 28:33]
  wire  _T_12 = $signed(io_in1) < $signed(io_in2); // @[ALU.scala 28:98]
  wire  _T_13 = funct3 == 3'h3; // @[ALU.scala 29:33]
  wire  _T_14 = io_in1 < io_in2; // @[ALU.scala 29:94]
  wire  _T_16 = funct3 == 3'h4; // @[ALU.scala 30:33]
  wire [31:0] _T_17 = io_in1 ^ io_in2; // @[ALU.scala 30:90]
  wire  _T_18 = funct3 == 3'h6; // @[ALU.scala 31:33]
  wire [31:0] _T_19 = io_in1 | io_in2; // @[ALU.scala 31:90]
  wire  _T_20 = funct3 == 3'h7; // @[ALU.scala 32:33]
  wire [31:0] _T_21 = io_in1 & io_in2; // @[ALU.scala 32:90]
  wire  _T_22 = funct3 == 3'h1; // @[ALU.scala 33:33]
  wire [62:0] _GEN_34 = {{31'd0}, io_in1}; // @[ALU.scala 33:90]
  wire [62:0] _T_24 = _GEN_34 << io_in2[4:0]; // @[ALU.scala 33:90]
  wire  _T_25 = funct3 == 3'h5; // @[ALU.scala 34:33]
  wire  _T_26 = funct7 == 7'h0; // @[ALU.scala 35:36]
  wire [31:0] _T_28 = io_in1 >> io_in2[4:0]; // @[ALU.scala 35:98]
  wire  _T_29 = funct7 == 7'h20; // @[ALU.scala 36:41]
  wire  _T_31 = ~io_in1[31]; // @[ALU.scala 36:110]
  wire [5:0] _GEN_35 = {{1'd0}, io_in2[4:0]}; // @[ALU.scala 38:240]
  wire [5:0] _T_38 = 6'h20 - _GEN_35; // @[ALU.scala 38:240]
  wire [94:0] _T_39 = 95'hffffffff << _T_38; // @[ALU.scala 38:231]
  wire [94:0] _GEN_36 = {{63'd0}, _T_28}; // @[ALU.scala 38:213]
  wire [94:0] _T_40 = _GEN_36 | _T_39; // @[ALU.scala 38:213]
  wire [94:0] _GEN_0 = _T_31 ? {{63'd0}, _T_28} : _T_40; // @[ALU.scala 36:118]
  wire [94:0] _GEN_1 = _T_29 ? _GEN_0 : 95'h0; // @[ALU.scala 36:57]
  wire [94:0] _GEN_2 = _T_26 ? {{63'd0}, _T_28} : _GEN_1; // @[ALU.scala 35:49]
  wire [94:0] _GEN_3 = _T_25 ? _GEN_2 : 95'h0; // @[ALU.scala 34:49]
  wire [94:0] _GEN_4 = _T_22 ? {{32'd0}, _T_24} : _GEN_3; // @[ALU.scala 33:49]
  wire [94:0] _GEN_5 = _T_20 ? {{63'd0}, _T_21} : _GEN_4; // @[ALU.scala 32:49]
  wire [94:0] _GEN_6 = _T_18 ? {{63'd0}, _T_19} : _GEN_5; // @[ALU.scala 31:49]
  wire [94:0] _GEN_7 = _T_16 ? {{63'd0}, _T_17} : _GEN_6; // @[ALU.scala 30:49]
  wire [94:0] _GEN_8 = _T_13 ? {{94'd0}, _T_14} : _GEN_7; // @[ALU.scala 29:49]
  wire [94:0] _GEN_9 = _T_9 ? {{94'd0}, _T_12} : _GEN_8; // @[ALU.scala 28:49]
  wire [94:0] _GEN_10 = _T_6 ? {{63'd0}, _T_8} : _GEN_9; // @[ALU.scala 27:41]
  wire  _T_41 = opcode == 7'h33; // @[ALU.scala 44:25]
  wire [31:0] _T_48 = io_in1 - io_in2; // @[ALU.scala 47:104]
  wire [31:0] _GEN_11 = _T_29 ? _T_48 : 32'h0; // @[ALU.scala 47:57]
  wire [31:0] _GEN_12 = _T_26 ? _T_8 : _GEN_11; // @[ALU.scala 46:49]
  wire [62:0] _GEN_13 = _T_26 ? _T_24 : 63'h0; // @[ALU.scala 51:49]
  wire  _GEN_14 = _T_26 & _T_12; // @[ALU.scala 55:49]
  wire  _GEN_15 = _T_26 & _T_14; // @[ALU.scala 59:49]
  wire [31:0] _GEN_16 = _T_26 ? _T_17 : 32'h0; // @[ALU.scala 63:49]
  wire [31:0] _GEN_20 = _T_26 ? _T_19 : 32'h0; // @[ALU.scala 75:49]
  wire [31:0] _GEN_21 = _T_26 ? _T_21 : 32'h0; // @[ALU.scala 79:49]
  wire [31:0] _GEN_22 = _T_20 ? _GEN_21 : 32'h0; // @[ALU.scala 78:41]
  wire [31:0] _GEN_23 = _T_18 ? _GEN_20 : _GEN_22; // @[ALU.scala 74:49]
  wire [94:0] _GEN_24 = _T_25 ? _GEN_2 : {{63'd0}, _GEN_23}; // @[ALU.scala 66:49]
  wire [94:0] _GEN_25 = _T_16 ? {{63'd0}, _GEN_16} : _GEN_24; // @[ALU.scala 62:49]
  wire [94:0] _GEN_26 = _T_13 ? {{94'd0}, _GEN_15} : _GEN_25; // @[ALU.scala 58:49]
  wire [94:0] _GEN_27 = _T_9 ? {{94'd0}, _GEN_14} : _GEN_26; // @[ALU.scala 54:49]
  wire [94:0] _GEN_28 = _T_22 ? {{32'd0}, _GEN_13} : _GEN_27; // @[ALU.scala 50:49]
  wire [94:0] _GEN_29 = _T_6 ? {{63'd0}, _GEN_12} : _GEN_28; // @[ALU.scala 45:41]
  wire [94:0] _GEN_30 = _T_41 ? _GEN_29 : 95'h0; // @[ALU.scala 44:41]
  wire [94:0] _GEN_31 = _T_5 ? _GEN_10 : _GEN_30; // @[ALU.scala 26:41]
  wire [94:0] _GEN_32 = _T_4 ? 95'h0 : _GEN_31; // @[ALU.scala 25:41]
  wire [94:0] _GEN_33 = _T_3 ? 95'h0 : _GEN_32; // @[ALU.scala 24:33]
  assign io_out = _GEN_33[31:0]; // @[ALU.scala 24:55 ALU.scala 25:63 ALU.scala 27:72 ALU.scala 28:80 ALU.scala 29:80 ALU.scala 30:80 ALU.scala 31:80 ALU.scala 32:80 ALU.scala 33:80 ALU.scala 35:88 ALU.scala 36:127 ALU.scala 38:188 ALU.scala 41:87 ALU.scala 42:87 ALU.scala 46:88 ALU.scala 47:95 ALU.scala 48:87 ALU.scala 51:88 ALU.scala 52:87 ALU.scala 55:88 ALU.scala 56:87 ALU.scala 59:88 ALU.scala 60:79 ALU.scala 63:88 ALU.scala 64:79 ALU.scala 67:88 ALU.scala 68:127 ALU.scala 70:188 ALU.scala 72:79 ALU.scala 75:88 ALU.scala 76:79 ALU.scala 79:88 ALU.scala 80:79 ALU.scala 81:87 ALU.scala 82:71]
endmodule
module TOP(
  input         clock,
  input         reset,
  input         io_reset,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] InstDeco_io_instruc; // @[TOP.scala 14:30]
  wire [4:0] InstDeco_io_rd; // @[TOP.scala 14:30]
  wire [4:0] InstDeco_io_rs1; // @[TOP.scala 14:30]
  wire [4:0] InstDeco_io_rs2; // @[TOP.scala 14:30]
  wire [31:0] InstDeco_io_imm; // @[TOP.scala 14:30]
  wire [31:0] ALU_io_instruc; // @[TOP.scala 15:25]
  wire [31:0] ALU_io_in1; // @[TOP.scala 15:25]
  wire [31:0] ALU_io_in2; // @[TOP.scala 15:25]
  wire [31:0] ALU_io_out; // @[TOP.scala 15:25]
  reg [6:0] opcode; // @[TOP.scala 18:29]
  reg [31:0] RegOfVec_0; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_1; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_2; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_3; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_4; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_5; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_6; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_7; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_8; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_9; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_10; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_11; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_12; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_13; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_14; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_15; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_16; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_17; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_18; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_19; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_20; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_21; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_22; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_23; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_24; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_25; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_26; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_27; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_28; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_29; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_30; // @[TOP.scala 19:31]
  reg [31:0] RegOfVec_31; // @[TOP.scala 19:31]
  reg [31:0] instruc; // @[TOP.scala 20:30]
  reg [4:0] addrI; // @[TOP.scala 21:28]
  reg [31:0] pc; // @[TOP.scala 22:25]
  reg [31:0] reg_out; // @[TOP.scala 23:30]
  wire [31:0] _GEN_1 = 5'h1 == InstDeco_io_rs1 ? RegOfVec_1 : RegOfVec_0; // @[TOP.scala 31:20]
  wire [31:0] _GEN_2 = 5'h2 == InstDeco_io_rs1 ? RegOfVec_2 : _GEN_1; // @[TOP.scala 31:20]
  wire [31:0] _GEN_3 = 5'h3 == InstDeco_io_rs1 ? RegOfVec_3 : _GEN_2; // @[TOP.scala 31:20]
  wire [31:0] _GEN_4 = 5'h4 == InstDeco_io_rs1 ? RegOfVec_4 : _GEN_3; // @[TOP.scala 31:20]
  wire [31:0] _GEN_5 = 5'h5 == InstDeco_io_rs1 ? RegOfVec_5 : _GEN_4; // @[TOP.scala 31:20]
  wire [31:0] _GEN_6 = 5'h6 == InstDeco_io_rs1 ? RegOfVec_6 : _GEN_5; // @[TOP.scala 31:20]
  wire [31:0] _GEN_7 = 5'h7 == InstDeco_io_rs1 ? RegOfVec_7 : _GEN_6; // @[TOP.scala 31:20]
  wire [31:0] _GEN_8 = 5'h8 == InstDeco_io_rs1 ? RegOfVec_8 : _GEN_7; // @[TOP.scala 31:20]
  wire [31:0] _GEN_9 = 5'h9 == InstDeco_io_rs1 ? RegOfVec_9 : _GEN_8; // @[TOP.scala 31:20]
  wire [31:0] _GEN_10 = 5'ha == InstDeco_io_rs1 ? RegOfVec_10 : _GEN_9; // @[TOP.scala 31:20]
  wire [31:0] _GEN_11 = 5'hb == InstDeco_io_rs1 ? RegOfVec_11 : _GEN_10; // @[TOP.scala 31:20]
  wire [31:0] _GEN_12 = 5'hc == InstDeco_io_rs1 ? RegOfVec_12 : _GEN_11; // @[TOP.scala 31:20]
  wire [31:0] _GEN_13 = 5'hd == InstDeco_io_rs1 ? RegOfVec_13 : _GEN_12; // @[TOP.scala 31:20]
  wire [31:0] _GEN_14 = 5'he == InstDeco_io_rs1 ? RegOfVec_14 : _GEN_13; // @[TOP.scala 31:20]
  wire [31:0] _GEN_15 = 5'hf == InstDeco_io_rs1 ? RegOfVec_15 : _GEN_14; // @[TOP.scala 31:20]
  wire [31:0] _GEN_16 = 5'h10 == InstDeco_io_rs1 ? RegOfVec_16 : _GEN_15; // @[TOP.scala 31:20]
  wire [31:0] _GEN_17 = 5'h11 == InstDeco_io_rs1 ? RegOfVec_17 : _GEN_16; // @[TOP.scala 31:20]
  wire [31:0] _GEN_18 = 5'h12 == InstDeco_io_rs1 ? RegOfVec_18 : _GEN_17; // @[TOP.scala 31:20]
  wire [31:0] _GEN_19 = 5'h13 == InstDeco_io_rs1 ? RegOfVec_19 : _GEN_18; // @[TOP.scala 31:20]
  wire [31:0] _GEN_20 = 5'h14 == InstDeco_io_rs1 ? RegOfVec_20 : _GEN_19; // @[TOP.scala 31:20]
  wire [31:0] _GEN_21 = 5'h15 == InstDeco_io_rs1 ? RegOfVec_21 : _GEN_20; // @[TOP.scala 31:20]
  wire [31:0] _GEN_22 = 5'h16 == InstDeco_io_rs1 ? RegOfVec_22 : _GEN_21; // @[TOP.scala 31:20]
  wire [31:0] _GEN_23 = 5'h17 == InstDeco_io_rs1 ? RegOfVec_23 : _GEN_22; // @[TOP.scala 31:20]
  wire [31:0] _GEN_24 = 5'h18 == InstDeco_io_rs1 ? RegOfVec_24 : _GEN_23; // @[TOP.scala 31:20]
  wire [31:0] _GEN_25 = 5'h19 == InstDeco_io_rs1 ? RegOfVec_25 : _GEN_24; // @[TOP.scala 31:20]
  wire [31:0] _GEN_26 = 5'h1a == InstDeco_io_rs1 ? RegOfVec_26 : _GEN_25; // @[TOP.scala 31:20]
  wire [31:0] _GEN_27 = 5'h1b == InstDeco_io_rs1 ? RegOfVec_27 : _GEN_26; // @[TOP.scala 31:20]
  wire [31:0] _GEN_28 = 5'h1c == InstDeco_io_rs1 ? RegOfVec_28 : _GEN_27; // @[TOP.scala 31:20]
  wire [31:0] _GEN_29 = 5'h1d == InstDeco_io_rs1 ? RegOfVec_29 : _GEN_28; // @[TOP.scala 31:20]
  wire [31:0] _GEN_30 = 5'h1e == InstDeco_io_rs1 ? RegOfVec_30 : _GEN_29; // @[TOP.scala 31:20]
  wire [31:0] _GEN_33 = 5'h1 == InstDeco_io_rs2 ? RegOfVec_1 : RegOfVec_0; // @[TOP.scala 32:26]
  wire [31:0] _GEN_34 = 5'h2 == InstDeco_io_rs2 ? RegOfVec_2 : _GEN_33; // @[TOP.scala 32:26]
  wire [31:0] _GEN_35 = 5'h3 == InstDeco_io_rs2 ? RegOfVec_3 : _GEN_34; // @[TOP.scala 32:26]
  wire [31:0] _GEN_36 = 5'h4 == InstDeco_io_rs2 ? RegOfVec_4 : _GEN_35; // @[TOP.scala 32:26]
  wire [31:0] _GEN_37 = 5'h5 == InstDeco_io_rs2 ? RegOfVec_5 : _GEN_36; // @[TOP.scala 32:26]
  wire [31:0] _GEN_38 = 5'h6 == InstDeco_io_rs2 ? RegOfVec_6 : _GEN_37; // @[TOP.scala 32:26]
  wire [31:0] _GEN_39 = 5'h7 == InstDeco_io_rs2 ? RegOfVec_7 : _GEN_38; // @[TOP.scala 32:26]
  wire [31:0] _GEN_40 = 5'h8 == InstDeco_io_rs2 ? RegOfVec_8 : _GEN_39; // @[TOP.scala 32:26]
  wire [31:0] _GEN_41 = 5'h9 == InstDeco_io_rs2 ? RegOfVec_9 : _GEN_40; // @[TOP.scala 32:26]
  wire [31:0] _GEN_42 = 5'ha == InstDeco_io_rs2 ? RegOfVec_10 : _GEN_41; // @[TOP.scala 32:26]
  wire [31:0] _GEN_43 = 5'hb == InstDeco_io_rs2 ? RegOfVec_11 : _GEN_42; // @[TOP.scala 32:26]
  wire [31:0] _GEN_44 = 5'hc == InstDeco_io_rs2 ? RegOfVec_12 : _GEN_43; // @[TOP.scala 32:26]
  wire [31:0] _GEN_45 = 5'hd == InstDeco_io_rs2 ? RegOfVec_13 : _GEN_44; // @[TOP.scala 32:26]
  wire [31:0] _GEN_46 = 5'he == InstDeco_io_rs2 ? RegOfVec_14 : _GEN_45; // @[TOP.scala 32:26]
  wire [31:0] _GEN_47 = 5'hf == InstDeco_io_rs2 ? RegOfVec_15 : _GEN_46; // @[TOP.scala 32:26]
  wire [31:0] _GEN_48 = 5'h10 == InstDeco_io_rs2 ? RegOfVec_16 : _GEN_47; // @[TOP.scala 32:26]
  wire [31:0] _GEN_49 = 5'h11 == InstDeco_io_rs2 ? RegOfVec_17 : _GEN_48; // @[TOP.scala 32:26]
  wire [31:0] _GEN_50 = 5'h12 == InstDeco_io_rs2 ? RegOfVec_18 : _GEN_49; // @[TOP.scala 32:26]
  wire [31:0] _GEN_51 = 5'h13 == InstDeco_io_rs2 ? RegOfVec_19 : _GEN_50; // @[TOP.scala 32:26]
  wire [31:0] _GEN_52 = 5'h14 == InstDeco_io_rs2 ? RegOfVec_20 : _GEN_51; // @[TOP.scala 32:26]
  wire [31:0] _GEN_53 = 5'h15 == InstDeco_io_rs2 ? RegOfVec_21 : _GEN_52; // @[TOP.scala 32:26]
  wire [31:0] _GEN_54 = 5'h16 == InstDeco_io_rs2 ? RegOfVec_22 : _GEN_53; // @[TOP.scala 32:26]
  wire [31:0] _GEN_55 = 5'h17 == InstDeco_io_rs2 ? RegOfVec_23 : _GEN_54; // @[TOP.scala 32:26]
  wire [31:0] _GEN_56 = 5'h18 == InstDeco_io_rs2 ? RegOfVec_24 : _GEN_55; // @[TOP.scala 32:26]
  wire [31:0] _GEN_57 = 5'h19 == InstDeco_io_rs2 ? RegOfVec_25 : _GEN_56; // @[TOP.scala 32:26]
  wire [31:0] _GEN_58 = 5'h1a == InstDeco_io_rs2 ? RegOfVec_26 : _GEN_57; // @[TOP.scala 32:26]
  wire [31:0] _GEN_59 = 5'h1b == InstDeco_io_rs2 ? RegOfVec_27 : _GEN_58; // @[TOP.scala 32:26]
  wire [31:0] _GEN_60 = 5'h1c == InstDeco_io_rs2 ? RegOfVec_28 : _GEN_59; // @[TOP.scala 32:26]
  wire [31:0] _GEN_61 = 5'h1d == InstDeco_io_rs2 ? RegOfVec_29 : _GEN_60; // @[TOP.scala 32:26]
  wire [31:0] _GEN_62 = 5'h1e == InstDeco_io_rs2 ? RegOfVec_30 : _GEN_61; // @[TOP.scala 32:26]
  wire [31:0] _GEN_63 = 5'h1f == InstDeco_io_rs2 ? RegOfVec_31 : _GEN_62; // @[TOP.scala 32:26]
  wire  _T_7 = ~io_reset; // @[TOP.scala 37:31]
  wire  _T_8 = pc != 32'h3; // @[TOP.scala 37:47]
  wire  _T_9 = _T_7 & _T_8; // @[TOP.scala 37:40]
  wire [31:0] _T_11 = pc + 32'h1; // @[TOP.scala 39:26]
  wire [4:0] _T_13 = addrI + 5'h1; // @[TOP.scala 43:32]
  wire  _T_14 = pc == 32'h3; // @[TOP.scala 49:17]
  wire  _T_15 = addrI == 5'h1; // @[TOP.scala 68:15]
  wire  _T_16 = addrI == 5'h2; // @[TOP.scala 71:26]
  wire  _T_17 = addrI == 5'h3; // @[TOP.scala 74:26]
  wire  _T_18 = addrI == 5'h4; // @[TOP.scala 77:26]
  wire  _T_19 = addrI == 5'h5; // @[TOP.scala 80:26]
  wire  _T_20 = addrI == 5'h6; // @[TOP.scala 83:26]
  InstDeco InstDeco ( // @[TOP.scala 14:30]
    .io_instruc(InstDeco_io_instruc),
    .io_rd(InstDeco_io_rd),
    .io_rs1(InstDeco_io_rs1),
    .io_rs2(InstDeco_io_rs2),
    .io_imm(InstDeco_io_imm)
  );
  ALU ALU ( // @[TOP.scala 15:25]
    .io_instruc(ALU_io_instruc),
    .io_in1(ALU_io_in1),
    .io_in2(ALU_io_in2),
    .io_out(ALU_io_out)
  );
  assign io_out = reg_out; // @[TOP.scala 34:16]
  assign InstDeco_io_instruc = instruc; // @[TOP.scala 26:29]
  assign ALU_io_instruc = instruc; // @[TOP.scala 30:23]
  assign ALU_io_in1 = 5'h1f == InstDeco_io_rs1 ? RegOfVec_31 : _GEN_30; // @[TOP.scala 31:20]
  assign ALU_io_in2 = opcode[5] ? _GEN_63 : InstDeco_io_imm; // @[TOP.scala 32:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  opcode = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  RegOfVec_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  RegOfVec_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  RegOfVec_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  RegOfVec_3 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  RegOfVec_4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  RegOfVec_5 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  RegOfVec_6 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  RegOfVec_7 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  RegOfVec_8 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  RegOfVec_9 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  RegOfVec_10 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  RegOfVec_11 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  RegOfVec_12 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  RegOfVec_13 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  RegOfVec_14 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  RegOfVec_15 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  RegOfVec_16 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  RegOfVec_17 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  RegOfVec_18 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  RegOfVec_19 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  RegOfVec_20 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  RegOfVec_21 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  RegOfVec_22 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  RegOfVec_23 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  RegOfVec_24 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  RegOfVec_25 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  RegOfVec_26 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  RegOfVec_27 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  RegOfVec_28 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  RegOfVec_29 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  RegOfVec_30 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  RegOfVec_31 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  instruc = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  addrI = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  pc = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  reg_out = _RAND_36[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      opcode <= 7'h0;
    end else begin
      opcode <= instruc[6:0];
    end
    if (reset) begin
      RegOfVec_0 <= 32'h0;
    end else if (_T_14) begin
      if (5'h0 == InstDeco_io_rd) begin
        RegOfVec_0 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_1 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1 == InstDeco_io_rd) begin
        RegOfVec_1 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_2 <= 32'h0;
    end else if (_T_14) begin
      if (5'h2 == InstDeco_io_rd) begin
        RegOfVec_2 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_3 <= 32'h0;
    end else if (_T_14) begin
      if (5'h3 == InstDeco_io_rd) begin
        RegOfVec_3 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_4 <= 32'h0;
    end else if (_T_14) begin
      if (5'h4 == InstDeco_io_rd) begin
        RegOfVec_4 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_5 <= 32'h0;
    end else if (_T_14) begin
      if (5'h5 == InstDeco_io_rd) begin
        RegOfVec_5 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_6 <= 32'h0;
    end else if (_T_14) begin
      if (5'h6 == InstDeco_io_rd) begin
        RegOfVec_6 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_7 <= 32'h0;
    end else if (_T_14) begin
      if (5'h7 == InstDeco_io_rd) begin
        RegOfVec_7 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_8 <= 32'h0;
    end else if (_T_14) begin
      if (5'h8 == InstDeco_io_rd) begin
        RegOfVec_8 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_9 <= 32'h0;
    end else if (_T_14) begin
      if (5'h9 == InstDeco_io_rd) begin
        RegOfVec_9 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_10 <= 32'h0;
    end else if (_T_14) begin
      if (5'ha == InstDeco_io_rd) begin
        RegOfVec_10 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_11 <= 32'h0;
    end else if (_T_14) begin
      if (5'hb == InstDeco_io_rd) begin
        RegOfVec_11 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_12 <= 32'h0;
    end else if (_T_14) begin
      if (5'hc == InstDeco_io_rd) begin
        RegOfVec_12 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_13 <= 32'h0;
    end else if (_T_14) begin
      if (5'hd == InstDeco_io_rd) begin
        RegOfVec_13 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_14 <= 32'h0;
    end else if (_T_14) begin
      if (5'he == InstDeco_io_rd) begin
        RegOfVec_14 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_15 <= 32'h0;
    end else if (_T_14) begin
      if (5'hf == InstDeco_io_rd) begin
        RegOfVec_15 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_16 <= 32'h0;
    end else if (_T_14) begin
      if (5'h10 == InstDeco_io_rd) begin
        RegOfVec_16 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_17 <= 32'h0;
    end else if (_T_14) begin
      if (5'h11 == InstDeco_io_rd) begin
        RegOfVec_17 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_18 <= 32'h0;
    end else if (_T_14) begin
      if (5'h12 == InstDeco_io_rd) begin
        RegOfVec_18 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_19 <= 32'h0;
    end else if (_T_14) begin
      if (5'h13 == InstDeco_io_rd) begin
        RegOfVec_19 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_20 <= 32'h0;
    end else if (_T_14) begin
      if (5'h14 == InstDeco_io_rd) begin
        RegOfVec_20 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_21 <= 32'h0;
    end else if (_T_14) begin
      if (5'h15 == InstDeco_io_rd) begin
        RegOfVec_21 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_22 <= 32'h0;
    end else if (_T_14) begin
      if (5'h16 == InstDeco_io_rd) begin
        RegOfVec_22 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_23 <= 32'h0;
    end else if (_T_14) begin
      if (5'h17 == InstDeco_io_rd) begin
        RegOfVec_23 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_24 <= 32'h0;
    end else if (_T_14) begin
      if (5'h18 == InstDeco_io_rd) begin
        RegOfVec_24 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_25 <= 32'h0;
    end else if (_T_14) begin
      if (5'h19 == InstDeco_io_rd) begin
        RegOfVec_25 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_26 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1a == InstDeco_io_rd) begin
        RegOfVec_26 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_27 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1b == InstDeco_io_rd) begin
        RegOfVec_27 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_28 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1c == InstDeco_io_rd) begin
        RegOfVec_28 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_29 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1d == InstDeco_io_rd) begin
        RegOfVec_29 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_30 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1e == InstDeco_io_rd) begin
        RegOfVec_30 <= reg_out;
      end
    end
    if (reset) begin
      RegOfVec_31 <= 32'h0;
    end else if (_T_14) begin
      if (5'h1f == InstDeco_io_rd) begin
        RegOfVec_31 <= reg_out;
      end
    end
    if (reset) begin
      instruc <= 32'h0;
    end else if (_T_15) begin
      instruc <= 32'h100113;
    end else if (_T_16) begin
      instruc <= 32'h300193;
    end else if (_T_17) begin
      instruc <= 32'h213;
    end else if (_T_18) begin
      instruc <= 32'h310233;
    end else if (_T_19) begin
      instruc <= 32'h2201b3;
    end else if (_T_20) begin
      instruc <= 32'h418133;
    end
    if (reset) begin
      addrI <= 5'h0;
    end else if (!(_T_9)) begin
      addrI <= _T_13;
    end
    if (reset) begin
      pc <= 32'h0;
    end else if (_T_9) begin
      pc <= _T_11;
    end else begin
      pc <= 32'h0;
    end
    if (reset) begin
      reg_out <= 32'h0;
    end else begin
      reg_out <= ALU_io_out;
    end
  end
endmodule
