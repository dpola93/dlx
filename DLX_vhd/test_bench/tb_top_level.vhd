

library IEEE;

use IEEE.std_logic_1164.all;
use WORK.all;
use work.myTypes.all;

entity tb_top_level is
end tb_top_level;

architecture TEST of tb_top_level is

    signal Clock : std_logic := '0';
    signal Reset : std_logic := '1';

	signal IRAM_Addr	: std_logic_vector(31 downto 0);
	signal IRAM_Dout	: std_logic_vector(31 downto 0);
	signal DRAM_Addr	: std_logic_vector(31 downto 0);
	signal DRAM_Dout	: std_logic_vector(31 downto 0);
	signal DRAM_Din		: std_logic_vector(31 downto 0);
	signal DRAM_EN		: std_logic;
	signal DRAM_WR		: std_logic;

component top_level
	port(
	clock		: in  std_logic; 
	rst		: in  std_logic;
	IRAM_Addr_o	: out std_logic_vector(31 downto 0);
	IRAM_Dout_i	: in  std_logic_vector(31 downto 0);
	DRAM_Enable_o	: out std_logic;
	DRAM_WR_o	: out std_logic;
	DRAM_Din_o	: out std_logic_vector(31 downto 0);
	DRAM_Addr_o	: out std_logic_vector(31 downto 0);
	DRAM_Dout_i	: in  std_logic_vector(31 downto 0)
	); 
end component;

component IRAM
 port (
  Rst	: in  std_logic;
  Addr	: in  std_logic_vector(31 downto 0);
  Dout	: out std_logic_vector(31 downto 0)
  );

end component;

component DRAM
  generic (
	RAM_DEPTH	: integer := 4096;
	I_SIZE		: integer := 32);
 port (
	Clk 		: in  std_logic;
	Rst		: in  std_logic;
	Enable		: in  std_logic;
	WR		: in  std_logic;
	Din		: in  std_logic_vector(31 downto 0);
	Addr		: in  std_logic_vector(31 downto 0);
	Dout		: out std_logic_vector(31 downto 0)
  );
end component;

begin
-- TODO: MOVE THIS SHIT TO THE REAL TB

DUT:	top_level port map(
	Clock		=> clock, -- HEREEEEEEEEE 
	Rst		=> reset,
	IRAM_Addr_o	=> IRAM_Addr,
	IRAM_Dout_i	=> IRAM_Dout,
	DRAM_Enable_o	=> DRAM_EN,
	DRAM_WR_o	=> DRAM_WR,
	DRAM_Din_o	=> DRAM_Din,
	DRAM_Addr_o	=> DRAM_Addr,
	DRAM_Dout_i	=> DRAM_Dout
	);

DMEM:	DRAM generic map(
	RAM_DEPTH	=> 4096,
	I_SIZE		=> 32
	) 
	port map(
	Clk	=> clock, -- HEREEEEEEEEE 
	Rst	=> reset,
	Enable	=> DRAM_EN,
	WR	=> DRAM_WR,
	Din	=> DRAM_Din,
	Addr	=> DRAM_Addr,
	Dout	=> DRAM_Dout
	);

IMEM: IRAM port map(
Rst	=> Reset,
Addr	=> IRAM_Addr,
Dout	=> IRAM_Dout
);


        PCLOCK : process(Clock)
	begin
		Clock <= not(Clock) after 0.5 ns;	
	end process;
	
	Reset <= '1', '0' after 4 ns;
       

end TEST;

