library ieee; 
use ieee.std_logic_1164.all; 

entity carry_sel_gen is 
        generic( N : integer := 4);
	Port (	A:	In	std_logic_vector(N-1 downto 0);
		B:	In	std_logic_vector(N-1 downto 0);
		Ci:	In	std_logic;
		S:	Out	std_logic_vector(N-1 downto 0);
		Co:	Out	std_logic);
end carry_sel_gen; 

architecture STRUCTURAL of carry_sel_gen is

component rca
   generic (  N     :   integer := 4);
   Port ( A:	In	std_logic_vector(N-1 downto 0);
   B:	In	std_logic_vector(N-1 downto 0);
   Ci:	In	std_logic;
   S:	Out	std_logic_vector(N-1 downto 0);
   Co:	Out	std_logic);
end component;

component mux21
   generic (
      SIZE : integer
	);
	Port (	IN0:	In	std_logic_vector(N-1 downto 0);
		IN1:	In	std_logic_vector(N-1 downto 0);
		CTRL:	In	std_logic;
		OUT1:	Out	std_logic_vector(N-1 downto 0));
end component;

constant zero : std_logic := '0';
constant one  : std_logic := '1';
signal nocarry_sum_to_mux : std_logic_vector(N-1 downto 0);
signal carry_sum_to_mux   : std_logic_vector(N-1 downto 0);
signal carry_carry_out : std_logic;
signal nocarry_carry_out : std_logic;


begin

rca_nocarry : rca
   generic map (N => N) 
   port map (A,B,zero,nocarry_sum_to_mux,nocarry_carry_out); 

rca_carry : rca
   generic map (N => N) 
   port map (A,B,one,carry_sum_to_mux,carry_carry_out);

outmux : mux21
   generic map (SIZE => N) 
   port map (nocarry_sum_to_mux,carry_sum_to_mux,Ci,S);
       
       
       
end STRUCTURAL;

