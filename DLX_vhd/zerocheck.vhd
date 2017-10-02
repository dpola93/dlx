library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zerocheck is
	generic (
	SIZE : integer := 32
);
  port (
	IN0 : in	std_logic_vector(SIZE - 1 downto 0);
	CTRL: in	std_logic; -- when 0, out 1 if not equal . when 1 out 1 if equal
	OUT1 : out  std_logic

	);
end zerocheck;

architecture Bhe of zerocheck is
begin
	process(CTRL, IN0)
	begin
	case CTRL is
		when '0' =>
			if IN0 = "00000000000000000000000000000000" then
				OUT1 <= '0';
			else
				OUT1 <= '1';
			end if;
		when '1' =>
			if IN0 = "00000000000000000000000000000000" then
				OUT1 <= '1';
			else
				OUT1 <= '0';
			end if;
		when others => OUT1 <= 'X';
	end case;
	end process;
end Bhe;
