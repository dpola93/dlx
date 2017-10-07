library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity fetch_block is
	generic (
	SIZE : integer := 32
);
 port (
	FETCH_o :		out std_logic_vector(SIZE - 1 downto 0);
	branch_target_i :	in std_logic_vector(SIZE - 1 downto 0);
	sum_addr_i :		in std_logic_vector(SIZE - 1 downto 0);
	A_i :			in std_logic_vector(SIZE - 1 downto 0);
	NPC4_i :		in std_logic_vector(SIZE - 1 downto 0);
	S_MUX_PC_BUS_i :	in std_logic_vector(1 downto 0);
	PC_o :			out std_logic_vector(SIZE - 1 downto 0);
	PC4_o :			out std_logic_vector(SIZE - 1 downto 0);
	stall_i :		in std_logic;
	take_prediction_i :	in std_logic;
	wrong_back_pred_i :	in std_logic;
	predicted_PC :		in std_logic_vector(SIZE - 1 downto 0);
	clk :			in std_logic;
	rst :			in std_logic

	);
end fetch_block;

architecture Struct of fetch_block is

component add4
	port(
		IN1	: in unsigned(SIZE - 1 downto 0);
		OUT1	: out unsigned(SIZE - 1 downto 0)
	);
end component;

component IRAM
 port (
  Rst	: in std_logic;
  Addr	: in std_logic_vector(SIZE - 1 downto 0);
  Dout	: out std_logic_vector(SIZE - 1 downto 0)
  );

end component;

component ff32_en
	port(
		D	: in std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		en	: in std_logic;
		clk	: in std_logic;
		rst	: in std_logic
	);
end component;

component mux41
 port (
 	IN0	: in std_logic_vector(SIZE - 1 downto 0);
	IN1	: in std_logic_vector(SIZE - 1 downto 0);
	IN2	: in std_logic_vector(SIZE - 1 downto 0);
	IN3	: in std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in std_logic_vector(1 downto 0);
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

  );
end component;
component mux21
 port (
 	IN0	: in std_logic_vector(SIZE - 1 downto 0);
	IN1	: in std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in std_logic;
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

  );
end component;

signal PC_help		: std_logic_vector(SIZE - 1 downto 0);
signal PC_BUS		: std_logic_vector(SIZE - 1 downto 0);
signal PC_BUS_no_BTB	: std_logic_vector(SIZE - 1 downto 0);
signal help_ctrl	: std_logic_vector(1 downto 0);
signal PC4_o_uns	: unsigned(SIZE - 1 downto 0);
signal en_IR		: std_logic;

begin

en_IR <= not stall_i;
PC: ff32_en port map(
	D	=> PC_BUS, 
	Q	=> PC_help,
	en	=> en_IR,
	clk	=> clk,
	rst	=> rst);

IMEM: IRAM port map(
	Rst	=> rst,
	Addr	=> PC_help,
	Dout	=> FETCH_o);

PCADD: add4 port map(
	IN1	=> unsigned(PC_help),
	OUT1	=> PC4_o_uns);

MUXTARGET: mux41 port map(
	IN0	=> std_logic_vector(PC4_o_uns), 
	IN1	=> A_i, 
	IN2	=> sum_addr_i, 
	IN3	=> branch_target_i, 
	CTRL	=> S_MUX_PC_BUS_i, 
	OUT1	=> PC_BUS_no_btb);

MUXPREDICTION: mux41 port map(
	IN0	=> PC_BUS_no_btb, 
	IN1	=> predicted_PC, 
	IN2	=> NPC4_i, 
	IN3	=> NPC4_i, 
	CTRL	=> help_ctrl, 
	OUT1	=> PC_BUS);
help_ctrl <= wrong_back_pred_i&take_prediction_i;
PC4_o <= std_logic_vector(PC4_o_uns);
PC_o <= PC_help;

end Struct;
