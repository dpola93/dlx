library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use work.myTypes.all;

--possibile instructions: sll, slli, srl, srli, sra, srai

--00 SLL SLLI
--01 SRL SRLI
--10 SRA SRAI
entity shifter is
	port(	A		: in  std_logic_vector(31 downto 0);
	     	B		: in  std_logic_vector(4 downto 0);
		LOGIC_ARITH	: in  std_logic;	-- 0 = logic, 1 = arith
		LEFT_RIGHT	: in  std_logic;	-- 0 = left, 1 = right
		OUTPUT		: out std_logic_vector(31 downto 0)
	);
end shifter;

architecture behavioral of shifter is

begin
	SHIFT: process (A, B, LOGIC_ARITH, LEFT_RIGHT ) is
	begin

		if LEFT_RIGHT = '0' then

			if LOGIC_ARITH = '0' then
				OUTPUT <= to_StdLogicVector((to_bitvector(A)) sll (conv_integer(B)));
			end if;				
		else

			if LOGIC_ARITH = '0' then
				OUTPUT <= to_StdLogicVector((to_bitvector(A)) srl (conv_integer(B)));
			else
				OUTPUT <= to_StdLogicVector((to_bitvector(A)) sra (conv_integer(B)));
			end if;
		end if;
	end process;
end architecture behavioral;

architecture struct of shifter is

component shift_firstLevel is
	port(A : in std_logic_vector(31 downto 0);
	     sel : in std_logic_vector(1 downto 0);
	     mask00 : out std_logic_vector(38 downto 0);
	     mask08 : out std_logic_vector(38 downto 0);
	     mask16 : out std_logic_vector(38 downto 0));
end component;

component shift_secondLevel is
	port(sel : in std_logic_vector(1 downto 0);
	     mask00 : in std_logic_vector(38 downto 0);
	     mask08 : in std_logic_vector(38 downto 0);
	     mask16 : in std_logic_vector(38 downto 0);
	     Y : out std_logic_vector(38 downto 0));
end component;

component shift_thirdLevel is
	port(sel : in std_logic_vector(2 downto 0);
	     A : in std_logic_vector(38 downto 0);
	     Y : out std_logic_vector(31 downto 0));
end component;

signal m0, m8, m16, y : std_logic_vector(38 downto 0);
signal s3 : std_logic_vector(2 downto 0);
signal sel : std_logic_vector(1 downto 0);
begin

	sel <= LOGIC_ARITH&LEFT_RIGHT;
	
	process(sel, s3, B, A)
		begin
		
		case sel is
		
		when "00" => s3 <= B(2 downto 0);
		when "01" => s3 <= not(B(2 downto 0));
		when "11" => s3 <= not(B(2 downto 0));
		when others => s3 <= "XXX";
		end case;
	end process;

IL : shift_firstLevel port map(A, sel, m0, m8, m16);
IIL : shift_secondLevel port map(B(4 downto 3), m0, m8, m16, y);
IIIL : shift_thirdLevel port map(s3, y, OUTPUT);

end struct;
