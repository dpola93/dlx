-- TOP LEVEL BLOCK

library IEEE;

use IEEE.std_logic_1164.all;
use work.myTypes.all;

entity top_level is
	port(
	clock		: in  std_logic; 
	rst		: in  std_logic;
	IRAM_Addr_o	: out std_logic_vector(31 downto 0);
	IRAM_Dout_i	: in  std_logic_vector(31 downto 0);
	DRAM_Enable_o	: out std_logic;
	DRAM_WR_o	: out std_logic;
	DRAM_Din_o	: out std_logic_vector(31 downto 0);
	DRAM_Addr_o	: out std_logic_vector(31 downto 0);
	DRAM_Dout_i	: in  std_logic_vector(31 downto 0)
	); 
end top_level;

architecture arch of top_level is


  component fetch_block
    port (
	branch_target_i		: in  std_logic_vector(31 downto 0);
	sum_addr_i		: in  std_logic_vector(31 downto 0);
	A_i			: in  std_logic_vector(31 downto 0);
	NPC4_i			: in  std_logic_vector(31 downto 0);
	S_MUX_PC_BUS_i		: in  std_logic_vector(1 downto 0);
	PC_o			: out std_logic_vector(31 downto 0);
	PC4_o			: out std_logic_vector(31 downto 0);
	PC_BUS_pre_BTB		: out std_logic_vector(31 downto 0);
	stall_i			: in  std_logic;
	mispredict_i		: in  std_logic;
	take_prediction_i	: in  std_logic;
	predicted_PC		: in  std_logic_vector(31 downto 0);
	clk			: in  std_logic;
	rst			: in  std_logic
	);
  end component;

component fetch_regs is
 port (
	NPCF_i	: in  std_logic_vector(31 downto 0);
	IR_i	: in  std_logic_vector(31 downto 0);
	NPCF_o	: out std_logic_vector(31 downto 0);
	IR_o	: out std_logic_vector(31 downto 0);
	stall_i	: in  std_logic;
	clk	: in  std_logic;
	rst	: in  std_logic
	);
end component;

component jump_logic is
 port (
	NPCF_i		: in  std_logic_vector(31 downto 0);
	IR_i		: in  std_logic_vector(31 downto 0);
	A_i		: in  std_logic_vector(31 downto 0);
	A_o		: out std_logic_vector(31 downto 0);
	rA_o		: out std_logic_vector(4 downto 0);
	rB_o		: out std_logic_vector(4 downto 0);
	rC_o		: out std_logic_vector(4 downto 0);
	branch_target_o	: out std_logic_vector(31 downto 0);
	sum_addr_o	: out std_logic_vector(31 downto 0);
	extended_imm	: out std_logic_vector(31 downto 0);
	taken_o		: out std_logic; --was the branch taken or not?
	FW_X_i		: in  std_logic_vector(31 downto 0);
	FW_W_i		: in  std_logic_vector(31 downto 0);
	S_FW_Adec_i	: in  std_logic_vector(1 downto 0);
	S_EXT_i		: in  std_logic;
	S_EXT_SIGN_i	: in  std_logic;
	S_MUX_LINK_i	: in  std_logic;
	S_EQ_NEQ_i	: in  std_logic 
	);
end component;

component dlx_regfile is
port ( Clk: 	in  std_logic;
Rst: 		in  std_logic;
ENABLE: 	in  std_logic;
RD1: 		in  std_logic;
RD2: 		in  std_logic;
WR: 		in  std_logic;
ADD_WR: 	in  std_logic_vector(4 downto 0);
ADD_RD1: 	in  std_logic_vector(4 downto 0);
ADD_RD2: 	in  std_logic_vector(4 downto 0);
DATAIN: 	in  std_logic_vector(31 downto 0);
OUT1: 		out std_logic_vector(31 downto 0);
OUT2: 		out std_logic_vector(31 downto 0));
end component;

