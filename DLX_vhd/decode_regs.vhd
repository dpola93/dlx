
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity decode_regs is
	generic (
	SIZE : integer := 32
);
  port (
	A_i : in  std_logic_vector(SIZE - 1 downto 0);
	B_i : in  std_logic_vector(SIZE - 1 downto 0);
	rA_i : in  std_logic_vector(4 downto 0);
	rB_i : in  std_logic_vector(4 downto 0);
	rC_i : in  std_logic_vector(4 downto 0);
	IMM_i : in  std_logic_vector(SIZE - 1 downto 0);
	A_o : out  std_logic_vector(SIZE - 1 downto 0);
	B_o : out  std_logic_vector(SIZE - 1 downto 0);
	rA_o : out  std_logic_vector(4 downto 0);
	rB_o : out  std_logic_vector(4 downto 0);
	rC_o : out  std_logic_vector(4 downto 0);
	IMM_o : out  std_logic_vector(SIZE - 1 downto 0);
	stall_i : in std_logic;
	clk : in std_logic;
	rst : in std_logic

	);
end decode_regs;

architecture Struct of decode_regs is

component ff32_en
	generic(
		SIZE : integer
	);
	port(
		D : in  std_logic_vector(SIZE - 1 downto 0);
		Q : out  std_logic_vector(SIZE - 1 downto 0);
		en : in std_logic;
		clk : in std_logic;
		rst : in std_logic
	);
end component;

signal enable : std_logic;


begin


--enable signal is a signal received from CU that can stop the entire stage of the pipeline
enable <= not stall_i;



-- first operand from RF
A: ff32_en generic map(
	SIZE => 32
	)port map(
	D => A_i, 
	Q => A_o,
	en => enable,
	clk => clk,
	rst => rst);

-- second operand from RF
B: ff32_en generic map(
	SIZE => 32
	)port map(
	D => B_i, 
	Q => B_o,
	en => enable,
	clk => clk,
	rst => rst);

-- index of rA
rA: ff32_en generic map(
	SIZE => 5
	)port map(
	D => rA_i, 
	Q => rA_o,
	en => enable,
	clk => clk,
	rst => rst);
-- index of rB
rB: ff32_en generic map(
	SIZE => 5
	)port map(
	D => rB_i, 
	Q => rB_o,
	en => enable,
	clk => clk,
	rst => rst);
-- index of rC
rC: ff32_en generic map(
	SIZE => 5
	)port map(
	D => rC_i, 
	Q => rC_o,
	en => enable,
	clk => clk,
	rst => rst);

-- immediate value
IMM: ff32_en generic map(
	SIZE => 32
	)port map(
	D => IMM_i, 
	Q => IMM_o,
	en => enable,
	clk => clk,
	rst => rst);


end Struct;
