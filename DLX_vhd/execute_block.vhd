
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity execute_block is
	generic (
	SIZE : integer := 32
);
  port (
	IMM_i		: in  std_logic_vector(SIZE - 1 downto 0);
	A_i		: in  std_logic_vector(SIZE - 1 downto 0);
	rB_i		: in  std_logic_vector(4 downto 0);
	rC_i		: in  std_logic_vector(4 downto 0);
	MUXED_B_i	: in  std_logic_vector(SIZE - 1 downto 0);
	S_MUX_ALUIN_i	: in  std_logic;
	FW_X_i		: in  std_logic_vector(SIZE - 1 downto 0);
	FW_W_i		: in  std_logic_vector(SIZE - 1 downto 0);
	S_FW_A_i	: in  std_logic_vector(1 downto 0);
	S_FW_B_i	: in  std_logic_vector(1 downto 0);
	muxed_dest	: out std_logic_vector(4 downto 0);
	muxed_B		: out std_logic_vector(SIZE -1  downto 0);
	S_MUX_DEST_i	: in  std_logic_vector(1 downto 0);
	OP		: in  AluOp;
	DOUT		: out std_logic_vector(SIZE - 1 downto 0);
	stall_o		: out std_logic;
	Clock		: in  std_logic;
	Reset		: in  std_logic
	);
end execute_block;

architecture struct of execute_block is

component mux21
  port (
  	IN0	: in  std_logic_vector(SIZE - 1 downto 0);
	IN1	: in  std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in  std_logic;
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

    );
end component;

component mux41
  generic (
	MUX_SIZE : integer := 5
	);
  port (
  	IN0	: in  std_logic_vector(MUX_SIZE - 1  downto 0);
	IN1	: in  std_logic_vector(MUX_SIZE - 1 downto 0);
	IN2	: in  std_logic_vector(MUX_SIZE - 1 downto 0);
	IN3	: in  std_logic_vector(MUX_SIZE - 1 downto 0);
	CTRL	: in  std_logic_vector(1 downto 0);
	OUT1	: out std_logic_vector(MUX_SIZE - 1 downto 0)

    );
end component;

component real_alu
	generic (
	DATA_SIZE : integer := 32);
	port (
	IN1	: in  std_logic_vector(DATA_SIZE - 1 downto 0);
	IN2	: in  std_logic_vector(DATA_SIZE - 1 downto 0);
	OP	: in  AluOp;
	DOUT	: out std_logic_vector(DATA_SIZE - 1 downto 0);
	stall_o	: out std_logic;
	Clock	: in  std_logic;
	Reset	: in  std_logic
    );
end component;

signal FWB2mux : std_logic_vector(SIZE - 1 downto 0);
signal FWA2alu : std_logic_vector(SIZE - 1 downto 0);
signal FWB2alu : std_logic_vector(SIZE - 1 downto 0);

begin

MUXALUIN: mux21 port map(
	IN0	=> FWB2mux,
	IN1	=> IMM_i, 
	CTRL	=> S_MUX_ALUIN_i, 
	OUT1	=> FWB2alu);

ALU: real_alu generic map (
	DATA_SIZE => 32
	)
	port map (
	IN1	=> FWA2alu,
	IN2	=> FWB2alu,
	OP	=> OP,
	DOUT	=> DOUT,
	stall_o	=> stall_o,
	Clock	=> Clock,
	Reset	=> Reset
	);

MUXDEST: mux41 	generic map(
	MUX_SIZE => 5
	)
	port map(
	IN0	=> "00000", -- THIS VALUE SHOULD NEVER APPEAR!!
	IN1	=> rC_i, 
	IN2	=> rB_i, 
	IN3	=> "11111", 
	CTRL	=> S_MUX_DEST_i, 
	OUT1	=> muxed_dest
	);

MUX_FWA: mux41 	generic map(
	MUX_SIZE => 32
	)
	port map(
	IN0	=> A_i, 
	IN1	=> FW_X_i, 
	IN2	=> FW_W_i, 
	IN3	=> "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ", -- TODO: remove this, avoid meta state during synth 
	CTRL	=> S_FW_A_i, 
	OUT1	=> FWA2alu
	);

MUX_FWB: mux41 	generic map(
	MUX_SIZE => 32
	)
	port map(
	IN0	=> MUXED_B_i, 
	IN1	=> FW_X_i,
	IN2	=> FW_W_i, 
	IN3	=> "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ", -- TODO: remove this, avoid meta state during synth 
	CTRL	=> S_FW_B_i, 
	OUT1	=> FWB2mux
	);
muxed_B <= FWB2mux;
end struct;
