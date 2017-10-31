library ieee;
use ieee.std_logic_1164.all;
use work.myTypes.all;


entity shift_thirdLevel is
	port(sel	: in std_logic_vector(2 downto 0);
	     A		: in std_logic_vector(38 downto 0);
	     Y		: out std_logic_vector(31 downto 0));
end shift_thirdLevel;

architecture behav of shift_thirdLevel is

begin 
	process(sel, A)
		begin
		
		case sel is
			when "000" =>
				Y <= A(38 downto 7);
			when "001" =>
				Y <= A(37 downto 6);
			when "010" =>
				Y <= A(36 downto 5);
			when "011" => 
				Y <= A(35 downto 4);
			when "100" => 
				Y <= A(34 downto 3);
			when "101" => 
				Y <= A(33 downto 2);
			when "110" => 
				Y <= A(32 downto 1);
			when "111" => 
				Y <= A(31 downto 0);
			when others => Y <= (others => 'X');
		end case;
	end process;
end behav;
