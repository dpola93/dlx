library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_misc.all;

--TODO: make this look a little bit better

entity comparator is 
	generic (M : integer := 64);	
	port (	
	C	: in  std_logic; -- carry out
	V	: in  std_logic; -- overflow
	SUM	: in  std_logic_vector(M-1 downto 0);
	sel	: in  std_logic_vector(2 downto 0); -- selection
	sign	: in  std_logic; -- 0 unsigned / signed 1
	S	: out std_logic
	);
end comparator; 




architecture BEHAVIORAL of comparator is
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
	N	<= SUM(M-1);

	G 	<= 	C and (not Z)	when sign = '0' else
			(N xnor V) and (not Z);

	GE	<= 	C 		when sign = '0' else
			N xnor V;

	L	<= 	not(C)		when sign = '0' else
			not(N xnor V);

	LE	<=	not(C) or Z	when sign = '0' else
			not(N xnor V) or Z;

	E	<=	Z;
	NE	<=	not(Z);


	S <=	G  when sel="000" else
		GE when sel="001" else
		L  when sel="010" else
		LE when sel="011" else
		E  when sel="100" else
		NE when sel="101" else
		'0';

end BEHAVIORAL;

