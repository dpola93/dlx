library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity sum_gen is 
	generic (
	         N     :   integer := 32);
	Port (	A:	In	std_logic_vector(N-1 downto 0);
		B:      In	std_logic_vector(N-1 downto 0);
		Cin:   In std_logic_vector(N/4 downto 0);
		S:   Out std_logic_vector(N-1 downto 0)
		);
end sum_gen; 

architecture STRUCTURAL of sum_gen is

   component carry_sel_gen 
    generic( N : integer := 4);
	   Port (	A:	In	std_logic_vector(N-1 downto 0);
		   B:	In	std_logic_vector(N-1 downto 0);
		   Ci:	In	std_logic;
		   S:	Out	std_logic_vector(N-1 downto 0);
		   Co:	Out	std_logic);
   end component; 
   


    begin
        csel_gen: for i in 0 to N/4-1 generate
           csel_N: carry_sel_gen port map(A((i+1)*4-1 downto i*4),B((i+1)*4-1 downto i*4),Cin(i),S((i+1)*4-1 downto i*4),open);
       end generate csel_gen;          
           
        

end STRUCTURAL;
