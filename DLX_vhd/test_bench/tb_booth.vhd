
library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use WORK.all;
use work.myTypes.all;

entity tb_booth is
end tb_booth;

architecture TEST of tb_booth is

--component boothmul_pipelined
component simple_booth
	generic (N : integer := 16);

port(	
		Clock	: in std_logic;
		Reset	: in std_logic;
		sign	: in std_logic;
		enable	: in std_logic;
		busy	: out std_logic;
		A	: IN std_logic_vector (N-1 downto 0);
		B	: IN std_logic_vector (N-1 downto 0);
		P	: OUT std_logic_vector (2*N-1 downto 0)
		);
end component;


type P_in is array (8 downto 0) of std_logic_vector (31 downto 0);

signal fakeA,fakeB : std_logic_vector(15 downto 0);
signal fakeP : std_logic_vector(31 downto 0);
signal fakeS : std_logic;
signal Clock,Reset : std_logic := '0';
signal A : signed(15 downto 0):= to_signed(65530,16);
signal B : signed(15 downto 0):= to_signed(65534,16);
signal P_reg : P_in;

signal enable  : std_logic := '0';
signal busy : std_logic;

begin

--UT: boothmul_pipelined Port Map (Clock,Reset,fakeS,fakeA,fakeB,fakeP);
UT: simple_booth Port Map (Clock,Reset,fakeS,enable,busy,fakeA,fakeB,fakeP);

fakeA <= std_logic_vector(A);
fakeB <= std_logic_vector(B);
fakeS <= '1';
P_reg(0) <= std_logic_vector(A*B);
PCLOCK : process(Clock)
	begin
		Clock <= not(Clock) after 0.5 ns;	
	end process;

addvalue: process(Clock)
	begin
	if clock = '1' and clock'event then
		if busy = '0' and enable = '0' then
			assert signed(fakeP) = A*B report integer'image(to_integer(A*B)) & "  " &  integer'image(to_integer(signed(fakeP)))  severity error;
			A <= A+1;
			enable <= '1';
			if A = 0 then
				B <= B+1;
			end if;
		else
			enable <= '0';
		end if;
--	assert unsigned(fakeP) = unsigned(P_reg(8)) report integer'image(to_integer(unsigned(fakeP))) & "-" &  integer'image(to_integer(unsigned(P_reg(8))))  severity error;
	end if;
	end process;

	
	Reset <= '1', '0' after 4 ns;
end TEST;
