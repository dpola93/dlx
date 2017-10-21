library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity cw_mem is
	generic (
		MICROCODE_MEM_SIZE	: integer := 64;	-- Microcode Memory Size
		OP_CODE_SIZE		: integer := 6;		-- Op Code Size
		CW_SIZE			: integer := 13);	-- Control Word Size
	port (

		OPCODE_IN	: in  std_logic_vector(5 downto 0);	-- Instruction Register
		CW_OUT		: out std_logic_vector(CW_SIZE - 1 downto 0)
);
end cw_mem;

architecture bhe of cw_mem is
--  signal OPC : std_logic_vector(OP_CODE_SIZE -1 downto 0);
-- this is the microcode memory, it works as a LUT -> to decode an instruction it's opcode indexes this memory
  type mem_array is array (integer range 0 to 63) of std_logic_vector(12 downto 0);
  signal cw_mem : mem_array := ("0000000010001", -- (0X00) R type
                                 "0000000010001", -- (0X01) F type
                                 "1011000000000", -- (0X02) J
                                 "1011011110001", -- (0X03) JAL
                                 "1101000000000", -- (0X04) BEQZ 
                                 "1101100000000", -- (0X05) BNEZ
                                 "0000000000000", -- (0X06) BFPT
                                 "0000000000000", -- (0X07) BFPT
                                 "0001001100001", -- (0X08) ADDI
                                 "0000001100001", -- (0X09) ADDUI
                                 "0001001100001", -- (0X0A) SUBI
                                 "0000001100001", -- (0X0B) SUBUI
                                 "0000001100001", -- (0X0C) ANDI
                                 "0000001100001", -- (0X0D) ORI
                                 "0000001100001", -- (0X0E) XORI
                                 "0000000000000", -- (0X0F) LHI	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X10) RFE	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X11) TRAP	-- NOT IMPLEMENTED
                                 "0100000000000", -- (0X12) JR
                                 "0100011100001", -- (0X13) JALR
                                 "0000001100001", -- (0X14) SLLI
                                 "0000000000000", -- (0X15) NOP
                                 "0000001100001", -- (0X16) SRLI
                                 "0000001100001", -- (0X17) SRAI
                                 "0000001100001", -- (0X18) SEQI
                                 "0000001100001", -- (0X19) SNEI
                                 "0000001100001", -- (0X1A) SLTI
                                 "0000001100001", -- (0X1B) SGTI
                                 "0000001100001", -- (0X1C) SLEI
                                 "0000001100001", -- (0X1D) SGEI
                                 "0000000000000", -- (0X1E)
                                 "0000000000000", -- (0X1F)
                                 "0000000000000", -- (0X20) LB	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X21) LH	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X22) 
                                 "0000001101011", -- (0X23) LW
                                 "0000000000000", -- (0X24) LBU	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X25) LHU	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X26) LF	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X27) LD	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X28) SB	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X29) SH	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X2A) 
                                 "0000001101100", -- (0X2B) SW
                                 "0000000000000", -- (0X2C) 
                                 "0000000000000", -- (0X2D) 
                                 "0000000000000", -- (0X2E) SF	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X2F) SD	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X30) 
                                 "0000000000000", -- (0X31) 
                                 "0000000000000", -- (0X32) 
                                 "0000000000000", -- (0X33) 
                                 "0000000000000", -- (0X34) 
                                 "0000000000000", -- (0X35) 
                                 "0000000000000", -- (0X36) 
                                 "0000000000000", -- (0X37) 
                                 "0000000000000", -- (0X38) ITLB	-- NOT IMPLEMENTED
                                 "0000000000000", -- (0X39) 
                                 "0000001100001", -- (0X3A) SLTUI
                                 "0000001100001", -- (0X3B) SGTUI
                                 "0000001100001", -- (0X3C) SLEUI
                                 "0000001100001", -- (0X3D) SGEUI
                                 "0000000000000", -- (0X3E) 
                                 "0000000000000"  -- (0X3F) 
 				);

begin                                
-- 	CW_OUT <= cw_mem(to_integer(unsigned(OPCODE_IN))); 
--	CW_OUT <=	cw_mem(0) when OPCODE_IN = "0X00" else
--			cw_mem(1) when OPCODE_IN = "0X01" else
--			NULL;

