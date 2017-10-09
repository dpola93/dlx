library ieee; 
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

ENTITY simple_booth_add_ext IS

	generic (N : integer := 8);

PORT(	
		Clock		: in  std_logic;
		Reset		: in  std_logic;
		sign		: in  std_logic;
		enable		: in  std_logic;
		busy		: out std_logic;
		valid		: out std_logic;
		A		: in  std_logic_vector (N-1 downto 0);
		B		: in  std_logic_vector (N-1 downto 0);
		A_to_add	: out std_logic_vector (2*N-1 downto 0);
		B_to_add	: out std_logic_vector (2*N-1 downto 0);
		ACC_from_add	: in  std_logic_vector (2*N-1 downto 0)
		);
END simple_booth_add_ext;


architecture struct of simple_booth_add_ext is

component booth_encoder 
	port(	
	B_in	: in  std_logic_vector (2 downto 0);
	A_out	: out std_logic_vector (2 downto 0)
	);
end component;

component shift  
	generic(
		N : natural
	);
	port(
	Clock	: in  std_logic; 
	ALOAD	: in  std_logic; 
	D	: in  std_logic_vector(N-1 downto 0); 
	SO	: out std_logic	); 
end component; 

component piso_r_2
  generic(
	N : natural 
	);
  port(
	Clock	: in  std_logic; 
	ALOAD	: in  std_logic; 
	D	: in  std_logic_vector(N-1 downto 0); 
	SO	: out std_logic_vector(N-1 downto 0)	); 
end component;
  component mux8to1_gen 

	generic (  M : integer ); 	

	port(	
		A : in  std_logic_vector (M-1 downto 0); 
		B : in  std_logic_vector (M-1 downto 0); 
 		C : in  std_logic_vector (M-1 downto 0);
		D : in  std_logic_vector (M-1 downto 0);
		E : in  std_logic_vector (M-1 downto 0);
		F : in  std_logic_vector (M-1 downto 0);
		G : in  std_logic_vector (M-1 downto 0);
		H : in  std_logic_vector (M-1 downto 0);
		
		S : in  std_logic_vector (2 downto 0);
		Y : out std_logic_vector (M-1 downto 0)
		);
  end component; 

  component RCA 
 	generic (M : integer
	        );
	Port (	A:	in  std_logic_vector(M-1 downto 0);
		B:	in  std_logic_vector(M-1 downto 0);
		Cin:	in  std_logic_vector(0 downto 0);
		S:	out std_logic_vector(M-1 downto 0)
		);
  end component; 



type mux_select is array (N/2 downto 0) of std_logic_vector(2 downto 0);
signal tot_select	: mux_select;
signal piso_0_in	: std_logic_vector(N/2-1 downto 0);
signal piso_1_in	: std_logic_vector(N/2-1 downto 0);
signal piso_2_in	: std_logic_vector(N/2-1 downto 0);

signal piso_0_out	: std_logic;
signal piso_1_out	: std_logic;
signal piso_2_out	: std_logic;

signal enc_0_in		: std_logic_vector(2 downto 0);
signal enc_N2_in	: std_logic_vector(2 downto 0);

signal last_bit		: std_logic;
signal extend_vector	: std_logic_vector(N-1 downto 0);
signal extended_A	: std_logic_vector(2*N-1 downto 0);
signal zeros		: std_logic_vector(2*N-1 downto 0);

signal A2		: std_logic_vector(2*N-1 downto 0);
signal notA		: std_logic_vector(2*N-1 downto 0);
signal notA2		: std_logic_vector(2*N-1 downto 0);

signal A4		: std_logic_vector(2*N-1 downto 0);
signal A8		: std_logic_vector(2*N-1 downto 0);
signal notA4		: std_logic_vector(2*N-1 downto 0);
signal notA8		: std_logic_vector(2*N-1 downto 0);

signal A_to_mux		: std_logic_vector(2*N-1 downto 0);
signal A2_to_mux	: std_logic_vector(2*N-1 downto 0);
signal notA_to_mux	: std_logic_vector(2*N-1 downto 0);
signal notA2_to_mux	: std_logic_vector(2*N-1 downto 0);

signal A_to_mux_LOAD		: std_logic_vector(2*N-1 downto 0);
signal A2_to_mux_LOAD		: std_logic_vector(2*N-1 downto 0);
signal notA_to_mux_LOAD		: std_logic_vector(2*N-1 downto 0);
signal notA2_to_mux_LOAD	: std_logic_vector(2*N-1 downto 0);

signal mux_out_to_add	: std_logic_vector(2*N-1 downto 0);

