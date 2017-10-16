-- add4.vhd -- 
-- This component is an adder with two inputs
-- both carries (input and output) are ignored 

-- TODO: replace this with a better structural adder.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity basicadd is
	generic (
	SIZE : integer := 32
);
  port (
	IN1	: in  unsigned(SIZE - 1 downto 0);
   	IN2	: in  unsigned(SIZE - 1 downto 0);
	OUT1	: out unsigned(SIZE - 1 downto 0)

	);
end basicadd;

architecture bhe of basicadd is

begin

	OUT1 <= IN1+IN2;

end bhe;
