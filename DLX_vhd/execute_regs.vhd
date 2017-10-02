

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity execute_regs is
	generic (
	SIZE : integer := 32
);
  port (
	X_i	: in std_logic_vector(SIZE - 1 downto 0);
	S_i	: in std_logic_vector(SIZE - 1 downto 0);
	D2_i	: in std_logic_vector(4 downto 0);
	X_o	: out std_logic_vector(SIZE - 1 downto 0);
	S_o	: out std_logic_vector(SIZE - 1 downto 0);
	D2_o	: out std_logic_vector(4 downto 0);
	stall_i	: in std_logic;
	clk	: in std_logic;
	rst	: in std_logic

	);
end execute_regs;

architecture struct of execute_regs is

signal enable	: std_logic;

component ff32_en
	generic(
		SIZE : integer
	);
	port(
		D	: in std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		en	: in std_logic;
		clk	: in std_logic;
		rst	: in std_logic
	);
end component;

begin

enable <= not stall_i;

X: ff32_en generic map(
	SIZE => 32
	)port map(
	D	=> X_i, 
	Q	=> X_o,
	en	=> enable,
	clk	=> clk,
	rst	=> rst);

S: ff32_en generic map(
	SIZE => 32
	)port map(
	D	=> S_i, 
	Q	=> S_o,
	en	=> enable,
	clk	=> clk,
	rst	=> rst);

D2: ff32_en generic map(
	SIZE => 5
	)port map(
	D	=> D2_i, 
	Q	=> D2_o,
	en	=> enable,
	clk	=> clk,
	rst	=> rst);

end struct;