signal load		: std_logic;
signal input_mux_sel	: std_logic_vector(2 downto 0);
signal count		: unsigned(4 downto 0);

signal accumulate	: std_logic_vector(2*N-1 downto 0);
signal next_accumulate	: std_logic_vector(2*N-1 downto 0);
signal sum_out		: std_logic_vector(2*N-1 downto 0);

signal triggered	: std_logic;

begin
-- TODO: check if this is correct!
last_bit <= sign and B(N-1);

enc_0_in <= B(1 downto 0)&'0';
enc_N2_in <= last_bit&last_bit&B(N-1);

piso_gen: for i in 1 to N/2 generate
	piso_0_in(i-1) <= tot_select(i)(0);
	piso_1_in(i-1) <= tot_select(i)(1);
	piso_2_in(i-1) <= tot_select(i)(2);
end generate piso_gen;


encod_loop: for i in 0 to N/2 generate

   en_level0 : IF i = 0 generate
      encod_0 : booth_encoder port map(enc_0_in, tot_select(i));
   end generate en_level0;
   
   en_levelN : IF i = N/2 generate
      encod_i : booth_encoder port map(enc_N2_in, tot_select(i));
   end generate en_levelN;

   en_leveli : IF i > 0 and i < N/2 generate
      encod_i : booth_encoder port map(B(2*i+1 downto 2*i-1), tot_select(i));
   end generate en_leveli;
      
end generate encod_loop;

piso_0 : shift generic map( N => N/2) port map(Clock,load,piso_0_in,piso_0_out);
piso_1 : shift generic map( N => N/2) port map(Clock,load,piso_1_in,piso_1_out);
piso_2 : shift generic map( N => N/2) port map(Clock,load,piso_2_in,piso_2_out);

zeros	<= (others => '0');
notA	<= std_logic_vector(unsigned(not(extended_A))+1);
A2	<= extended_A(2*N-2 downto 0)&'0';
notA2	<= notA(2*N-2 downto 0)&'0';

A4 <= extended_A(2*N-3 downto 0)&"00";
A8 <= extended_A(2*N-4 downto 0)&"000";
notA4 <= notA(2*N-3 downto 0)&"00";
notA8 <= notA(2*N-4 downto 0)&"000";

extend_vector <= (others => A(N-1) and sign);

extended_A <= extend_vector&A;

A_reg		: piso_r_2 generic map( N => 2*N) port map(Clock,load,A4,A_to_mux);
A2_reg		: piso_r_2 generic map( N => 2*N) port map(Clock,load,A8,A2_to_mux);
notA_reg	: piso_r_2 generic map( N => 2*N) port map(Clock,load,notA4,notA_to_mux);
notA2_reg	: piso_r_2 generic map( N => 2*N) port map(Clock,load,notA8,notA2_to_mux);

A_to_mux_LOAD <=	extended_A when count = 8 else
			A_to_mux;
A2_to_mux_LOAD <=	A2 when count = 8 else
			A2_to_mux;
notA_to_mux_LOAD <=	notA when count = 8 else
			notA_to_mux;
notA2_to_mux_LOAD <=	notA2 when count = 8 else
			notA2_to_mux;



input_mux_sel(0) <= 	tot_select(0)(0) when count = 8 else
			piso_0_out;
input_mux_sel(1) <= 	tot_select(0)(1) when count = 8 else
			piso_1_out;
input_mux_sel(2) <= 	tot_select(0)(2) when count = 8 else
			piso_2_out;

mux_i : mux8to1_gen 
	generic map (M => 2*N)
	port map ((others => '0'), A_to_mux_LOAD, notA_to_mux_LOAD, A2_to_mux_LOAD, notA2_to_mux_LOAD, zeros, zeros, zeros, input_mux_sel, mux_out_to_add);


A_to_add <= accumulate;
B_to_add <= mux_out_to_add;

load	<=	'1' when count = 8 else
		'0';

next_accumulate <=	mux_out_to_add when count = 8 else
			ACC_from_add;

busy	<=	'1' when count /= 8 or enable = '1' else
		'0';
valid	<=	'1' when count = 0 else
		'0';

process(Reset,Clock)
begin
	if Reset = '1' then
			count <= "01000";
			accumulate <= (others => '0');
			triggered <= '0';
	else
		if Clock = '1' and Clock'event then
			if count = 8 and enable = '1' then
				triggered <= '1';
				count <= count - 1;
			end if;
			if count = 0 then
				count <= "01000";
				triggered <= '0';
			else 
				if triggered = '1' then
					count <= count - 1;
				end if;
			end if;
			accumulate <= next_accumulate;
		end if;
	end if;
end process;


end struct;
