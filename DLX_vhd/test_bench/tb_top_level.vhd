

library IEEE;

use IEEE.std_logic_1164.all;
use WORK.all;
use work.myTypes.all;

entity tb_top_level is
end tb_top_level;

architecture TEST of tb_top_level is

    signal Clock : std_logic := '0';
    signal Reset : std_logic := '1';

component top_level
	port(
	clock	: in  std_logic; 
	rst	: in  std_logic
	); 
end component;
begin
-- TODO: MOVE THIS SHIT TO THE REAL TB

DUT:	top_level port map(Clock,Reset);

        PCLOCK : process(Clock)
	begin
		Clock <= not(Clock) after 0.5 ns;	
	end process;
	
	Reset <= '1', '0' after 4 ns;
       

end TEST;

