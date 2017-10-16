library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity pg is 
	Port (	g:	In	std_logic;
		p:      In	std_logic;
		g_prec: In	std_logic;
		p_prec: In	std_logic;		
		g_out:	Out	std_logic;
		p_out:	Out	std_logic);
end pg; 

architecture beh of pg is
begin

g_out <= g OR (p AND g_prec);
p_out <= p AND p_prec;

end beh;
