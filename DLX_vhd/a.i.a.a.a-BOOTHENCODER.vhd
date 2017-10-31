-- booth_encoder.vhd --

-- booth encoder as described in Prof. Graziano documents

library ieee;
use ieee.std_logic_1164.all;


entity booth_encoder is
port(	
		B_in	: in  std_logic_vector (2 downto 0);
		A_out	: out std_logic_vector (2 downto 0)
		);
end booth_encoder;

architecture bhe of booth_encoder is
begin 
	A_out <=	"000" when B_in = "000" else --   0	position 000
			"100" when B_in = "001" else --   A	position 001
			"100" when B_in = "010" else --   A	position 001
			"101" when B_in = "011" else --  2A	position 011
			"111" when B_in = "100" else -- -2A	position 100
			"110" when B_in = "101" else --  -A	position 010
			"110" when B_in = "110" else --  -A	position 010
			"000" when B_in = "111";     --   0	position 000
			
end bhe;
