library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity pg_net is 
	Port (	a:	In	std_logic;
		b:      In	std_logic;	
		g_out:	Out	std_logic;
		p_out:	Out	std_logic);
end pg_net; 

architecture beh of pg_net is
begin

g_out <= a AND b;
p_out <= a XOR b;

end beh;
