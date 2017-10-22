-- *** a.a-CU-HW.vhd *** --

-- this block is describes the control unit.
-- This is a Hardwired control unit
-- Microcode LUT is declared directly here 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.myTypes.all;

entity dlx_cu is
	generic (
		MICROCODE_MEM_SIZE	: integer := 64;	-- Microcode Memory Size
		FUNC_SIZE		: integer := 11;	-- Func Field Size for R-Type Ops
		OP_CODE_SIZE		: integer := 6;		-- Op Code Size
		IR_SIZE			: integer := 32;	-- Instruction Register Size    
		CW_SIZE			: integer := 13);	-- Control Word Size
	port (
		Clk		: in  std_logic;		-- Clock
		Rst		: in  std_logic;		-- Reset: Active-High

		IR_IN		: in  std_logic_vector(IR_SIZE - 1 downto 0);	-- Instruction Register
		stall_exe_i	: in  std_logic;				-- Stall signal coming from EXE stage
		mispredict_i	: in  std_logic;
		D1_i		: in  std_logic_vector(4 downto 0);		-- Destination register of exe stage
		D2_i		: in  std_logic_vector(4 downto 0);		-- Destination register of mem stage

		S1_LATCH_EN	: out std_logic;			-- Latch enable of Fetch stage
		S2_LATCH_EN	: out std_logic;			-- Latch enable of Dec stage 
		S3_LATCH_EN	: out std_logic;			-- Latch enable of Exe stage
		S_MUX_PC_BUS	: out std_logic_vector(1 downto 0);	-- Control of mux to PC
		S_EXT		: out std_logic;			-- Control of extender
		S_EXT_SIGN	: out std_logic;			-- Control of extender sign
		S_EQ_NEQ	: out std_logic;			-- Control of Comparator
		S_MUX_DEST	: out std_logic_vector(1 downto 0);	-- Control of Destination register
		S_MUX_LINK	: out std_logic;			-- Control of link mux 
		S_MUX_MEM	: out std_logic;			-- Control of mux to memory address
		S_MEM_W_R	: out std_logic;			-- Control of mem W/R
		S_MEM_EN	: out std_logic;			-- Control mem enable
		S_RF_W_wb	: out std_logic;			-- Control WB enable
		S_RF_W_mem	: out std_logic;			-- Current op in mem is going to write on wb?
		S_RF_W_exe	: out std_logic;			-- Current op in exe is going to write on wb?
		S_MUX_ALUIN	: out std_logic;			-- Control ALU input ( IMM or B )
		stall_exe_o	: out std_logic;			-- Stall exe stage
		stall_dec_o	: out std_logic;			-- Stall dec stage
		stall_fetch_o	: out std_logic;			-- Stall fetch stage
		stall_btb_o	: out std_logic;			-- Stall btb
		was_branch_o	: out std_logic;			-- Op in decode is a branch or not?
		was_jmp_o	: out std_logic;
		ALU_WORD_o	: out std_logic_vector(12 downto 0);		-- Opcode to ALU
		ALU_OPCODE	: out aluOp		-- Opcode to ALU

);
end dlx_cu;

architecture dlx_cu_hw of dlx_cu is

  -- ***************************
  -- *** SIGNAL DECLARATIONS ***
  -- ***************************
  
-- this is the microcode memory, it works as a LUT -> to decode an instruction it's opcode indexes this memory
                                
                                
  signal IR_opcode	: std_logic_vector(OP_CODE_SIZE -1 downto 0);	-- OpCode part of IR
  signal IR_func	: std_logic_vector(FUNC_SIZE -1 downto 0);	-- Func part of IR when Rtype
  signal cw_d		: std_logic_vector(CW_SIZE - 1 downto 0);
  signal cw_from_mem	: std_logic_vector(CW_SIZE - 1 downto 0);	-- full control word read from cw_mem


  -- control word is shifted to the correct stage
  signal cw_e	: std_logic_vector(CW_SIZE - 1 - 6 downto 0);	-- second stage
  signal cw_m	: std_logic_vector(CW_SIZE - 1 - 9  downto 0);	-- third stage
  signal cw_w	: std_logic_vector(CW_SIZE - 1 - 12  downto 0);	-- fourth stage
  
  signal aluOpcode_d : aluOp := NOP;	-- ALUOP defined in package -- ! MIGHT NOT BE SYNTHESIZABLE
  signal aluOpcode_e : aluOp := NOP;	-- shifted ALUOP to feed execute stage -- ! MIGHT NOT BE SYNTHESIZABLE


  signal S_MEM_LOAD		: std_logic;	-- is current op in mem stage a LOAD?
  signal S_EXE_LOAD		: std_logic;	-- is current op in exe stage a LOAD?

  -- stall signals from stall unit
  signal stall_exe_o_TEMP	: std_logic;	
  signal stall_dec_o_TEMP	: std_logic;	
  signal stall_btb_o_TEMP	: std_logic;	
  signal stall_fetch_o_TEMP	: std_logic;

  signal bubble_dec			: std_logic; -- transform next op in decode into a NOP
  signal next_bubble_dec		: std_logic;
  signal bubble_exe			: std_logic; -- transform next op in exe into a NOP
  signal next_bubble_exe		: std_logic;

  -- ********************************
  -- ***  COMPONENTS DECLARATION  ***
  -- ********************************

