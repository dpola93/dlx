-- MULTIPLIER LOGIC - structural

library ieee; 
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

ENTITY simple_booth_add_ext IS

	generic (N : integer := 8);

PORT(	
		Clock		: in  std_logic;
		Reset		: in  std_logic;
		sign		: in  std_logic;
		enable		: in  std_logic;
		valid		: out std_logic;
		A		: in  std_logic_vector (N-1 downto 0);
		B		: in  std_logic_vector (N-1 downto 0);
		A_to_add	: out std_logic_vector (2*N-1 downto 0);
		B_to_add	: out std_logic_vector (2*N-1 downto 0);
		sign_to_add	: out std_logic;
		final_out	: out std_logic_vector (2*N-1 downto 0);
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

component ff32_en
	generic(
		SIZE : integer
	);
	port(
		D	: in  std_logic_vector(SIZE - 1 downto 0);
		Q	: out std_logic_vector(SIZE - 1 downto 0);
		en	: in  std_logic;
		clk	: in  std_logic;
		rst	: in  std_logic
	);
end component;
component mux21
  port (
  	IN0	: in  std_logic_vector(31 downto 0);
	IN1	: in  std_logic_vector(31 downto 0);
	CTRL	: in  std_logic;
	OUT1	: out std_logic_vector(31 downto 0)

    );
end component;

type mux_select is array (N/2 downto 0) of std_logic_vector(2 downto 0);
signal tot_select	: mux_select;
signal piso_0_in	: std_logic_vector(N/2 downto 0);
signal piso_1_in	: std_logic_vector(N/2 downto 0);
signal piso_2_in	: std_logic_vector(N/2 downto 0);

signal piso_0_out	: std_logic;
signal piso_1_out	: std_logic;
signal piso_2_out	: std_logic;

signal enc_0_in		: std_logic_vector(2 downto 0);
signal enc_N2_in	: std_logic_vector(2 downto 0);

signal last_bit		: std_logic;
signal extend_vector	: std_logic_vector(N-1 downto 0);
signal extended_A	: std_logic_vector(2*N-1 downto 0);
signal zeros		: std_logic_vector(2*N-1 downto 0);

signal reg_enable	: std_logic;

signal A_to_mux		: std_logic_vector(2*N-1 downto 0);
signal A2_to_mux	: std_logic_vector(2*N-1 downto 0);


signal mux_out_to_add	: std_logic_vector(2*N-1 downto 0);

signal load		: std_logic;
signal input_mux_sel	: std_logic_vector(2 downto 0);
signal count		: unsigned(4 downto 0);

signal accumulate	: std_logic_vector(2*N-1 downto 0);
signal next_accumulate	: std_logic_vector(2*N-1 downto 0);

signal triggered	: std_logic;

begin
last_bit <= sign and B(N-1);

enc_0_in <= B(1 downto 0)&'0';
enc_N2_in <= last_bit&last_bit&B(N-1);

piso_gen: for i in 0 to N/2 generate
	piso_0_in(i) <= tot_select(i)(0);
	piso_1_in(i) <= tot_select(i)(1);
	piso_2_in(i) <= tot_select(i)(2);
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

piso_0 : shift generic map( N => N/2+1) port map(Clock,load,piso_0_in,piso_0_out);
piso_1 : shift generic map( N => N/2+1) port map(Clock,load,piso_1_in,piso_1_out);
piso_2 : shift generic map( N => N/2+1) port map(Clock,load,piso_2_in,piso_2_out);

extend_vector	<= (others => A(N-1) and sign);
extended_A	<= extend_vector&A;

zeros		<= (others => '0');

A_reg : piso_r_2 generic map( N => 2*N) port map(Clock,load,extended_A,A_to_mux);

A2_to_mux	<= A_to_mux  (2*N-2 downto 0)&'0';



input_mux_sel(0) <=	piso_0_out;
input_mux_sel(1) <=	piso_1_out;
input_mux_sel(2) <=	piso_2_out;


INPUTMUX: mux21 port map(
	IN0	=> A_to_mux,
	IN1	=> A2_to_mux, 
	CTRL	=> input_mux_sel(0), 
	OUT1	=> B_to_add);

ACCUMULATOR: ff32_en generic map(
	SIZE => N*2
	)port map(
	D	=> next_accumulate, 
	Q	=> accumulate,
	en	=> reg_enable,
	clk	=> Clock,
	rst	=> Reset);
--on first clock cycle need to always enable accumulator
reg_enable	<= input_mux_sel(2) or nor_reduce(std_logic_vector(count) xor "01001");

A_to_add	<= accumulate;
sign_to_add	<= input_mux_sel(1);

--last output could be either from accumulator or directly from adder
final_out <=	accumulate when input_mux_sel(2) = '0' else
		ACC_from_add;

--sequential process for count handling
process(Reset,Clock)
begin
	if Reset = '1' then
			count <= "01001";
	else
		if Clock = '1' and Clock'event then
			if count /= 0 and enable = '1' then
				count <= count - 1;
			end if;
			if count = 0 then
				count <= "01001";
			end if;
		end if;
	end if;
end process;

--combinatorial process for signals
process(count,ACC_from_add)
begin
	if count = 0 then
		valid		<= '1';
		next_accumulate	<= ACC_from_add;
		load		<= '0';
	elsif count = 9 then
		valid		<= '0';
		next_accumulate	<= (others => '0');
		load		<= '1';
	else
		valid		<= '0';
		next_accumulate	<= ACC_from_add;
		load		<= '0';
	end if;
end process;
end struct;
