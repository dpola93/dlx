-- add4.vhd -- 

-- This component is an adder with a single input
-- output is always = input + 4
-- both carries (input and output) are ignored


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add4 is
	generic (
	SIZE : integer := 32
);
  port (
	IN1	: in  unsigned(SIZE - 1 downto 0);
	OUT1	: out unsigned(SIZE - 1 downto 0)

	);
end add4;

architecture bhe of add4 is

begin

	OUT1 <= IN1+4;

end bhe;
