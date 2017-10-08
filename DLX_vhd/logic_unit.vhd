
-- logic_unit.vhd -- 


-- TODO: replace this with a better structural LOGIC UNIT.

library ieee;
use ieee.std_logic_1164.all;
--use work.myTypes.all;

entity logic_unit is
	generic (
	SIZE : integer := 32
);
  port (
	IN1	: in std_logic_vector(SIZE - 1 downto 0);
   	IN2	: in std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in std_logic_vector(1 downto 0); -- need to do only and, or and xor
	OUT1	: out  std_logic_vector(SIZE - 1 downto 0)

	);
end logic_unit;

architecture Bhe of logic_unit is

begin

	OUT1 <= IN1 and IN2	when CTRL = "00" else
		IN1 or IN2	when CTRL = "01" else
		IN1 xor IN2	when CTRL = "10" else
		(others => '0');

end Bhe;
