library ieee;
use ieee.std_logic_1164.all;

package myTypes is
	constant OP_CODE_SIZE : integer :=  6;                                              -- OPCODE field size
   	constant FUNC_SIZE    : integer :=  11; 
   	constant PRED_SIZE    : integer :=  4; 
	type aluOp is (
		NOP, SLLS, SRLS, SRAS, ADDS, ADDUS, SUBS, SUBUS, ANDS, ORS, XORS, SEQS, SNES,
		SLTS,SGTS,SLES,SGES,MOVI2SS,MOVS2IS,MOVFS,MOVDS,MOVFP2IS,MOVI2FP,MOVI2TS,MOVT2IS,
		SLTUS,SGTUS,SLEUS,SGEUS,
		MULTU,MULTS
			);
	constant RTYPE : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"0";
	constant FTYPE : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"1";

	constant ITYPE_J    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"2";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_JAL  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"3";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_BEQZ : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"4";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_BNEZ : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"5";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_BFTP : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"6";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_BFPF : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"7";    -- ADDI1 RS2,RD,INP1

	constant ITYPE_ADDI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"8";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_ADDUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"9";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_SUBI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"A";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_SUBUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"B";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_ANDI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"C";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_ORI   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"D";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_XORI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"E";    -- ADDI1 RS2,RD,INP1
	
	constant ITYPE_LHI   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "00"&X"F";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_RFE   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"0";    -- SUBI1 RS2,RD,INP1
	constant ITYPE_TRAP  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"1";    -- ANDI1 RS2,RD,INP1
	constant ITYPE_JR    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"2";    -- ORI1  RS2,RD,INP1
	constant ITYPE_JALR  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"3";    -- ORI1  RS2,RD,INP1

	constant ITYPE_SLLI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"4";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_NOP   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"5";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_SRLI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"6";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SRAI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"7";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SEQI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"8";    -- ADDI1 RS2,RD,INP1
	constant ITYPE_SNEI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"9";    -- ANDI1 RS2,RD,INP1
	constant ITYPE_SLTI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"A";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SGTI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"B";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SLEI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"C";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SGEI  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "01"&X"D";    -- ORI1  RS2,RD,INP1

	constant ITYPE_LB    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"0";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LH    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"1";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LW    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"3";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LBU   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"4";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LHU   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"5";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LF    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"6";    -- ORI1  RS2,RD,INP1
	constant ITYPE_LD    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"7";    -- ORI1  RS2,RD,INP1

	constant ITYPE_SB    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"8";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SH    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"9";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SW    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"B";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SF    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"E";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SD    : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "10"&X"F";    -- ORI1  RS2,RD,INP1

	constant ITYPE_ITLB  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "11"&X"8";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SLTUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "11"&X"A";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SGTUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "11"&X"B";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SLEUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "11"&X"C";    -- ORI1  RS2,RD,INP1
	constant ITYPE_SGEUI : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "11"&X"D";    -- ORI1  RS2,RD,INP1

	constant RFUNC_SLL     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"04";    -- ADD RS1,RS2,RD
	constant RFUNC_SRL     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"06";    -- ADD RS1,RS2,RD
	constant RFUNC_SRA     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"07";    -- ADD RS1,RS2,RD
	constant RFUNC_ADD     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"20";    -- ADD RS1,RS2,RD
	constant RFUNC_ADDU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"21";    -- ADD RS1,RS2,RD
	constant RFUNC_SUB     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"22";    -- ADD RS1,RS2,RD
	constant RFUNC_SUBU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"23";    -- ADD RS1,RS2,RD
	constant RFUNC_AND     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"24";    -- ADD RS1,RS2,RD
	constant RFUNC_OR      : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"25";    -- ADD RS1,RS2,RD
	constant RFUNC_XOR     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"26";    -- ADD RS1,RS2,RD
	constant RFUNC_SEQ     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"28";    -- ADD RS1,RS2,RD
	constant RFUNC_SNE     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"29";    -- ADD RS1,RS2,RD
	constant RFUNC_SLT     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"2A";    -- ADD RS1,RS2,RD
	constant RFUNC_SGT     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"2B";    -- ADD RS1,RS2,RD
	constant RFUNC_SLE     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"2C";    -- ADD RS1,RS2,RD
	constant RFUNC_SGE     : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"2D";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVI2S  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"30";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVS2I  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"31";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"32";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVD    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"33";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVFP2I : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"34";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVI2FP : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"35";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVI2T  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"36";    -- ADD RS1,RS2,RD
	constant RFUNC_MOVT2I  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"37";    -- ADD RS1,RS2,RD
	constant RFUNC_SLTU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"3A";    -- ADD RS1,RS2,RD
	constant RFUNC_SGTU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"3B";    -- ADD RS1,RS2,RD
	constant RFUNC_SLEU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"3C";    -- ADD RS1,RS2,RD
	constant RFUNC_SGEU    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"3D";    -- ADD RS1,RS2,RD

	constant FFUNC_ADDF   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"00";    -- ADD RS1,RS2,RD
	constant FFUNC_SUBF   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"01";    -- ADD RS1,RS2,RD
	constant FFUNC_MULTF  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"02";    -- ADD RS1,RS2,RD
	constant FFUNC_DIVF   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"03";    -- ADD RS1,RS2,RD
	constant FFUNC_ADDD   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"04";    -- ADD RS1,RS2,RD
	constant FFUNC_SUBD   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"05";    -- ADD RS1,RS2,RD
	constant FFUNC_MULTD  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"06";    -- ADD RS1,RS2,RD
	constant FFUNC_DIVD   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"07";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTF2D : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"08";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTF2I : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"09";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTD2F : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0A";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTD2I : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0B";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTI2F : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0C";    -- ADD RS1,RS2,RD
	constant FFUNC_CVTI2D : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0D";    -- ADD RS1,RS2,RD
	constant FFUNC_MULT   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0E";    -- ADD RS1,RS2,RD
	constant FFUNC_DIV    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"0F";    -- ADD RS1,RS2,RD
	constant FFUNC_EQF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"10";    -- ADD RS1,RS2,RD
	constant FFUNC_NEF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"11";    -- ADD RS1,RS2,RD
	constant FFUNC_LFT    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"12";    -- ADD RS1,RS2,RD
	constant FFUNC_GTF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"13";    -- ADD RS1,RS2,RD
	constant FFUNC_LEF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"14";    -- ADD RS1,RS2,RD
	constant FFUNC_GEF    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"15";    -- ADD RS1,RS2,RD
	constant FFUNC_MULTU  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"16";    -- ADD RS1,RS2,RD
	constant FFUNC_DIVU   : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"17";    -- ADD RS1,RS2,RD
	constant FFUNC_EQD    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"18";    -- ADD RS1,RS2,RD
	constant FFUNC_NED    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"19";    -- ADD RS1,RS2,RD
	constant FFUNC_LTD    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"1A";    -- ADD RS1,RS2,RD
	constant FFUNC_GTD    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"1B";    -- ADD RS1,RS2,RD
	constant FFUNC_LED    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"1C";    -- ADD RS1,RS2,RD
	constant FFUNC_GED    : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "000"&X"1D";    -- ADD RS1,RS2,RD

	constant TAKE_PC4     : std_logic_vector(1 downto 0) :=  "00";
	constant TAKE_BRANCH  : std_logic_vector(1 downto 0) :=  "11";
	constant TAKE_A       : std_logic_vector(1 downto 0) :=  "01";
	constant TAKE_SUM     : std_logic_vector(1 downto 0) :=  "10";

end myTypes;