component cw_mem is
	generic (
		MICROCODE_MEM_SIZE	: integer;	-- Microcode Memory Size
		OP_CODE_SIZE		: integer;		-- Op Code Size
		CW_SIZE			: integer	-- Control Word Size
		);
	port (

		OPCODE_IN	: in  std_logic_vector(OP_CODE_SIZE - 1 downto 0);	-- Instruction Register
		CW_OUT		: out std_logic_vector(CW_SIZE - 1 downto 0)
	);
end component;

component alu_ctrl is
	port (
	OP		: in  AluOp;
	ALU_WORD	: out std_logic_vector(12 downto 0)
	);

end component;

-- instantiation of stall_logic block
component stall_logic is
  generic (
    FUNC_SIZE          :     integer; -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer -- Op Code Size
);
  port (
    -- Instruction Register
    OPCODE_i		: in  std_logic_vector(OP_CODE_SIZE-1  downto 0);
    FUNC_i		: in  std_logic_vector(FUNC_SIZE-1  downto 0);
    rA_i		: in  std_logic_vector(4 downto 0);
    rB_i		: in  std_logic_vector(4 downto 0);
    D1_i		: in  std_logic_vector(4 downto 0); -- taken from output of destination mux in EXE stage
    D2_i		: in  std_logic_vector(4 downto 0);
    S_mem_LOAD_i	: in  std_logic;
    S_exe_LOAD_i	: in  std_logic;
    S_exe_WRITE_i	: in  std_logic;
    S_MUX_PC_BUS_i	: in  std_logic_vector(1 downto 0);
    mispredict_i	: in  std_logic;
    bubble_dec_o	: out std_logic;
    bubble_exe_o	: out std_logic;
    stall_exe_o		: out std_logic;
    stall_dec_o		: out std_logic;
    stall_btb_o		: out std_logic;
    stall_fetch_o	: out std_logic
);
end component;


 
begin

  -- ********************************
  -- *** COMPONENTS INSTANTIATION ***
  -- ********************************

STALL_L : stall_logic 
  generic map (
    FUNC_SIZE          => 11,
    OP_CODE_SIZE       => 6
  )
  port map(
    -- Instruction Register
    OPCODE_i		=> IR_opcode,
    FUNC_i		=> IR_func,
    rA_i		=> IR_IN(25 downto 21),
    rB_i		=> IR_IN(20 downto 16),
    D1_i		=> D1_i,
    D2_i		=> D2_i,
    S_mem_LOAD_i	=> S_MEM_LOAD,
    S_exe_LOAD_i	=> S_EXE_LOAD,
    S_exe_WRITE_i	=> cw_e(CW_SIZE - 13),
    S_MUX_PC_BUS_i	=> cw_d(CW_SIZE - 1 downto CW_SIZE - 2),
    mispredict_i	=> mispredict_i,
    bubble_dec_o	=> next_bubble_dec,
    bubble_exe_o	=> next_bubble_exe,
    stall_exe_o		=> stall_exe_o_TEMP,
    stall_dec_o		=> stall_dec_o_TEMP,
    stall_btb_o		=> stall_btb_o_TEMP,
    stall_fetch_o	=> stall_fetch_o_TEMP
);  

CWM : cw_mem 
  generic map(
	MICROCODE_MEM_SIZE	=> MICROCODE_MEM_SIZE,
	OP_CODE_SIZE		=> OP_CODE_SIZE,
	CW_SIZE			=> CW_SIZE
	)
  port map(
	OPCODE_IN	=> IR_opcode,
	CW_OUT		=> cw_from_mem
	);

