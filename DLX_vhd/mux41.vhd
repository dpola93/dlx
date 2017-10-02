
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity mux41 is
	generic (
	MUX_SIZE : integer := 32
);
 port (
	IN0	: in std_logic_vector(MUX_SIZE - 1 downto 0);
	IN1	: in std_logic_vector(MUX_SIZE - 1 downto 0);
	IN2	: in std_logic_vector(MUX_SIZE - 1 downto 0);
	IN3	: in std_logic_vector(MUX_SIZE - 1 downto 0);
	CTRL	: in std_logic_vector(1 downto 0);
	OUT1	: out std_logic_vector(MUX_SIZE - 1 downto 0)

	);
end mux41;

architecture Bhe of mux41 is

begin
	process ( CTRL, IN0, IN1, IN2, IN3)
	begin
	case CTRL is
		when "00"	=> OUT1 <= IN0;
		when "01"	=> OUT1 <= IN1;
		when "10"	=> OUT1 <= IN2;
		when "11"	=> OUT1 <= IN3;
		when others	=> OUT1 <= (others => 'X');
	end case;
	end process;

end Bhe;
