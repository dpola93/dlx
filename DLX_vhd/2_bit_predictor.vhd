-- *** 2_bit_predictor.vhd *** --

-- this block is a simple 2 bit predictor.
-- it implements the canonical FSM for 2 bit preditcors
-- look at the scheme on Hennessy Patterson 5th Ed., figure C-18
-- this needs to be implemented for each line of the BTB cache
-- Future improvements: integrate this into the BTB in order to instatiate only one


library ieee;
use ieee.std_logic_1164.all;

entity predictor_2 is
  port (
	clock			: in  std_logic;
	reset			: in  std_logic;
	enable			: in  std_logic;	-- if 1 FSM advances, 0 is frozen
	taken_i			: in  std_logic;	-- input bit  -> 1 taken, 0 not taken
	prediction_o		: out std_logic		-- output but -> 1 taken, 0 not taken
	);
end predictor_2;


architecture bhe of predictor_2 is

	-- state is on 2 bits
	-- 00 strong NT
	-- 01 weak   NT
	-- 10 weak   T
	-- 11 strong T
	signal STATE		: std_logic_vector(1 downto 0);
	signal next_STATE	: std_logic_vector(1 downto 0);

begin
	
	-- output of the circuit is the MSB of the state
	prediction_o <= STATE(1);	

	-- sequential process for state update
	process(clock,reset)
	begin
		if reset='1' then
			STATE <= "00";
		elsif clock = '1' and clock'event and enable = '1' then
			STATE <= next_STATE;
		end if;	

	end process;
	
	-- combinatorial process for next_STATE computation
	-- Future improvements : do this by hand
	process(taken_i, enable)
	begin
		if enable = '1' then
		if taken_i = '1' then
			case STATE is
				when "00"	=> next_STATE <= "01";
				when "01"	=> next_STATE <= "10";
				when "10"	=> next_STATE <= "11";
				when "11"	=> next_STATE <= "11";
				when others	=> next_STATE <= "00"; -- might not be synthesizable
			end case;
		else
			case STATE is
				when "00"	=> next_STATE <= "00";
				when "01"	=> next_STATE <= "00";
				when "10"	=> next_STATE <= "01";
				when "11"	=> next_STATE <= "11";
				when others	=> next_STATE <= "00"; -- might not be synthesizable
			end case;
		end if;
		end if;
	end process;

end bhe;
