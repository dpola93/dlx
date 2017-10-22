library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity p4add is 
	generic (
	         N     :   integer := 32;
		 logN  :   integer := 5);
	Port (	A	: In  std_logic_vector(N-1 downto 0);
		B	: In  std_logic_vector(N-1 downto 0);
		Cin	: In  std_logic;
		sign	: In  std_logic;
		S	: Out std_logic_vector(N-1 downto 0);
		Cout	: Out std_logic);
end p4add; 

architecture STRUCTURAL of p4add is

component xor_gen is 
	generic (
	         N     :   integer
		);
	Port (
		A	: In  std_logic_vector(N-1 downto 0);
		B	: In  std_logic;
		S	: Out std_logic_vector(N-1 downto 0)
	);
end component; 

   component sum_gen 
    generic( N : integer := 32);
	   Port (	A:	In	std_logic_vector(N-1 downto 0);
		   B:	In	std_logic_vector(N-1 downto 0);
		   Cin:	In	std_logic_vector((N/4) downto 0);
		   S:	Out	std_logic_vector(N-1 downto 0));
   end component; 
   
   component carry_tree 
	   generic (
	            N     :   integer := 32;
		    logN  :   integer := 5);
	   Port (	A:	In	std_logic_vector(N-1 downto 0);
		   B:      In	std_logic_vector(N-1 downto 0);
		   Cin:   In std_logic;
		   Cout:	Out	std_logic_vector(N/4-1 	downto 0));
   end component; 
    
   signal carry_pro 	: std_logic_vector(N/4 downto 0);
   signal new_B		: std_logic_vector(N-1 downto 0);  
   
    begin
       
	xor32: xor_gen
	generic map(N=>N)
	port map(B,sign,new_B);
 
        ct: carry_tree 
        generic map(N=>N,logN=>logN)
        port map(A,new_B,Cin,carry_pro(N/4 downto 1));
          
	add: sum_gen
	generic map(N=>N)
	port map(A,new_B,carry_pro(N/4 downto 0),S);
        
       
       carry_pro(0)<=Cin xor sign;
       Cout<= carry_pro(N/4);           
           
        

end STRUCTURAL;
