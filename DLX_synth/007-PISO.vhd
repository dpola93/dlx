library ieee; 
use ieee.std_logic_1164.all; 

entity shift is 
  generic(
	N : natural := 8
	);
  port(
	Clock	: in  std_logic; 
	ALOAD	: in  std_logic; 
	D  	: in  std_logic_vector(N-1 downto 0); 
	SO 	: out std_logic
	); 
end shift; 

architecture archi of shift is 
  signal tmp: std_logic_vector(N-1 downto 0); 
  begin  
    process (Clock) 
      begin 
        if (Clock'event and Clock='1') then 
	  if (ALOAD='1') then 
            tmp <= D;
          else
            tmp <= '0'&tmp(N-1 downto 1) ; 
          end if; 
        end if; 
    end process; 
    SO <= tmp(0); 
end archi; 