component dlx_cu is
 generic (
  MICROCODE_MEM_SIZE	:   integer := 64; -- Microcode Memory Size
  FUNC_SIZE		:   integer := 11; -- Func Field Size for R-Type Ops
  OP_CODE_SIZE		:   integer := 6; -- Op Code Size
  IR_SIZE		:   integer := 32; -- Instruction Register Size  
  CW_SIZE		:   integer := 13); -- Control Word Size
 port (
  Clk			: in  std_logic; -- clock
  Rst			: in  std_logic; -- rst:Active-Low
  IR_IN			: in  std_logic_vector(31 downto 0);
  stall_exe_i		: in  std_logic;
  mispredict_i		: in  std_logic;
  D1_i			: in  std_logic_vector(4 downto 0);
  D2_i			: in  std_logic_vector(4 downto 0);
  
  S1_LATCH_EN		: out std_logic;
  S2_LATCH_EN		: out std_logic; 
  S3_LATCH_EN		: out std_logic;
  S_MUX_PC_BUS		: out std_logic_vector(1 downto 0);
  S_EXT			: out std_logic;
  S_EXT_SIGN		: out std_logic;
  S_EQ_NEQ		: out std_logic;
  S_MUX_LINK		: out std_logic;
  S_MUX_DEST		: out std_logic_vector(1 downto 0);
  S_MUX_MEM		: out std_logic;
  S_MEM_EN		: out std_logic;
  S_MEM_W_R		: out std_logic;
  S_RF_W_wb		: out std_logic;
  S_RF_W_mem		: out std_logic;
  S_RF_W_exe		: out std_logic;
  S_MUX_ALUIN		: out std_logic;
  stall_exe_o		: out std_logic;
  stall_dec_o		: out std_logic;
  stall_fetch_o    	: out std_logic;
  stall_btb_o		: out std_logic;
  was_branch_o		: out std_logic;
  was_jmp_o		: out std_logic;
  ALU_WORD_o		: out std_logic_vector(12 downto 0);		-- Opcode to ALU
  ALU_OPCODE		: out aluOp


);
end component;

component decode_regs is
 port (
	A_i	: in  std_logic_vector(31 downto 0);
	B_i	: in  std_logic_vector(31 downto 0);
	rA_i	: in  std_logic_vector(4 downto 0);
	rB_i	: in  std_logic_vector(4 downto 0);
	rC_i	: in  std_logic_vector(4 downto 0);
	IMM_i	: in  std_logic_vector(31 downto 0);
	ALUW_i	: in  std_logic_vector(12 downto 0);
	A_o	: out std_logic_vector(31 downto 0);
	B_o	: out std_logic_vector(31 downto 0);
	rA_o	: out std_logic_vector(4 downto 0);
	rB_o	: out std_logic_vector(4 downto 0);
	rC_o	: out std_logic_vector(4 downto 0);
	IMM_o	: out std_logic_vector(31 downto 0);
	ALUW_o	: out std_logic_vector(12 downto 0);
	stall_i : in  std_logic;
	clk 	: in  std_logic;
	rst	: in  std_logic

	);
end component;

component execute_regs
port (
	X_i		: in  std_logic_vector(31 downto 0);
	S_i		: in  std_logic_vector(31 downto 0);
	D2_i		: in  std_logic_vector(4 downto 0);
	X_o		: out std_logic_vector(31 downto 0);
	S_o		: out std_logic_vector(31 downto 0);
	D2_o		: out std_logic_vector(4 downto 0);
	stall_i		: in  std_logic;
	clk		: in  std_logic;
	rst		: in  std_logic

	);
end component;

