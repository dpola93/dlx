library ieee;
use ieee.std_logic_1164.all;
use work.myTypes.all;

--00 SLL SLLI
--01 SRL SRLI
--10 SRA SRAI

entity shift_firstLevel is
	port(A		: in  std_logic_vector(31 downto 0);
	     sel	: in  std_logic_vector(1 downto 0);
	     mask00	: out std_logic_vector(38 downto 0);
	     mask08	: out std_logic_vector(38 downto 0);
	     mask16	: out std_logic_vector(38 downto 0));
end shift_firstLevel;

architecture behav of shift_firstLevel is

	begin 

	process(sel, A)
		begin
		
		case sel is
			when "00" =>
				mask00 <= A & "0000000";
				mask08 <= A(23 downto 0) & x"000" & "000";
				mask16 <= A(15 downto 0) & x"00000" & "000";
			when "01" =>
				mask00 <= "0000000" & A;
				mask08 <= x"000" & "000" & A(31 downto 8);
				mask16 <= x"00000" & "000" & A(31 downto 16) ;
			when "11" =>
				mask00 <= (38 downto 32 => A(31)) & A;
				mask08 <= (38 downto 24 => A(31)) & A(31 downto 8);
				mask16 <= (38 downto 16 => A(31)) & A(31 downto 16);

			when others => mask00 <= x"000000000" & "000";
				       mask08 <= x"000000000" & "000";
				       mask16 <= x"000000000" & "000";
		end case;
	end process;

end behav;
