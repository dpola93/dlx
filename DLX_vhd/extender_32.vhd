
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity extender_32 is
	generic (
	SIZE : integer := 32
);
  port (
	IN1	: in  std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in  std_logic;                -- when 0 extend on 16 bits , when 1 extend on 26 bits
	SIGN	: in  std_logic;                -- when 0 unsigned, when 1 signed 
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

	);
end extender_32;

architecture Bhe of extender_32 is

	signal TEMP16 : std_logic_vector(15 downto 0);
	signal TEMP26 : std_logic_vector(25 downto 0);

begin

	TEMP16	<= IN1(15 downto 0);
	TEMP26	<= IN1(25 downto 0);
	OUT1	<= 	std_logic_vector(resize(signed(TEMP26),SIZE)) when CTRL = '1' else
			std_logic_vector(resize(signed(TEMP16),SIZE)) when CTRL = '0' and SIGN = '1' else
			std_logic_vector(resize(unsigned(TEMP16),SIZE));

end Bhe;
