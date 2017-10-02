

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity mem_regs is
	generic (
	SIZE : integer := 32
);
  port (
	W_i	: in std_logic_vector(SIZE - 1 downto 0);
	D3_i	: in std_logic_vector(4 downto 0);
	W_o	: out std_logic_vector(SIZE - 1 downto 0);
	D3_o	: out std_logic_vector(4 downto 0);
	clk	: in std_logic;
	rst	: in std_logic

	);
end mem_regs;

architecture Struct of mem_regs is

component ff32
	generic(
		SIZE : integer
	);
	port(
		D	: in std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		clk	: in std_logic;
		rst	: in std_logic
	);
end component;

begin

W: ff32 generic map(
	SIZE => 32
	)
	port map(
	D	=> W_i, 
	Q	=> W_o,
	clk	=> clk,
	rst	=> rst
	);


D3: ff32 generic map(
	SIZE => 5
	)
	port map(
	D	=> D3_i, 
	Q	=> D3_o,
	clk	=> clk,
	rst	=> rst
	);

end Struct;
