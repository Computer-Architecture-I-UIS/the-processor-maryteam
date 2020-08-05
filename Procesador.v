module InstDeco(
  input  [31:0] io_instruc,
  output [4:0]  io_rd,
  output [4:0]  io_rs1,
  output [4:0]  io_rs2,
  output [31:0] io_imm,
  output [5:0]  io_state
);
  wire [6:0] opcode = io_instruc[6:0]; // @[InstDeco.scala 31:27]
  wire [2:0] funct3 = io_instruc[14:12]; // @[InstDeco.scala 34:27]
  wire [6:0] funct7 = io_instruc[31:25]; // @[InstDeco.scala 37:27]
  wire  _T_7 = 7'h37 == opcode; // @[Conditional.scala 37:30]
  wire [31:0] _T_10 = {io_instruc[31:12],12'h0}; // @[InstDeco.scala 56:76]
  wire  _T_11 = 7'h17 == opcode; // @[Conditional.scala 37:30]
  wire  _T_15 = 7'h6f == opcode; // @[Conditional.scala 37:30]
  wire [20:0] _T_24 = {io_instruc[31],io_instruc[19:12],io_instruc[20],io_instruc[30:21],1'h0}; // @[InstDeco.scala 65:123]
  wire  _T_25 = 7'h67 == opcode; // @[Conditional.scala 37:30]
  wire [11:0] _T_27 = io_instruc[31:20]; // @[InstDeco.scala 70:61]
  wire  _T_28 = 7'h63 == opcode; // @[Conditional.scala 37:30]
  wire [12:0] _T_37 = {io_instruc[31],io_instruc[7],io_instruc[30:25],io_instruc[11:8],1'h0}; // @[InstDeco.scala 75:121]
  wire  _T_38 = 3'h0 == funct3; // @[Conditional.scala 37:30]
  wire  _T_39 = 3'h1 == funct3; // @[Conditional.scala 37:30]
  wire  _T_40 = 3'h4 == funct3; // @[Conditional.scala 37:30]
  wire  _T_41 = 3'h5 == funct3; // @[Conditional.scala 37:30]
  wire  _T_42 = 3'h6 == funct3; // @[Conditional.scala 37:30]
  wire  _T_43 = 3'h7 == funct3; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_0 = _T_43 ? 6'h9 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_1 = _T_42 ? 6'h8 : _GEN_0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_2 = _T_41 ? 6'h7 : _GEN_1; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_3 = _T_40 ? 6'h6 : _GEN_2; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_4 = _T_39 ? 6'h5 : _GEN_3; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_5 = _T_38 ? 6'h4 : _GEN_4; // @[Conditional.scala 40:58]
  wire  _T_44 = 7'h3 == opcode; // @[Conditional.scala 37:30]
  wire  _T_49 = 3'h2 == funct3; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_6 = _T_41 ? 6'h12 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_7 = _T_40 ? 6'h11 : _GEN_6; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_8 = _T_49 ? 6'h10 : _GEN_7; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_9 = _T_39 ? 6'hf : _GEN_8; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_10 = _T_38 ? 6'he : _GEN_9; // @[Conditional.scala 40:58]
  wire  _T_52 = 7'h23 == opcode; // @[Conditional.scala 37:30]
  wire [11:0] _T_56 = {funct7,io_instruc[11:7]}; // @[InstDeco.scala 122:83]
  wire [5:0] _GEN_11 = _T_49 ? 6'hc : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_12 = _T_39 ? 6'hb : _GEN_11; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_13 = _T_38 ? 6'ha : _GEN_12; // @[Conditional.scala 40:58]
  wire  _T_60 = 7'h13 == opcode; // @[Conditional.scala 37:30]
  wire  _T_65 = 3'h3 == funct3; // @[Conditional.scala 37:30]
  wire [4:0] _T_71 = io_instruc[24:20]; // @[InstDeco.scala 163:77]
  wire  _T_75 = 7'h0 == funct7; // @[Conditional.scala 37:30]
  wire  _T_76 = 7'h20 == funct7; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_14 = _T_76 ? 6'h1b : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_15 = _T_75 ? 6'h1a : _GEN_14; // @[Conditional.scala 40:58]
  wire [11:0] _GEN_16 = _T_41 ? $signed({{7{_T_71[4]}},_T_71}) : $signed(_T_27); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_17 = _T_41 ? _GEN_15 : 6'h0; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_18 = _T_39 ? $signed({{7{_T_71[4]}},_T_71}) : $signed(_GEN_16); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_19 = _T_39 ? 6'h19 : _GEN_17; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_20 = _T_43 ? 6'h18 : _GEN_19; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_21 = _T_43 ? $signed(_T_27) : $signed(_GEN_18); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_22 = _T_42 ? 6'h17 : _GEN_20; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_23 = _T_42 ? $signed(_T_27) : $signed(_GEN_21); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_24 = _T_40 ? 6'h16 : _GEN_22; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_25 = _T_40 ? $signed(_T_27) : $signed(_GEN_23); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_26 = _T_65 ? 6'h15 : _GEN_24; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_27 = _T_65 ? $signed(_T_27) : $signed(_GEN_25); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_28 = _T_49 ? 6'h14 : _GEN_26; // @[Conditional.scala 39:67]
  wire [11:0] _GEN_29 = _T_49 ? $signed(_T_27) : $signed(_GEN_27); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_30 = _T_38 ? 6'h13 : _GEN_28; // @[Conditional.scala 40:58]
  wire [11:0] _GEN_31 = _T_38 ? $signed(_T_27) : $signed(_GEN_29); // @[Conditional.scala 40:58]
  wire  _T_77 = 7'h33 == opcode; // @[Conditional.scala 37:30]
  wire  _T_80 = 7'h1 == funct7; // @[Conditional.scala 37:30]
  wire [5:0] _GEN_32 = _T_76 ? 6'h25 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_33 = _T_80 ? 6'h24 : _GEN_32; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_34 = _T_75 ? 6'h23 : _GEN_33; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_35 = _T_80 ? 6'h27 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_36 = _T_75 ? 6'h26 : _GEN_35; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_37 = _T_80 ? 6'h29 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_38 = _T_75 ? 6'h28 : _GEN_37; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_39 = _T_80 ? 6'h2b : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_40 = _T_75 ? 6'h2a : _GEN_39; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_41 = _T_80 ? 6'h2d : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_42 = _T_75 ? 6'h2c : _GEN_41; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_43 = _T_76 ? 6'h30 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_44 = _T_80 ? 6'h2f : _GEN_43; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_45 = _T_75 ? 6'h2e : _GEN_44; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_46 = _T_80 ? 6'h32 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_47 = _T_75 ? 6'h31 : _GEN_46; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_48 = _T_80 ? 6'h34 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_49 = _T_75 ? 6'h33 : _GEN_48; // @[Conditional.scala 40:58]
  wire [5:0] _GEN_50 = _T_43 ? _GEN_49 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_51 = _T_42 ? _GEN_47 : _GEN_50; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_52 = _T_41 ? _GEN_45 : _GEN_51; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_53 = _T_40 ? _GEN_42 : _GEN_52; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_54 = _T_65 ? _GEN_40 : _GEN_53; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_55 = _T_49 ? _GEN_38 : _GEN_54; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_56 = _T_39 ? _GEN_36 : _GEN_55; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_57 = _T_38 ? _GEN_34 : _GEN_56; // @[Conditional.scala 40:58]
  wire  _T_104 = 7'h73 == opcode; // @[Conditional.scala 37:30]
  wire [31:0] _T_107 = {20'h0,io_instruc[31:20]}; // @[InstDeco.scala 296:68]
  wire [5:0] _GEN_58 = _T_43 ? 6'h22 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_59 = _T_42 ? 6'h21 : _GEN_58; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_60 = _T_41 ? 6'h20 : _GEN_59; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_61 = _T_65 ? 6'h1f : _GEN_60; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_62 = _T_49 ? 6'h1e : _GEN_61; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_63 = _T_39 ? 6'h1d : _GEN_62; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_64 = _T_38 ? 6'h1c : _GEN_63; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_65 = _T_104 ? $signed(_T_107) : $signed(32'sh0); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_66 = _T_104 ? _GEN_64 : 6'h0; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_67 = _T_77 ? _GEN_57 : _GEN_66; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_68 = _T_77 ? $signed(32'sh0) : $signed(_GEN_65); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_69 = _T_60 ? $signed({{20{_GEN_31[11]}},_GEN_31}) : $signed(_GEN_68); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_70 = _T_60 ? _GEN_30 : _GEN_67; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_71 = _T_52 ? $signed({{20{_T_56[11]}},_T_56}) : $signed(_GEN_69); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_72 = _T_52 ? _GEN_13 : _GEN_70; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_73 = _T_44 ? $signed({{20{_T_27[11]}},_T_27}) : $signed(_GEN_71); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_74 = _T_44 ? _GEN_10 : _GEN_72; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_75 = _T_28 ? $signed({{19{_T_37[12]}},_T_37}) : $signed(_GEN_73); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_76 = _T_28 ? _GEN_5 : _GEN_74; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_77 = _T_25 ? 6'hd : _GEN_76; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_78 = _T_25 ? $signed({{20{_T_27[11]}},_T_27}) : $signed(_GEN_75); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_79 = _T_15 ? 6'h3 : _GEN_77; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_80 = _T_15 ? $signed({{11{_T_24[20]}},_T_24}) : $signed(_GEN_78); // @[Conditional.scala 39:67]
  wire [5:0] _GEN_81 = _T_11 ? 6'h2 : _GEN_79; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_82 = _T_11 ? $signed(_T_10) : $signed(_GEN_80); // @[Conditional.scala 39:67]
  assign io_rd = io_instruc[11:7]; // @[InstDeco.scala 41:14]
  assign io_rs1 = io_instruc[19:15]; // @[InstDeco.scala 44:15]
  assign io_rs2 = io_instruc[24:20]; // @[InstDeco.scala 46:15]
  assign io_imm = _T_7 ? $signed(_T_10) : $signed(_GEN_82); // @[InstDeco.scala 48:15 InstDeco.scala 56:39 InstDeco.scala 60:39 InstDeco.scala 65:39 InstDeco.scala 70:39 InstDeco.scala 75:39 InstDeco.scala 100:39 InstDeco.scala 122:39 InstDeco.scala 138:39 InstDeco.scala 163:55 InstDeco.scala 167:63 InstDeco.scala 296:31]
  assign io_state = _T_7 ? 6'h1 : _GEN_81; // @[InstDeco.scala 39:17 InstDeco.scala 55:41 InstDeco.scala 59:41 InstDeco.scala 64:41 InstDeco.scala 69:41 InstDeco.scala 76:41 InstDeco.scala 80:57 InstDeco.scala 83:57 InstDeco.scala 86:57 InstDeco.scala 89:57 InstDeco.scala 92:57 InstDeco.scala 95:58 InstDeco.scala 101:41 InstDeco.scala 105:57 InstDeco.scala 108:57 InstDeco.scala 111:57 InstDeco.scala 114:57 InstDeco.scala 117:57 InstDeco.scala 123:41 InstDeco.scala 127:57 InstDeco.scala 130:57 InstDeco.scala 133:57 InstDeco.scala 139:41 InstDeco.scala 145:57 InstDeco.scala 148:57 InstDeco.scala 151:57 InstDeco.scala 154:57 InstDeco.scala 157:57 InstDeco.scala 160:57 InstDeco.scala 164:57 InstDeco.scala 168:65 InstDeco.scala 172:81 InstDeco.scala 175:81 InstDeco.scala 182:41 InstDeco.scala 186:65 InstDeco.scala 190:73 InstDeco.scala 193:73 InstDeco.scala 196:73 InstDeco.scala 201:65 InstDeco.scala 205:73 InstDeco.scala 208:73 InstDeco.scala 213:65 InstDeco.scala 217:73 InstDeco.scala 220:73 InstDeco.scala 225:65 InstDeco.scala 229:73 InstDeco.scala 232:73 InstDeco.scala 238:65 InstDeco.scala 242:73 InstDeco.scala 245:73 InstDeco.scala 250:65 InstDeco.scala 254:73 InstDeco.scala 257:73 InstDeco.scala 260:73 InstDeco.scala 266:65 InstDeco.scala 270:73 InstDeco.scala 273:73 InstDeco.scala 281:65 InstDeco.scala 285:73 InstDeco.scala 288:73 InstDeco.scala 297:33 InstDeco.scala 301:57 InstDeco.scala 304:57 InstDeco.scala 307:57 InstDeco.scala 310:57 InstDeco.scala 313:57 InstDeco.scala 316:57 InstDeco.scala 319:57]
endmodule
module ID(
  input         clock,
  output [31:0] io_rs1,
  output [31:0] io_rs2,
  output [5:0]  io_ctrl_cmd,
  input  [31:0] io_instruction,
  output [31:0] io_imm,
  input         io_wen,
  input  [31:0] io_rd
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
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
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  wire [31:0] deco_io_instruc; // @[ID.scala 50:24]
  wire [4:0] deco_io_rd; // @[ID.scala 50:24]
  wire [4:0] deco_io_rs1; // @[ID.scala 50:24]
  wire [4:0] deco_io_rs2; // @[ID.scala 50:24]
  wire [31:0] deco_io_imm; // @[ID.scala 50:24]
  wire [5:0] deco_io_state; // @[ID.scala 50:24]
  reg [31:0] regs [0:30]; // @[ID.scala 55:23]
  wire [31:0] regs__T_5_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_5_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_6_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_6_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_7_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_7_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_8_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_8_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_9_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_9_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_10_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_10_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_11_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_11_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_12_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_12_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_13_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_13_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_14_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_14_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_15_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_15_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_16_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_16_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_17_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_17_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_18_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_18_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_19_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_19_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_20_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_20_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_21_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_21_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_22_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_22_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_23_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_23_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_24_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_24_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_25_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_25_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_26_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_26_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_27_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_27_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_28_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_28_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_29_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_29_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_30_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_30_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_31_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_31_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_32_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_32_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_33_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_33_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_34_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_34_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_35_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_35_addr; // @[ID.scala 55:23]
  wire [31:0] regs__T_4_data; // @[ID.scala 55:23]
  wire [4:0] regs__T_4_addr; // @[ID.scala 55:23]
  wire  regs__T_4_mask; // @[ID.scala 55:23]
  wire  regs__T_4_en; // @[ID.scala 55:23]
  wire [4:0] addr_rd = deco_io_rd; // @[ID.scala 45:28 ID.scala 90:17]
  wire  _T = addr_rd != 5'h0; // @[ID.scala 57:30]
  wire [4:0] addr_rs1 = deco_io_rs1; // @[ID.scala 43:28 ID.scala 88:17]
  wire  _T_36 = addr_rs1 != 5'h0; // @[ID.scala 70:29]
  wire  _T_37 = addr_rs1 == addr_rd; // @[ID.scala 70:50]
  wire  _T_38 = _T_37 & io_wen; // @[ID.scala 70:61]
  wire [31:0] regs_out_1 = regs__T_5_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_6 = 5'h1 == addr_rs1 ? regs_out_1 : 32'h0; // @[ID.scala 70:41]
  wire [31:0] regs_out_2 = regs__T_6_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_7 = 5'h2 == addr_rs1 ? regs_out_2 : _GEN_6; // @[ID.scala 70:41]
  wire [31:0] regs_out_3 = regs__T_7_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_8 = 5'h3 == addr_rs1 ? regs_out_3 : _GEN_7; // @[ID.scala 70:41]
  wire [31:0] regs_out_4 = regs__T_8_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_9 = 5'h4 == addr_rs1 ? regs_out_4 : _GEN_8; // @[ID.scala 70:41]
  wire [31:0] regs_out_5 = regs__T_9_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_10 = 5'h5 == addr_rs1 ? regs_out_5 : _GEN_9; // @[ID.scala 70:41]
  wire [31:0] regs_out_6 = regs__T_10_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_11 = 5'h6 == addr_rs1 ? regs_out_6 : _GEN_10; // @[ID.scala 70:41]
  wire [31:0] regs_out_7 = regs__T_11_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_12 = 5'h7 == addr_rs1 ? regs_out_7 : _GEN_11; // @[ID.scala 70:41]
  wire [31:0] regs_out_8 = regs__T_12_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_13 = 5'h8 == addr_rs1 ? regs_out_8 : _GEN_12; // @[ID.scala 70:41]
  wire [31:0] regs_out_9 = regs__T_13_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_14 = 5'h9 == addr_rs1 ? regs_out_9 : _GEN_13; // @[ID.scala 70:41]
  wire [31:0] regs_out_10 = regs__T_14_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_15 = 5'ha == addr_rs1 ? regs_out_10 : _GEN_14; // @[ID.scala 70:41]
  wire [31:0] regs_out_11 = regs__T_15_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_16 = 5'hb == addr_rs1 ? regs_out_11 : _GEN_15; // @[ID.scala 70:41]
  wire [31:0] regs_out_12 = regs__T_16_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_17 = 5'hc == addr_rs1 ? regs_out_12 : _GEN_16; // @[ID.scala 70:41]
  wire [31:0] regs_out_13 = regs__T_17_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_18 = 5'hd == addr_rs1 ? regs_out_13 : _GEN_17; // @[ID.scala 70:41]
  wire [31:0] regs_out_14 = regs__T_18_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_19 = 5'he == addr_rs1 ? regs_out_14 : _GEN_18; // @[ID.scala 70:41]
  wire [31:0] regs_out_15 = regs__T_19_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_20 = 5'hf == addr_rs1 ? regs_out_15 : _GEN_19; // @[ID.scala 70:41]
  wire [31:0] regs_out_16 = regs__T_20_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_21 = 5'h10 == addr_rs1 ? regs_out_16 : _GEN_20; // @[ID.scala 70:41]
  wire [31:0] regs_out_17 = regs__T_21_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_22 = 5'h11 == addr_rs1 ? regs_out_17 : _GEN_21; // @[ID.scala 70:41]
  wire [31:0] regs_out_18 = regs__T_22_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_23 = 5'h12 == addr_rs1 ? regs_out_18 : _GEN_22; // @[ID.scala 70:41]
  wire [31:0] regs_out_19 = regs__T_23_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_24 = 5'h13 == addr_rs1 ? regs_out_19 : _GEN_23; // @[ID.scala 70:41]
  wire [31:0] regs_out_20 = regs__T_24_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_25 = 5'h14 == addr_rs1 ? regs_out_20 : _GEN_24; // @[ID.scala 70:41]
  wire [31:0] regs_out_21 = regs__T_25_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_26 = 5'h15 == addr_rs1 ? regs_out_21 : _GEN_25; // @[ID.scala 70:41]
  wire [31:0] regs_out_22 = regs__T_26_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_27 = 5'h16 == addr_rs1 ? regs_out_22 : _GEN_26; // @[ID.scala 70:41]
  wire [31:0] regs_out_23 = regs__T_27_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_28 = 5'h17 == addr_rs1 ? regs_out_23 : _GEN_27; // @[ID.scala 70:41]
  wire [31:0] regs_out_24 = regs__T_28_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_29 = 5'h18 == addr_rs1 ? regs_out_24 : _GEN_28; // @[ID.scala 70:41]
  wire [31:0] regs_out_25 = regs__T_29_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_30 = 5'h19 == addr_rs1 ? regs_out_25 : _GEN_29; // @[ID.scala 70:41]
  wire [31:0] regs_out_26 = regs__T_30_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_31 = 5'h1a == addr_rs1 ? regs_out_26 : _GEN_30; // @[ID.scala 70:41]
  wire [31:0] regs_out_27 = regs__T_31_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_32 = 5'h1b == addr_rs1 ? regs_out_27 : _GEN_31; // @[ID.scala 70:41]
  wire [31:0] regs_out_28 = regs__T_32_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_33 = 5'h1c == addr_rs1 ? regs_out_28 : _GEN_32; // @[ID.scala 70:41]
  wire [31:0] regs_out_29 = regs__T_33_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_34 = 5'h1d == addr_rs1 ? regs_out_29 : _GEN_33; // @[ID.scala 70:41]
  wire [31:0] regs_out_30 = regs__T_34_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_35 = 5'h1e == addr_rs1 ? regs_out_30 : _GEN_34; // @[ID.scala 70:41]
  wire [31:0] regs_out_31 = regs__T_35_data; // @[ID.scala 65:28 ID.scala 68:53]
  wire [31:0] _GEN_36 = 5'h1f == addr_rs1 ? regs_out_31 : _GEN_35; // @[ID.scala 70:41]
  wire [31:0] _T_39 = _T_38 ? io_rd : _GEN_36; // @[ID.scala 70:41]
  wire [4:0] addr_rs2 = deco_io_rs2; // @[ID.scala 44:28 ID.scala 89:17]
  wire  _T_41 = addr_rs2 != 5'h0; // @[ID.scala 71:29]
  wire  _T_42 = addr_rs2 == addr_rd; // @[ID.scala 71:50]
  wire  _T_43 = _T_42 & io_wen; // @[ID.scala 71:61]
  wire [31:0] _GEN_38 = 5'h1 == addr_rs2 ? regs_out_1 : 32'h0; // @[ID.scala 71:41]
  wire [31:0] _GEN_39 = 5'h2 == addr_rs2 ? regs_out_2 : _GEN_38; // @[ID.scala 71:41]
  wire [31:0] _GEN_40 = 5'h3 == addr_rs2 ? regs_out_3 : _GEN_39; // @[ID.scala 71:41]
  wire [31:0] _GEN_41 = 5'h4 == addr_rs2 ? regs_out_4 : _GEN_40; // @[ID.scala 71:41]
  wire [31:0] _GEN_42 = 5'h5 == addr_rs2 ? regs_out_5 : _GEN_41; // @[ID.scala 71:41]
  wire [31:0] _GEN_43 = 5'h6 == addr_rs2 ? regs_out_6 : _GEN_42; // @[ID.scala 71:41]
  wire [31:0] _GEN_44 = 5'h7 == addr_rs2 ? regs_out_7 : _GEN_43; // @[ID.scala 71:41]
  wire [31:0] _GEN_45 = 5'h8 == addr_rs2 ? regs_out_8 : _GEN_44; // @[ID.scala 71:41]
  wire [31:0] _GEN_46 = 5'h9 == addr_rs2 ? regs_out_9 : _GEN_45; // @[ID.scala 71:41]
  wire [31:0] _GEN_47 = 5'ha == addr_rs2 ? regs_out_10 : _GEN_46; // @[ID.scala 71:41]
  wire [31:0] _GEN_48 = 5'hb == addr_rs2 ? regs_out_11 : _GEN_47; // @[ID.scala 71:41]
  wire [31:0] _GEN_49 = 5'hc == addr_rs2 ? regs_out_12 : _GEN_48; // @[ID.scala 71:41]
  wire [31:0] _GEN_50 = 5'hd == addr_rs2 ? regs_out_13 : _GEN_49; // @[ID.scala 71:41]
  wire [31:0] _GEN_51 = 5'he == addr_rs2 ? regs_out_14 : _GEN_50; // @[ID.scala 71:41]
  wire [31:0] _GEN_52 = 5'hf == addr_rs2 ? regs_out_15 : _GEN_51; // @[ID.scala 71:41]
  wire [31:0] _GEN_53 = 5'h10 == addr_rs2 ? regs_out_16 : _GEN_52; // @[ID.scala 71:41]
  wire [31:0] _GEN_54 = 5'h11 == addr_rs2 ? regs_out_17 : _GEN_53; // @[ID.scala 71:41]
  wire [31:0] _GEN_55 = 5'h12 == addr_rs2 ? regs_out_18 : _GEN_54; // @[ID.scala 71:41]
  wire [31:0] _GEN_56 = 5'h13 == addr_rs2 ? regs_out_19 : _GEN_55; // @[ID.scala 71:41]
  wire [31:0] _GEN_57 = 5'h14 == addr_rs2 ? regs_out_20 : _GEN_56; // @[ID.scala 71:41]
  wire [31:0] _GEN_58 = 5'h15 == addr_rs2 ? regs_out_21 : _GEN_57; // @[ID.scala 71:41]
  wire [31:0] _GEN_59 = 5'h16 == addr_rs2 ? regs_out_22 : _GEN_58; // @[ID.scala 71:41]
  wire [31:0] _GEN_60 = 5'h17 == addr_rs2 ? regs_out_23 : _GEN_59; // @[ID.scala 71:41]
  wire [31:0] _GEN_61 = 5'h18 == addr_rs2 ? regs_out_24 : _GEN_60; // @[ID.scala 71:41]
  wire [31:0] _GEN_62 = 5'h19 == addr_rs2 ? regs_out_25 : _GEN_61; // @[ID.scala 71:41]
  wire [31:0] _GEN_63 = 5'h1a == addr_rs2 ? regs_out_26 : _GEN_62; // @[ID.scala 71:41]
  wire [31:0] _GEN_64 = 5'h1b == addr_rs2 ? regs_out_27 : _GEN_63; // @[ID.scala 71:41]
  wire [31:0] _GEN_65 = 5'h1c == addr_rs2 ? regs_out_28 : _GEN_64; // @[ID.scala 71:41]
  wire [31:0] _GEN_66 = 5'h1d == addr_rs2 ? regs_out_29 : _GEN_65; // @[ID.scala 71:41]
  wire [31:0] _GEN_67 = 5'h1e == addr_rs2 ? regs_out_30 : _GEN_66; // @[ID.scala 71:41]
  wire [31:0] _GEN_68 = 5'h1f == addr_rs2 ? regs_out_31 : _GEN_67; // @[ID.scala 71:41]
  wire [31:0] _T_44 = _T_43 ? io_rd : _GEN_68; // @[ID.scala 71:41]
  InstDeco deco ( // @[ID.scala 50:24]
    .io_instruc(deco_io_instruc),
    .io_rd(deco_io_rd),
    .io_rs1(deco_io_rs1),
    .io_rs2(deco_io_rs2),
    .io_imm(deco_io_imm),
    .io_state(deco_io_state)
  );
  assign regs__T_5_addr = 5'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_5_data = regs[regs__T_5_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_5_data = regs__T_5_addr >= 5'h1f ? _RAND_1[31:0] : regs[regs__T_5_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_6_addr = 5'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_6_data = regs[regs__T_6_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_6_data = regs__T_6_addr >= 5'h1f ? _RAND_2[31:0] : regs[regs__T_6_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_7_addr = 5'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_7_data = regs[regs__T_7_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_7_data = regs__T_7_addr >= 5'h1f ? _RAND_3[31:0] : regs[regs__T_7_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_8_addr = 5'h3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_8_data = regs[regs__T_8_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_8_data = regs__T_8_addr >= 5'h1f ? _RAND_4[31:0] : regs[regs__T_8_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_9_addr = 5'h4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_9_data = regs[regs__T_9_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_9_data = regs__T_9_addr >= 5'h1f ? _RAND_5[31:0] : regs[regs__T_9_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_10_addr = 5'h5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_10_data = regs[regs__T_10_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_10_data = regs__T_10_addr >= 5'h1f ? _RAND_6[31:0] : regs[regs__T_10_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_11_addr = 5'h6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_11_data = regs[regs__T_11_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_11_data = regs__T_11_addr >= 5'h1f ? _RAND_7[31:0] : regs[regs__T_11_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_12_addr = 5'h7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_12_data = regs[regs__T_12_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_12_data = regs__T_12_addr >= 5'h1f ? _RAND_8[31:0] : regs[regs__T_12_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_13_addr = 5'h8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_13_data = regs[regs__T_13_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_13_data = regs__T_13_addr >= 5'h1f ? _RAND_9[31:0] : regs[regs__T_13_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_14_addr = 5'h9;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_14_data = regs[regs__T_14_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_14_data = regs__T_14_addr >= 5'h1f ? _RAND_10[31:0] : regs[regs__T_14_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_15_addr = 5'ha;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_15_data = regs[regs__T_15_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_15_data = regs__T_15_addr >= 5'h1f ? _RAND_11[31:0] : regs[regs__T_15_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_16_addr = 5'hb;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_16_data = regs[regs__T_16_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_16_data = regs__T_16_addr >= 5'h1f ? _RAND_12[31:0] : regs[regs__T_16_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_17_addr = 5'hc;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_17_data = regs[regs__T_17_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_17_data = regs__T_17_addr >= 5'h1f ? _RAND_13[31:0] : regs[regs__T_17_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_18_addr = 5'hd;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_18_data = regs[regs__T_18_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_18_data = regs__T_18_addr >= 5'h1f ? _RAND_14[31:0] : regs[regs__T_18_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_19_addr = 5'he;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_19_data = regs[regs__T_19_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_19_data = regs__T_19_addr >= 5'h1f ? _RAND_15[31:0] : regs[regs__T_19_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_20_addr = 5'hf;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_20_data = regs[regs__T_20_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_20_data = regs__T_20_addr >= 5'h1f ? _RAND_16[31:0] : regs[regs__T_20_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_21_addr = 5'h10;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_21_data = regs[regs__T_21_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_21_data = regs__T_21_addr >= 5'h1f ? _RAND_17[31:0] : regs[regs__T_21_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_22_addr = 5'h11;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_22_data = regs[regs__T_22_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_22_data = regs__T_22_addr >= 5'h1f ? _RAND_18[31:0] : regs[regs__T_22_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_23_addr = 5'h12;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_23_data = regs[regs__T_23_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_23_data = regs__T_23_addr >= 5'h1f ? _RAND_19[31:0] : regs[regs__T_23_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_24_addr = 5'h13;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_24_data = regs[regs__T_24_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_24_data = regs__T_24_addr >= 5'h1f ? _RAND_20[31:0] : regs[regs__T_24_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_25_addr = 5'h14;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_25_data = regs[regs__T_25_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_25_data = regs__T_25_addr >= 5'h1f ? _RAND_21[31:0] : regs[regs__T_25_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_26_addr = 5'h15;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_26_data = regs[regs__T_26_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_26_data = regs__T_26_addr >= 5'h1f ? _RAND_22[31:0] : regs[regs__T_26_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_27_addr = 5'h16;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_27_data = regs[regs__T_27_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_27_data = regs__T_27_addr >= 5'h1f ? _RAND_23[31:0] : regs[regs__T_27_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_28_addr = 5'h17;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_28_data = regs[regs__T_28_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_28_data = regs__T_28_addr >= 5'h1f ? _RAND_24[31:0] : regs[regs__T_28_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_29_addr = 5'h18;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_29_data = regs[regs__T_29_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_29_data = regs__T_29_addr >= 5'h1f ? _RAND_25[31:0] : regs[regs__T_29_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_30_addr = 5'h19;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_30_data = regs[regs__T_30_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_30_data = regs__T_30_addr >= 5'h1f ? _RAND_26[31:0] : regs[regs__T_30_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_31_addr = 5'h1a;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_31_data = regs[regs__T_31_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_31_data = regs__T_31_addr >= 5'h1f ? _RAND_27[31:0] : regs[regs__T_31_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_32_addr = 5'h1b;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_32_data = regs[regs__T_32_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_32_data = regs__T_32_addr >= 5'h1f ? _RAND_28[31:0] : regs[regs__T_32_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_33_addr = 5'h1c;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_33_data = regs[regs__T_33_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_33_data = regs__T_33_addr >= 5'h1f ? _RAND_29[31:0] : regs[regs__T_33_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_34_addr = 5'h1d;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_34_data = regs[regs__T_34_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_34_data = regs__T_34_addr >= 5'h1f ? _RAND_30[31:0] : regs[regs__T_34_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_35_addr = 5'h1e;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_35_data = regs[regs__T_35_addr]; // @[ID.scala 55:23]
  `else
  assign regs__T_35_data = regs__T_35_addr >= 5'h1f ? _RAND_31[31:0] : regs[regs__T_35_addr]; // @[ID.scala 55:23]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regs__T_4_data = io_rd;
  assign regs__T_4_addr = addr_rd - 5'h1;
  assign regs__T_4_mask = 1'h1;
  assign regs__T_4_en = io_wen & _T;
  assign io_rs1 = _T_36 ? _T_39 : 32'h0; // @[ID.scala 81:16]
  assign io_rs2 = _T_41 ? _T_44 : 32'h0; // @[ID.scala 80:16]
  assign io_ctrl_cmd = deco_io_state; // @[ID.scala 85:20]
  assign io_imm = deco_io_imm; // @[ID.scala 82:15]
  assign deco_io_instruc = io_instruction; // @[ID.scala 77:24]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_8 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_10 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  _RAND_12 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_14 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_16 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_18 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_20 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_22 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_24 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_26 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_28 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_30 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 31; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(regs__T_4_en & regs__T_4_mask) begin
      regs[regs__T_4_addr] <= regs__T_4_data; // @[ID.scala 55:23]
    end
  end
endmodule
module Instrucciones(
  input         clock,
  input         reset,
  input  [4:0]  io_addr_IF,
  output [31:0] io_instrucc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] IF_salida; // @[Instrucciones.scala 13:32]
  wire  _T = io_addr_IF == 5'h0; // @[Instrucciones.scala 29:20]
  wire  _T_1 = io_addr_IF == 5'h1; // @[Instrucciones.scala 32:31]
  wire  _T_2 = io_addr_IF == 5'h2; // @[Instrucciones.scala 35:31]
  wire  _T_3 = io_addr_IF == 5'h3; // @[Instrucciones.scala 38:31]
  wire  _T_4 = io_addr_IF == 5'h4; // @[Instrucciones.scala 41:31]
  wire  _T_5 = io_addr_IF == 5'h5; // @[Instrucciones.scala 44:31]
  wire  _T_6 = io_addr_IF == 5'h6; // @[Instrucciones.scala 47:31]
  wire  _T_7 = io_addr_IF == 5'h7; // @[Instrucciones.scala 50:31]
  wire  _T_8 = io_addr_IF == 5'h8; // @[Instrucciones.scala 53:31]
  wire  _T_9 = io_addr_IF == 5'h9; // @[Instrucciones.scala 56:31]
  assign io_instrucc = IF_salida; // @[Instrucciones.scala 60:21]
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
  IF_salida = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      IF_salida <= 32'h0;
    end else if (_T) begin
      IF_salida <= 32'h100113;
    end else if (_T_1) begin
      IF_salida <= 32'h300193;
    end else if (_T_2) begin
      IF_salida <= 32'h213;
    end else if (_T_3) begin
      IF_salida <= 32'h310233;
    end else if (_T_4) begin
      IF_salida <= 32'h222233;
    end else if (_T_5) begin
      IF_salida <= 32'h418133;
    end else if (_T_6) begin
      IF_salida <= 32'h311133;
    end else if (_T_7) begin
      IF_salida <= 32'h41f133;
    end else if (_T_8) begin
      IF_salida <= 32'h41c2b3;
    end else if (_T_9) begin
      IF_salida <= 32'h418133;
    end
  end
endmodule
module controldeco(
  input  [5:0] io_cmd,
  output       io_out_EX_mux3,
  output [4:0] io_out_EX_ALU
);
  wire  _T = 6'h26 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_1 = 6'h19 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_2 = 6'h2e == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_3 = 6'h1a == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_4 = 6'h30 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_5 = 6'h1b == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_6 = 6'h23 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_7 = 6'h13 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_8 = 6'h25 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_9 = 6'h1 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_10 = 6'h2c == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_11 = 6'h16 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_12 = 6'h31 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_13 = 6'h17 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_14 = 6'h33 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_15 = 6'h18 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_16 = 6'h28 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_17 = 6'h14 == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_18 = 6'h2a == io_cmd; // @[Conditional.scala 37:30]
  wire  _T_19 = 6'h15 == io_cmd; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_1 = _T_19 ? 4'h9 : 4'hf; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_3 = _T_18 ? 4'h9 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_17 ? 1'h0 : _T_18; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_5 = _T_17 ? 4'h8 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_16 | _GEN_4; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_7 = _T_16 ? 4'h8 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_15 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_9 = _T_15 ? 4'h7 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_14 | _GEN_8; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_11 = _T_14 ? 4'h7 : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_13 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_13 = _T_13 ? 4'h6 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_12 | _GEN_12; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_15 = _T_12 ? 4'h6 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_11 ? 1'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_17 = _T_11 ? 4'h5 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_10 | _GEN_16; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_19 = _T_10 ? 4'h5 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_9 ? 1'h0 : _GEN_18; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_21 = _T_9 ? 4'hf : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_8 | _GEN_20; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_23 = _T_8 ? 4'h4 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_7 ? 1'h0 : _GEN_22; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_25 = _T_7 ? 4'h3 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_6 | _GEN_24; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_27 = _T_6 ? 4'h3 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_5 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_29 = _T_5 ? 4'h2 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_4 | _GEN_28; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_31 = _T_4 ? 4'h2 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_3 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_33 = _T_3 ? 4'h1 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_2 | _GEN_32; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_35 = _T_2 ? 4'h1 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_1 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_37 = _T_1 ? 4'h0 : _GEN_35; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_39 = _T ? 4'h0 : _GEN_37; // @[Conditional.scala 40:58]
  assign io_out_EX_mux3 = _T | _GEN_36; // @[controldeco.scala 32:15]
  assign io_out_EX_ALU = {{1'd0}, _GEN_39}; // @[controldeco.scala 32:15]
endmodule
module ALU(
  input  [4:0]  io_sel,
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  output [31:0] io_out
);
  wire [31:0] shifted = io_in1 >> io_in2[4:0]; // @[ALU.scala 28:19]
  wire [31:0] _T_3 = io_in1 + io_in2; // @[ALU.scala 33:20]
  wire [31:0] _T_5 = io_in1 - io_in2; // @[ALU.scala 38:20]
  wire  _T_6 = 5'h0 == io_sel; // @[Conditional.scala 37:30]
  wire [62:0] _GEN_36 = {{31'd0}, io_in1}; // @[ALU.scala 50:42]
  wire [62:0] _T_8 = _GEN_36 << io_in2[4:0]; // @[ALU.scala 50:42]
  wire  _T_9 = 5'h1 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_12 = 5'h2 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_14 = ~io_in1[31]; // @[ALU.scala 58:46]
  wire [5:0] _GEN_37 = {{1'd0}, io_in2[4:0]}; // @[ALU.scala 59:82]
  wire [5:0] _T_17 = 6'h20 - _GEN_37; // @[ALU.scala 59:82]
  wire [94:0] _T_18 = 95'hffffffff << _T_17; // @[ALU.scala 59:73]
  wire [94:0] _GEN_38 = {{63'd0}, shifted}; // @[ALU.scala 59:55]
  wire [94:0] _T_19 = _GEN_38 | _T_18; // @[ALU.scala 59:55]
  wire [94:0] _GEN_0 = _T_14 ? {{63'd0}, shifted} : _T_19; // @[ALU.scala 58:54]
  wire  _T_20 = 5'h3 == io_sel; // @[Conditional.scala 37:30]
  wire [32:0] totalsum = {{1'd0}, _T_3}; // @[ALU.scala 32:20 ALU.scala 33:10]
  wire  _T_23 = 5'h4 == io_sel; // @[Conditional.scala 37:30]
  wire [32:0] totalsub = {{1'd0}, _T_5}; // @[ALU.scala 37:20 ALU.scala 38:10]
  wire  _T_26 = 5'h5 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_27 = io_in1 ^ io_in2; // @[ALU.scala 73:42]
  wire  _T_28 = 5'h6 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_29 = io_in1 | io_in2; // @[ALU.scala 77:42]
  wire  _T_30 = 5'h7 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_31 = io_in1 & io_in2; // @[ALU.scala 81:42]
  wire  _T_32 = 5'h8 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_35 = $signed(io_in1) < $signed(io_in2); // @[ALU.scala 85:50]
  wire  _T_39 = 5'h9 == io_sel; // @[Conditional.scala 37:30]
  wire  _T_40 = io_in1 < io_in2; // @[ALU.scala 90:46]
  wire  _T_44 = 5'ha == io_sel; // @[Conditional.scala 37:30]
  wire  _T_45 = io_in1 == io_in2; // @[ALU.scala 95:46]
  wire  _T_49 = 5'hb == io_sel; // @[Conditional.scala 37:30]
  wire  _T_51 = _T_45 ? 1'h0 : 1'h1; // @[ALU.scala 100:38]
  wire  _T_54 = 5'hc == io_sel; // @[Conditional.scala 37:30]
  wire  _T_58 = _T_35 ^ 1'h1; // @[ALU.scala 105:75]
  wire  _T_63 = 5'hd == io_sel; // @[Conditional.scala 37:30]
  wire  _T_65 = _T_40 ? 1'h0 : 1'h1; // @[ALU.scala 110:38]
  wire  _T_68 = 5'he == io_sel; // @[Conditional.scala 37:30]
  wire  _T_69 = 5'hf == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_1 = _T_69 ? io_in2 : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_68 ? io_in1 : _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_63 ? {{31'd0}, _T_65} : _GEN_2; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_54 ? {{31'd0}, _T_58} : _GEN_3; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_7 = _T_49 ? {{31'd0}, _T_51} : _GEN_5; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_9 = _T_44 ? {{31'd0}, _T_45} : _GEN_7; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_11 = _T_39 ? {{31'd0}, _T_40} : _GEN_9; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_13 = _T_32 ? {{31'd0}, _T_35} : _GEN_11; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_15 = _T_30 ? _T_31 : _GEN_13; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_17 = _T_28 ? _T_29 : _GEN_15; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_19 = _T_26 ? _T_27 : _GEN_17; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_21 = _T_23 ? totalsub[31:0] : _GEN_19; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_24 = _T_20 ? totalsum[31:0] : _GEN_21; // @[Conditional.scala 39:67]
  wire [94:0] _GEN_27 = _T_12 ? _GEN_0 : {{63'd0}, _GEN_24}; // @[Conditional.scala 39:67]
  wire [94:0] _GEN_30 = _T_9 ? {{63'd0}, shifted} : _GEN_27; // @[Conditional.scala 39:67]
  wire [94:0] _GEN_33 = _T_6 ? {{32'd0}, _T_8} : _GEN_30; // @[Conditional.scala 40:58]
  assign io_out = _GEN_33[31:0]; // @[ALU.scala 43:8 ALU.scala 50:32 ALU.scala 54:32 ALU.scala 58:63 ALU.scala 59:44 ALU.scala 63:32 ALU.scala 68:32 ALU.scala 73:32 ALU.scala 77:32 ALU.scala 81:32 ALU.scala 85:32 ALU.scala 90:32 ALU.scala 95:32 ALU.scala 100:32 ALU.scala 105:32 ALU.scala 110:32 ALU.scala 114:39 ALU.scala 116:39]
endmodule
module Procesador(
  input         clock,
  input         reset,
  output [31:0] io_rs1,
  output [31:0] io_rs2,
  output [31:0] io_imm,
  output [31:0] io_out,
  input         io_reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  ID_clock; // @[Procesador.scala 49:24]
  wire [31:0] ID_io_rs1; // @[Procesador.scala 49:24]
  wire [31:0] ID_io_rs2; // @[Procesador.scala 49:24]
  wire [5:0] ID_io_ctrl_cmd; // @[Procesador.scala 49:24]
  wire [31:0] ID_io_instruction; // @[Procesador.scala 49:24]
  wire [31:0] ID_io_imm; // @[Procesador.scala 49:24]
  wire  ID_io_wen; // @[Procesador.scala 49:24]
  wire [31:0] ID_io_rd; // @[Procesador.scala 49:24]
  wire  Instru_clock; // @[Procesador.scala 50:28]
  wire  Instru_reset; // @[Procesador.scala 50:28]
  wire [4:0] Instru_io_addr_IF; // @[Procesador.scala 50:28]
  wire [31:0] Instru_io_instrucc; // @[Procesador.scala 50:28]
  wire [5:0] control_io_cmd; // @[Procesador.scala 51:29]
  wire  control_io_out_EX_mux3; // @[Procesador.scala 51:29]
  wire [4:0] control_io_out_EX_ALU; // @[Procesador.scala 51:29]
  wire [4:0] ALU_io_sel; // @[Procesador.scala 52:24]
  wire [31:0] ALU_io_in1; // @[Procesador.scala 52:24]
  wire [31:0] ALU_io_in2; // @[Procesador.scala 52:24]
  wire [31:0] ALU_io_out; // @[Procesador.scala 52:24]
  reg [31:0] pc; // @[Procesador.scala 46:25]
  reg [4:0] addr_IF; // @[Procesador.scala 53:30]
  reg [31:0] ALU_out; // @[Procesador.scala 54:30]
  wire  _T_1 = ~io_reset; // @[Procesador.scala 61:42]
  wire  _T_2 = pc != 32'h3; // @[Procesador.scala 61:58]
  wire  _T_3 = _T_1 & _T_2; // @[Procesador.scala 61:51]
  wire [31:0] _T_6 = pc + 32'h1; // @[Procesador.scala 61:78]
  wire [4:0] _T_14 = addr_IF + 5'h1; // @[Procesador.scala 62:91]
  wire  _T_16 = pc == 32'h2; // @[Procesador.scala 63:29]
  wire  _T_20 = control_io_out_EX_mux3; // @[Procesador.scala 72:50]
  ID ID ( // @[Procesador.scala 49:24]
    .clock(ID_clock),
    .io_rs1(ID_io_rs1),
    .io_rs2(ID_io_rs2),
    .io_ctrl_cmd(ID_io_ctrl_cmd),
    .io_instruction(ID_io_instruction),
    .io_imm(ID_io_imm),
    .io_wen(ID_io_wen),
    .io_rd(ID_io_rd)
  );
  Instrucciones Instru ( // @[Procesador.scala 50:28]
    .clock(Instru_clock),
    .reset(Instru_reset),
    .io_addr_IF(Instru_io_addr_IF),
    .io_instrucc(Instru_io_instrucc)
  );
  controldeco control ( // @[Procesador.scala 51:29]
    .io_cmd(control_io_cmd),
    .io_out_EX_mux3(control_io_out_EX_mux3),
    .io_out_EX_ALU(control_io_out_EX_ALU)
  );
  ALU ALU ( // @[Procesador.scala 52:24]
    .io_sel(ALU_io_sel),
    .io_in1(ALU_io_in1),
    .io_in2(ALU_io_in2),
    .io_out(ALU_io_out)
  );
  assign io_rs1 = ID_io_rs1; // @[Procesador.scala 74:16]
  assign io_rs2 = ID_io_rs2; // @[Procesador.scala 75:16]
  assign io_imm = ID_io_imm; // @[Procesador.scala 76:16]
  assign io_out = ALU_io_out; // @[Procesador.scala 77:16]
  assign ID_clock = clock;
  assign ID_io_instruction = Instru_io_instrucc; // @[Procesador.scala 67:27]
  assign ID_io_wen = pc == 32'h2; // @[Procesador.scala 63:19]
  assign ID_io_rd = _T_16 ? ALU_out : 32'h0; // @[Procesador.scala 64:18]
  assign Instru_clock = clock;
  assign Instru_reset = reset;
  assign Instru_io_addr_IF = addr_IF; // @[Procesador.scala 57:27]
  assign control_io_cmd = ID_io_ctrl_cmd; // @[Procesador.scala 69:24]
  assign ALU_io_sel = control_io_out_EX_ALU; // @[Procesador.scala 70:20]
  assign ALU_io_in1 = ID_io_rs1; // @[Procesador.scala 71:20]
  assign ALU_io_in2 = _T_20 ? ID_io_rs2 : ID_io_imm; // @[Procesador.scala 72:20]
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
  pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  addr_IF = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  ALU_out = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else if (_T_3) begin
      pc <= _T_6;
    end else begin
      pc <= 32'h0;
    end
    if (reset) begin
      addr_IF <= 5'h0;
    end else if (!(_T_3)) begin
      addr_IF <= _T_14;
    end
    if (reset) begin
      ALU_out <= 32'h0;
    end else begin
      ALU_out <= ALU_io_out;
    end
  end
endmodule
