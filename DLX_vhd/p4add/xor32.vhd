library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity xor_gen is 
	generic (
	         N     :   integer := 32
		);
	Port (
		A	: In  std_logic_vector(N-1 downto 0);
		B	: In  std_logic;
		S	: Out std_logic_vector(N-1 downto 0)
	);
end xor_gen; 

architecture bhe of xor_gen is
begin
S <= A xor (N-1 downto 0 => B);

end bhe;
