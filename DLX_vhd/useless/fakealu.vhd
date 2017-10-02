
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity fakeALU is
  generic (
    DATA_SIZE : integer := 32);
  port (
    IN1 : in  std_logic_vector(DATA_SIZE - 1 downto 0);
    IN2 : in  std_logic_vector(DATA_SIZE - 1 downto 0);
    OP : in AluOp;
    DOUT : out std_logic_vector(DATA_SIZE - 1 downto 0);
    ZEROUT : out std_logic;
    stall_o : out std_logic;
    Clock : in std_logic;
    Reset : in std_logic
    );

end fakeALU;

architecture Bhe of fakealu is		

component fake_mult
  port (
    IN1 : in  std_logic_vector(31 downto 0);
    IN2 : in  std_logic_vector(31 downto 0);
    DOUT : out std_logic_vector(31 downto 0);
    stall_o : out std_logic;
    enable : in std_logic;
    Clock : in std_logic;
    Reset : in std_logic
    );
end component;



signal enable2mult : std_logic := '0';
signal multDATA : std_logic_vector(31 downto 0);

begin



MULT: fake_mult port Map(
    IN1 => IN1,
    IN2 => IN2,
    DOUT => multDATA,
    stall_o => stall_o,
    enable => enable2mult,
    Clock => Clock,
    Reset => Reset
    );


ZEROUT <= '0';
process(IN1,IN2,OP,multDATA)
begin
  case OP is
    when NOP => DOUT <= (others => '0');
    when SLLS => DOUT <= (others => '0');
    when SRLS => DOUT <= (others => '0');
    when SRAS => DOUT <= (others => '0');
    when ADDS => DOUT <= std_logic_vector(signed(IN1)+signed(IN2));
    when ADDUS => DOUT <= std_logic_vector(unsigned(IN1)+unsigned(IN2));
    when SUBS => DOUT <=  std_logic_vector(signed(IN1)-signed(IN2));
    when SUBUS => DOUT <= std_logic_vector(unsigned(IN1)-unsigned(IN2));
    when ANDS => DOUT <= IN1 and IN2;
    when ORS => DOUT <= IN1 or IN2;
    when XORS => DOUT <= IN1 xor IN2;
    when SEQS => 
	if(IN1 = IN2) then
        DOUT <= X"00000001";
        else 
        DOUT <= X"00000000";
        end if;
    when SNES =>
        if(IN1 /= IN2) then
        DOUT <= X"00000001";
        else 
        DOUT <= X"00000000";
        end if;
    when SLTS =>
        if(signed(IN1) < signed(IN2)) then
        DOUT <= X"00000001";
        else 
        DOUT <= X"00000000";
        end if;
    when SGTS => DOUT <= (others => '0');
    when SLES =>
        if(signed(IN1) <= signed(IN2)) then
        DOUT <= X"00000001";
        else 
        DOUT <= X"00000000";
        end if;
    when SGES =>
        if(signed(IN1) >= signed(IN2)) then
        DOUT <= X"00000001";
        else 
        DOUT <= X"00000000";
        end if;
    when MOVI2SS => DOUT <= (others => '0');
    when MOVS2IS => DOUT <= (others => '0');
    when MOVFS => DOUT <= (others => '0');
    when MOVDS => DOUT <= (others => '0');
    when MOVFP2IS => DOUT <= (others => '0');
    when MOVI2FP => DOUT <= (others => '0');
    when MOVI2TS => DOUT <= (others => '0');
    when MOVT2IS => DOUT <= (others => '0');
    when SLTUS => DOUT <= (others => '0');
    when SGTUS => DOUT <= (others => '0');
    when SLEUS => DOUT <= (others => '0');
    when SGEU => DOUT <= (others => '0');
    when MULTU => 
		DOUT <= multDATA;
		enable2mult <= '1';
    when others => DOUT <= (others => '0');
  end case;
end process;

end Bhe;


