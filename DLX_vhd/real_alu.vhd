library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity real_alu is
	generic (
	DATA_SIZE : integer := 32);
	port (
	IN1	: in  std_logic_vector(DATA_SIZE - 1 downto 0);
	IN2	: in  std_logic_vector(DATA_SIZE - 1 downto 0);
	OP	: in  AluOp;
	DOUT	: out std_logic_vector(DATA_SIZE - 1 downto 0);
	ZEROUT	: out std_logic;
	stall_o	: out std_logic;
	Clock	: in  std_logic;
	Reset	: in  std_logic
	);

end real_alu;

architecture Bhe of real_alu is		

component fake_mult
 port (
	IN1	: in  std_logic_vector(31 downto 0);
	IN2	: in  std_logic_vector(31 downto 0);
	DOUT	: out std_logic_vector(31 downto 0);
	stall_o	: out std_logic;
	enable	: in  std_logic;
	Clock	: in  std_logic;
	Reset	: in  std_logic
	);
end component;

component simple_booth_add_ext
generic (N : integer);
port(	
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
end component;


component RCA 
generic (M : integer);
Port (
	A	: in  std_logic_vector(M-1 downto 0);
	B	: in  std_logic_vector(M-1 downto 0);
	Cin	: in  std_logic_vector(0 downto 0);
	S	: out std_logic_vector(M-1 downto 0)
	);
 end component; 



signal enable2mult 	: std_logic := '0';
signal multDATA 	: std_logic_vector(31 downto 0);
signal sign_to_booth	: std_logic;
signal enable_to_booth	: std_logic;
signal busy_from_booth	: std_logic;
signal valid_from_booth	: std_logic;
signal A_booth_to_add	: std_logic_vector(DATA_SIZE-1 downto 0);
signal B_booth_to_add	: std_logic_vector(DATA_SIZE-1 downto 0);

signal sum_out		: std_logic_vector(DATA_SIZE-1 downto 0);

signal mux_A		: std_logic_vector(DATA_SIZE-1 downto 0);
signal mux_B		: std_logic_vector(DATA_SIZE-1 downto 0);

signal carry_to_adder	: std_logic_vector(0 downto 0);

signal out_mux_sel	: std_logic_vector(1 downto 0);

signal mux_adder_input	: std_logic;
signal not_control	: std_logic;

signal notB		: std_logic_vector(DATA_SIZE-1 downto 0);

begin

notB <=		IN2 		when not_control = '0' else
		not(IN2);

mux_A <=	IN1		when mux_adder_input = '0' else
		A_booth_to_add	when mux_adder_input = '1' else
		(others => 'X');

mux_B <=	notB		when mux_adder_input = '0' else
		B_booth_to_add	when mux_adder_input = '1' else
		(others => 'X');


MULT: simple_booth_add_ext 
	generic map ( N => DATA_SIZE/2)
	port Map(
	Clock		=> Clock,
	Reset		=> Reset,
	sign		=> sign_to_booth,
	enable		=> enable_to_booth,
	busy		=> busy_from_booth,
	valid		=> valid_from_booth,
	A		=> IN1(DATA_SIZE/2-1 downto 0),
	B		=> IN2(DATA_SIZE/2-1 downto 0),
	A_to_add	=> A_booth_to_add,
	B_to_add	=> B_booth_to_add,
	ACC_from_add	=> sum_out
  );

ADDER: RCA 
	generic map ( M => DATA_SIZE)
	port map (
	A	=> mux_A,
	B	=> mux_B,
	Cin	=> carry_to_adder,
	S	=> sum_out
	);


ZEROUT <= '0';
stall_o <= busy_from_booth and not(valid_from_booth);
DOUT <= sum_out		when out_mux_sel = "00" else
	(others => '0')	when out_mux_sel = "01" else
	(others => '0')	when out_mux_sel = "10" else
	(others => '0')	when out_mux_sel = "11" else
	(others => 'X');

process(IN1,IN2,OP,multDATA)
begin
 case OP is
--  when NOP => DOUT <= (others => '0');
--  when SLLS => DOUT <= (others => '0');
--  when SRLS => DOUT <= (others => '0');
--  when SRAS => DOUT <= (others => '0');
  when ADDS =>	--mux_adder_input <= '0';
			not_control <= '0';
			carry_to_adder <= "0";
			out_mux_sel <= "00";
  when ADDUS =>	--mux_adder_input <= '0';
			not_control <= '0';
			carry_to_adder <= "0";	
			out_mux_sel <= "00";
  when SUBS =>	--mux_adder_input <= '0';
			not_control <= '1';
			carry_to_adder <= "1";	
			out_mux_sel <= "00";
  when SUBUS =>	--mux_adder_input <= '0';
			not_control <= '1';
			carry_to_adder <= "1";
			out_mux_sel <= "00";

  when ANDS =>	out_mux_sel <= "01";
  when ORS =>	out_mux_sel <= "01";
  when XORS =>	out_mux_sel <= "01";
  when SEQS =>	out_mux_sel <= "11";
  when SNES =>	out_mux_sel <= "11";
  when SLTS =>	out_mux_sel <= "11";
  when SGTS =>	out_mux_sel <= "11";
  when SLES =>	out_mux_sel <= "11";
  when SGES =>	out_mux_sel <= "11";
--  when MOVI2SS => DOUT <= (others => '0');
--  when MOVS2IS => DOUT <= (others => '0');
--  when MOVFS => DOUT <= (others => '0');
--  when MOVDS => DOUT <= (others => '0');
--  when MOVFP2IS => DOUT <= (others => '0');
--  when MOVI2FP => DOUT <= (others => '0');
--  when MOVI2TS => DOUT <= (others => '0');
--  when MOVT2IS => DOUT <= (others => '0');
--  when SLTUS => DOUT <= (others => '0');
--  when SGTUS => DOUT <= (others => '0');
--  when SLEUS => DOUT <= (others => '0');
--  when SGEU => DOUT <= (others => '0');
  when MULTU =>	out_mux_sel <= "00";
	--		mux_adder_input <= '0';
			enable_to_booth <= '1';
			carry_to_adder <= "0";
			sign_to_booth <= '0';
  when MULTS =>	out_mux_sel <= "00";
		--	mux_adder_input <= '0';
			enable_to_booth <= '1';
			carry_to_adder <= "0";
			sign_to_booth <= '1';
  when others => out_mux_sel <= "00";
 end case;
end process;

process(Clock)
begin
	if busy_from_booth = '1' then 
		mux_adder_input <= '1';
	else 
		mux_adder_input <= '0' ;
	end if;
end process;

end bhe;