ALU_C: alu_ctrl
	port map(
	OP		=> aluopcode_d,
	ALU_WORD	=> ALU_WORD_o
	);

  -- stall signals for each individual stage of the pipeline
  -- an OR is needed cause a stall might come from ALU too
  stall_exe_o	<= stall_exe_i or stall_exe_o_TEMP;
  stall_dec_o	<= stall_exe_i or stall_dec_o_TEMP;
  stall_fetch_o	<= stall_exe_i or stall_fetch_o_TEMP;
  stall_btb_o	<= stall_exe_i or stall_btb_o_TEMP;

  -- split function in OPCODE and FUNC
  IR_opcode(5 downto 0)	<= IR_IN(31 downto 26);
  IR_func(10 downto 0) 	<= IR_IN(FUNC_SIZE - 1 downto 0);


  -- control work is assigned to the word looked up in microcode memory
  -- in case of bubble_dec, a NOP cw is fed instead
  cw_d	<= cw_from_mem when bubble_dec = '0' else "0000000000000";

  -- *** ATM THE LATCH ENABLES ARE DOING NOTHING! EVERYTHING IS CONTROLLED BY STALL ***
  S1_LATCH_EN	<= '1';
  S2_LATCH_EN 	<= '1';
  S3_LATCH_EN	<= '1';

  -- DEC stage control signals
  S_MUX_PC_BUS	<= cw_d(CW_SIZE - 1 downto CW_SIZE - 2);
  S_EXT		<= cw_d(CW_SIZE - 3);
  S_EXT_SIGN	<= cw_d(CW_SIZE - 4);
  S_EQ_NEQ	<= cw_d(CW_SIZE - 5);
  S_MUX_LINK    <= cw_d(CW_SIZE - 6);

  -- EXE stage control signals
  S_MUX_ALUIN	<= cw_e(CW_SIZE - 7);
  S_MUX_DEST    <= cw_e(CW_SIZE - 8 downto CW_SIZE - 9);

  -- MEM stage control signals 
  S_MEM_EN	<= cw_m(CW_SIZE - 10);
  S_MEM_W_R	<= cw_m(CW_SIZE - 11);
  S_MUX_MEM	<= cw_m(CW_SIZE - 12);

  -- WB stage control signals 
  S_RF_W_wb	<= cw_w(CW_SIZE - 13);

  -- RF write signal is sent to other stages to compute hazards/forwarding
  S_RF_W_mem	<= cw_m(CW_SIZE - 13);
  S_RF_W_exe	<= cw_e(CW_SIZE - 13);

  -- is the current op in mem stage a LOAD?
  S_MEM_LOAD	<= cw_m(CW_SIZE - 10) and (not cw_m(CW_SIZE - 11));

  -- is the current op in exe stage a LOAD?
  S_EXE_LOAD	<= cw_e(CW_SIZE - 10) and (not cw_e(CW_SIZE - 11));

  -- is current op in DEC stage a branch?
  was_branch_o	<=  cw_d(CW_SIZE - 1) and cw_d(CW_SIZE - 2);

  -- is current op in DEC stage an inconditional jump?
  was_jmp_o	<=  cw_d(CW_SIZE - 1) xor cw_d(CW_SIZE - 2);


  ALU_OPCODE <= aluOpcode_e;

  -- ********************************
  -- ***        PROCESSES         ***
  -- ********************************

  -- sequential process to manage and pipeline control words
  
CW_PIPE: process (Clk, Rst)
begin  -- process Clk
	if Rst = '1' then                   -- asynchronous reset (active high)

		cw_e <= (others => '0');
		cw_m <= (others => '0');
		cw_w <= (others => '0');
		aluOpcode_e <= NOP;

	elsif Clk'event and Clk = '1' then  -- rising clock edge

		-- update of the bubbe signal
		-- bubble means: cancel next operation and make it a nop ( used in case of misprediction or inconditional jumps)
		bubble_dec <= next_bubble_dec;
		bubble_exe <= next_bubble_exe;

		-- EXE stalled 
		if stall_exe_i = '1' or stall_exe_o_TEMP = '1' then
			cw_m		<= "0000"; -- NOP instertion
			cw_e		<= cw_e;
			aluOpcode_e 	<= aluOpcode_e;

		-- DEC stalled
		elsif stall_dec_o_TEMP = '1' then
			cw_e		<= "0000000"; -- NOP instertion
			cw_m		<= cw_e(CW_SIZE - 1 - 9 downto 0);

		-- no stall
		else
			cw_e		<= cw_d(CW_SIZE - 1 - 6 downto 0);
			cw_m		<= cw_e(CW_SIZE - 1 - 9 downto 0);
			aluOpcode_e	<= aluOpcode_d;
		end if;
		
		-- WB cannot be stalled
		cw_w <= cw_m(CW_SIZE - 1 - 12 downto 0);

	end if;
