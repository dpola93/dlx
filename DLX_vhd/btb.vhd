library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.myTypes.all;

-- TODO: its useless to have both valid and taken?? what if use only taken instead?? think about this
-- TODO: do a 2 bit predictor scheme too
-- BTB number of lines should be correctly evaulated in order to achieve good performance without spending too much area
-- add comment on this, it's not clear at all
entity btb is
	generic (
	N_LINES	: integer := PRED_SIZE;
	SIZE	: integer := 32
);
  port (
	clock			: in  std_logic;
	reset			: in  std_logic;
	stall_i			: in  std_logic;
	TAG_i			: in  std_logic_vector(N_LINES - 1 downto 0); -- TAG is taken from the PC ( remove 2 lowest bits)
	target_PC_i		: in  std_logic_vector(SIZE - 1 downto 0); -- correct value from dec stage
	was_taken_i		: in  std_logic; -- correct value from dec stage
	predicted_next_PC_o	: out std_logic_vector(SIZE - 1 downto 0);  -- output to PC
	taken_o			: out std_logic; -- control to bypass PC_MUX and use prediction
	mispredict_o		: out std_logic -- 1 when last branch was not correctly predicted
	);
end btb;

architecture Bhe of btb is

-- actual BTB memory
type PC_array is array (integer range 0 to 2**N_LINES - 1) of std_logic_vector(SIZE - 1 downto 0);

signal predict_PC	: PC_array;
signal taken		: std_logic_vector(2**N_LINES - 1 downto 0);


-- help signal
signal last_TAG			: std_logic_vector(N_LINES - 1 downto 0);
signal last_TAG_next		: std_logic_vector(N_LINES - 1 downto 0);
signal last_PC			: std_logic_vector(SIZE -1 downto 0);
signal current_PC_prediction	: std_logic_vector(SIZE -1 downto 0);
signal last_taken_next		: std_logic;
signal last_taken		: std_logic;
signal current_taken		: std_logic;

begin

-- TODO: fix identation of this shit
process(reset,clock)
begin
	if reset = '1' then
		-- reset behavior
		taken <= (others => '0');
		last_TAG <= (others => '0');
		last_taken <= '0';
		last_PC <= (others => '0');
		for i in 0 to 2**N_LINES-1 loop
			predict_PC(i) <= (others => '0');
		end loop;
	else if clock = '1' and clock'event then
		-- update registers ( when stalled keep the old value )
		if stall_i <= '0' then
			last_taken <= last_taken_next;
			last_TAG <= last_TAG_next;
			last_PC <= current_PC_prediction;
			-- update even if the prediction is correct
			predict_PC(to_integer(unsigned(last_TAG))) <= target_PC_i;
			taken(to_integer(unsigned(last_TAG)))	<= was_taken_i;
		else -- is this else really necessary??
			last_taken <= last_taken;
			last_TAG <= last_TAG;
			last_PC <= last_PC;
		end if;

	end if;
	end if;
end process;

-- SURE?? in this case if mispredicted NT, CPU always stalls
mispredict_o		<= (or_reduce(target_PC_i xor last_PC) and last_taken) or ( not(last_taken) and was_taken_i) ;


--accesses to memory
current_taken		<= taken(to_integer(unsigned(TAG_i)));
current_PC_prediction	<= predict_PC(to_integer(unsigned(TAG_i)));
predicted_next_PC_o	<= current_PC_prediction;

-- need to have a correct behavior at reset
last_TAG_next		<= 	TAG_i when reset = '0' else
				(others => '0');
--taken ( and last_taken_next ) when curret op is valid (found in memory) and prediction is taken
taken_o			<=	current_taken when reset = '0' else
	 			'0';

last_taken_next		<=	current_taken;

end Bhe;
