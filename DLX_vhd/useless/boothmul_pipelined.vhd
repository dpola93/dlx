library ieee; 
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

ENTITY boothmul_pipelined IS

	generic (N : integer := 8);

PORT(	
		Clock	: in std_logic;
		Reset	: in std_logic;
		sign	: in std_logic;
		A	: IN std_logic_vector (N-1 downto 0);
		B	: IN std_logic_vector (N-1 downto 0);
		P	: OUT std_logic_vector (2*N-1 downto 0)
		);
END boothmul_pipelined;

architecture BEHAVIOR of boothmul_pipelined is

  component booth_encoder 
	PORT(	
		B_in	: IN std_logic_vector (2 downto 0);
		A_out	: OUT std_logic_vector (2 downto 0)
		);
  end component; 

  component mux8to1_gen 

	generic (  M : integer := 64); 	

	PORT(	
		A : IN std_logic_vector (M-1 downto 0); 
		B : IN std_logic_vector (M-1 downto 0); 
 		C : IN std_logic_vector (M-1 downto 0);
		D : IN std_logic_vector (M-1 downto 0);
		E : IN std_logic_vector (M-1 downto 0);
		F : IN std_logic_vector (M-1 downto 0);
		G : IN std_logic_vector (M-1 downto 0);
		H : IN std_logic_vector (M-1 downto 0);
		
		S : IN std_logic_vector (2 downto 0);
		Y : OUT std_logic_vector (M-1 downto 0)
		);
  end component; 

  component RCA 
 	generic (M : integer := 64
	        );
	Port (	A : In std_logic_vector(M-1 downto 0);
		B : In std_logic_vector(M-1 downto 0);
		S : Out	std_logic_vector(M-1 downto 0)
		);
  end component; 

signal b_enc		: std_logic_vector(N downto 0);
signal last_enc		: std_logic_vector(2 downto 0);
signal zeros		: std_logic_vector(2*N-1 downto 0);
type mux_select		is array (N/2 downto 0) of std_logic_vector(2 downto 0);
type mux_in		is array (4 downto 0) of std_logic_vector (2*N-1 downto 0);
type tot_in		is array (N/2 downto 0) of mux_in;
type tot_out		is array (N/2 downto 0) of std_logic_vector (2*N-1 downto 0);
type tot_out_reg	is array (N/2 downto 0) of tot_out;
type tot_sum		is array (N/2 downto 0) of std_logic_vector (2*N-1 downto 0);

signal tot_mux_in	: tot_in;
signal tot_mux_out	: tot_out;
signal tot_mux_out_reg	: tot_out_reg;
signal tot_select	: mux_select;
signal mux_ini		: mux_in;
signal mux_out0		: std_logic_vector (2*N-1 downto 0);
signal mux_outi		: std_logic_vector (2*N-1 downto 0); 
signal sum		: tot_sum;
signal next_sum		: tot_sum;
signal extend		: std_logic;



signal Cin		: std_logic;
signal Cout		: std_logic;

type not_type		is array (N/2 downto 0) of std_logic_vector ( 2*N-1 downto 0);
signal notmuxA  	: not_type;
signal notmux2A 	: not_type;

BEGIN
--TODO: add comments

b_enc		<= B &'0'; 
zeros		<= (others => '0');
extend		<= sign;
last_enc	<= sign&sign&B(N-1);
Cin		<= '0';
P		<= sum(N/2-1);


encod_loop: for i in 0 to N/2 generate

	en_level0 : IF i = 0 generate
		encod_0 : booth_encoder port map(b_enc(2 downto 0), tot_select(i));
	end generate en_level0;
	
	en_levelN : IF i = N/2 generate
		encod_i : booth_encoder port map(last_enc, tot_select(i));
	end generate en_levelN;
	
	en_leveli : IF i > 0 and i < N/2 generate
		encod_i : booth_encoder port map(B(2*i+1 downto 2*i-1), tot_select(i));
	end generate en_leveli;
      
end generate encod_loop;


