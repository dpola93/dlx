LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


ENTITY booth_encoder IS
PORT(	
		B_in : IN std_logic_vector (2 downto 0);
		A_out : OUT std_logic_vector (2 downto 0)
		);
END booth_encoder;

ARCHITECTURE behavior OF booth_encoder IS
BEGIN 
	A_out <= "000" WHEN B_in = "000" else -- 0	       position 000
			"001" WHEN B_in = "001" else --  A     position 001
			"001" WHEN B_in = "010" else --  A     position 001
			"011" WHEN B_in = "011" else --  2A    position 011
			"100" WHEN B_in = "100" else --  (-2A) position 100
			"010" WHEN B_in = "101" else --  (-A)  position 010
			"010" WHEN B_in = "110" else --  (-A)  position 010
			"000" WHEN B_in = "111";      --  0     position 000
			
END behavior;
