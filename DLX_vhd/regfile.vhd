library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use WORK.all;

entity RegFile is
    generic(
       databit: natural := 32;
       addrbit: natural := 5
       );
 port ( Clk: 		IN std_logic;
         Rst: 		IN std_logic;
	 ENABLE: 	IN std_logic;
	 RD1: 		IN std_logic;
	 RD2: 		IN std_logic;
	 WR: 		IN std_logic;
	 ADD_WR: 	IN std_logic_vector(addrbit-1 downto 0);
	 ADD_RD1: 	IN std_logic_vector(addrbit-1 downto 0);
	 ADD_RD2: 	IN std_logic_vector(addrbit-1 downto 0);
	 DATAIN: 	IN std_logic_vector(databit-1 downto 0);
    	 OUT1: 		OUT std_logic_vector(databit-1 downto 0);
	 OUT2: 		OUT std_logic_vector(databit-1 downto 0));
end RegFile;

architecture A of RegFile is

        -- suggested structures
        subtype REG_ADDR is natural range 0 to 31; -- using natural type
	type REG_ARRAY is array(REG_ADDR) of std_logic_vector(databit-1 downto 0); 
	signal REGISTERS : REG_ARRAY; 

	
begin 
-- write your RF code 
process(clk)
    begin
        if(clk = '1' and clk'event) then
        if(Rst = '1') then
           --reset behavior
           for i in 0 to 31 loop
              REGISTERS(i) <= (others => '0');
           end loop;
           out1<= (others =>'0');
           out2<= (others =>'0');
        else if(enable = '1') then
           --normal behavior
           if(wr = '1') then
              --write
              REGISTERS(conv_integer(ADD_WR)) <= DATAIN;
           end if;
           if(rd1 = '1') then
              --read first
              out1 <= REGISTERS(conv_integer(ADD_RD1));
           end if;
           if(rd2 = '1') then
              --read second
              out2 <= REGISTERS(conv_integer(ADD_RD2));
           end if;
        end if;
        end if;
    end if;
end process;
      
end A;

----
