-- real_alu.vhd
-- TODO: ADD MUXES AND NOT BLOCK
-- MAKE THIS AS STRUCTURAL AS POSSIBLE
-- THINK ABOUT A KIND OF CU TO GENERATE CONTROL SIGNALS

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
	valid		: out std_logic;
	A		: in  std_logic_vector (N-1 downto 0);
	B		: in  std_logic_vector (N-1 downto 0);
	A_to_add	: out std_logic_vector (2*N-1 downto 0);
	B_to_add	: out std_logic_vector (2*N-1 downto 0);
	final_out	: out std_logic_vector (2*N-1 downto 0);
	sign_to_add	: out std_logic;
	ACC_from_add	: in  std_logic_vector (2*N-1 downto 0)
	);
end component;


component p4add
generic (
	N	: integer := 32;
	logN	: integer := 5);
Port (
	A	: in  std_logic_vector(N-1 downto 0);
	B	: in  std_logic_vector(N-1 downto 0);
	Cin	: in  std_logic;
	sign	: In  std_logic;
	S	: out std_logic_vector(N-1 downto 0);
	Cout	: out std_logic);
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
	port(
	A		: in  std_logic_vector(31 downto 0);
	B		: in  std_logic_vector(4 downto 0);
	LOGIC_ARITH	: in  std_logic;	-- 1 = logic, 0 = arith
	LEFT_RIGHT	: in  std_logic;	-- 1 = left, 0 = right
	OUTPUT		: out std_logic_vector(31 downto 0)
	);
end component;

component logic_unit 
	generic ( SIZE : integer := 32 );
	port (
	IN1	: in std_logic_vector(SIZE - 1 downto 0);
   	IN2	: in std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in std_logic_vector(1 downto 0); -- need to do only and, or and xor
	OUT1	: out  std_logic_vector(SIZE - 1 downto 0)
	);
end component;

signal sign_to_booth	: std_logic;
signal enable_to_booth	: std_logic;
signal valid_from_booth	: std_logic;
signal A_booth_to_add	: std_logic_vector(DATA_SIZE-1 downto 0);
signal B_booth_to_add	: std_logic_vector(DATA_SIZE-1 downto 0);
signal sign_booth_to_add	: std_logic;

signal sum_out		: std_logic_vector(DATA_SIZE-1 downto 0);
signal comp_out		: std_logic;
signal shift_out	: std_logic_vector(DATA_SIZE-1 downto 0);
signal mult_out		: std_logic_vector(DATA_SIZE-1 downto 0);

signal mux_A		: std_logic_vector(DATA_SIZE-1 downto 0);
signal mux_B		: std_logic_vector(DATA_SIZE-1 downto 0);
signal mux_sign		: std_logic;

signal carry_from_adder	: std_logic;
signal overflow		: std_logic;

signal out_mux_sel	: std_logic_vector(2 downto 0);
signal comp_sel		: std_logic_vector(2 downto 0);

signal sign_to_adder	: std_logic;

signal left_right	: std_logic; -- 1 = logic, 0 = arith
signal logic_arith	: std_logic; -- 1 = left, 0 = right

signal lu_ctrl		: std_logic_vector(1 downto 0);
signal lu_out		: std_logic_vector(DATA_SIZE-1 downto 0);


begin


mux_A <=	IN1		when enable_to_booth = '0' else
		A_booth_to_add	when enable_to_booth = '1' else
		(others => 'X');

mux_B <=	IN2		when enable_to_booth = '0' else
		B_booth_to_add	when enable_to_booth = '1' else
		(others => 'X');

mux_sign <=	sign_to_adder		when enable_to_booth = '0' else
		sign_booth_to_add	when enable_to_booth = '1' else
		'X';
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
	valid		=> valid_from_booth,
	A		=> IN1(DATA_SIZE/2-1 downto 0),
	B		=> IN2(DATA_SIZE/2-1 downto 0),
	A_to_add	=> A_booth_to_add,
	B_to_add	=> B_booth_to_add,
	final_out	=> mult_out,	
	sign_to_add	=> sign_booth_to_add,
	ACC_from_add	=> sum_out
  );

