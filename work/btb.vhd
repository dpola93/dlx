library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- BTB number of lines should be correctly evaulated in order to achieve good performance without spending too much area

entity btb is
	generic (
	N_LINES	: integer := 4;
	SIZE	: integer := 32
);
  port (
	clock			: in std_logic;
	reset			: in std_logic;
	stall_i			: in std_logic;
	TAG_i			: in std_logic_vector(N_LINES - 1 downto 0); -- TAG is taken from the PC ( remove 2 lowest bits)
	was_taken_i		: in std_logic; -- signal coming from CU, was last branch taken?
	was_branch_i		: in std_logic; -- signal coming from CU, was last operation a branch?
	target_PC_i		: in std_logic_vector(SIZE - 1 downto 0); -- output to PC
	predicted_next_PC_o	: out std_logic_vector(SIZE - 1 downto 0); -- correct value from dec stage 
	taken_o			: out std_logic; -- control to bypass PC_MUX and use prediction
	mispredict_o		: out std_logic -- 1 when last branch was not correctly predicted

	);
end btb;

architecture Bhe of btb is


-- actual BTB memory
type PC_array is array (integer range 0 to 2**N_LINES - 1) of std_logic_vector(SIZE - 1 downto 0);

signal predict_PC : PC_array;
signal valid		: std_logic_vector(2**N_LINES - 1 downto 0);
signal taken		: std_logic_vector(2**N_LINES - 1 downto 0);


-- help signal
signal last_TAG		: std_logic_vector(N_LINES - 1 downto 0);
signal last_TAG_next	: std_logic_vector(N_LINES - 1 downto 0);
signal last_taken_next	: std_logic;
signal last_taken	: std_logic;
signal current_valid	: std_logic;
signal current_taken	: std_logic;

begin


process(reset,clock)
begin
	if reset = '1' then
		-- reset behavior
		valid <= (others => '0');
		last_TAG <= (others => '0');
		last_taken <= '0';
	else if clock = '1' and clock'event then
		-- update registers ( when stalled keep the old value )
		if stall_i <= '0' then
			last_taken <= last_taken_next;
			last_TAG <= last_TAG_next;
		else
			last_taken <= last_taken;
			last_TAG <= last_TAG;
		end if;

		-- if last op was a branch update value
		-- update even if the prediction is correct
		if was_branch_i = '1' then
			valid(to_integer(unsigned(last_TAG))) <= '1';
			if was_taken_i = '1' then
				predict_PC(to_integer(unsigned(last_TAG))) <= target_PC_i;
			end if;
			if last_taken /= was_taken_i then
				taken(to_integer(unsigned(last_TAG))) <= was_taken_i;
			end if;
		end if;
	end if;
	end if;
end process;


-- mispredict triggers when last operation was a branch and predicted value is different from actual value
mispredict_o <= was_branch_i and (last_taken xor was_taken_i) and ( not stall_i);

--accesses to memory
current_valid <= valid(to_integer(unsigned(TAG_i)));
current_taken <= taken(to_integer(unsigned(TAG_i)));
predicted_next_PC_o <= predict_PC(to_integer(unsigned(TAG_i)));

-- need to have a correct behavior at reset
last_TAG_next <= 	TAG_i when reset = '0' else
			"00";
--taken ( and last_taken_next ) when curret op is valid (found in memory) and prediction is taken
taken_o <=	'1' when current_valid = '1' and current_taken = '1' and reset = '0' else
	 	'0';

last_taken_next <=	'1' when current_valid = '1' and current_taken = '1' and reset = '0' else
	 		'0';

end Bhe;
