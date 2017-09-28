library IEEE;

use IEEE.std_logic_1164.all;
use WORK.all;
use work.myTypes.all;

entity tb_fw_logic is
end tb_fw_logic;

architecture TEST of tb_fw_logic is


component fw_logic is
  port (
	D2_i : in std_logic_vector(4 downto 0);
	D3_i : in std_logic_vector(4 downto 0);
	rA_i : in std_logic_vector(4 downto 0);
	rB_i : in std_logic_vector(4 downto 0);
	S_mem_W : in std_logic;
	S_mem_LOAD : in std_logic;
	S_wb_W : in std_logic;
	S_FWA : out std_logic_vector(1 downto 0);
	S_FWB : out std_logic_vector(1 downto 0)
	);
end component;


signal fake_D2,fake_D3,fake_rA,fake_rB : std_logic_vector(4 downto 0);
signal fake_memW,fake_memLOAD,fake_wbW : std_logic;

begin

UT: fw_logic Port Map (fake_D2,fake_D3,fake_rA,fake_rB,fake_memW,fake_memLOAD,fake_wbW,open,open);

fake_D2 <= "00000" , "00001" after 1 ns;
fake_D3 <= "00000";
fake_rA <= "00001", "00000" after 4 ns;
fake_rB <= "00000";
fake_memW <= '0', '1' after 1 ns;
fake_memLOAD <= '0', '1' after 2 ns;
fake_wbW <= '0', '1' after 3 ns;

end TEST;

