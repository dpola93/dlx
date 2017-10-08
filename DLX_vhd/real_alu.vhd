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
	S	: out std_logic_vector(M-1 downto 0);
	Cout	: out std_logic
	);
 end component; 

component comparator 
	generic (M : integer := 32);	
	port (	
	C	: in  std_logic; -- carry out
	V	: in  std_logic; -- overflow
	SUM	: in  std_logic_vector(M-1 downto 0);
	sel	: in  std_logic_vector(2 downto 0); -- selection
	sign	: in  std_logic; -- 0 unsigned / signed 1
	S	: out std_logic
	);
end component; 

component shifter
	generic (N: integer);
	port(
	A		: in  std_logic_vector(N-1 downto 0);
	B		: in  std_logic_vector(4 downto 0);
	LOGIC_ARITH	: in  std_logic;	-- 1 = logic, 0 = arith
	LEFT_RIGHT	: in  std_logic;	-- 1 = left, 0 = right
	OUTPUT		: out std_logic_vector(N-1 downto 0)
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
signal comp_out		: std_logic;
signal shift_out	: std_logic_vector(DATA_SIZE-1 downto 0);

signal mux_A		: std_logic_vector(DATA_SIZE-1 downto 0);
signal mux_B		: std_logic_vector(DATA_SIZE-1 downto 0);

signal carry_to_adder	: std_logic_vector(0 downto 0);
signal carry_from_adder	: std_logic;
signal overflow		: std_logic;

signal out_mux_sel	: std_logic_vector(1 downto 0);
signal comp_sel		: std_logic_vector(2 downto 0);

signal mux_adder_input	: std_logic;
signal not_control	: std_logic;

signal left_right	: std_logic; -- 1 = logic, 0 = arith
signal logic_arith	: std_logic; -- 1 = left, 0 = right

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

enable_to_booth <=	'1' when OP = MULTS or OP = MULTU else
			'0';
overflow	<= (IN2(DATA_SIZE-1) xnor sum_out(DATA_SIZE-1)) and (IN1(DATA_SIZE-1) xor IN2(DATA_SIZE-1)); 

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
	S	=> sum_out,
	Cout	=> carry_from_adder
	);

COMP: comparator
	generic map ( M => DATA_SIZE)
	port map (
	C	=> carry_from_adder,
	V	=> overflow,
	SUM	=> sum_out,
	sel	=> comp_sel,
	sign	=> sign_to_booth, --TODO: check if can use this signal, maybe rename it to avoid confusion
	S	=> comp_out
	);
SHIFT: shifter
	generic map( N => DATA_SIZE)
	port map(
	A		=> IN1,
	B		=> IN2,
	LOGIC_ARITH	=> logic_arith,
	LEFT_RIGHT	=> left_right,
	OUTPUT		=> shift_out
	);

ZEROUT <= '0';
stall_o <= busy_from_booth and not(valid_from_booth);
--TODO: set this according to what should be done ( ADDER, MULT, LOGIC, SHIFTER, COMP)
-- TODO: MISSING A FORWARDING ON STORE REG FIX THAT ADDING A FW TO S
DOUT <= sum_out		when out_mux_sel = "00" else
	(others => '0')	when out_mux_sel = "01" else
	shift_out	when out_mux_sel = "10" else
	"000"&X"0000000"&comp_out	when out_mux_sel = "11" else
	(others => 'X');

process(IN1,IN2,OP,multDATA)
begin
 case OP is
--  when NOP => DOUT <= (others => '0');
  when SLLS =>
		out_mux_sel <= "10";
		left_right <= '1';
		logic_arith <= '1';
 
  when SRLS =>
		out_mux_sel <= "10";
		left_right <= '0';
		logic_arith <= '1';
 
  when SRAS =>
		out_mux_sel <= "10";
		left_right <= '0';
		logic_arith <= '0';
 
  when ADDS =>
		not_control <= '0';
		carry_to_adder <= "0";
		out_mux_sel <= "00";
 
  when ADDUS =>
		not_control <= '0';
		carry_to_adder <= "0";	
		out_mux_sel <= "00";

  when SUBS =>		
		not_control <= '1';
		carry_to_adder <= "1";	
		out_mux_sel <= "00";

  when SUBUS =>
		not_control <= '1';
		carry_to_adder <= "1";
		out_mux_sel <= "00";

  when ANDS =>	out_mux_sel <= "01";
  when ORS =>	out_mux_sel <= "01";
  when XORS =>	out_mux_sel <= "01";
  when SEQS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "100";
		out_mux_sel <= "11";

  when SNES =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "101";
		out_mux_sel <= "11";

  when SLTS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "010";
		out_mux_sel <= "11";
		sign_to_booth <= '1';

  when SGTS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "000";
		out_mux_sel <= "11";
		sign_to_booth <= '1';

  when SLES =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "011";
		out_mux_sel <= "11";
		sign_to_booth <= '1';

  when SGES =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "001";
		out_mux_sel <= "11";
		sign_to_booth <= '1';

--  when MOVI2SS => DOUT <= (others => '0');
--  when MOVS2IS => DOUT <= (others => '0');
--  when MOVFS => DOUT <= (others => '0');
--  when MOVDS => DOUT <= (others => '0');
--  when MOVFP2IS => DOUT <= (others => '0');
--  when MOVI2FP => DOUT <= (others => '0');
--  when MOVI2TS => DOUT <= (others => '0');
--  when MOVT2IS => DOUT <= (others => '0');
  when SLTUS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "010";
		out_mux_sel <= "11";
		sign_to_booth <= '0';

  when SGTUS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "000";
		out_mux_sel <= "11";
		sign_to_booth <= '0';

  when SLEUS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "011";
		out_mux_sel <= "11";
		sign_to_booth <= '0';

  when SGEUS =>
		not_control <= '1';
		carry_to_adder <= "1";
		comp_sel <= "001";
		out_mux_sel <= "11";
		sign_to_booth <= '0';

  when MULTU =>	out_mux_sel <= "00";
			carry_to_adder <= "0";
			sign_to_booth <= '0';
  when MULTS =>	out_mux_sel <= "00";
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

