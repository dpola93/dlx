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

		OPCODE_IN	: in  std_logic_vector(OP_CODE_SIZE - 1 downto 0);	-- Instruction Register
		CW_OUT		: out std_logic_vector(CW_SIZE - 1 downto 0)
);
end cw_mem;

architecture bhe of cw_mem is

-- this is the microcode memory, it works as a LUT -> to decode an instruction it's opcode indexes this memory
  type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
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
	CW_OUT <= cw_mem(to_integer(unsigned(OPCODE_IN))); 
end bhe;
