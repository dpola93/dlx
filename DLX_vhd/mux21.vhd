
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.myTypes.all;

entity mux21 is
	generic (
	SIZE : integer := 32
);
 port (
	IN0	: in std_logic_vector(SIZE - 1 downto 0);
	IN1	: in std_logic_vector(SIZE - 1 downto 0);
	CTRL	: in std_logic;
	OUT1	: out std_logic_vector(SIZE - 1 downto 0)

	);
end mux21;

architecture Bhe of mux21 is

begin
	process ( CTRL, IN0, IN1)
	begin
	case CTRL is
		when '0'	=> OUT1 <= IN0;
		when '1'	=> OUT1 <= IN1;
		when others	=> OUT1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	end case;
	end process;
end Bhe;