ADDER: p4add 
	generic map (
	N => DATA_SIZE,
	logN => 5
	)
	port map (
	A	=> mux_A,
	B	=> mux_B,
	Cin	=> '0',
	sign	=> mux_sign,
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

SHIFT:	shifter
	port map(
	A		=> IN1,
	B		=> IN2(4 downto 0),
	LOGIC_ARITH	=> logic_arith,
	LEFT_RIGHT	=> left_right,
	OUTPUT		=> shift_out
	);

LU:	logic_unit
	generic map( SIZE => DATA_SIZE)
	port map(
	IN1	=> IN1,
   	IN2	=> IN2,
	CTRL	=> lu_ctrl,
	OUT1	=> lu_out
	);


-- stalling while booth is in process
stall_o <= enable_to_booth and not(valid_from_booth);

-- TODO: MISSING A FORWARDING ON STORE REG FIX THAT ADDING A FW TO S
DOUT <= sum_out				when out_mux_sel = "000" else
	lu_out				when out_mux_sel = "001" else
	shift_out			when out_mux_sel = "010" else
	"000"&X"0000000"&comp_out	when out_mux_sel = "011" else
	IN2 				when out_mux_sel = "100" else
	mult_out			when out_mux_sel = "101" else
	(others => 'X');

-- combinatorial process used to send the right data to components
process(IN1,IN2,OP)
begin
 case OP is
  -- when NOP we do a random LU operation, maybe change this into something smarter??
  when NOP  =>
		out_mux_sel <= "100";
		sign_to_booth <= '0'; -- useless but avoids errors on simulation

  when SLLS =>
		out_mux_sel <= "010";
		left_right <= '0';
		logic_arith <= '0';
 
  when SRLS =>
		out_mux_sel <= "010";
		left_right <= '1';
		logic_arith <= '0';
 
  when SRAS =>
		out_mux_sel <= "010";
		left_right <= '1';
		logic_arith <= '1';
 
  when ADDS =>
		sign_to_adder <= '0';
		out_mux_sel <= "000";
 
  when ADDUS =>
		sign_to_adder <= '0';
		out_mux_sel <= "000";

  when SUBS =>		
		sign_to_adder <= '1';
		out_mux_sel <= "000";

  when SUBUS =>
		sign_to_adder <= '1';
		out_mux_sel <= "000";

  when ANDS =>
		lu_ctrl	<= "00";
		out_mux_sel <= "001";

  when ORS =>
		lu_ctrl	<= "01";
		out_mux_sel <= "001";
  when XORS =>
		lu_ctrl	<= "10";
		out_mux_sel <= "001";

  when SEQS =>
		sign_to_adder <= '1';
		comp_sel <= "100";
		out_mux_sel <= "011";

  when SNES =>
		sign_to_adder <= '1';
		comp_sel <= "101";
		out_mux_sel <= "011";

  when SLTS =>
		sign_to_adder <= '1';
		comp_sel <= "010";
		out_mux_sel <= "011";

  when SGTS =>
		sign_to_adder <= '1';
		comp_sel <= "000";
		out_mux_sel <= "011";

  when SLES =>
		sign_to_adder <= '1';
		comp_sel <= "011";
		out_mux_sel <= "011";

  when SGES =>
		sign_to_adder <= '1';
		comp_sel <= "001";
		out_mux_sel <= "011";

--  UNIMPLEMENTED OPS
--  when MOVI2SS => DOUT <= (others => '0');
--  when MOVS2IS => DOUT <= (others => '0');
--  when MOVFS => DOUT <= (others => '0');
--  when MOVDS => DOUT <= (others => '0');
--  when MOVFP2IS => DOUT <= (others => '0');
--  when MOVI2FP => DOUT <= (others => '0');
--  when MOVI2TS => DOUT <= (others => '0');
--  when MOVT2IS => DOUT <= (others => '0');
  when SLTUS =>
		sign_to_adder <= '1';
		comp_sel <= "010";
		out_mux_sel <= "011";

  when SGTUS =>
		sign_to_adder <= '1';
		comp_sel <= "000";
		out_mux_sel <= "011";

  when SLEUS =>
		sign_to_adder <= '1';
		comp_sel <= "011";
		out_mux_sel <= "011";

  when SGEUS =>
		sign_to_adder <= '1';
		comp_sel <= "001";
		out_mux_sel <= "011";

  when MULTU =>
		out_mux_sel <= "101";
		sign_to_booth <= '0';

  when MULTS =>
		out_mux_sel <= "101";
		sign_to_booth <= '1';

  when others => out_mux_sel <= "000";
 end case;
end process;


end bhe;

