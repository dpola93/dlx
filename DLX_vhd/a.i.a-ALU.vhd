-- real_alu.vhd

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
--	OP	: in  AluOp;
	ALUW_i	: in  std_logic_vector(12 downto 0);
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
	C	: in  std_logic;			-- carry out
	V	: in  std_logic;			-- overflow
	SUM	: in  std_logic_vector(M-1 downto 0);
	sel	: in  std_logic_vector(2 downto 0);	-- selection
	sign	: in  std_logic;			-- 0 unsigned / signed 1
	S	: out std_logic
	);
end component; 

component bhe_comparator is 
	generic (M : integer := 32);	
	port (	
	A	: in  std_logic_vector(M-1 downto 0);			-- carry out
	B	: in  std_logic_vector(M-1 downto 0);
	sign	: in  std_logic;
	sel	: in  std_logic_vector(2 downto 0);	-- selection
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
signal sign_bit_to_comp	: std_logic;
signal out_mux_sel	: std_logic_vector(2 downto 0);
signal comp_sel		: std_logic_vector(2 downto 0);

signal sign_to_adder	: std_logic;

signal left_right	: std_logic; -- 1 = logic, 0 = arith
signal logic_arith	: std_logic; -- 1 = left, 0 = right

signal lu_ctrl		: std_logic_vector(1 downto 0);
signal lu_out		: std_logic_vector(DATA_SIZE-1 downto 0);

signal ALU_WORD_TEST	:std_logic_vector(12 downto 0);
begin

ALU_WORD_TEST <= out_mux_sel&left_right&logic_arith&sign_to_adder&lu_ctrl&comp_sel&enable_to_booth&sign_to_booth;

out_mux_sel	<= ALUW_i(12 downto 10);
left_right	<= ALUW_i(9);
logic_arith	<= ALUW_i(8);
sign_to_adder	<= ALUW_i(7);
lu_ctrl		<= ALUW_i(6 downto 5);
comp_sel	<= ALUW_i(4 downto 2);
enable_to_booth	<= ALUW_i(1);
sign_to_booth	<= ALUW_i(0);

mux_A <=	IN1		when enable_to_booth = '0' else
		A_booth_to_add	when enable_to_booth = '1' else
		(others => 'X');

mux_B <=	IN2		when enable_to_booth = '0' else
		B_booth_to_add	when enable_to_booth = '1' else
		(others => 'X');

mux_sign <=	sign_to_adder		when enable_to_booth = '0' else
		sign_booth_to_add	when enable_to_booth = '1' else
		'X';

sign_bit_to_comp <= IN1(DATA_SIZE-1) xor IN2(DATA_SIZE-1);

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
 	sign	=> sign_to_booth,
 	S	=> comp_out
 );


-- NO MORE USED, IMPROVES SPEED, INCREASES AREA
-- BHE_COMP: bhe_comparator
-- 	generic map ( M => DATA_SIZE)
-- 	port map (
-- 	A	=> IN1,
-- 	B	=> IN2,
-- 	sel	=> comp_sel,
-- 	sign	=> sign_to_booth,
-- 	S	=> comp_out
-- 	);

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


overflow <= (IN2(DATA_SIZE-1) xnor sum_out(DATA_SIZE-1)) and (IN1(DATA_SIZE-1) xor IN2(DATA_SIZE-1)); 

-- stalling while booth is in process
stall_o <= enable_to_booth and not(valid_from_booth);

DOUT <= sum_out				when out_mux_sel = "000" else
	lu_out				when out_mux_sel = "001" else
	shift_out			when out_mux_sel = "010" else
	"000"&X"0000000"&comp_out	when out_mux_sel = "011" else
	IN2 				when out_mux_sel = "100" else
	mult_out			when out_mux_sel = "101" else
	(others => 'X');

end bhe;

