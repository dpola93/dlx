library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity g is 
	Port (	g:	In	std_logic;
		p:      In	std_logic;
		g_prec: In	std_logic;
		g_out:	Out	std_logic);
end g; 

architecture beh of g is
begin

g_out <= g OR (p AND g_prec);

end beh;
