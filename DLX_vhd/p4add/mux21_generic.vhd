library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic

entity MUX21_GENERIC is
generic (
  N : integer := 4); 
	Port (	A:	In	std_logic_vector(N-1 downto 0);
		B:	In	std_logic_vector(N-1 downto 0);
		S:	In	std_logic;
		Y:	Out	std_logic_vector(N-1 downto 0));
end MUX21_GENERIC;

architecture BEHAVIORAL of MUX21_GENERIC is

begin
	pmux: process(A,B,S)
	begin
		if S='0' then
			Y <= A;
		else
			Y <= B;
		end if;

	end process;

end BEHAVIORAL;

