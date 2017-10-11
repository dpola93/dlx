library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity predictor_2 is
  port (
	clock			: in  std_logic;
	reset			: in  std_logic;
	enable			: in  std_logic;
	taken_i			: in  std_logic;
	prediction_o		: out std_logic
	);
end predictor_2;


architecture bhe of predictor_2 is

	signal STATE		: std_logic_vector(1 downto 0);
	signal next_STATE	: std_logic_vector(1 downto 0);

begin

	prediction_o <= STATE(1);	
	process(clock,reset)
	begin
		if reset='1' then
			STATE		<= "00";
		elsif clock = '1' and clock'event and enable = '1' then
			STATE<=next_STATE;
		end if;	

	end process;
	
	process(taken_i, enable)
	begin
		if enable = '1' then
		if taken_i = '1' then
		case STATE is
			when "00"	=> next_STATE <= "01";
			when "01"	=> next_STATE <= "10";
			when "10"	=> next_STATE <= "11";
			when "11"	=> next_STATE <= "11";
			when others	=> next_STATE <= "00"; 
		end case;
		else
		case STATE is
			when "00"	=> next_STATE <= "00";
			when "01"	=> next_STATE <= "00";
			when "10"	=> next_STATE <= "01";
			when "11"	=> next_STATE <= "11";
			when others	=> next_STATE <= "00"; 
		end case;
		end if;
		end if;
	end process;

end bhe;
