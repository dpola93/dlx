library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity booth_encoder is
port(	
		B_in	: in std_logic_vector (2 downto 0);
		A_out	: out std_logic_vector (2 downto 0)
		);
end booth_encoder;

architecture behavior of booth_encoder is
begin 
	A_out <=	"000" when B_in = "000" else -- 0      position 000
			"001" when B_in = "001" else --  A     position 001
			"001" when B_in = "010" else --  A     position 001
			"011" when B_in = "011" else --  2A    position 011
			"100" when B_in = "100" else --  (-2A) position 100
			"010" when B_in = "101" else --  (-A)  position 010
			"010" when B_in = "110" else --  (-A)  position 010
			"000" when B_in = "111";      --  0    position 000
			
END behavior;
