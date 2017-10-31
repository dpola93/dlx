

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity mem_block is
	generic (
	SIZE : integer := 32
);
  port (
	X_i		: in  std_logic_vector(SIZE - 1 downto 0);
	LOAD_i		: in  std_logic_vector(SIZE - 1 downto 0);
	S_MUX_MEM_i	: in  std_logic;
	W_o		: out std_logic_vector(SIZE - 1 downto 0)
	);
end mem_block;

architecture struct of mem_block is

component mux21
  port (
  	IN0	: in  std_logic_vector(SIZE - 1 downto 0);
	IN1	: in  std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in  std_logic;
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

    );
end component;

begin

MUXMEM: mux21
	port map(
	IN0	=> X_i,
	IN1	=> LOAD_i, 
	CTRL	=> S_MUX_MEM_i, 
	OUT1	=> W_o
	);

end struct;