component execute_block
port (
	IMM_i		: in  std_logic_vector(31 downto 0);
	A_i		: in  std_logic_vector(31 downto 0);
	rB_i		: in  std_logic_vector(4 downto 0);
	rC_i		: in  std_logic_vector(4 downto 0);
	MUXED_B_i	: in  std_logic_vector(31 downto 0);
	S_MUX_ALUIN_i	: in  std_logic;
	FW_X_i		: in  std_logic_vector(31 downto 0);
	FW_W_i		: in  std_logic_vector(31 downto 0);
	S_FW_A_i	: in  std_logic_vector(1 downto 0);
	S_FW_B_i	: in  std_logic_vector(1 downto 0);
	muxed_dest	: out std_logic_vector(4 downto 0);
	muxed_B		: out std_logic_vector(31  downto 0);
	S_MUX_DEST_i	: in  std_logic_vector(1 downto 0);
	OP		: in  AluOp;
	ALUW_i		: in  std_logic_vector(12 downto 0);
	DOUT		: out std_logic_vector(31 downto 0);
	stall_o		: out std_logic;
	clock		: in  std_logic;
	Reset		: in  std_logic
	);
end component;


component mem_regs 
 port (
	W_i		: in  std_logic_vector(31 downto 0);
	D3_i		: in  std_logic_vector(4 downto 0);
	W_o		: out std_logic_vector(31 downto 0);
	D3_o		: out std_logic_vector(4 downto 0);
	clk		: in  std_logic;
	rst		: in  std_logic
	);
end component;

component mem_block
 port (
	X_i		: in  std_logic_vector(31 downto 0);
	LOAD_i		: in  std_logic_vector(31 downto 0);
	S_MUX_MEM_i	: in  std_logic;
	W_o		: out std_logic_vector(31 downto 0)
	);
end component;

component fw_logic is
 port (
	D1_i		: in  std_logic_vector(4 downto 0); -- taken from output of destination mux in EXE stage
	rAdec_i 	: in  std_logic_vector(4 downto 0); -- taken from IR directly in DEC stage
	D2_i		: in  std_logic_vector(4 downto 0);
	D3_i		: in  std_logic_vector(4 downto 0);
	rA_i		: in  std_logic_vector(4 downto 0);
	rB_i		: in  std_logic_vector(4 downto 0);
	S_mem_W		: in  std_logic; -- will the current instruction in MEM stage write to RF?
	S_mem_LOAD	: in  std_logic; -- is the current instruction in MEM stage a LOAD?
	S_wb_W		: in  std_logic; -- will the current instruction in WB stage write to RF?
	S_exe_W		: in  std_logic; -- will the current instruction in EXE stage write to RF?
	S_FWAdec	: out std_logic_vector(1 downto 0); -- this signal controls forward of A in DEC stage
	S_FWA		: out std_logic_vector(1 downto 0);
	S_FWB		: out std_logic_vector(1 downto 0)
	);
end component;

component btb is
	generic (
	N_LINES	: integer ;
	SIZE	: integer
);
 port (
	clock			: in  std_logic;
	reset			: in  std_logic;
	stall_i			: in  std_logic;
	TAG_i			: in  std_logic_vector(N_LINES - 1 downto 0); -- TAG is taken from the PC ( remove 2 lowest bits)
	target_PC_i		: in  std_logic_vector(SIZE - 1 downto 0); -- correct value from dec stage
	was_taken_i		: in  std_logic; -- correct value from dec stage
	predicted_next_PC_o	: out std_logic_vector(SIZE - 1 downto 0);  -- output to PC
	taken_o			: out std_logic; -- control to bypass PC_MUX and use prediction
	mispredict_o		: out std_logic -- 1 when last branch was not correctly predicted
	);
end component;


signal PC		: std_logic_vector(31 downto 0);
signal PC4		: std_logic_vector(31 downto 0);
signal TARGET_PC	: std_logic_vector(31 downto 0);
signal IR 			: std_logic_vector(31 downto 0);
signal NPCF		: std_logic_vector(31 downto 0);