end process CW_PIPE;




   -- combinatorial process to generate ALU OP CODES 

ALU_OP_CODE_P : process (IR_opcode, IR_func)
begin 
	case conv_integer(unsigned(IR_opcode)) is

	        -- case of R type requires analysis of FUNC
		when 0 =>
			case conv_integer(unsigned(IR_func)) is
				when  4 => aluOpcode_d <= SLLS; -- sll according to instruction set coding
				when  6 => aluOpcode_d <= SRLS; 
				when  7 => aluOpcode_d <= SRAS; 
				when 32 => aluOpcode_d <= ADDS; 
				when 33 => aluOpcode_d <= ADDUS; 
				when 34 => aluOpcode_d <= SUBS; 
				when 35 => aluOpcode_d <= SUBUS; 
				when 36 => aluOpcode_d <= ANDS; 
				when 37 => aluOpcode_d <= ORS; 
				when 38 => aluOpcode_d <= XORS; 
				when 40 => aluOpcode_d <= SEQS; 
				when 41 => aluOpcode_d <= SNES; 
				when 42 => aluOpcode_d <= SLTS; 
				when 43 => aluOpcode_d <= SGTS; 
				when 44 => aluOpcode_d <= SLES; 
				when 45 => aluOpcode_d <= SGES; 
				when 48 => aluOpcode_d <= MOVI2SS; 
				when 49 => aluOpcode_d <= MOVS2IS; 
				when 50 => aluOpcode_d <= MOVFS; 
				when 51 => aluOpcode_d <= MOVDS; 
				when 52 => aluOpcode_d <= MOVFP2IS; 
				when 53 => aluOpcode_d <= MOVI2FP; 
				when 54 => aluOpcode_d <= MOVI2TS; 
				when 55 => aluOpcode_d <= MOVT2IS; 
				when 58 => aluOpcode_d <= SLTUS; 
				when 59 => aluOpcode_d <= SGTUS; 
				when 60 => aluOpcode_d <= SLEUS; 
				when 61 => aluOpcode_d <= SGEUS;
				when others => aluOpcode_d <= NOP; -- might not be synthesizable
			end case;

		-- type F instruction case -- MULT only at the moment
		when 1 =>
			case conv_integer(unsigned(IR_func)) is
				when 22 => aluOpcode_d <= MULTU;
				when 14 => aluOpcode_d <= MULTS;
				when others => aluOpcode_d <= NOP; -- might not be synthesizable
			end case;

		-- I-TYPE instructions
		when 2  => aluOpcode_d <= NOP;		-- j
		when 3  => aluOpcode_d <= NOP;		-- jal
		when 4  => aluOpcode_d <= NOP;		-- beqz
		when 5  => aluOpcode_d <= NOP;		-- bnez
		when 8  => aluOpcode_d <= ADDS;		-- addi
		when 9  => aluOpcode_d <= ADDUS;	-- addui
		when 10 => aluOpcode_d <= SUBS;		-- subi
		when 11 => aluOpcode_d <= SUBUS;	-- subui
		when 12 => aluOpcode_d <= ANDS;		-- andi
		when 13 => aluOpcode_d <= ORS;		-- ori
		when 14 => aluOpcode_d <= XORS;		-- xori
		when 18 => aluOpcode_d <= NOP;		-- jr
		when 19 => aluOpcode_d <= NOP;		-- jalr
		when 20 => aluOpcode_d <= SLLS;		-- slli
		when 21 => aluOpcode_d <= NOP;		-- nop
		when 22 => aluOpcode_d <= SRLS;		-- srli
		when 23 => aluOpcode_d <= SRAS;		-- srai
		when 24 => aluOpcode_d <= SEQS;		-- seqi
		when 25 => aluOpcode_d <= SNES;		-- snei
		when 26 => aluOpcode_d <= SLTS;		-- slti
		when 27 => aluOpcode_d <= SGTS;		-- sgti
		when 28 => aluOpcode_d <= SLES;		-- slei	
		when 29 => aluOpcode_d <= SGES;		-- sgei	
		when 35 => aluOpcode_d <= ADDS;		-- lw
		when 43 => aluOpcode_d <= ADDS;		-- sw
		when 58 => aluOpcode_d <= SLTUS;	-- sltui
		when 59 => aluOpcode_d <= SGTUS;	-- sgtui
		when 60 => aluOpcode_d <= SLEUS;	-- sleui	
		when 61 => aluOpcode_d <= SGEUS;	-- sgeui	
		when others => aluOpcode_d <= NOP;	-- might not be synthesizable
	 end case;
end process ALU_OP_CODE_P;


end dlx_cu_hw;
