-- *** comparator.vhd *** --

-- structural comparator as described in prof. Graziano documents
-- extended in order to handle both signed and unsigned comparisons 
-- sum is computed outside of the comparator

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_misc.all;


entity comparator is 
	generic (M : integer := 64);	
	port (	
	C	: in  std_logic;			-- carry out
	SUM	: in  std_logic_vector(M-1 downto 0);
	sel	: in  std_logic_vector(2 downto 0);	-- selection
	sign	: in  std_logic;			-- 0 unsigned / signed 1
	S	: out std_logic
	);
end comparator; 

architecture bhe_2 of comparator is
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
	Z 	<= nor_reduce(SUM);
  	NC	<= C xor sign;

  	G	<= NC and (not Z);
  	GE	<= NC;
  	L	<= not NC;
  	LE	<= (not NC) or Z;
  	E	<= Z;
  	NE	<= not Z; 
	S <=	G  when sel="000" else
		GE when sel="001" else
		L  when sel="010" else
		LE when sel="011" else
		E  when sel="100" else
		NE when sel="101" else
		'X';
end bhe_2;

