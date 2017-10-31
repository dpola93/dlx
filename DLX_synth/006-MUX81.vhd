library ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux8to1_gen is

generic ( M:  integer := 64); 

port(	
	A	: in std_logic_vector (M-1 downto 0); 
	B	: in std_logic_vector (M-1 downto 0); 
	C	: in std_logic_vector (M-1 downto 0);
	D	: in std_logic_vector (M-1 downto 0);
	E	: in std_logic_vector (M-1 downto 0);
	F	: in std_logic_vector (M-1 downto 0);
	G	: in std_logic_vector (M-1 downto 0);
	H	: in std_logic_vector (M-1 downto 0);
	
	S	: in std_logic_vector (2 downto 0);
	Y	: out std_logic_vector (M-1 downto 0)
		);
end mux8to1_gen;

architecture behavior of mux8to1_gen is

begin 
	Y <=	A when S = "000" else
		B when S = "001" else
		C when S = "010" else
		D when S = "011" else 
		E when S = "100" else
		F when S = "101" else
		G when S = "110" else
		H when S = "111";
end behavior;
