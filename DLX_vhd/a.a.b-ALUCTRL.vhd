-- alu_ctrl.vhd

library ieee;
use ieee.std_logic_1164.all;
use work.myTypes.all;

entity alu_ctrl is
	port (
	OP		: in  AluOp;
	BOOTH_STALL	: in  std_logic;
	ALU_WORD	: out std_logic_vector(12 downto 0)
	);

end alu_ctrl;

architecture bhe of alu_ctrl is		

signal out_mux_sel	: std_logic_vector(2 downto 0);
signal left_right	: std_logic;
signal logic_arith	: std_logic;
signal sign_to_adder	: std_logic;
signal lu_ctrl		: std_logic_vector(1 downto 0);
signal comp_sel		: std_logic_vector(2 downto 0);
signal enable_to_booth	: std_logic;
signal sign_to_booth	: std_logic;

begin
enable_to_booth <=	'1' when (OP = MULTS or OP = MULTU) and BOOTH_STALL = '0' else
			'0';

ALU_WORD <= out_mux_sel&left_right&logic_arith&sign_to_adder&lu_ctrl&comp_sel&enable_to_booth&sign_to_booth;

-- combinatorial process used to send the right data to components
process(OP)
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
		sign_to_booth <= '0';

  when SNES =>
		sign_to_adder <= '1';
		comp_sel <= "101";
		out_mux_sel <= "011";
		sign_to_booth <= '0';

  when SLTS =>
		sign_to_adder <= '1';
		comp_sel <= "010";
		out_mux_sel <= "011";
		sign_to_booth <= '1';

  when SGTS =>
		sign_to_adder <= '1';
		comp_sel <= "000";
		out_mux_sel <= "011";
		sign_to_booth <= '1';

  when SLES =>
		sign_to_adder <= '1';
		comp_sel <= "011";
		out_mux_sel <= "011";
		sign_to_booth <= '1';

  when SGES =>
		sign_to_adder <= '1';
		comp_sel <= "001";
		out_mux_sel <= "011";
		sign_to_booth <= '1';

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
		sign_to_booth <= '0';

  when SGTUS =>
		sign_to_adder <= '1';
		comp_sel <= "000";
		out_mux_sel <= "011";
		sign_to_booth <= '0';

  when SLEUS =>
		sign_to_adder <= '1';
		comp_sel <= "011";
		out_mux_sel <= "011";
		sign_to_booth <= '0';

  when SGEUS =>
		sign_to_adder <= '1';
		comp_sel <= "001";
		out_mux_sel <= "011";
		sign_to_booth <= '0';

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

