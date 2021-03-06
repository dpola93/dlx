
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity fetch_regs is
	generic (
	SIZE : integer := 32
);
 port (
	NPCF_i	: in  std_logic_vector(SIZE - 1 downto 0);
	IR_i	: in  std_logic_vector(SIZE - 1 downto 0);
	NPCF_o	: out std_logic_vector(SIZE - 1 downto 0);
	IR_o	: out std_logic_vector(SIZE - 1 downto 0);
	stall_i	: in  std_logic;
	clk	: in  std_logic;
	rst	: in  std_logic

	);
end fetch_regs;

architecture struct of fetch_regs is

component ff32_en
	port(
		D	: in  std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		en	: in  std_logic;
		clk	: in  std_logic;
		rst	: in  std_logic
	);
end component;
component ff32_en_IR
	port(
		D	: in  std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		en	: in  std_logic;
		clk	: in  std_logic;
		rst	: in  std_logic
	);
end component;

signal enable : std_logic;

begin

enable <= not stall_i;

NPCF: ff32_en port map(
	D	=> NPCF_i, 
	Q	=> NPCF_o,
	en	=> enable,
	clk	=> clk,
	rst	=> rst);

IR: ff32_en_IR port map(
	D	=> IR_i, 
	Q	=> IR_o,
	en	=> enable,
	clk	=> clk,
	rst	=> rst);

end struct;