in_mu : for i in 0 to N/2 generate
	
	mlevel_0 : IF i = 0 generate
		tot_mux_in(i)(0) <= (others => '0' );
	
		tot_mux_in(i)(1)(2*N-1 downto N) <= (others => ('0'OR A(N-1)) and extend); -- take sign of A (last bit and extend)
		tot_mux_in(i)(1)(N-1 downto 0) <= A; --lowest 16 bits are A
		
		--notmuxA is A flipped (twos complement)
		notmuxA(i)(2*N-1 downto N) <= (others => ('0'OR A(N-1)) and extend);
		notmuxA(i)(N-1 downto 0) <= A;
		tot_mux_in(i)(2) <= std_logic_vector(signed(NOT(notmuxA(i))) + 1);
	
	
		tot_mux_in(i)(3)(2*N-1 downto N+1) <= (others => ('0'OR A(N-1)) and extend);
		tot_mux_in(i)(3)(N downto 1) <= A;
		tot_mux_in(i)(3)(0 downto 0) <= (others => '0');
	      
	      
		notmux2A(i)(2*N-1 downto N+1) <= (others => ('0'OR A(N-1)) and extend);
		notmux2A(i)(N downto 1) <= A;
		notmux2A(i)(0 downto 0) <= (others => '0');
		tot_mux_in(i)(4) <= std_logic_vector(signed(NOT(notmux2A(i))) + 1);
      
	end generate mlevel_0;
  

	mlevel_N : IF i = N/2 generate
	
		tot_mux_in(i)(0) <= (others => '0');
	      
		tot_mux_in(i)(1)(2*N-1 downto N+2*i) <= (others => ('0'OR A(N-1)) and extend);
		tot_mux_in(i)(1)(N+2*i-1 downto 2*i) <= A;
		tot_mux_in(i)(1)(2*i-1 downto 0) <= (others => '0');
	   
	end generate mlevel_N;


	mlevel_i : IF i > 0 and i < N/2 generate
	
		tot_mux_in(i)(0) <= (others => '0');
	      
		tot_mux_in(i)(1)(2*N-1 downto N+2*i) <= (others => ('0'OR A(N-1)) and extend);
		tot_mux_in(i)(1)(N+2*i-1 downto 2*i) <= A;
		tot_mux_in(i)(1)(2*i-1 downto 0) <= (others => '0');
		   
		
		notmuxA(i)(2*N-1 downto N+2*i) <= (others => ('0'OR A(N-1)) and extend);
		notmuxA(i)(N+2*i-1 downto 2*i) <= A;
		notmuxA(i)(2*i-1 downto 0) <= (others => '0');
		tot_mux_in(i)(2) <= std_logic_vector(signed(NOT(notmuxA(i))) + 1);
	      
		
		tot_mux_in(i)(3)(2*N-1 downto N+1+2*i) <= (others => ('0'OR A(N-1)) and extend);
		tot_mux_in(i)(3)(N+2*i downto 2*i+1) <= A;
		tot_mux_in(i)(3)(2*i downto 0) <= (others => '0');
		
		   
		notmux2A(i)(2*N-1 downto N+1+2*i) <= (others => ('0'OR A(N-1)) and extend);
		notmux2A(i)(N+2*i downto 2*i+1) <= A;
		notmux2A(i)(2*i downto 0) <= (others => '0');
		tot_mux_in(i)(4) <= std_logic_vector(signed(NOT(notmux2A(i))) + 1);
	   
	end generate mlevel_i;
	
end generate in_mu;
	

mux_loop: for i in 0 to N/2 generate
	mux_i : mux8to1_gen 
	generic map (M => 2*N)
-- TODO:fix this with a proper port map
	port map (tot_mux_in(i)(0), tot_mux_in(i)(1), tot_mux_in(i)(2), tot_mux_in(i)(3), tot_mux_in(i)(4), zeros, zeros, zeros, tot_select(i), tot_mux_out_reg(0)(i));

end generate mux_loop; 



sum_loop: for i in 0 to N/2-1 generate
	
	level_0 : IF i = 0 generate
		sum1 : rca 
		generic map (M => 2*N)
       		port map(tot_mux_out_reg(0)(0),tot_mux_out_reg(0)(1), next_sum(i));       
	end generate level_0;
	
	level_i : IF i > 0 generate
		sum_i : rca 
		generic map (M => 2*N)
		port map(sum(i-1), tot_mux_out_reg(i)(i+1), next_sum(i));
	end generate level_i;

end generate sum_loop;
 

process(Reset,Clock)
begin
	if Reset = '1' then
		for i in 0 to N/2 loop
			sum(i) <= (others => '0');
		--	tot_mux_out_reg(0)(i) <= (others => '0');
		end loop;
	else
		if Clock = '1' and Clock'event then
			for i in 0 to N/2 loop
				sum(i) <= next_sum(i);

			end loop;
			tot_mux_out_reg(1) <= tot_mux_out_reg(0);
			tot_mux_out_reg(2) <= tot_mux_out_reg(1);
			tot_mux_out_reg(3) <= tot_mux_out_reg(2);
			tot_mux_out_reg(4) <= tot_mux_out_reg(3);
			tot_mux_out_reg(5) <= tot_mux_out_reg(4);
			tot_mux_out_reg(6) <= tot_mux_out_reg(5);
			tot_mux_out_reg(7) <= tot_mux_out_reg(6);
			tot_mux_out_reg(8) <= tot_mux_out_reg(7);
		end if;
	end if;
end process;

end BEHAVIOR;