process (OPCODE_IN)
begin
	case to_integer(unsigned(OPCODE_IN)) is
		when 0 => CW_OUT <= cw_mem(0);
		when 1 => CW_OUT <= cw_mem(1);	
		when 2 => CW_OUT <= cw_mem(2);	
		when 3 => CW_OUT <= cw_mem(3);	
		when 4 => CW_OUT <= cw_mem(4);	
		when 5 => CW_OUT <= cw_mem(5);	
		when 6 => CW_OUT <= cw_mem(6);	
		when 7 => CW_OUT <= cw_mem(7);	
		when 8 => CW_OUT <= cw_mem(8);	
		when 9 => CW_OUT <= cw_mem(9);	
		when 10 => CW_OUT <= cw_mem(10);	
		when 11 => CW_OUT <= cw_mem(11);	
		when 12 => CW_OUT <= cw_mem(12);	
		when 13 => CW_OUT <= cw_mem(13);	
		when 14 => CW_OUT <= cw_mem(14);	
		when 15 => CW_OUT <= cw_mem(15);	
		when 16 => CW_OUT <= cw_mem(16);	
		when 17 => CW_OUT <= cw_mem(17);	
		when 18 => CW_OUT <= cw_mem(18);	
		when 19 => CW_OUT <= cw_mem(19);	
		when 20 => CW_OUT <= cw_mem(20);	
		when 21 => CW_OUT <= cw_mem(21);	
		when 22 => CW_OUT <= cw_mem(22);	
		when 23 => CW_OUT <= cw_mem(23);	
		when 24 => CW_OUT <= cw_mem(24);	
		when 25 => CW_OUT <= cw_mem(25);	
		when 26 => CW_OUT <= cw_mem(26);	
		when 27 => CW_OUT <= cw_mem(27);	
		when 28 => CW_OUT <= cw_mem(28);	
		when 29 => CW_OUT <= cw_mem(29);	
		when 30 => CW_OUT <= cw_mem(30);	
		when 31 => CW_OUT <= cw_mem(31);	
		when 32 => CW_OUT <= cw_mem(32);	
		when 33 => CW_OUT <= cw_mem(33);	
		when 34 => CW_OUT <= cw_mem(34);	
		when 35 => CW_OUT <= cw_mem(35);	
		when 36 => CW_OUT <= cw_mem(36);	
		when 37 => CW_OUT <= cw_mem(37);	
		when 38 => CW_OUT <= cw_mem(38);	
		when 39 => CW_OUT <= cw_mem(39);	
		when 40 => CW_OUT <= cw_mem(40);	
		when 41 => CW_OUT <= cw_mem(41);	
		when 42 => CW_OUT <= cw_mem(42);	
		when 43 => CW_OUT <= cw_mem(43);	
		when 44 => CW_OUT <= cw_mem(44);	
		when 45 => CW_OUT <= cw_mem(45);	
		when 46 => CW_OUT <= cw_mem(46);	
		when 47 => CW_OUT <= cw_mem(47);	
		when 48 => CW_OUT <= cw_mem(48);	
		when 49 => CW_OUT <= cw_mem(49);	
		when 50 => CW_OUT <= cw_mem(50);	
		when 51 => CW_OUT <= cw_mem(51);	
		when 52 => CW_OUT <= cw_mem(52);	
		when 53 => CW_OUT <= cw_mem(53);	
		when 54 => CW_OUT <= cw_mem(54);	
		when 55 => CW_OUT <= cw_mem(55);	
		when 56 => CW_OUT <= cw_mem(56);	
		when 57 => CW_OUT <= cw_mem(57);	
		when 58 => CW_OUT <= cw_mem(58);	
		when 59 => CW_OUT <= cw_mem(59);	
		when 60 => CW_OUT <= cw_mem(60);	
		when 61 => CW_OUT <= cw_mem(61);	
		when 62 => CW_OUT <= cw_mem(62);	
		when 63 => CW_OUT <= cw_mem(63);	
		when others => NULL;
	end case;
end process;
	
end bhe;
