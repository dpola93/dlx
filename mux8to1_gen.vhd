LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY mux8to1_gen IS

generic ( M:  integer := 64); 

PORT(	
		A : IN std_logic_vector (M-1 downto 0); 
		B : IN std_logic_vector (M-1 downto 0); 
 		C : IN std_logic_vector (M-1 downto 0);
		D : IN std_logic_vector (M-1 downto 0);
		E : IN std_logic_vector (M-1 downto 0);
		F : IN std_logic_vector (M-1 downto 0);
		G : IN std_logic_vector (M-1 downto 0);
		H : IN std_logic_vector (M-1 downto 0);
		
		S : IN std_logic_vector (2 downto 0);
		Y : OUT std_logic_vector (M-1 downto 0)
		);
END mux8to1_gen;

architecture behavior of mux8to1_gen is

BEGIN 
	Y <= A WHEN S = "000" else
			B WHEN S = "001" else
			C WHEN S = "010" else
			D WHEN S = "011" else 
			E WHEN S = "100" else
			F WHEN S = "101" else
			G WHEN S = "110" else
			H WHEN S = "111";
END behavior;
