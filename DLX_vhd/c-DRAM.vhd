library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


-- Data memory for DLX
-- Memory filled by a process which reads from a file
-- file name is "data.mem"
entity DRAM is
  generic (
    RAM_DEPTH : natural := 4096;
    I_SIZE : integer := 32);
  port (
    Clk  : in  std_logic;
    Rst  : in  std_logic;
    Enable : in std_logic;
    WR : in std_logic;
    Din : in std_logic_vector(I_SIZE - 1 downto 0);
    Addr : in  std_logic_vector(I_SIZE - 1 downto 0);
    Dout : out std_logic_vector(I_SIZE - 1 downto 0)
    );

end DRAM;

architecture DRam_Bhe of DRAM is

  type RAMtype is array (0 to RAM_DEPTH - 1) of std_logic_vector(I_SIZE - 1 downto 0);-- std_logic_vector(I_SIZE - 1 downto 0);

  signal DRAM_mem : RAMtype;

begin  -- DRam_Bhe
--  Dout <= DRAM_mem(to_integer(unsigned(Addr))/4) when WR = '0' and Enable = '1' else (others => 'Z');


  -- purpose: This process is in charge of filling the Instruction RAM with the firmware
  -- type   : combinational
  -- inputs : Rst
  -- outputs: DRAM_mem
  FILL_MEM_P: process (Rst,Clk)
    file mem_fp2: text;
    variable file_line2 : line;
    variable index2 : integer := 0;
    variable tmp_data_u2 : std_logic_vector(I_SIZE-1 downto 0);
  begin  -- process FILL_MEM_P
    if (Rst = '1') then
      file_open(mem_fp2,"DLX_vhd/test_bench/data.mem",READ_MODE);
      report "RESETTT:";
	
      while (not endfile(mem_fp2)) loop
        readline(mem_fp2,file_line2);
        hread(file_line2,tmp_data_u2);
        DRAM_mem(index2) <= tmp_data_u2;       
        index2 := index2 + 1;
      end loop;
    else
	if(clk'event and clk = '0') then
	if(Enable = '1' and Wr = '1') then
		DRAM_mem(to_integer(unsigned(Addr))/4) <= Din;
		report "i = " & integer'image(to_integer(unsigned(Addr)));
	elsif ( Enable = '1' and WR='0' ) then
  		Dout <= DRAM_mem(to_integer(unsigned(Addr))/4);
	end if;
	end if;
    end if;
  end process FILL_MEM_P;

end DRam_Bhe;