signal AtoComp			: std_logic_vector(31 downto 0);
signal dummy_A			: std_logic_vector(31 downto 0);
signal dummy_B			: std_logic_vector(31 downto 0);
signal dummy_branch_target	: std_logic_vector(31 downto 0);
signal dummy_sum_addr		: std_logic_vector(31 downto 0);
signal dummy_S_MUX_PC_BUS	: std_logic_vector(1 downto 0);
signal dummy_S_MUX_DEST		: std_logic_vector(1 downto 0);
signal dummy_S_EXT		: std_logic;
signal dummy_S_EXT_SIGN		: std_logic;
signal dummy_S_MUX_LINK		: std_logic;
signal dummy_S_MUX_ALUIN	: std_logic;
signal dummy_S_EQ_NEQ		: std_logic;
signal dummy_S_MEM_W_R		: std_logic;
signal dummy_S_MEM_EN		: std_logic;

signal dummy_S_RF_W_wb		: std_logic;
signal dummy_S_RF_W_mem		: std_logic;
signal dummy_S_RF_W_exe		: std_logic;

signal dummy_S_FWA2exe		: std_logic_vector(1 downto 0);
signal dummy_S_FWB2exe		: std_logic_vector(1 downto 0);
signal dummy_S_FWAdec		: std_logic_vector(1 downto 0);

signal dummy_S_MUX_MEM		: std_logic;

signal dummy_OP			: AluOp;
signal ALUW_dec			: std_logic_vector(12 downto 0);
signal ALUW			: std_logic_vector(12 downto 0);
signal help_B			: std_logic_vector(31 downto 0);
signal help_DEST		: std_logic_vector(4 downto 0);
signal help_IMM			: std_logic_vector(31 downto 0);

signal A2exe			: std_logic_vector(31 downto 0);
signal B2exe			: std_logic_vector(31 downto 0);
signal IMM2exe			: std_logic_vector(31 downto 0);
signal D12exe			: std_logic_vector(4 downto 0);

signal rA2reg			: std_logic_vector(4 downto 0);
signal rB2reg			: std_logic_vector(4 downto 0);
signal rC2reg			: std_logic_vector(4 downto 0);

signal rA2fw			: std_logic_vector(4 downto 0);
signal rB2mux			: std_logic_vector(4 downto 0);
signal rC2mux			: std_logic_vector(4 downto 0);
signal muxed_dest2exe		: std_logic_vector(4 downto 0);

signal X2mem			: std_logic_vector(31 downto 0);
signal S2mem			: std_logic_vector(31 downto 0);

signal D22D3			: std_logic_vector(4 downto 0);

signal S2wb			: std_logic_vector(31 downto 0);
signal X2wb			: std_logic_vector(31 downto 0);
signal L2wb			: std_logic_vector(31 downto 0);

signal W2wb			: std_logic_vector(31 downto 0);
signal wb2reg			: std_logic_vector(31 downto 0);
signal D32reg			: std_logic_vector(4 downto 0);

signal stall_fetch		: std_logic;
signal stall_btb		: std_logic;
signal stall_decode		: std_logic;
signal stall_exe		: std_logic;

signal exe_stall_cu		: std_logic;
signal dec_stall_cu		: std_logic;

signal was_taken_from_jl	: std_logic;
signal was_taken		: std_logic;
signal was_branch		: std_logic;
signal was_jmp			: std_logic;

signal enable_regfile		: std_logic;

signal mispredict		: std_logic;
signal take_prediction		: std_logic;
signal wrong_back_pred		: std_logic;
signal predicted_PC		: std_logic_vector(31 downto 0);

begin

