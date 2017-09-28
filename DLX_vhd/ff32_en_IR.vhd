

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity ff32_en_IR is
generic (
	SIZE : integer := 32
);
PORT( 
	D: in std_logic_vector(SIZE - 1 downto 0);
	en : in std_logic;
	clk: in std_logic;
	rst: in std_logic;
	Q: out std_logic_vector(SIZE - 1 downto 0)
	);
end ff32_en_IR;

architecture behavioral of ff32_en_IR is
begin
	process(clk)
	begin
		if(rst='1') then
			Q <= X"54000000";
		else
		if(clk='1' and clk'EVENT) then
			if en = '1' then
				Q <= D;
			end if;
		end if;
		end if;
	end process;
end behavioral;