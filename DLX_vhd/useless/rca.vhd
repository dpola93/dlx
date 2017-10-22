library ieee; 
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity rca is 
	generic (M : integer := 64);
	
	Port (	A	:	in  std_logic_vector(M-1 downto 0);
		B	:	in  std_logic_vector(M-1 downto 0);
		Cin	:	in  std_logic_vector(0 downto 0); -- small trick to have an easy conversion to unsigned
		S	:	out std_logic_vector(M-1 downto 0);
		Cout	:	out std_logic
		);
end rca; 




architecture behavioral of rca is

signal temp : std_logic_vector(M downto 0);
begin
  
  temp	<= std_logic_vector(unsigned('0'&A) + unsigned('0'&B) + unsigned(Cin));
  S	<= temp(M-1 downto 0);
  Cout	<= temp(M);

end behavioral;

