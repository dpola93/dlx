-- *** bhe_comparator.vhd *** --

-- structural comparator as described in prof. Graziano documents
-- extended in order to handle both signed and unsigned comparisons 
-- sum is computed outside of the comparator

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity bhe_comparator is 
	generic (M : integer := 32);	
	port (	
	A	: in  std_logic_vector(M-1 downto 0);			-- carry out
	B	: in  std_logic_vector(M-1 downto 0);
	sign	: in  std_logic;
	sel	: in  std_logic_vector(2 downto 0);	-- selection
	S	: out std_logic
	);
end bhe_comparator; 

architecture bhe_2 of bhe_comparator is
signal NC	: std_logic;
signal Z	: std_logic;
signal N	: std_logic;
signal G	: std_logic;
signal GE	: std_logic;
signal L	: std_logic;
signal LE	: std_logic;
signal E	: std_logic;
signal NE	: std_logic;
begin

  	G	<= 	'1' when signed(A) > signed(B) and sign = '1' else
		   	'1' when unsigned(A) > unsigned(B) and sign = '0' else
			'0'; 
  	GE	<= 	'1' when signed(A) >= signed(B) and sign = '1' else
		   	'1' when unsigned(A) >= unsigned(B) and sign = '0' else
			'0'; 
  	L	<= 	'1' when signed(A) < signed(B) and sign = '1' else
		   	'1' when unsigned(A) < unsigned(B) and sign = '0' else
			'0'; 
  	LE	<= 	'1' when signed(A) <= signed(B) and sign = '1' else
		   	'1' when unsigned(A) <= unsigned(B) and sign = '0' else
			'0'; 
  	E	<= 	'1' when signed(A) = signed(B) else
			'0'; 
  	NE	<= 	'1' when signed(A) /= signed(B) else
			'0'; 
	
	S <=	G  when sel="000" else
		GE when sel="001" else
		L  when sel="010" else
		LE when sel="011" else
		E  when sel="100" else
		NE when sel="101" else
		'X';
end bhe_2;