was_taken <= (was_taken_from_jl and was_branch) or was_jmp;

    -- instance of DLX
	UFETCH_BLOCK: fetch_block
	Port Map(
	branch_target_i 	=> dummy_branch_target,
	sum_addr_i		=> dummy_sum_addr,
	A_i			=> dummy_A,
	NPC4_i			=> NPCF,
	S_MUX_PC_BUS_i		=> dummy_S_MUX_PC_BUS,
	PC_o			=> PC, 
	PC4_o			=> PC4, --this is actually PC4 
	PC_BUS_pre_BTB		=> TARGET_PC,
	stall_i			=> stall_fetch,
	mispredict_i		=> mispredict,
	take_prediction_i	=> take_prediction,
	predicted_PC		=> predicted_PC,
	clk			=> clock,
	rst			=> rst
	);

	UBTB : btb
	generic map(
	N_LINES	=> PRED_SIZE,
	SIZE	=> 32
	)
 	port map(
	clock			=> clock,
	reset			=> rst,
	stall_i			=> stall_btb,
	TAG_i			=> PC(2+PRED_SIZE-1 downto 2),
	target_PC_i		=> TARGET_PC,
	was_taken_i		=> was_taken,
	predicted_next_PC_o	=> predicted_PC,
	taken_o			=> take_prediction,
	mispredict_o		=> mispredict

	);
	
	IRAM_Addr_o	<= PC;

	UFEETCH_REGS: fetch_regs
	Port Map (PC4,IRAM_Dout_i,NPCF,IR,stall_decode,clock, rst);

	UJUMP_LOGIC: jump_logic
	Port Map (
	NPCF_i		=> NPCF,
	IR_i		=> IR,
	A_i		=> AtoComp,
	A_o		=> dummy_A,
	rA_o		=> rA2reg,
	rB_o		=> rB2reg,
	rC_o		=> rC2reg,
	branch_target_o	=> dummy_branch_target,
	sum_addr_o	=> dummy_sum_addr,
	extended_imm	=> help_IMM,
	taken_o		=> was_taken_from_jl,
	FW_X_i		=> X2wb,
	FW_W_i		=> wb2reg,
	S_FW_Adec_i	=> dummy_S_FWAdec,
	S_EXT_i		=> dummy_S_EXT,
	S_EXT_SIGN_i	=> dummy_S_EXT_SIGN,
	S_MUX_LINK_i	=> dummy_S_MUX_LINK,
	S_EQ_NEQ_i	=> dummy_S_EQ_NEQ
	);
	
	UCU: dlx_cu
	generic map(
	MICROCODE_MEM_SIZE	=> 64,
	FUNC_SIZE		=> 11,
	OP_CODE_SIZE		=> 6,
	IR_SIZE			=> 32,
	CW_SIZE			=> 13
	)
	Port Map (
	Clk		=> clock,
	Rst		=> rst,
	IR_IN		=> IR,
	stall_exe_i	=> exe_stall_cu,
 	mispredict_i	=> mispredict,
	D1_i		=> muxed_dest2exe,
	D2_i		=> D22D3,
	S1_LATCH_EN	=> open,
	S2_LATCH_EN	=> open,
	S3_LATCH_EN 	=> open,
	S_MUX_PC_BUS	=> dummy_S_MUX_PC_BUS,
	S_EXT		=> dummy_S_EXT,
	S_EXT_SIGN	=> dummy_S_EXT_SIGN,
	S_EQ_NEQ	=> dummy_S_EQ_NEQ,
	S_MUX_LINK	=> dummy_S_MUX_LINK,
	S_MUX_DEST	=> dummy_S_MUX_DEST,
	S_MUX_MEM	=> dummy_S_MUX_MEM,
	S_MEM_EN	=> dummy_S_MEM_EN,
 	S_MEM_W_R	=> dummy_S_MEM_W_R,
	S_RF_W_wb	=> dummy_S_RF_W_wb,
	S_RF_W_mem	=> dummy_S_RF_W_mem,
	S_RF_W_exe	=> dummy_S_RF_W_exe,
	S_MUX_ALUIN 	=> dummy_S_MUX_ALUIN,
	stall_exe_o	=> stall_exe,
	stall_dec_o	=> stall_decode,
	stall_fetch_o	=> stall_fetch,
	stall_btb_o	=> stall_btb,
	was_branch_o	=> was_branch, 
	was_jmp_o	=> was_jmp, 
  	ALU_WORD_o	=> ALUW_dec,
	ALU_OPCODE	=> dummy_OP
	);

	enable_regfile <= not(stall_decode);

	RF: dlx_regfile
	Port Map (
	Clk		=> clock, 
	Rst		=> rst,
	ENABLE		=> enable_regfile,
	RD1		=> '1',
	RD2		=> '1',
	WR		=> dummy_S_RF_W_mem,
	ADD_WR		=> D22D3,
	ADD_RD1		=> IRAM_Dout_i(25 downto 21),
	ADD_RD2		=> IRAM_Dout_i(20 downto 16),
	DATAIN		=> W2wb,
	OUT1		=> AtoComp,
	OUT2		=> dummy_B
	);

	UDECODE_REGS: decode_regs
	Port Map (
	A_i	=> AtoComp,
	B_i	=> dummy_B,
	rA_i	=> rA2reg,
	rB_i	=> rB2reg,
	rC_i	=> rC2reg,
	IMM_i	=> help_IMM,
	ALUW_i	=> ALUW_dec,
	A_o	=> A2exe,
	B_o	=> B2exe,
	rA_o	=> rA2fw,
	rB_o	=> rB2mux,
	rC_o	=> rC2mux,
	IMM_o	=> IMM2exe,
	stall_i => stall_exe,
	ALUW_o	=> ALUW,
	clk	=> clock,
	rst	=> rst
	);

	UEXECUTE_REGS: execute_regs
	Port Map (X2mem,S2mem,muxed_dest2exe,X2wb,S2wb,D22D3,'0',clock,rst);

	UEXECUTE_BLOCK : execute_block
 	Port Map(
	IMM_i		=> IMM2exe,
	A_i		=> A2exe,
	rB_i		=> rB2mux,
	rC_i		=> rC2mux,
	MUXED_B_i	=> B2exe,
	S_MUX_ALUIN_i	=> dummy_S_MUX_ALUIN,
	FW_X_i		=> X2wb,
	FW_W_i		=> wb2reg,
	S_FW_A_i	=> dummy_S_FWA2exe,
	S_FW_B_i	=> dummy_S_FWB2exe,
	muxed_dest	=> muxed_dest2exe,
	muxed_B		=> S2mem,
	S_MUX_DEST_i	=> dummy_S_MUX_DEST,
	OP		=> dummy_OP,
	ALUW_i		=> ALUW,	
	DOUT		=> X2mem,
	stall_o		=> exe_stall_cu,
	clock		=> clock,
	Reset		=> rst
	);


	DRAM_Enable_o	<= dummy_S_MEM_EN;
	DRAM_WR_o	<= dummy_S_MEM_W_R;
	DRAM_Din_o	<= S2wb;
	DRAM_Addr_o	<= X2wb;
	L2wb		<= DRAM_Dout_i;

	UMEM_REGS: mem_regs
	Port Map (W2wb,D22D3,wb2reg,D32reg,clock,rst);

	UMEM_BLOCK: mem_block
	Port Map (X2wb,L2wb,dummy_S_MUX_MEM,W2wb);

	UFW_LOGIC: fw_logic
 	Port Map(
	D1_i		=> muxed_dest2exe,
	D2_i		=> D22D3,
	D3_i		=> D32reg,
	rAdec_i		=> IR(25 downto 21),
	rA_i		=> rA2fw,
	rB_i		=> rB2mux,
	S_exe_W		=> dummy_S_RF_W_exe,
	S_mem_W		=> dummy_S_RF_W_mem,
	S_mem_LOAD	=> dummy_S_MUX_MEM,
	S_wb_W		=> dummy_S_RF_W_wb,
	S_FWAdec	=> dummy_S_FWAdec,
	S_FWA		=> dummy_S_FWA2exe,
	S_FWB		=> dummy_S_FWB2exe
	);


end arch;

