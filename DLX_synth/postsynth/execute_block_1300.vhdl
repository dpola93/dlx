
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_execute_block is

-- define attributes
attribute ENUM_ENCODING : STRING;

-- define any necessary types
type aluOp is (NOP, SLLS, SRLS, SRAS, ADDS, ADDUS, SUBS, SUBUS, ANDS, ORS, 
   XORS, SEQS, SNES, SLTS, SGTS, SLES, SGES, MOVI2SS, MOVS2IS, MOVFS, MOVDS, 
   MOVFP2IS, MOVI2FP, MOVI2TS, MOVT2IS, SLTUS, SGTUS, SLEUS, SGEUS, MULTU, 
   MULTS);
attribute ENUM_ENCODING of aluOp : type is 
   "00000 00001 00010 00011 00100 00101 00110 00111 01000 01001 01010 01011 01100 01101 01110 01111 10000 10001 10010 10011 10100 10101 10110 10111 11000 11001 11010 11011 11100 11101 11110";
   
   -- Declarations for conversion functions.
   function aluOp_to_std_logic_vector(arg : in aluOp) return std_logic_vector;

end CONV_PACK_execute_block;

package body CONV_PACK_execute_block is
   
   -- enum type to std_logic_vector function
   function aluOp_to_std_logic_vector(arg : in aluOp) return std_logic_vector 
   is
   -- synopsys built_in SYN_FEED_THRU;
   begin
      case arg is
         when NOP => return "00000";
         when SLLS => return "00001";
         when SRLS => return "00010";
         when SRAS => return "00011";
         when ADDS => return "00100";
         when ADDUS => return "00101";
         when SUBS => return "00110";
         when SUBUS => return "00111";
         when ANDS => return "01000";
         when ORS => return "01001";
         when XORS => return "01010";
         when SEQS => return "01011";
         when SNES => return "01100";
         when SLTS => return "01101";
         when SGTS => return "01110";
         when SLES => return "01111";
         when SGES => return "10000";
         when MOVI2SS => return "10001";
         when MOVS2IS => return "10010";
         when MOVFS => return "10011";
         when MOVDS => return "10100";
         when MOVFP2IS => return "10101";
         when MOVI2FP => return "10110";
         when MOVI2TS => return "10111";
         when MOVT2IS => return "11000";
         when SLTUS => return "11001";
         when SGTUS => return "11010";
         when SLEUS => return "11011";
         when SGEUS => return "11100";
         when MULTU => return "11101";
         when MULTS => return "11110";
         when others => assert FALSE -- this should not happen.
               report "un-convertible value"
               severity warning;
               return "00000";
      end case;
   end;

end CONV_PACK_execute_block;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_63 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_63;

architecture SYN_BEHAVIORAL of FA_63 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_62 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_62;

architecture SYN_BEHAVIORAL of FA_62 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_61 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_61;

architecture SYN_BEHAVIORAL of FA_61 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_60 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_60;

architecture SYN_BEHAVIORAL of FA_60 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_59 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_59;

architecture SYN_BEHAVIORAL of FA_59 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n4, n5, n6 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : OR2_X1 port map( A1 => B, A2 => A, ZN => n5);
   U3 : NAND2_X1 port map( A1 => Ci, A2 => n5, ZN => n3);
   U4 : NAND2_X1 port map( A1 => n3, A2 => n4, ZN => Co);
   U5 : NAND2_X1 port map( A1 => B, A2 => A, ZN => n4);
   U6 : XNOR2_X1 port map( A => B, B => A, ZN => n6);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_58 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_58;

architecture SYN_BEHAVIORAL of FA_58 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U3 : NAND2_X1 port map( A1 => n4, A2 => n5, ZN => Co);
   U2 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n5);
   U4 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n4);
   U5 : XNOR2_X1 port map( A => B, B => A, ZN => n6);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_57 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_57;

architecture SYN_BEHAVIORAL of FA_57 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_56 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_56;

architecture SYN_BEHAVIORAL of FA_56 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XOR2_X1 port map( A => B, B => A, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_55 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_55;

architecture SYN_BEHAVIORAL of FA_55 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_54 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_54;

architecture SYN_BEHAVIORAL of FA_54 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_53 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_53;

architecture SYN_BEHAVIORAL of FA_53 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_52 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_52;

architecture SYN_BEHAVIORAL of FA_52 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => B, A2 => A, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_51 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_51;

architecture SYN_BEHAVIORAL of FA_51 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_50 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_50;

architecture SYN_BEHAVIORAL of FA_50 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_49 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_49;

architecture SYN_BEHAVIORAL of FA_49 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_48 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_48;

architecture SYN_BEHAVIORAL of FA_48 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XOR2_X1 port map( A => A, B => B, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_47 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_47;

architecture SYN_BEHAVIORAL of FA_47 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n5, n6, n7 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n6, A2 => n5, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n7, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n7);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n5);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n6);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_46 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_46;

architecture SYN_BEHAVIORAL of FA_46 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_45 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_45;

architecture SYN_BEHAVIORAL of FA_45 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_44 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_44;

architecture SYN_BEHAVIORAL of FA_44 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XNOR2_X1 port map( A => A, B => B, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_43 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_43;

architecture SYN_BEHAVIORAL of FA_43 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_42 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_42;

architecture SYN_BEHAVIORAL of FA_42 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_41 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_41;

architecture SYN_BEHAVIORAL of FA_41 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_40 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_40;

architecture SYN_BEHAVIORAL of FA_40 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => B, B => A, Z => S);
   U2 : AND2_X1 port map( A1 => B, A2 => A, ZN => Co);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_39 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_39;

architecture SYN_BEHAVIORAL of FA_39 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_38 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_38;

architecture SYN_BEHAVIORAL of FA_38 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_37 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_37;

architecture SYN_BEHAVIORAL of FA_37 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n4, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n4);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_36 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_36;

architecture SYN_BEHAVIORAL of FA_36 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_35 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_35;

architecture SYN_BEHAVIORAL of FA_35 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_34 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_34;

architecture SYN_BEHAVIORAL of FA_34 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_33 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_33;

architecture SYN_BEHAVIORAL of FA_33 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n4, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n4);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_32 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_32;

architecture SYN_BEHAVIORAL of FA_32 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => B, B => A, Z => S);
   U2 : AND2_X1 port map( A1 => B, A2 => A, ZN => Co);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_31 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_31;

architecture SYN_BEHAVIORAL of FA_31 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_30 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_30;

architecture SYN_BEHAVIORAL of FA_30 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U4 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_29 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_29;

architecture SYN_BEHAVIORAL of FA_29 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_28 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_28;

architecture SYN_BEHAVIORAL of FA_28 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_27 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_27;

architecture SYN_BEHAVIORAL of FA_27 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_26 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_26;

architecture SYN_BEHAVIORAL of FA_26 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U4 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_25 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_25;

architecture SYN_BEHAVIORAL of FA_25 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_24 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_24;

architecture SYN_BEHAVIORAL of FA_24 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XOR2_X1 port map( A => B, B => A, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_23 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_23;

architecture SYN_BEHAVIORAL of FA_23 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : OAI21_X1 port map( B1 => B, B2 => A, A => Ci, ZN => n5);
   U4 : XNOR2_X1 port map( A => A, B => B, ZN => n6);
   U5 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_22 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_22;

architecture SYN_BEHAVIORAL of FA_22 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_21 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_21;

architecture SYN_BEHAVIORAL of FA_21 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_20 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_20;

architecture SYN_BEHAVIORAL of FA_20 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => B, A2 => A, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_19 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_19;

architecture SYN_BEHAVIORAL of FA_19 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : OAI21_X1 port map( B1 => B, B2 => A, A => Ci, ZN => n5);
   U2 : XNOR2_X1 port map( A => A, B => B, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_18 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_18;

architecture SYN_BEHAVIORAL of FA_18 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_17 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_17;

architecture SYN_BEHAVIORAL of FA_17 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_16 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_16;

architecture SYN_BEHAVIORAL of FA_16 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XOR2_X1 port map( A => B, B => A, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_15 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_15;

architecture SYN_BEHAVIORAL of FA_15 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_14 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_14;

architecture SYN_BEHAVIORAL of FA_14 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_13 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_13;

architecture SYN_BEHAVIORAL of FA_13 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_12 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_12;

architecture SYN_BEHAVIORAL of FA_12 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : OR2_X1 port map( A1 => B, A2 => A, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_11 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_11;

architecture SYN_BEHAVIORAL of FA_11 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_10 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_10;

architecture SYN_BEHAVIORAL of FA_10 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_9 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_9;

architecture SYN_BEHAVIORAL of FA_9 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_8 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_8;

architecture SYN_BEHAVIORAL of FA_8 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => A, A2 => B, ZN => Co);
   U2 : XOR2_X1 port map( A => B, B => A, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_7 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_7;

architecture SYN_BEHAVIORAL of FA_7 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_6 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_6;

architecture SYN_BEHAVIORAL of FA_6 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_5 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_5;

architecture SYN_BEHAVIORAL of FA_5 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_4 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_4;

architecture SYN_BEHAVIORAL of FA_4 is

   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => S);
   U1 : OR2_X1 port map( A1 => B, A2 => A, ZN => Co);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_3 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_3;

architecture SYN_BEHAVIORAL of FA_3 is

   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_2 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_2;

architecture SYN_BEHAVIORAL of FA_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n4, n5, n6 : std_logic;

begin
   
   U5 : OAI21_X1 port map( B1 => A, B2 => B, A => Ci, ZN => n5);
   U4 : NAND2_X1 port map( A1 => A, A2 => B, ZN => n4);
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n6);
   U1 : XNOR2_X1 port map( A => Ci, B => n6, ZN => S);
   U3 : NAND2_X1 port map( A1 => n5, A2 => n4, ZN => Co);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_1 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_1;

architecture SYN_BEHAVIORAL of FA_1 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U2 : XNOR2_X1 port map( A => B, B => A, ZN => n3);
   U1 : XNOR2_X1 port map( A => Ci, B => n3, ZN => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_7 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_7;

architecture SYN_Bhe of mux21_SIZE4_7 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U4 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_6 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_6;

architecture SYN_Bhe of mux21_SIZE4_6 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U4 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_5 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_5;

architecture SYN_Bhe of mux21_SIZE4_5 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U4 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_4 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_4;

architecture SYN_Bhe of mux21_SIZE4_4 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U4 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));
   U3 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_3 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_3;

architecture SYN_Bhe of mux21_SIZE4_3 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5 : std_logic;

begin
   
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : INV_X1 port map( A => IN0(0), ZN => n2);
   U4 : OR2_X1 port map( A1 => CTRL, A2 => n4, ZN => n1);
   U5 : NAND2_X1 port map( A1 => n1, A2 => n5, ZN => OUT1(1));
   U6 : INV_X1 port map( A => IN0(1), ZN => n4);
   U7 : NAND2_X1 port map( A1 => CTRL, A2 => IN1(0), ZN => n3);
   U8 : OAI21_X1 port map( B1 => CTRL, B2 => n2, A => n3, ZN => OUT1(0));
   U9 : NAND2_X1 port map( A1 => CTRL, A2 => IN1(1), ZN => n5);

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_2 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_2;

architecture SYN_Bhe of mux21_SIZE4_2 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));
   U4 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_1 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_1;

architecture SYN_Bhe of mux21_SIZE4_1 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));
   U2 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U3 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U4 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_15 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_15;

architecture SYN_STRUCTURAL of RCA_N4_15 is

   component FA_57
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_58
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_59
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_60
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561359 : std_logic;

begin
   
   FAI_1 : FA_60 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_59 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_58 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_57 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561359);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_14 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_14;

architecture SYN_STRUCTURAL of RCA_N4_14 is

   component FA_53
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_54
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_55
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_56
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561358 : std_logic;

begin
   
   FAI_1 : FA_56 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_55 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_54 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_53 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561358);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_13 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_13;

architecture SYN_STRUCTURAL of RCA_N4_13 is

   component FA_49
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_50
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_51
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_52
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561357 : std_logic;

begin
   
   FAI_1 : FA_52 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_51 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_50 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_49 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561357);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_12 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_12;

architecture SYN_STRUCTURAL of RCA_N4_12 is

   component FA_45
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_46
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_47
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_48
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n2, CTMP_3_port, CTMP_2_port, n1, net561356 : std_logic;

begin
   
   FAI_1 : FA_48 port map( A => A(0), B => B(0), Ci => n2, S => S(0), Co => n1)
                           ;
   FAI_2 : FA_47 port map( A => A(1), B => B(1), Ci => n1, S => S(1), Co => 
                           CTMP_2_port);
   FAI_3 : FA_46 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_45 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561356);
   n2 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_11 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_11;

architecture SYN_STRUCTURAL of RCA_N4_11 is

   component FA_41
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_42
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_43
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_44
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561355 : std_logic;

begin
   
   FAI_1 : FA_44 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_43 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_42 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_41 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561355);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_10 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_10;

architecture SYN_STRUCTURAL of RCA_N4_10 is

   component FA_37
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_38
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_39
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_40
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n2, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561354 : std_logic;

begin
   
   FAI_1 : FA_40 port map( A => A(0), B => B(0), Ci => n2, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_39 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_38 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_37 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561354);
   n2 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_9 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_9;

architecture SYN_STRUCTURAL of RCA_N4_9 is

   component FA_33
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_34
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_35
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_36
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n2, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561353 : std_logic;

begin
   
   FAI_1 : FA_36 port map( A => A(0), B => B(0), Ci => n2, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_35 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_34 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_33 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561353);
   n2 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_8 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_8;

architecture SYN_STRUCTURAL of RCA_N4_8 is

   component FA_29
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_30
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_31
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_32
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561352 : std_logic;

begin
   
   FAI_1 : FA_32 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_31 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_30 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_29 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561352);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_7 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_7;

architecture SYN_STRUCTURAL of RCA_N4_7 is

   component FA_25
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_26
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_27
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_28
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561351 : std_logic;

begin
   
   FAI_1 : FA_28 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_27 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_26 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_25 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561351);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_6 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_6;

architecture SYN_STRUCTURAL of RCA_N4_6 is

   component FA_21
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_22
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_23
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_24
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561350 : std_logic;

begin
   
   FAI_1 : FA_24 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_23 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_22 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_21 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561350);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_5 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_5;

architecture SYN_STRUCTURAL of RCA_N4_5 is

   component FA_17
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_18
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_19
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_20
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561349 : std_logic;

begin
   
   FAI_1 : FA_20 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_19 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_18 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_17 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561349);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_4 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_4;

architecture SYN_STRUCTURAL of RCA_N4_4 is

   component FA_13
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_14
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_15
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_16
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561348 : std_logic;

begin
   
   FAI_1 : FA_16 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_15 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_14 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_13 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561348);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_3 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_3;

architecture SYN_STRUCTURAL of RCA_N4_3 is

   component FA_9
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_10
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_11
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_12
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561347 : std_logic;

begin
   
   FAI_1 : FA_12 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_11 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_10 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_9 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561347);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_2 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_2;

architecture SYN_STRUCTURAL of RCA_N4_2 is

   component FA_5
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_6
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_7
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_8
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561346 : std_logic;

begin
   
   FAI_1 : FA_8 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_7 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_6 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_5 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561346);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_1 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_1;

architecture SYN_STRUCTURAL of RCA_N4_1 is

   component FA_1
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_2
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_3
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_4
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561345 : std_logic;

begin
   
   FAI_1 : FA_4 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_3 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_2 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_1 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561345);
   n1 <= '1';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_N9_1 is

   port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);  
         SO : out std_logic);

end shift_N9_1;

architecture SYN_archi of shift_N9_1 is

   component SDFF_X2
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component SDFF_X1
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal tmp_8_port, tmp_7_port, tmp_6_port, tmp_5_port, tmp_4_port, 
      tmp_3_port, tmp_2_port, tmp_1_port, n2, n3, n4, n5, n6, n7, n8, n9, n10, 
      n11 : std_logic;

begin
   
   tmp_reg_3_inst : SDFF_X1 port map( D => tmp_4_port, SI => D(3), SE => ALOAD,
                           CK => Clock, Q => tmp_3_port, QN => n11);
   tmp_reg_7_inst : SDFF_X1 port map( D => tmp_8_port, SI => D(7), SE => ALOAD,
                           CK => Clock, Q => tmp_7_port, QN => n10);
   tmp_reg_5_inst : SDFF_X1 port map( D => tmp_6_port, SI => D(5), SE => ALOAD,
                           CK => Clock, Q => tmp_5_port, QN => n9);
   tmp_reg_4_inst : SDFF_X1 port map( D => tmp_5_port, SI => D(4), SE => ALOAD,
                           CK => Clock, Q => tmp_4_port, QN => n8);
   tmp_reg_8_inst : SDFF_X1 port map( D => n6, SI => D(8), SE => ALOAD, CK => 
                           Clock, Q => tmp_8_port, QN => n7);
   tmp_reg_6_inst : SDFF_X1 port map( D => tmp_7_port, SI => D(6), SE => ALOAD,
                           CK => Clock, Q => tmp_6_port, QN => n5);
   tmp_reg_1_inst : SDFF_X1 port map( D => tmp_2_port, SI => D(1), SE => ALOAD,
                           CK => Clock, Q => tmp_1_port, QN => n4);
   tmp_reg_2_inst : SDFF_X1 port map( D => tmp_3_port, SI => D(2), SE => ALOAD,
                           CK => Clock, Q => tmp_2_port, QN => n3);
   tmp_reg_0_inst : SDFF_X2 port map( D => tmp_1_port, SI => D(0), SE => ALOAD,
                           CK => Clock, Q => SO, QN => n2);
   n6 <= '0';

end SYN_archi;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_8 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_8;

architecture SYN_bhe of booth_encoder_8 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n9, n10, n11, n12 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n9, B1 => n12, 
                           B2 => n11, B3 => B_in(2), ZN => A_out(0));
   U6 : INV_X1 port map( A => B_in(1), ZN => n11);
   U3 : INV_X1 port map( A => B_in(2), ZN => n9);
   U4 : INV_X1 port map( A => B_in(0), ZN => n12);
   U5 : OAI221_X1 port map( B1 => B_in(1), B2 => n12, C1 => n11, C2 => B_in(2),
                           A => n10, ZN => A_out(2));
   U7 : NAND2_X1 port map( A1 => B_in(2), A2 => n12, ZN => n10);
   U8 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n9, ZN => 
                           A_out(1));

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_7 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_7;

architecture SYN_bhe of booth_encoder_7 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U6 : INV_X1 port map( A => B_in(1), ZN => n10);
   U3 : INV_X1 port map( A => B_in(0), ZN => n11);
   U4 : INV_X1 port map( A => B_in(2), ZN => n8);
   U5 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));
   U7 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U8 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_6 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_6;

architecture SYN_bhe of booth_encoder_6 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U3 : INV_X1 port map( A => B_in(2), ZN => n8);
   U4 : INV_X1 port map( A => B_in(1), ZN => n10);
   U5 : INV_X1 port map( A => B_in(0), ZN => n11);
   U6 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U7 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);
   U8 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_5 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_5;

architecture SYN_bhe of booth_encoder_5 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U3 : INV_X1 port map( A => B_in(2), ZN => n8);
   U4 : INV_X1 port map( A => B_in(1), ZN => n10);
   U5 : INV_X1 port map( A => B_in(0), ZN => n11);
   U6 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));
   U7 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U8 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_4 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_4;

architecture SYN_bhe of booth_encoder_4 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U3 : INV_X1 port map( A => B_in(2), ZN => n8);
   U4 : INV_X1 port map( A => B_in(1), ZN => n10);
   U5 : INV_X1 port map( A => B_in(0), ZN => n11);
   U6 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U7 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);
   U8 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_3 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_3;

architecture SYN_bhe of booth_encoder_3 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U3 : INV_X1 port map( A => B_in(1), ZN => n10);
   U4 : INV_X1 port map( A => B_in(0), ZN => n11);
   U5 : INV_X1 port map( A => B_in(2), ZN => n8);
   U6 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U7 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);
   U8 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_2 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_2;

architecture SYN_bhe of booth_encoder_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n8, n9, n10, n11 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n11, 
                           B2 => n10, B3 => B_in(2), ZN => A_out(0));
   U3 : INV_X1 port map( A => B_in(1), ZN => n10);
   U4 : INV_X1 port map( A => B_in(0), ZN => n11);
   U5 : INV_X1 port map( A => B_in(2), ZN => n8);
   U6 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));
   U7 : OAI221_X1 port map( B1 => B_in(1), B2 => n11, C1 => n10, C2 => B_in(2),
                           A => n9, ZN => A_out(2));
   U8 : NAND2_X1 port map( A1 => B_in(2), A2 => n11, ZN => n9);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_1 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_1;

architecture SYN_bhe of booth_encoder_1 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n7, n8, n9 : std_logic;

begin
   
   U9 : OAI33_X1 port map( A1 => B_in(0), A2 => B_in(1), A3 => n8, B1 => n9, B2
                           => n8, B3 => B_in(2), ZN => A_out(0));
   U4 : NAND2_X1 port map( A1 => B_in(2), A2 => n9, ZN => n7);
   U3 : OAI221_X1 port map( B1 => B_in(1), B2 => n9, C1 => n8, C2 => B_in(2), A
                           => n7, ZN => A_out(2));
   U5 : INV_X1 port map( A => B_in(0), ZN => n9);
   U6 : INV_X1 port map( A => B_in(1), ZN => n8);
   U7 : AOI21_X1 port map( B1 => B_in(0), B2 => B_in(1), A => n8, ZN => 
                           A_out(1));

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_7 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_7;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_7 is

   component mux21_SIZE4_7
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_13
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_14
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561343, net561344 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_14 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561344);
   rca_carry : RCA_N4_13 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561343);
   outmux : mux21_SIZE4_7 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_6 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_6;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_6 is

   component mux21_SIZE4_6
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_11
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_12
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561341, net561342 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_12 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561342);
   rca_carry : RCA_N4_11 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561341);
   outmux : mux21_SIZE4_6 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_5 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_5;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_5 is

   component mux21_SIZE4_5
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_9
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_10
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561339, net561340 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_10 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561340);
   rca_carry : RCA_N4_9 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561339);
   outmux : mux21_SIZE4_5 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_4 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_4;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_4 is

   component mux21_SIZE4_4
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_7
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_8
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561337, net561338 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_8 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561338);
   rca_carry : RCA_N4_7 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561337);
   outmux : mux21_SIZE4_4 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_3 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_3;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_3 is

   component mux21_SIZE4_3
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_5
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_6
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561335, net561336 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_6 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561336);
   rca_carry : RCA_N4_5 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561335);
   outmux : mux21_SIZE4_3 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_2 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_2;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_2 is

   component mux21_SIZE4_2
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_3
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_4
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561333, net561334 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_4 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561334);
   rca_carry : RCA_N4_3 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561333);
   outmux : mux21_SIZE4_2 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_1 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_1;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_1 is

   component mux21_SIZE4_1
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_1
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_2
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561331, net561332 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_2 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561332);
   rca_carry : RCA_N4_1 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561331);
   outmux : mux21_SIZE4_1 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_26 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_26;

architecture SYN_beh of pg_26 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => g_out);
   U2 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U3 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_25 is

   port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out std_logic
         );

end pg_25;

architecture SYN_beh of pg_25 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U2 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => g_out_BAR);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_24 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_24;

architecture SYN_beh of pg_24 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => g, ZN => n3);
   U2 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U4 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_23 is

   port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out std_logic
         );

end pg_23;

architecture SYN_beh of pg_23 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => g_out_BAR);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_22 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_22;

architecture SYN_beh of pg_22 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U2 : INV_X1 port map( A => g, ZN => n3);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U4 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_21 is

   port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out std_logic
         );

end pg_21;

architecture SYN_beh of pg_21 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => g_out_BAR);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_20 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_20;

architecture SYN_beh of pg_20 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U1 : CLKBUF_X1 port map( A => p, Z => n3);
   U2 : INV_X1 port map( A => n4, ZN => g_out);
   U3 : AND2_X1 port map( A1 => n3, A2 => p_prec, ZN => p_out);
   U4 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n4);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_19 is

   port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out std_logic
         );

end pg_19;

architecture SYN_beh of pg_19 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => g_out_BAR);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_18 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_18;

architecture SYN_beh of pg_18 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);
   U3 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_17 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_17;

architecture SYN_beh of pg_17 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => g_out);
   U2 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_16 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_16;

architecture SYN_beh of pg_16 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_15 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_15;

architecture SYN_beh of pg_15 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => g_out);
   U2 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_14 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_14;

architecture SYN_beh of pg_14 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_13 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_13;

architecture SYN_beh of pg_13 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_12 is

   port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
         g_BAR : in std_logic);

end pg_12;

architecture SYN_beh of pg_12 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : NAND2_X1 port map( A1 => n3, A2 => g_BAR, ZN => g_out);
   U3 : NAND2_X1 port map( A1 => p, A2 => g_prec, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_11 is

   port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
         g_BAR : in std_logic);

end pg_11;

architecture SYN_beh of pg_11 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U3 : NAND2_X1 port map( A1 => n2, A2 => g_BAR, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_10 is

   port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
         g_BAR : in std_logic);

end pg_10;

architecture SYN_beh of pg_10 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U2 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U3 : NAND2_X1 port map( A1 => n2, A2 => g_BAR, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_9 is

   port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
         g_BAR : in std_logic);

end pg_9;

architecture SYN_beh of pg_9 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : NAND2_X1 port map( A1 => n2, A2 => g_BAR, ZN => g_out);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_8 is

   port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out std_logic
         );

end pg_8;

architecture SYN_beh of pg_8 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => p_prec, A2 => p, ZN => p_out);
   U2 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => g_out_BAR);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_7 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_7;

architecture SYN_beh of pg_7 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_6 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_6;

architecture SYN_beh of pg_6 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_5 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_5;

architecture SYN_beh of pg_5 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => g, ZN => n2);
   U2 : NAND2_X1 port map( A1 => n3, A2 => n2, ZN => g_out);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n3);
   U4 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_4 is

   port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
         g_BAR : in std_logic);

end pg_4;

architecture SYN_beh of pg_4 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U3 : NAND2_X1 port map( A1 => n2, A2 => g_BAR, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_3 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_3;

architecture SYN_beh of pg_3 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_2 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_2;

architecture SYN_beh of pg_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => g, ZN => n3);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U4 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_1 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_1;

architecture SYN_beh of pg_1 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U3 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n3);
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_9 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_9;

architecture SYN_beh of g_9 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AOI21_X1 port map( B1 => g_prec, B2 => p, A => g, ZN => n2);
   U2 : INV_X1 port map( A => n2, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_8 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_8;

architecture SYN_beh of g_8 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => n3, A2 => n2, ZN => g_out);
   U2 : INV_X1 port map( A => g, ZN => n2);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_7 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_7;

architecture SYN_beh of g_7 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => n3, A2 => n2, ZN => g_out);
   U2 : INV_X1 port map( A => g, ZN => n2);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_6 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_6;

architecture SYN_beh of g_6 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => g_out);
   U2 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_5 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_5;

architecture SYN_beh of g_5 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);
   U2 : INV_X1 port map( A => g, ZN => n3);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_4 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_4;

architecture SYN_beh of g_4 is

   component NAND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => g, ZN => n3);
   U2 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n2);
   U3 : NAND2_X2 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_3 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_3;

architecture SYN_beh of g_3 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => g, ZN => n2);
   U2 : NAND2_X1 port map( A1 => n3, A2 => n2, ZN => g_out);
   U3 : NAND2_X1 port map( A1 => g_prec, A2 => p, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_2 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_2;

architecture SYN_beh of g_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => p, A2 => g_prec, ZN => n3);
   U2 : INV_X1 port map( A => g, ZN => n2);
   U3 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_1 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_1;

architecture SYN_beh of g_1 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3 : std_logic;

begin
   
   U1 : INV_X1 port map( A => n3, ZN => g_out);
   U2 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n3);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_31 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_31;

architecture SYN_beh of pg_net_31 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => a, B => b, Z => p_out);
   U2 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_30 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_30;

architecture SYN_beh of pg_net_30 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : INV_X1 port map( A => a, ZN => n1);
   U2 : XNOR2_X1 port map( A => b, B => n1, ZN => p_out);
   U3 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_29 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_29;

architecture SYN_beh of pg_net_29 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_28 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_28;

architecture SYN_beh of pg_net_28 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_27 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_27;

architecture SYN_beh of pg_net_27 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);
   U2 : INV_X1 port map( A => a, ZN => n1);
   U3 : XNOR2_X1 port map( A => b, B => n1, ZN => p_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_26 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_26;

architecture SYN_beh of pg_net_26 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_25 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_25;

architecture SYN_beh of pg_net_25 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => a, B => b, Z => p_out);
   U2 : AND2_X1 port map( A1 => a, A2 => b, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_24 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_24;

architecture SYN_beh of pg_net_24 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_23 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_23;

architecture SYN_beh of pg_net_23 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_22 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_22;

architecture SYN_beh of pg_net_22 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_21 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_21;

architecture SYN_beh of pg_net_21 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : INV_X1 port map( A => a, ZN => n1);
   U2 : XNOR2_X1 port map( A => b, B => n1, ZN => p_out);
   U3 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_20 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_20;

architecture SYN_beh of pg_net_20 is

   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);
   U2 : INV_X1 port map( A => a, ZN => n1);
   U3 : XNOR2_X1 port map( A => b, B => n1, ZN => p_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_19 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_19;

architecture SYN_beh of pg_net_19 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_18 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_18;

architecture SYN_beh of pg_net_18 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_17 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_17;

architecture SYN_beh of pg_net_17 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U2 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_16 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_16;

architecture SYN_beh of pg_net_16 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U2 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_15 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_15;

architecture SYN_beh of pg_net_15 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_14 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_14;

architecture SYN_beh of pg_net_14 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U2 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_13 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_13;

architecture SYN_beh of pg_net_13 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_12 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_12;

architecture SYN_beh of pg_net_12 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => a, B => b, Z => p_out);
   U2 : AND2_X1 port map( A1 => a, A2 => b, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_11 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_11;

architecture SYN_beh of pg_net_11 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_10 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_10;

architecture SYN_beh of pg_net_10 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_9 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_9;

architecture SYN_beh of pg_net_9 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_8 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_8;

architecture SYN_beh of pg_net_8 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_7 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_7;

architecture SYN_beh of pg_net_7 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_6 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_6;

architecture SYN_beh of pg_net_6 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U2 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_5 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_5;

architecture SYN_beh of pg_net_5 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_4 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_4;

architecture SYN_beh of pg_net_4 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_3 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_3;

architecture SYN_beh of pg_net_3 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_2 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_2;

architecture SYN_beh of pg_net_2 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : XOR2_X1 port map( A => b, B => a, Z => p_out);
   U1 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_1 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_1;

architecture SYN_beh of pg_net_1 is

   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : XNOR2_X1 port map( A => b, B => n1, ZN => p_out);
   U2 : INV_X1 port map( A => a, ZN => n1);
   U3 : AND2_X1 port map( A1 => b, A2 => a, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux41_MUX_SIZE32_1 is

   port( IN0, IN1, IN2, IN3 : in std_logic_vector (31 downto 0);  CTRL : in 
         std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 downto
         0));

end mux41_MUX_SIZE32_1;

architecture SYN_bhe of mux41_MUX_SIZE32_1 is

   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X3
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NOR2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component OR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n38, n39, n40, n41, n53, n54, n55, n57, n61, n63, n64, n65, n66, n68,
      n69, n70, n71, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92
      , n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, 
      n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, 
      n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, 
      n131, n132, n135, n136, n137, n138, n139, n141, n142, n143, n144, n145, 
      n146, n147, n148, n149 : std_logic;

begin
   
   U21 : INV_X1 port map( A => n143, ZN => OUT1(29));
   U15 : INV_X1 port map( A => n145, ZN => OUT1(31));
   U1 : BUF_X2 port map( A => n148, Z => n128);
   U2 : NAND2_X1 port map( A1 => n83, A2 => IN2(12), ZN => n38);
   U3 : AOI21_X1 port map( B1 => n127, B2 => IN0(12), A => n96, ZN => n39);
   U4 : NAND2_X1 port map( A1 => n38, A2 => n39, ZN => OUT1(12));
   U5 : AOI222_X1 port map( A1 => n130, A2 => IN1(23), B1 => n127, B2 => 
                           IN0(23), C1 => IN2(23), C2 => n83, ZN => n40);
   U6 : INV_X1 port map( A => n40, ZN => OUT1(23));
   U7 : AOI222_X1 port map( A1 => n126, A2 => IN0(30), B1 => n125, B2 => 
                           IN2(30), C1 => IN1(30), C2 => n71, ZN => n41);
   U8 : INV_X1 port map( A => n41, ZN => OUT1(30));
   U9 : BUF_X1 port map( A => n148, Z => n127);
   U10 : NOR2_X2 port map( A1 => n81, A2 => CTRL(0), ZN => n83);
   U11 : OR3_X1 port map( A1 => n93, A2 => n94, A3 => n95, ZN => OUT1(16));
   U12 : NAND3_X1 port map( A1 => n53, A2 => n54, A3 => n55, ZN => OUT1(15));
   U13 : OR3_X1 port map( A1 => n112, A2 => n113, A3 => n114, ZN => OUT1(17));
   U14 : OR3_X1 port map( A1 => n97, A2 => n98, A3 => n99, ZN => OUT1(26));
   U16 : BUF_X2 port map( A => n61, Z => n125);
   U17 : NAND2_X1 port map( A1 => n131, A2 => IN1(15), ZN => n53);
   U18 : NAND2_X1 port map( A1 => n83, A2 => IN2(15), ZN => n54);
   U19 : NAND2_X1 port map( A1 => n127, A2 => IN0(15), ZN => n55);
   U20 : AOI222_X1 port map( A1 => n57, A2 => IN1(29), B1 => n128, B2 => 
                           IN0(29), C1 => n125, C2 => IN2(29), ZN => n143);
   U22 : AOI222_X1 port map( A1 => n57, A2 => IN1(31), B1 => n128, B2 => 
                           IN0(31), C1 => n125, C2 => IN2(31), ZN => n145);
   U23 : CLKBUF_X1 port map( A => n129, Z => n57);
   U24 : BUF_X1 port map( A => n149, Z => n131);
   U25 : NOR2_X1 port map( A1 => n64, A2 => CTRL(0), ZN => n61);
   U26 : BUF_X2 port map( A => n61, Z => n63);
   U27 : NAND2_X1 port map( A1 => n63, A2 => IN2(0), ZN => n68);
   U28 : NAND2_X1 port map( A1 => n125, A2 => IN2(1), ZN => n70);
   U29 : NAND2_X1 port map( A1 => n125, A2 => IN2(21), ZN => n90);
   U30 : NAND2_X1 port map( A1 => n125, A2 => IN2(13), ZN => n124);
   U31 : AND2_X1 port map( A1 => n63, A2 => IN2(16), ZN => n95);
   U32 : AOI222_X1 port map( A1 => n130, A2 => IN1(4), B1 => n127, B2 => IN0(4)
                           , C1 => n63, C2 => IN2(4), ZN => n147);
   U33 : AOI222_X1 port map( A1 => n71, A2 => IN1(19), B1 => n127, B2 => 
                           IN0(19), C1 => n63, C2 => IN2(19), ZN => n136);
   U34 : NAND2_X1 port map( A1 => n125, A2 => IN2(8), ZN => n85);
   U35 : NAND3_X1 port map( A1 => n66, A2 => n68, A3 => n65, ZN => OUT1(0));
   U36 : INV_X1 port map( A => CTRL(1), ZN => n64);
   U37 : NAND2_X1 port map( A1 => n131, A2 => IN1(0), ZN => n65);
   U38 : NAND2_X1 port map( A1 => n128, A2 => IN0(0), ZN => n66);
   U39 : AOI22_X1 port map( A1 => n131, A2 => IN1(1), B1 => n127, B2 => IN0(1),
                           ZN => n69);
   U40 : NAND2_X1 port map( A1 => n69, A2 => n70, ZN => OUT1(1));
   U41 : INV_X1 port map( A => n146, ZN => OUT1(3));
   U42 : AOI222_X1 port map( A1 => n130, A2 => IN1(28), B1 => n126, B2 => 
                           IN0(28), C1 => n83, C2 => IN2(28), ZN => n142);
   U43 : BUF_X2 port map( A => n149, Z => n71);
   U44 : NOR2_X2 port map( A1 => CTRL(1), A2 => CTRL(0), ZN => n148);
   U45 : CLKBUF_X3 port map( A => n148, Z => n126);
   U46 : BUF_X2 port map( A => n149, Z => n130);
   U47 : AND2_X2 port map( A1 => CTRL(0), A2 => n82, ZN => n149);
   U48 : BUF_X2 port map( A => n149, Z => n129);
   U49 : INV_X1 port map( A => n138, ZN => OUT1(24));
   U50 : INV_X1 port map( A => n139, ZN => OUT1(25));
   U51 : AND2_X1 port map( A1 => n83, A2 => IN2(26), ZN => n99);
   U52 : AND2_X1 port map( A1 => n127, A2 => IN0(26), ZN => n98);
   U53 : AND2_X1 port map( A1 => n129, A2 => IN1(26), ZN => n97);
   U54 : INV_X1 port map( A => n141, ZN => OUT1(27));
   U55 : INV_X1 port map( A => n142, ZN => OUT1(28));
   U56 : INV_X1 port map( A => n137, ZN => OUT1(20));
   U57 : AND2_X1 port map( A1 => n129, A2 => IN1(12), ZN => n96);
   U58 : INV_X1 port map( A => n147, ZN => OUT1(4));
   U59 : INV_X1 port map( A => n144, ZN => OUT1(2));
   U60 : INV_X1 port map( A => n136, ZN => OUT1(19));
   U61 : AND2_X1 port map( A1 => n127, A2 => IN0(16), ZN => n94);
   U62 : AND2_X1 port map( A1 => n130, A2 => IN1(16), ZN => n93);
   U63 : AND2_X1 port map( A1 => n83, A2 => IN2(17), ZN => n114);
   U64 : AND2_X1 port map( A1 => n127, A2 => IN0(17), ZN => n113);
   U65 : AND2_X1 port map( A1 => n129, A2 => IN1(17), ZN => n112);
   U66 : INV_X1 port map( A => n135, ZN => OUT1(18));
   U67 : INV_X1 port map( A => CTRL(1), ZN => n81);
   U68 : INV_X1 port map( A => CTRL(1), ZN => n82);
   U69 : INV_X1 port map( A => n132, ZN => OUT1(10));
   U70 : NAND3_X1 port map( A1 => n106, A2 => n107, A3 => n108, ZN => OUT1(6));
   U71 : NAND3_X1 port map( A1 => n109, A2 => n110, A3 => n111, ZN => OUT1(7));
   U72 : NAND3_X1 port map( A1 => n119, A2 => n120, A3 => n121, ZN => OUT1(9));
   U73 : NAND3_X1 port map( A1 => n115, A2 => n116, A3 => n117, ZN => OUT1(14))
                           ;
   U74 : NAND3_X1 port map( A1 => n100, A2 => n101, A3 => n102, ZN => OUT1(11))
                           ;
   U75 : NAND3_X1 port map( A1 => n122, A2 => n123, A3 => n124, ZN => OUT1(13))
                           ;
   U76 : NAND3_X1 port map( A1 => n103, A2 => n104, A3 => n105, ZN => OUT1(5));
   U77 : AOI222_X1 port map( A1 => n129, A2 => IN1(25), B1 => n128, B2 => 
                           IN0(25), C1 => n125, C2 => IN2(25), ZN => n139);
   U78 : AOI222_X1 port map( A1 => n71, A2 => IN1(3), B1 => n126, B2 => IN0(3),
                           C1 => n83, C2 => IN2(3), ZN => n146);
   U79 : AOI222_X1 port map( A1 => n130, A2 => IN1(18), B1 => n126, B2 => 
                           IN0(18), C1 => n63, C2 => IN2(18), ZN => n135);
   U80 : NAND3_X1 port map( A1 => n84, A2 => n85, A3 => n86, ZN => OUT1(8));
   U81 : NAND2_X1 port map( A1 => n130, A2 => IN1(8), ZN => n84);
   U82 : NAND2_X1 port map( A1 => n126, A2 => IN0(8), ZN => n86);
   U83 : NAND3_X1 port map( A1 => n87, A2 => n88, A3 => n89, ZN => OUT1(22));
   U84 : NAND2_X1 port map( A1 => n125, A2 => IN2(22), ZN => n87);
   U85 : NAND2_X1 port map( A1 => n71, A2 => IN1(22), ZN => n88);
   U86 : NAND2_X1 port map( A1 => n126, A2 => IN0(22), ZN => n89);
   U87 : NAND3_X1 port map( A1 => n90, A2 => n91, A3 => n92, ZN => OUT1(21));
   U88 : NAND2_X1 port map( A1 => n71, A2 => IN1(21), ZN => n91);
   U89 : NAND2_X1 port map( A1 => n126, A2 => IN0(21), ZN => n92);
   U90 : NAND2_X1 port map( A1 => n71, A2 => IN1(11), ZN => n100);
   U91 : NAND2_X1 port map( A1 => n126, A2 => IN0(11), ZN => n101);
   U92 : NAND2_X1 port map( A1 => n125, A2 => IN2(11), ZN => n102);
   U93 : NAND2_X1 port map( A1 => n129, A2 => IN1(5), ZN => n103);
   U94 : NAND2_X1 port map( A1 => n126, A2 => IN0(5), ZN => n104);
   U95 : NAND2_X1 port map( A1 => n63, A2 => IN2(5), ZN => n105);
   U96 : NAND2_X1 port map( A1 => n129, A2 => IN1(6), ZN => n106);
   U97 : NAND2_X1 port map( A1 => n128, A2 => IN0(6), ZN => n107);
   U98 : NAND2_X1 port map( A1 => n83, A2 => IN2(6), ZN => n108);
   U99 : NAND2_X1 port map( A1 => n130, A2 => IN1(7), ZN => n109);
   U100 : NAND2_X1 port map( A1 => n126, A2 => IN0(7), ZN => n110);
   U101 : NAND2_X1 port map( A1 => n83, A2 => IN2(7), ZN => n111);
   U102 : NAND2_X1 port map( A1 => n129, A2 => IN1(14), ZN => n115);
   U103 : NAND2_X1 port map( A1 => n128, A2 => IN0(14), ZN => n116);
   U104 : NAND2_X1 port map( A1 => n125, A2 => IN2(14), ZN => n117);
   U105 : NAND2_X1 port map( A1 => n129, A2 => IN1(9), ZN => n119);
   U106 : NAND2_X1 port map( A1 => n128, A2 => IN0(9), ZN => n120);
   U107 : NAND2_X1 port map( A1 => n125, A2 => IN2(9), ZN => n121);
   U108 : NAND2_X1 port map( A1 => n130, A2 => IN1(13), ZN => n122);
   U109 : NAND2_X1 port map( A1 => n126, A2 => IN0(13), ZN => n123);
   U110 : AOI222_X1 port map( A1 => n130, A2 => IN1(24), B1 => n128, B2 => 
                           IN0(24), C1 => n125, C2 => IN2(24), ZN => n138);
   U111 : AOI222_X1 port map( A1 => n71, A2 => IN1(2), B1 => n126, B2 => IN0(2)
                           , C1 => n125, C2 => IN2(2), ZN => n144);
   U112 : AOI222_X1 port map( A1 => n71, A2 => IN1(27), B1 => n126, B2 => 
                           IN0(27), C1 => n83, C2 => IN2(27), ZN => n141);
   U113 : AOI222_X1 port map( A1 => n130, A2 => IN1(20), B1 => n127, B2 => 
                           IN0(20), C1 => n83, C2 => IN2(20), ZN => n137);
   U114 : AOI222_X1 port map( A1 => n129, A2 => IN1(10), B1 => n127, B2 => 
                           IN0(10), C1 => n83, C2 => IN2(10), ZN => n132);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_1 is

   port( IN0, IN1 : in std_logic_vector (31 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (31 downto 0));

end mux21_1;

architecture SYN_Bhe of mux21_1 is

   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : MUX2_X1 port map( A => IN0(9), B => IN1(9), S => CTRL, Z => OUT1(9));
   U2 : MUX2_X1 port map( A => IN0(8), B => IN1(8), S => CTRL, Z => OUT1(8));
   U3 : MUX2_X1 port map( A => IN0(7), B => IN1(7), S => CTRL, Z => OUT1(7));
   U4 : MUX2_X1 port map( A => IN0(6), B => IN1(6), S => CTRL, Z => OUT1(6));
   U5 : MUX2_X1 port map( A => IN0(5), B => IN1(5), S => CTRL, Z => OUT1(5));
   U6 : MUX2_X1 port map( A => IN0(4), B => IN1(4), S => CTRL, Z => OUT1(4));
   U7 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));
   U8 : MUX2_X1 port map( A => IN0(31), B => IN1(31), S => CTRL, Z => OUT1(31))
                           ;
   U9 : MUX2_X1 port map( A => IN0(30), B => IN1(30), S => CTRL, Z => OUT1(30))
                           ;
   U10 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U12 : MUX2_X1 port map( A => IN0(28), B => IN1(28), S => CTRL, Z => OUT1(28)
                           );
   U13 : MUX2_X1 port map( A => IN0(27), B => IN1(27), S => CTRL, Z => OUT1(27)
                           );
   U14 : MUX2_X1 port map( A => IN0(26), B => IN1(26), S => CTRL, Z => OUT1(26)
                           );
   U15 : MUX2_X1 port map( A => IN0(25), B => IN1(25), S => CTRL, Z => OUT1(25)
                           );
   U16 : MUX2_X1 port map( A => IN0(24), B => IN1(24), S => CTRL, Z => OUT1(24)
                           );
   U17 : MUX2_X1 port map( A => IN0(23), B => IN1(23), S => CTRL, Z => OUT1(23)
                           );
   U18 : MUX2_X1 port map( A => IN0(22), B => IN1(22), S => CTRL, Z => OUT1(22)
                           );
   U19 : MUX2_X1 port map( A => IN0(21), B => IN1(21), S => CTRL, Z => OUT1(21)
                           );
   U20 : MUX2_X1 port map( A => IN0(20), B => IN1(20), S => CTRL, Z => OUT1(20)
                           );
   U21 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U22 : MUX2_X1 port map( A => IN0(19), B => IN1(19), S => CTRL, Z => OUT1(19)
                           );
   U23 : MUX2_X1 port map( A => IN0(18), B => IN1(18), S => CTRL, Z => OUT1(18)
                           );
   U24 : MUX2_X1 port map( A => IN0(17), B => IN1(17), S => CTRL, Z => OUT1(17)
                           );
   U25 : MUX2_X1 port map( A => IN0(16), B => IN1(16), S => CTRL, Z => OUT1(16)
                           );
   U26 : MUX2_X1 port map( A => IN0(15), B => IN1(15), S => CTRL, Z => OUT1(15)
                           );
   U27 : MUX2_X1 port map( A => IN0(14), B => IN1(14), S => CTRL, Z => OUT1(14)
                           );
   U28 : MUX2_X1 port map( A => IN0(13), B => IN1(13), S => CTRL, Z => OUT1(13)
                           );
   U29 : MUX2_X1 port map( A => IN0(12), B => IN1(12), S => CTRL, Z => OUT1(12)
                           );
   U30 : MUX2_X1 port map( A => IN0(11), B => IN1(11), S => CTRL, Z => OUT1(11)
                           );
   U31 : MUX2_X1 port map( A => IN0(10), B => IN1(10), S => CTRL, Z => OUT1(10)
                           );
   U11 : MUX2_X1 port map( A => IN0(29), B => IN1(29), S => CTRL, Z => OUT1(29)
                           );
   U32 : INV_X1 port map( A => IN0(0), ZN => n1);
   U33 : NOR2_X1 port map( A1 => CTRL, A2 => n1, ZN => OUT1(0));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity FA_0 is

   port( A, B, Ci : in std_logic;  S, Co : out std_logic);

end FA_0;

architecture SYN_BEHAVIORAL of FA_0 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : AND2_X1 port map( A1 => B, A2 => A, ZN => Co);
   U2 : XOR2_X1 port map( A => B, B => A, Z => S);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_SIZE4_0 is

   port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (3 downto 0));

end mux21_SIZE4_0;

architecture SYN_Bhe of mux21_SIZE4_0 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U2 : MUX2_X1 port map( A => IN0(2), B => IN1(2), S => CTRL, Z => OUT1(2));
   U3 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));
   U4 : MUX2_X1 port map( A => IN0(0), B => IN1(0), S => CTRL, Z => OUT1(0));
   U1 : MUX2_X1 port map( A => IN0(3), B => IN1(3), S => CTRL, Z => OUT1(3));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity RCA_N4_0 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_N4_0;

architecture SYN_STRUCTURAL of RCA_N4_0 is

   component FA_61
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_62
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_63
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   component FA_0
      port( A, B, Ci : in std_logic;  S, Co : out std_logic);
   end component;
   
   signal n1, CTMP_3_port, CTMP_2_port, CTMP_1_port, net561330 : std_logic;

begin
   
   FAI_1 : FA_0 port map( A => A(0), B => B(0), Ci => n1, S => S(0), Co => 
                           CTMP_1_port);
   FAI_2 : FA_63 port map( A => A(1), B => B(1), Ci => CTMP_1_port, S => S(1), 
                           Co => CTMP_2_port);
   FAI_3 : FA_62 port map( A => A(2), B => B(2), Ci => CTMP_2_port, S => S(2), 
                           Co => CTMP_3_port);
   FAI_4 : FA_61 port map( A => A(3), B => B(3), Ci => CTMP_3_port, S => S(3), 
                           Co => net561330);
   n1 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_sel_gen_N4_0 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end carry_sel_gen_N4_0;

architecture SYN_STRUCTURAL of carry_sel_gen_N4_0 is

   component mux21_SIZE4_0
      port( IN0, IN1 : in std_logic_vector (3 downto 0);  CTRL : in std_logic; 
            OUT1 : out std_logic_vector (3 downto 0));
   end component;
   
   component RCA_N4_15
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component RCA_N4_0
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, nocarry_sum_to_mux_3_port, 
      nocarry_sum_to_mux_2_port, nocarry_sum_to_mux_1_port, 
      nocarry_sum_to_mux_0_port, carry_sum_to_mux_3_port, 
      carry_sum_to_mux_2_port, carry_sum_to_mux_1_port, carry_sum_to_mux_0_port
      , net561328, net561329 : std_logic;

begin
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   rca_nocarry : RCA_N4_0 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic0_port, S(3) => 
                           nocarry_sum_to_mux_3_port, S(2) => 
                           nocarry_sum_to_mux_2_port, S(1) => 
                           nocarry_sum_to_mux_1_port, S(0) => 
                           nocarry_sum_to_mux_0_port, Co => net561329);
   rca_carry : RCA_N4_15 port map( A(3) => A(3), A(2) => A(2), A(1) => A(1), 
                           A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1) => 
                           B(1), B(0) => B(0), Ci => X_Logic1_port, S(3) => 
                           carry_sum_to_mux_3_port, S(2) => 
                           carry_sum_to_mux_2_port, S(1) => 
                           carry_sum_to_mux_1_port, S(0) => 
                           carry_sum_to_mux_0_port, Co => net561328);
   outmux : mux21_SIZE4_0 port map( IN0(3) => nocarry_sum_to_mux_3_port, IN0(2)
                           => nocarry_sum_to_mux_2_port, IN0(1) => 
                           nocarry_sum_to_mux_1_port, IN0(0) => 
                           nocarry_sum_to_mux_0_port, IN1(3) => 
                           carry_sum_to_mux_3_port, IN1(2) => 
                           carry_sum_to_mux_2_port, IN1(1) => 
                           carry_sum_to_mux_1_port, IN1(0) => 
                           carry_sum_to_mux_0_port, CTRL => Ci, OUT1(3) => S(3)
                           , OUT1(2) => S(2), OUT1(1) => S(1), OUT1(0) => S(0))
                           ;

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_0 is

   port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic);

end pg_0;

architecture SYN_beh of pg_0 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3 : std_logic;

begin
   
   U1 : AND2_X1 port map( A1 => p, A2 => p_prec, ZN => p_out);
   U2 : INV_X1 port map( A => g, ZN => n3);
   U3 : NAND2_X1 port map( A1 => p, A2 => g_prec, ZN => n2);
   U4 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity g_0 is

   port( g, p, g_prec : in std_logic;  g_out : out std_logic);

end g_0;

architecture SYN_beh of g_0 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2 : std_logic;

begin
   
   U1 : AOI21_X1 port map( B1 => p, B2 => g_prec, A => g, ZN => n2);
   U2 : INV_X1 port map( A => n2, ZN => g_out);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity pg_net_0 is

   port( a, b : in std_logic;  g_out, p_out : out std_logic);

end pg_net_0;

architecture SYN_beh of pg_net_0 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n1, n2 : std_logic;

begin
   
   U1 : NOR2_X1 port map( A1 => n2, A2 => n1, ZN => g_out);
   U2 : XNOR2_X1 port map( A => n1, B => b, ZN => p_out);
   U3 : INV_X1 port map( A => a, ZN => n1);
   U4 : INV_X1 port map( A => b, ZN => n2);

end SYN_beh;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_thirdLevel is

   port( sel : in std_logic_vector (2 downto 0);  A : in std_logic_vector (38 
         downto 0);  Y : out std_logic_vector (31 downto 0));

end shift_thirdLevel;

architecture SYN_behav of shift_thirdLevel is

   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n17, n18, n20, n21, n22, n23, n24, n25, n26, n28, n29, n31, n32, n33,
      n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49
      , n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, 
      n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78
      , n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, 
      n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, 
      n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, 
      n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, 
      n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141 : 
      std_logic;

begin
   
   U144 : AOI22_X1 port map( A1 => n135, A2 => A(0), B1 => n40, B2 => A(2), ZN 
                           => n129);
   U140 : AOI22_X1 port map( A1 => n137, A2 => A(4), B1 => n23, B2 => A(6), ZN 
                           => n130);
   U137 : OAI22_X1 port map( A1 => A(1), A2 => n134, B1 => A(3), B2 => n26, ZN 
                           => n132);
   U136 : AOI21_X1 port map( B1 => n23, B2 => n36, A => n132, ZN => n131);
   U135 : OAI21_X1 port map( B1 => A(5), B2 => n136, A => n131, ZN => n93);
   U134 : OAI222_X1 port map( A1 => n141, A2 => n129, B1 => n141, B2 => n130, 
                           C1 => n138, C2 => n93, ZN => Y(0));
   U29 : AOI22_X1 port map( A1 => n135, A2 => A(32), B1 => n40, B2 => A(34), ZN
                           => n49);
   U28 : AOI22_X1 port map( A1 => n137, A2 => A(36), B1 => n23, B2 => A(38), ZN
                           => n50);
   U33 : OAI22_X1 port map( A1 => A(33), A2 => n26, B1 => A(37), B2 => n33, ZN 
                           => n55);
   U32 : AOI21_X1 port map( B1 => n135, B2 => n54, A => n55, ZN => n53);
   U31 : OAI21_X1 port map( B1 => A(35), B2 => n136, A => n53, ZN => n51);
   U27 : OAI222_X1 port map( A1 => n138, A2 => n49, B1 => n138, B2 => n50, C1 
                           => n51, C2 => n141, ZN => Y(31));
   U93 : OAI22_X1 port map( A1 => A(19), A2 => n134, B1 => A(21), B2 => n26, ZN
                           => n101);
   U92 : AOI21_X1 port map( B1 => n23, B2 => n78, A => n101, ZN => n100);
   U91 : OAI21_X1 port map( B1 => A(23), B2 => n136, A => n100, ZN => n96);
   U89 : OAI22_X1 port map( A1 => A(20), A2 => n134, B1 => A(22), B2 => n26, ZN
                           => n98);
   U88 : AOI21_X1 port map( B1 => n137, B2 => n82, A => n98, ZN => n97);
   U87 : OAI21_X1 port map( B1 => A(26), B2 => n33, A => n97, ZN => n90);
   U86 : AOI22_X1 port map( A1 => sel(0), A2 => n96, B1 => n90, B2 => n140, ZN 
                           => Y(19));
   U80 : OAI22_X1 port map( A1 => A(21), A2 => n134, B1 => A(23), B2 => n26, ZN
                           => n92);
   U79 : AOI21_X1 port map( B1 => n137, B2 => n78, A => n92, ZN => n91);
   U78 : OAI21_X1 port map( B1 => A(27), B2 => n33, A => n91, ZN => n87);
   U77 : AOI22_X1 port map( A1 => n139, A2 => n90, B1 => n87, B2 => n140, ZN =>
                           Y(20));
   U76 : OAI22_X1 port map( A1 => A(22), A2 => n134, B1 => A(28), B2 => n33, ZN
                           => n89);
   U75 : AOI21_X1 port map( B1 => n40, B2 => n82, A => n89, ZN => n88);
   U74 : OAI21_X1 port map( B1 => A(26), B2 => n21, A => n88, ZN => n84);
   U73 : AOI22_X1 port map( A1 => n139, A2 => n87, B1 => n84, B2 => n140, ZN =>
                           Y(21));
   U38 : OAI22_X1 port map( A1 => A(5), A2 => n26, B1 => A(3), B2 => n134, ZN 
                           => n58);
   U37 : AOI21_X1 port map( B1 => n137, B2 => n36, A => n58, ZN => n57);
   U36 : OAI21_X1 port map( B1 => A(9), B2 => n33, A => n57, ZN => n45);
   U26 : OAI22_X1 port map( A1 => A(6), A2 => n26, B1 => A(4), B2 => n134, ZN 
                           => n48);
   U25 : AOI21_X1 port map( B1 => n137, B2 => n31, A => n48, ZN => n46);
   U24 : OAI21_X1 port map( B1 => A(10), B2 => n33, A => n46, ZN => n42);
   U23 : AOI22_X1 port map( A1 => n138, A2 => n45, B1 => n42, B2 => n140, ZN =>
                           Y(3));
   U72 : OAI22_X1 port map( A1 => A(23), A2 => n134, B1 => A(29), B2 => n33, ZN
                           => n86);
   U71 : AOI21_X1 port map( B1 => n40, B2 => n78, A => n86, ZN => n85);
   U70 : OAI21_X1 port map( B1 => A(27), B2 => n21, A => n85, ZN => n80);
   U69 : AOI22_X1 port map( A1 => n139, A2 => n84, B1 => n80, B2 => n140, ZN =>
                           Y(22));
   U68 : OAI22_X1 port map( A1 => A(26), A2 => n26, B1 => A(30), B2 => n33, ZN 
                           => n83);
   U67 : AOI21_X1 port map( B1 => n135, B2 => n82, A => n83, ZN => n81);
   U66 : OAI21_X1 port map( B1 => A(28), B2 => n136, A => n81, ZN => n76);
   U64 : OAI22_X1 port map( A1 => A(27), A2 => n26, B1 => A(31), B2 => n33, ZN 
                           => n79);
   U63 : AOI21_X1 port map( B1 => n135, B2 => n78, A => n79, ZN => n77);
   U62 : OAI21_X1 port map( B1 => A(29), B2 => n136, A => n77, ZN => n73);
   U61 : AOI22_X1 port map( A1 => sel(0), A2 => n76, B1 => n73, B2 => n140, ZN 
                           => Y(24));
   U111 : OAI22_X1 port map( A1 => A(15), A2 => n134, B1 => A(21), B2 => n33, 
                           ZN => n115);
   U110 : AOI21_X1 port map( B1 => n40, B2 => n107, A => n115, ZN => n114);
   U109 : OAI21_X1 port map( B1 => A(19), B2 => n21, A => n114, ZN => n109);
   U107 : OAI22_X1 port map( A1 => A(18), A2 => n26, B1 => A(22), B2 => n33, ZN
                           => n112);
   U106 : AOI21_X1 port map( B1 => n135, B2 => n111, A => n112, ZN => n110);
   U105 : OAI21_X1 port map( B1 => A(20), B2 => n21, A => n110, ZN => n105);
   U104 : AOI22_X1 port map( A1 => n139, A2 => n109, B1 => n105, B2 => n141, ZN
                           => Y(15));
   U10 : OAI22_X1 port map( A1 => A(14), A2 => n33, B1 => A(10), B2 => n26, ZN 
                           => n32);
   U9 : AOI21_X1 port map( B1 => n135, B2 => n31, A => n32, ZN => n29);
   U8 : OAI21_X1 port map( B1 => A(12), B2 => n136, A => n29, ZN => n20);
   U5 : OAI22_X1 port map( A1 => A(11), A2 => n26, B1 => A(9), B2 => n134, ZN 
                           => n25);
   U4 : AOI21_X1 port map( B1 => n23, B2 => n24, A => n25, ZN => n22);
   U3 : OAI21_X1 port map( B1 => A(13), B2 => n136, A => n22, ZN => n17);
   U2 : AOI22_X1 port map( A1 => n138, A2 => n20, B1 => n17, B2 => n140, ZN => 
                           Y(8));
   U18 : OAI22_X1 port map( A1 => A(6), A2 => n134, B1 => A(12), B2 => n33, ZN 
                           => n41);
   U17 : AOI21_X1 port map( B1 => n40, B2 => n31, A => n41, ZN => n39);
   U16 : OAI21_X1 port map( B1 => A(10), B2 => n136, A => n39, ZN => n34);
   U14 : OAI22_X1 port map( A1 => A(13), A2 => n33, B1 => A(9), B2 => n26, ZN 
                           => n37);
   U13 : AOI21_X1 port map( B1 => n135, B2 => n36, A => n37, ZN => n35);
   U12 : OAI21_X1 port map( B1 => A(11), B2 => n136, A => n35, ZN => n28);
   U11 : AOI22_X1 port map( A1 => n138, A2 => n34, B1 => n28, B2 => n140, ZN =>
                           Y(6));
   U59 : OAI22_X1 port map( A1 => A(26), A2 => n134, B1 => A(28), B2 => n26, ZN
                           => n75);
   U58 : AOI21_X1 port map( B1 => n23, B2 => n61, A => n75, ZN => n74);
   U57 : OAI21_X1 port map( B1 => A(30), B2 => n136, A => n74, ZN => n70);
   U56 : AOI22_X1 port map( A1 => sel(0), A2 => n73, B1 => n70, B2 => n140, ZN 
                           => Y(25));
   U103 : OAI22_X1 port map( A1 => A(19), A2 => n26, B1 => A(23), B2 => n33, ZN
                           => n108);
   U102 : AOI21_X1 port map( B1 => n135, B2 => n107, A => n108, ZN => n106);
   U101 : OAI21_X1 port map( B1 => A(21), B2 => n21, A => n106, ZN => n102);
   U98 : OAI22_X1 port map( A1 => A(18), A2 => n134, B1 => A(20), B2 => n26, ZN
                           => n104);
   U97 : AOI21_X1 port map( B1 => n23, B2 => n82, A => n104, ZN => n103);
   U96 : OAI21_X1 port map( B1 => A(22), B2 => n21, A => n103, ZN => n99);
   U95 : AOI22_X1 port map( A1 => n139, A2 => n102, B1 => n99, B2 => n140, ZN 
                           => Y(17));
   U123 : OAI22_X1 port map( A1 => A(14), A2 => n26, B1 => A(12), B2 => n134, 
                           ZN => n124);
   U122 : AOI21_X1 port map( B1 => n137, B2 => n111, A => n124, ZN => n123);
   U121 : OAI21_X1 port map( B1 => A(18), B2 => n33, A => n123, ZN => n119);
   U119 : OAI22_X1 port map( A1 => A(15), A2 => n26, B1 => A(13), B2 => n134, 
                           ZN => n121);
   U118 : AOI21_X1 port map( B1 => n137, B2 => n107, A => n121, ZN => n120);
   U117 : OAI21_X1 port map( B1 => A(19), B2 => n33, A => n120, ZN => n116);
   U116 : AOI22_X1 port map( A1 => n139, A2 => n119, B1 => n116, B2 => n141, ZN
                           => Y(12));
   U100 : AOI22_X1 port map( A1 => n139, A2 => n105, B1 => n102, B2 => n140, ZN
                           => Y(16));
   U50 : OAI22_X1 port map( A1 => A(28), A2 => n134, B1 => A(30), B2 => n26, ZN
                           => n69);
   U49 : AOI21_X1 port map( B1 => n137, B2 => n61, A => n69, ZN => n68);
   U48 : OAI21_X1 port map( B1 => A(34), B2 => n33, A => n68, ZN => n63);
   U46 : OAI22_X1 port map( A1 => A(31), A2 => n26, B1 => A(35), B2 => n33, ZN 
                           => n66);
   U45 : AOI21_X1 port map( B1 => n135, B2 => n65, A => n66, ZN => n64);
   U44 : OAI21_X1 port map( B1 => A(33), B2 => n136, A => n64, ZN => n59);
   U43 : AOI22_X1 port map( A1 => n139, A2 => n63, B1 => n59, B2 => n140, ZN =>
                           Y(28));
   U22 : OAI22_X1 port map( A1 => A(5), A2 => n134, B1 => A(11), B2 => n33, ZN 
                           => n44);
   U21 : AOI21_X1 port map( B1 => n40, B2 => n36, A => n44, ZN => n43);
   U20 : OAI21_X1 port map( B1 => A(9), B2 => n136, A => n43, ZN => n38);
   U19 : AOI22_X1 port map( A1 => n138, A2 => n42, B1 => n38, B2 => n140, ZN =>
                           Y(4));
   U54 : OAI22_X1 port map( A1 => A(27), A2 => n134, B1 => A(33), B2 => n33, ZN
                           => n72);
   U53 : AOI21_X1 port map( B1 => n40, B2 => n65, A => n72, ZN => n71);
   U52 : OAI21_X1 port map( B1 => A(31), B2 => n136, A => n71, ZN => n67);
   U47 : AOI22_X1 port map( A1 => n139, A2 => n67, B1 => n63, B2 => n140, ZN =>
                           Y(27));
   U15 : AOI22_X1 port map( A1 => n138, A2 => n38, B1 => n34, B2 => n140, ZN =>
                           Y(5));
   U115 : OAI22_X1 port map( A1 => A(14), A2 => n134, B1 => A(20), B2 => n33, 
                           ZN => n118);
   U114 : AOI21_X1 port map( B1 => n40, B2 => n111, A => n118, ZN => n117);
   U113 : OAI21_X1 port map( B1 => A(18), B2 => n21, A => n117, ZN => n113);
   U112 : AOI22_X1 port map( A1 => n139, A2 => n116, B1 => n113, B2 => n141, ZN
                           => Y(13));
   U132 : OAI22_X1 port map( A1 => A(12), A2 => n26, B1 => A(10), B2 => n134, 
                           ZN => n128);
   U131 : AOI21_X1 port map( B1 => n23, B2 => n111, A => n128, ZN => n127);
   U130 : OAI21_X1 port map( B1 => A(14), B2 => n21, A => n127, ZN => n18);
   U1 : AOI22_X1 port map( A1 => n139, A2 => n17, B1 => n18, B2 => n140, ZN => 
                           Y(9));
   U7 : AOI22_X1 port map( A1 => n138, A2 => n28, B1 => n20, B2 => n140, ZN => 
                           Y(7));
   U108 : AOI22_X1 port map( A1 => n139, A2 => n113, B1 => n109, B2 => n141, ZN
                           => Y(14));
   U90 : AOI22_X1 port map( A1 => n139, A2 => n99, B1 => n96, B2 => n140, ZN =>
                           Y(18));
   U65 : AOI22_X1 port map( A1 => sel(0), A2 => n80, B1 => n76, B2 => n140, ZN 
                           => Y(23));
   U51 : AOI22_X1 port map( A1 => n139, A2 => n70, B1 => n67, B2 => n140, ZN =>
                           Y(26));
   U42 : OAI22_X1 port map( A1 => A(30), A2 => n134, B1 => A(36), B2 => n33, ZN
                           => n62);
   U41 : AOI21_X1 port map( B1 => n40, B2 => n61, A => n62, ZN => n60);
   U40 : OAI21_X1 port map( B1 => A(34), B2 => n136, A => n60, ZN => n52);
   U39 : AOI22_X1 port map( A1 => n138, A2 => n59, B1 => n52, B2 => n140, ZN =>
                           Y(29));
   U84 : OAI22_X1 port map( A1 => A(4), A2 => n26, B1 => A(2), B2 => n134, ZN 
                           => n95);
   U83 : AOI21_X1 port map( B1 => n23, B2 => n31, A => n95, ZN => n94);
   U82 : OAI21_X1 port map( B1 => A(6), B2 => n136, A => n94, ZN => n56);
   U35 : AOI22_X1 port map( A1 => n138, A2 => n56, B1 => n45, B2 => n140, ZN =>
                           Y(2));
   U81 : AOI22_X1 port map( A1 => sel(0), A2 => n93, B1 => n56, B2 => n140, ZN 
                           => Y(1));
   U30 : AOI22_X1 port map( A1 => n138, A2 => n52, B1 => n51, B2 => n140, ZN =>
                           Y(30));
   U128 : OAI22_X1 port map( A1 => A(13), A2 => n26, B1 => A(11), B2 => n134, 
                           ZN => n126);
   U127 : AOI21_X1 port map( B1 => n23, B2 => n107, A => n126, ZN => n125);
   U126 : OAI21_X1 port map( B1 => A(15), B2 => n21, A => n125, ZN => n122);
   U120 : AOI22_X1 port map( A1 => n139, A2 => n122, B1 => n119, B2 => n141, ZN
                           => Y(11));
   U125 : AOI22_X1 port map( A1 => n139, A2 => n18, B1 => n122, B2 => n141, ZN 
                           => Y(10));
   U146 : INV_X1 port map( A => sel(2), ZN => n133);
   U138 : INV_X1 port map( A => n40, ZN => n26);
   U34 : INV_X1 port map( A => A(31), ZN => n54);
   U124 : INV_X1 port map( A => n23, ZN => n33);
   U94 : INV_X1 port map( A => A(25), ZN => n78);
   U99 : INV_X1 port map( A => A(24), ZN => n82);
   U85 : INV_X1 port map( A => A(8), ZN => n31);
   U129 : INV_X1 port map( A => A(17), ZN => n107);
   U133 : INV_X1 port map( A => A(16), ZN => n111);
   U6 : INV_X1 port map( A => A(15), ZN => n24);
   U60 : INV_X1 port map( A => A(32), ZN => n61);
   U55 : INV_X1 port map( A => A(29), ZN => n65);
   U139 : INV_X1 port map( A => A(7), ZN => n36);
   U141 : INV_X1 port map( A => n135, ZN => n134);
   U142 : BUF_X1 port map( A => sel(0), Z => n138);
   U143 : BUF_X1 port map( A => sel(0), Z => n139);
   U145 : INV_X1 port map( A => n138, ZN => n140);
   U147 : INV_X1 port map( A => n137, ZN => n136);
   U148 : INV_X1 port map( A => n21, ZN => n137);
   U149 : NAND2_X1 port map( A1 => n133, A2 => sel(1), ZN => n21);
   U150 : NOR2_X1 port map( A1 => sel(1), A2 => n133, ZN => n40);
   U151 : AND2_X1 port map( A1 => sel(2), A2 => sel(1), ZN => n135);
   U152 : INV_X1 port map( A => n139, ZN => n141);
   U153 : NOR2_X1 port map( A1 => sel(2), A2 => sel(1), ZN => n23);

end SYN_behav;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_secondLevel is

   port( sel : in std_logic_vector (1 downto 0);  mask00, mask08, mask16 : in 
         std_logic_vector (38 downto 0);  Y : out std_logic_vector (38 downto 
         0));

end shift_secondLevel;

architecture SYN_behav of shift_secondLevel is

   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53, n54, n55,
      n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70
      , n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n46, 
      n84, n92 : std_logic;

begin
   
   U79 : AOI222_X1 port map( A1 => n84, A2 => mask00(0), B1 => n43, B2 => 
                           mask16(0), C1 => n44, C2 => mask08(0), ZN => n82);
   U35 : AOI222_X1 port map( A1 => n84, A2 => mask00(2), B1 => n43, B2 => 
                           mask16(2), C1 => n92, C2 => mask08(2), ZN => n60);
   U13 : AOI222_X1 port map( A1 => n84, A2 => mask00(4), B1 => n43, B2 => 
                           mask16(4), C1 => n92, C2 => mask08(4), ZN => n49);
   U9 : AOI222_X1 port map( A1 => n84, A2 => mask00(6), B1 => n43, B2 => 
                           mask16(6), C1 => n92, C2 => mask08(6), ZN => n47);
   U11 : AOI222_X1 port map( A1 => n84, A2 => mask00(5), B1 => n43, B2 => 
                           mask16(5), C1 => n92, C2 => mask08(5), ZN => n48);
   U57 : AOI222_X1 port map( A1 => n84, A2 => mask00(1), B1 => n43, B2 => 
                           mask16(1), C1 => n44, C2 => mask08(1), ZN => n71);
   U15 : AOI222_X1 port map( A1 => n84, A2 => mask00(3), B1 => n43, B2 => 
                           mask16(3), C1 => n92, C2 => mask08(3), ZN => n50);
   U29 : AOI222_X1 port map( A1 => n84, A2 => mask00(32), B1 => n43, B2 => 
                           mask16(32), C1 => n92, C2 => mask08(32), ZN => n57);
   U25 : AOI222_X1 port map( A1 => n84, A2 => mask00(34), B1 => n43, B2 => 
                           mask16(34), C1 => n92, C2 => mask08(34), ZN => n55);
   U21 : AOI222_X1 port map( A1 => n84, A2 => mask00(36), B1 => n43, B2 => 
                           mask16(36), C1 => n92, C2 => mask08(36), ZN => n53);
   U17 : AOI222_X1 port map( A1 => n84, A2 => mask00(38), B1 => n43, B2 => 
                           mask16(38), C1 => n92, C2 => mask08(38), ZN => n51);
   U23 : AOI222_X1 port map( A1 => n84, A2 => mask00(35), B1 => n43, B2 => 
                           mask16(35), C1 => n92, C2 => mask08(35), ZN => n54);
   U31 : AOI222_X1 port map( A1 => n84, A2 => mask00(31), B1 => n43, B2 => 
                           mask16(31), C1 => n92, C2 => mask08(31), ZN => n58);
   U27 : AOI222_X1 port map( A1 => n84, A2 => mask00(33), B1 => n43, B2 => 
                           mask16(33), C1 => n92, C2 => mask08(33), ZN => n56);
   U19 : AOI222_X1 port map( A1 => n84, A2 => mask00(37), B1 => n43, B2 => 
                           mask16(37), C1 => n92, C2 => mask08(37), ZN => n52);
   U49 : AOI222_X1 port map( A1 => n84, A2 => mask00(23), B1 => n43, B2 => 
                           mask16(23), C1 => n44, C2 => mask08(23), ZN => n67);
   U45 : AOI222_X1 port map( A1 => n84, A2 => mask00(25), B1 => n43, B2 => 
                           mask16(25), C1 => n92, C2 => mask08(25), ZN => n65);
   U59 : AOI222_X1 port map( A1 => n84, A2 => mask00(19), B1 => n43, B2 => 
                           mask16(19), C1 => n44, C2 => mask08(19), ZN => n72);
   U53 : AOI222_X1 port map( A1 => n84, A2 => mask00(21), B1 => n43, B2 => 
                           mask16(21), C1 => n44, C2 => mask08(21), ZN => n69);
   U43 : AOI222_X1 port map( A1 => n84, A2 => mask00(26), B1 => n43, B2 => 
                           mask16(26), C1 => n92, C2 => mask08(26), ZN => n64);
   U47 : AOI222_X1 port map( A1 => n84, A2 => mask00(24), B1 => n43, B2 => 
                           mask16(24), C1 => n92, C2 => mask08(24), ZN => n66);
   U55 : AOI222_X1 port map( A1 => n84, A2 => mask00(20), B1 => n43, B2 => 
                           mask16(20), C1 => n44, C2 => mask08(20), ZN => n70);
   U51 : AOI222_X1 port map( A1 => n84, A2 => mask00(22), B1 => n43, B2 => 
                           mask16(22), C1 => n92, C2 => mask08(22), ZN => n68);
   U41 : AOI222_X1 port map( A1 => n84, A2 => mask00(27), B1 => n43, B2 => 
                           mask16(27), C1 => n92, C2 => mask08(27), ZN => n63);
   U39 : AOI222_X1 port map( A1 => n84, A2 => mask00(28), B1 => n43, B2 => 
                           mask16(28), C1 => n92, C2 => mask08(28), ZN => n62);
   U3 : AOI222_X1 port map( A1 => n84, A2 => mask00(9), B1 => n43, B2 => 
                           mask16(9), C1 => n92, C2 => mask08(9), ZN => n41);
   U77 : AOI222_X1 port map( A1 => n84, A2 => mask00(10), B1 => n43, B2 => 
                           mask16(10), C1 => n44, C2 => mask08(10), ZN => n81);
   U5 : AOI222_X1 port map( A1 => n84, A2 => mask00(8), B1 => n43, B2 => 
                           mask16(8), C1 => n92, C2 => mask08(8), ZN => n45);
   U37 : AOI222_X1 port map( A1 => n84, A2 => mask00(29), B1 => n43, B2 => 
                           mask16(29), C1 => n92, C2 => mask08(29), ZN => n61);
   U33 : AOI222_X1 port map( A1 => n84, A2 => mask00(30), B1 => n43, B2 => 
                           mask16(30), C1 => n44, C2 => mask08(30), ZN => n59);
   U63 : AOI222_X1 port map( A1 => n84, A2 => mask00(17), B1 => n43, B2 => 
                           mask16(17), C1 => n44, C2 => mask08(17), ZN => n74);
   U67 : AOI222_X1 port map( A1 => n84, A2 => mask00(15), B1 => n43, B2 => 
                           mask16(15), C1 => n92, C2 => mask08(15), ZN => n76);
   U65 : AOI222_X1 port map( A1 => n84, A2 => mask00(16), B1 => n43, B2 => 
                           mask16(16), C1 => n44, C2 => mask08(16), ZN => n75);
   U61 : AOI222_X1 port map( A1 => n84, A2 => mask00(18), B1 => n43, B2 => 
                           mask16(18), C1 => n92, C2 => mask08(18), ZN => n73);
   U73 : AOI222_X1 port map( A1 => n84, A2 => mask00(12), B1 => n43, B2 => 
                           mask16(12), C1 => n44, C2 => mask08(12), ZN => n79);
   U69 : AOI222_X1 port map( A1 => n84, A2 => mask00(14), B1 => n43, B2 => 
                           mask16(14), C1 => n44, C2 => mask08(14), ZN => n77);
   U71 : AOI222_X1 port map( A1 => n84, A2 => mask00(13), B1 => n43, B2 => 
                           mask16(13), C1 => n44, C2 => mask08(13), ZN => n78);
   U75 : AOI222_X1 port map( A1 => n84, A2 => mask00(11), B1 => n43, B2 => 
                           mask16(11), C1 => n44, C2 => mask08(11), ZN => n80);
   U78 : INV_X1 port map( A => n82, ZN => Y(0));
   U34 : INV_X1 port map( A => n60, ZN => Y(2));
   U12 : INV_X1 port map( A => n49, ZN => Y(4));
   U8 : INV_X1 port map( A => n47, ZN => Y(6));
   U10 : INV_X1 port map( A => n48, ZN => Y(5));
   U56 : INV_X1 port map( A => n71, ZN => Y(1));
   U14 : INV_X1 port map( A => n50, ZN => Y(3));
   U28 : INV_X1 port map( A => n57, ZN => Y(32));
   U24 : INV_X1 port map( A => n55, ZN => Y(34));
   U20 : INV_X1 port map( A => n53, ZN => Y(36));
   U16 : INV_X1 port map( A => n51, ZN => Y(38));
   U22 : INV_X1 port map( A => n54, ZN => Y(35));
   U30 : INV_X1 port map( A => n58, ZN => Y(31));
   U26 : INV_X1 port map( A => n56, ZN => Y(33));
   U18 : INV_X1 port map( A => n52, ZN => Y(37));
   U48 : INV_X1 port map( A => n67, ZN => Y(23));
   U44 : INV_X1 port map( A => n65, ZN => Y(25));
   U58 : INV_X1 port map( A => n72, ZN => Y(19));
   U52 : INV_X1 port map( A => n69, ZN => Y(21));
   U42 : INV_X1 port map( A => n64, ZN => Y(26));
   U46 : INV_X1 port map( A => n66, ZN => Y(24));
   U54 : INV_X1 port map( A => n70, ZN => Y(20));
   U50 : INV_X1 port map( A => n68, ZN => Y(22));
   U40 : INV_X1 port map( A => n63, ZN => Y(27));
   U38 : INV_X1 port map( A => n62, ZN => Y(28));
   U2 : INV_X1 port map( A => n41, ZN => Y(9));
   U76 : INV_X1 port map( A => n81, ZN => Y(10));
   U4 : INV_X1 port map( A => n45, ZN => Y(8));
   U36 : INV_X1 port map( A => n61, ZN => Y(29));
   U32 : INV_X1 port map( A => n59, ZN => Y(30));
   U62 : INV_X1 port map( A => n74, ZN => Y(17));
   U66 : INV_X1 port map( A => n76, ZN => Y(15));
   U64 : INV_X1 port map( A => n75, ZN => Y(16));
   U60 : INV_X1 port map( A => n73, ZN => Y(18));
   U72 : INV_X1 port map( A => n79, ZN => Y(12));
   U68 : INV_X1 port map( A => n77, ZN => Y(14));
   U70 : INV_X1 port map( A => n78, ZN => Y(13));
   U74 : INV_X1 port map( A => n80, ZN => Y(11));
   U6 : AOI222_X1 port map( A1 => n92, A2 => mask08(7), B1 => mask00(7), B2 => 
                           n84, C1 => mask16(7), C2 => n43, ZN => n46);
   U7 : INV_X1 port map( A => n46, ZN => Y(7));
   U80 : BUF_X2 port map( A => n42, Z => n84);
   U81 : BUF_X1 port map( A => n44, Z => n92);
   U82 : AND2_X2 port map( A1 => n83, A2 => sel(1), ZN => n43);
   U83 : NOR2_X2 port map( A1 => sel(1), A2 => n83, ZN => n44);
   U84 : INV_X1 port map( A => sel(0), ZN => n83);
   U85 : NOR2_X1 port map( A1 => sel(1), A2 => sel(0), ZN => n42);

end SYN_behav;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_firstLevel is

   port( A : in std_logic_vector (31 downto 0);  sel : in std_logic_vector (1 
         downto 0);  mask00, mask08, mask16 : out std_logic_vector (38 downto 
         0));

end shift_firstLevel;

architecture SYN_behav of shift_firstLevel is

   component NOR2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal mask08_38_port, mask08_37_port, mask08_36_port, mask08_35_port, 
      mask08_34_port, mask08_33_port, mask08_32_port, mask08_31_port, 
      mask08_23_port, mask08_22_port, mask08_21_port, mask08_20_port, 
      mask08_19_port, mask08_18_port, mask08_17_port, mask08_16_port, 
      mask08_15_port, mask08_7_port, mask08_6_port, mask08_5_port, 
      mask08_4_port, mask08_3_port, mask08_2_port, mask08_1_port, mask08_0_port
      , mask16_38_port, mask16_37_port, mask16_36_port, mask16_35_port, 
      mask16_34_port, mask16_33_port, mask16_32_port, mask16_31_port, 
      mask16_30_port, mask16_29_port, mask16_28_port, mask16_27_port, 
      mask16_26_port, mask16_25_port, mask16_24_port, mask16_23_port, 
      mask16_15_port, mask16_14_port, mask16_13_port, mask16_12_port, 
      mask16_11_port, mask16_10_port, mask16_9_port, mask16_8_port, 
      mask16_7_port, mask16_6_port, mask16_5_port, mask16_4_port, mask16_3_port
      , mask16_2_port, mask16_1_port, mask16_0_port, n36, n37, n38, n39, n40, 
      n41, n42, n43, mask16_18_port, n45, n46, n47, n48, n49, n50, n51, n52, 
      n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67
      , n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, 
      n82, n83, n84, n85, n88, n89, n90, n91, n92, n93, n94, n95, n86, n87, n96
      : std_logic;

begin
   mask08 <= ( mask08_38_port, mask08_37_port, mask08_36_port, mask08_35_port, 
      mask08_34_port, mask08_33_port, mask08_32_port, mask08_31_port, 
      mask16_38_port, mask16_37_port, mask16_36_port, mask16_35_port, 
      mask16_34_port, mask16_33_port, mask16_32_port, mask08_23_port, 
      mask08_22_port, mask08_21_port, mask08_20_port, mask08_19_port, 
      mask08_18_port, mask08_17_port, mask08_16_port, mask08_15_port, 
      mask16_6_port, mask16_5_port, mask16_4_port, mask16_3_port, mask16_2_port
      , mask16_1_port, mask16_0_port, mask08_7_port, mask08_6_port, 
      mask08_5_port, mask08_4_port, mask08_3_port, mask08_2_port, mask08_1_port
      , mask08_0_port );
   mask16 <= ( mask16_38_port, mask16_37_port, mask16_36_port, mask16_35_port, 
      mask16_34_port, mask16_33_port, mask16_32_port, mask16_31_port, 
      mask16_30_port, mask16_29_port, mask16_28_port, mask16_27_port, 
      mask16_26_port, mask16_25_port, mask16_24_port, mask16_23_port, 
      mask16_18_port, mask16_18_port, mask16_18_port, mask16_18_port, 
      mask16_18_port, mask16_18_port, mask16_18_port, mask16_15_port, 
      mask16_14_port, mask16_13_port, mask16_12_port, mask16_11_port, 
      mask16_10_port, mask16_9_port, mask16_8_port, mask16_7_port, 
      mask16_6_port, mask16_5_port, mask16_4_port, mask16_3_port, mask16_2_port
      , mask16_1_port, mask16_0_port );
   
   U137 : NAND2_X1 port map( A1 => sel(0), A2 => A(16), ZN => n67);
   U62 : NAND2_X1 port map( A1 => sel(0), A2 => A(8), ZN => n84);
   U131 : NAND2_X1 port map( A1 => sel(0), A2 => A(18), ZN => n53);
   U155 : NAND2_X1 port map( A1 => sel(0), A2 => A(10), ZN => n81);
   U125 : NAND2_X1 port map( A1 => sel(0), A2 => A(20), ZN => n41);
   U149 : NAND2_X1 port map( A1 => sel(0), A2 => A(12), ZN => n71);
   U119 : NAND2_X1 port map( A1 => sel(0), A2 => A(22), ZN => n39);
   U143 : NAND2_X1 port map( A1 => sel(0), A2 => A(14), ZN => n69);
   U122 : NAND2_X1 port map( A1 => sel(0), A2 => A(21), ZN => n40);
   U146 : NAND2_X1 port map( A1 => sel(0), A2 => A(13), ZN => n70);
   U67 : NAND2_X1 port map( A1 => n87, A2 => A(0), ZN => n60);
   U116 : NAND2_X1 port map( A1 => sel(0), A2 => A(23), ZN => n38);
   U140 : NAND2_X1 port map( A1 => sel(0), A2 => A(15), ZN => n68);
   U134 : NAND2_X1 port map( A1 => sel(0), A2 => A(17), ZN => n61);
   U59 : NAND2_X1 port map( A1 => sel(0), A2 => A(9), ZN => n83);
   U129 : NAND2_X1 port map( A1 => sel(0), A2 => A(19), ZN => n42);
   U152 : NAND2_X1 port map( A1 => sel(0), A2 => A(11), ZN => n72);
   U91 : NAND2_X1 port map( A1 => sel(0), A2 => A(31), ZN => n82);
   U85 : AOI21_X1 port map( B1 => A(25), B2 => n85, A => mask16_18_port, ZN => 
                           n94);
   U138 : NAND2_X1 port map( A1 => n85, A2 => A(9), ZN => n50);
   U15 : NAND2_X1 port map( A1 => n50, A2 => n96, ZN => mask16_32_port);
   U112 : NAND2_X1 port map( A1 => n87, A2 => A(17), ZN => n79);
   U44 : NAND2_X1 port map( A1 => n79, A2 => n96, ZN => mask08_32_port);
   U81 : AOI21_X1 port map( B1 => A(27), B2 => n85, A => mask16_18_port, ZN => 
                           n92);
   U132 : NAND2_X1 port map( A1 => n87, A2 => A(11), ZN => n48);
   U13 : NAND2_X1 port map( A1 => n48, A2 => n96, ZN => mask16_34_port);
   U106 : NAND2_X1 port map( A1 => n87, A2 => A(19), ZN => n77);
   U42 : NAND2_X1 port map( A1 => n77, A2 => n96, ZN => mask08_34_port);
   U77 : AOI21_X1 port map( B1 => A(29), B2 => n85, A => mask16_18_port, ZN => 
                           n90);
   U124 : NAND2_X1 port map( A1 => n87, A2 => A(13), ZN => n46);
   U11 : NAND2_X1 port map( A1 => n46, A2 => n96, ZN => mask16_36_port);
   U100 : NAND2_X1 port map( A1 => n87, A2 => A(21), ZN => n75);
   U40 : NAND2_X1 port map( A1 => n75, A2 => n96, ZN => mask08_36_port);
   U73 : AOI21_X1 port map( B1 => A(31), B2 => n85, A => mask16_18_port, ZN => 
                           n88);
   U118 : NAND2_X1 port map( A1 => n87, A2 => A(15), ZN => n43);
   U9 : NAND2_X1 port map( A1 => n43, A2 => n96, ZN => mask16_38_port);
   U93 : NAND2_X1 port map( A1 => n85, A2 => A(23), ZN => n73);
   U38 : NAND2_X1 port map( A1 => n73, A2 => n96, ZN => mask08_38_port);
   U79 : AOI21_X1 port map( B1 => A(28), B2 => n85, A => mask16_18_port, ZN => 
                           n91);
   U128 : NAND2_X1 port map( A1 => n87, A2 => A(12), ZN => n47);
   U12 : NAND2_X1 port map( A1 => n47, A2 => n96, ZN => mask16_35_port);
   U103 : NAND2_X1 port map( A1 => n87, A2 => A(20), ZN => n76);
   U41 : NAND2_X1 port map( A1 => n76, A2 => n96, ZN => mask08_35_port);
   U89 : AOI21_X1 port map( B1 => A(24), B2 => n85, A => mask16_15_port, ZN => 
                           n95);
   U141 : NAND2_X1 port map( A1 => n87, A2 => A(8), ZN => n51);
   U16 : NAND2_X1 port map( A1 => n51, A2 => n96, ZN => mask16_31_port);
   U115 : NAND2_X1 port map( A1 => n87, A2 => A(16), ZN => n80);
   U45 : NAND2_X1 port map( A1 => n80, A2 => n96, ZN => mask08_31_port);
   U83 : AOI21_X1 port map( B1 => A(26), B2 => n85, A => mask16_18_port, ZN => 
                           n93);
   U135 : NAND2_X1 port map( A1 => n85, A2 => A(10), ZN => n49);
   U14 : NAND2_X1 port map( A1 => n49, A2 => n96, ZN => mask16_33_port);
   U109 : NAND2_X1 port map( A1 => n87, A2 => A(18), ZN => n78);
   U43 : NAND2_X1 port map( A1 => n78, A2 => n96, ZN => mask08_33_port);
   U75 : AOI21_X1 port map( B1 => A(30), B2 => n85, A => mask16_18_port, ZN => 
                           n89);
   U121 : NAND2_X1 port map( A1 => n87, A2 => A(14), ZN => n45);
   U10 : NAND2_X1 port map( A1 => n45, A2 => n96, ZN => mask16_37_port);
   U97 : NAND2_X1 port map( A1 => n87, A2 => A(22), ZN => n74);
   U39 : NAND2_X1 port map( A1 => n74, A2 => n96, ZN => mask08_37_port);
   U114 : NAND2_X1 port map( A1 => n38, A2 => n80, ZN => mask00(23));
   U25 : NAND2_X1 port map( A1 => n96, A2 => n60, ZN => mask16_23_port);
   U47 : NAND2_X1 port map( A1 => n51, A2 => n82, ZN => mask08_23_port);
   U110 : NAND2_X1 port map( A1 => sel(0), A2 => A(25), ZN => n36);
   U108 : NAND2_X1 port map( A1 => n36, A2 => n78, ZN => mask00(25));
   U60 : NAND2_X1 port map( A1 => n85, A2 => A(2), ZN => n58);
   U23 : NAND2_X1 port map( A1 => n96, A2 => n58, ZN => mask16_25_port);
   U127 : NAND2_X1 port map( A1 => n42, A2 => n47, ZN => mask00(19));
   U153 : NAND2_X1 port map( A1 => n85, A2 => A(4), ZN => n56);
   U104 : NAND2_X1 port map( A1 => sel(0), A2 => A(27), ZN => n65);
   U52 : NAND2_X1 port map( A1 => n56, A2 => n65, ZN => mask08_19_port);
   U120 : NAND2_X1 port map( A1 => n40, A2 => n45, ZN => mask00(21));
   U147 : NAND2_X1 port map( A1 => n85, A2 => A(6), ZN => n54);
   U98 : NAND2_X1 port map( A1 => sel(0), A2 => A(29), ZN => n63);
   U49 : NAND2_X1 port map( A1 => n54, A2 => n63, ZN => mask08_21_port);
   U107 : NAND2_X1 port map( A1 => sel(0), A2 => A(26), ZN => n66);
   U105 : NAND2_X1 port map( A1 => n66, A2 => n77, ZN => mask00(26));
   U156 : NAND2_X1 port map( A1 => n87, A2 => A(3), ZN => n57);
   U22 : NAND2_X1 port map( A1 => n57, A2 => n96, ZN => mask16_26_port);
   U113 : NAND2_X1 port map( A1 => sel(0), A2 => A(24), ZN => n37);
   U111 : NAND2_X1 port map( A1 => n37, A2 => n79, ZN => mask00(24));
   U63 : NAND2_X1 port map( A1 => n85, A2 => A(1), ZN => n59);
   U24 : NAND2_X1 port map( A1 => n96, A2 => n59, ZN => mask16_24_port);
   U123 : NAND2_X1 port map( A1 => n41, A2 => n46, ZN => mask00(20));
   U150 : NAND2_X1 port map( A1 => n85, A2 => A(5), ZN => n55);
   U101 : NAND2_X1 port map( A1 => sel(0), A2 => A(28), ZN => n64);
   U50 : NAND2_X1 port map( A1 => n55, A2 => n64, ZN => mask08_20_port);
   U117 : NAND2_X1 port map( A1 => n39, A2 => n43, ZN => mask00(22));
   U144 : NAND2_X1 port map( A1 => n85, A2 => A(7), ZN => n52);
   U94 : NAND2_X1 port map( A1 => sel(0), A2 => A(30), ZN => n62);
   U48 : NAND2_X1 port map( A1 => n52, A2 => n62, ZN => mask08_22_port);
   U102 : NAND2_X1 port map( A1 => n65, A2 => n76, ZN => mask00(27));
   U21 : NAND2_X1 port map( A1 => n56, A2 => n96, ZN => mask16_27_port);
   U99 : NAND2_X1 port map( A1 => n64, A2 => n75, ZN => mask00(28));
   U20 : NAND2_X1 port map( A1 => n55, A2 => n96, ZN => mask16_28_port);
   U58 : NAND2_X1 port map( A1 => n58, A2 => n83, ZN => mask00(9));
   U154 : NAND2_X1 port map( A1 => n57, A2 => n81, ZN => mask00(10));
   U61 : NAND2_X1 port map( A1 => n59, A2 => n84, ZN => mask00(8));
   U96 : NAND2_X1 port map( A1 => n63, A2 => n74, ZN => mask00(29));
   U19 : NAND2_X1 port map( A1 => n54, A2 => n96, ZN => mask16_29_port);
   U92 : NAND2_X1 port map( A1 => n62, A2 => n73, ZN => mask00(30));
   U17 : NAND2_X1 port map( A1 => n52, A2 => n96, ZN => mask16_30_port);
   U133 : NAND2_X1 port map( A1 => n49, A2 => n61, ZN => mask00(17));
   U54 : NAND2_X1 port map( A1 => n36, A2 => n58, ZN => mask08_17_port);
   U139 : NAND2_X1 port map( A1 => n51, A2 => n68, ZN => mask00(15));
   U56 : NAND2_X1 port map( A1 => n38, A2 => n60, ZN => mask08_15_port);
   U136 : NAND2_X1 port map( A1 => n50, A2 => n67, ZN => mask00(16));
   U55 : NAND2_X1 port map( A1 => n37, A2 => n59, ZN => mask08_16_port);
   U130 : NAND2_X1 port map( A1 => n48, A2 => n53, ZN => mask00(18));
   U53 : NAND2_X1 port map( A1 => n57, A2 => n66, ZN => mask08_18_port);
   U148 : NAND2_X1 port map( A1 => n55, A2 => n71, ZN => mask00(12));
   U142 : NAND2_X1 port map( A1 => n52, A2 => n69, ZN => mask00(14));
   U145 : NAND2_X1 port map( A1 => n54, A2 => n70, ZN => mask00(13));
   U151 : NAND2_X1 port map( A1 => n56, A2 => n72, ZN => mask00(11));
   U158 : AND2_X1 port map( A1 => sel(0), A2 => A(0), ZN => mask00(0));
   U32 : INV_X1 port map( A => n67, ZN => mask16_0_port);
   U57 : INV_X1 port map( A => n84, ZN => mask08_0_port);
   U95 : AND2_X1 port map( A1 => sel(0), A2 => A(2), ZN => mask00(2));
   U18 : INV_X1 port map( A => n53, ZN => mask16_2_port);
   U46 : INV_X1 port map( A => n81, ZN => mask08_2_port);
   U70 : AND2_X1 port map( A1 => sel(0), A2 => A(4), ZN => mask00(4));
   U7 : INV_X1 port map( A => n41, ZN => mask16_4_port);
   U36 : INV_X1 port map( A => n71, ZN => mask08_4_port);
   U68 : AND2_X1 port map( A1 => sel(0), A2 => A(6), ZN => mask00(6));
   U5 : INV_X1 port map( A => n39, ZN => mask16_6_port);
   U34 : INV_X1 port map( A => n69, ZN => mask08_6_port);
   U69 : AND2_X1 port map( A1 => sel(0), A2 => A(5), ZN => mask00(5));
   U6 : INV_X1 port map( A => n40, ZN => mask16_5_port);
   U35 : INV_X1 port map( A => n70, ZN => mask08_5_port);
   U126 : AND2_X1 port map( A1 => sel(0), A2 => A(1), ZN => mask00(1));
   U26 : INV_X1 port map( A => n61, ZN => mask16_1_port);
   U51 : INV_X1 port map( A => n83, ZN => mask08_1_port);
   U71 : AND2_X1 port map( A1 => sel(0), A2 => A(3), ZN => mask00(3));
   U8 : INV_X1 port map( A => n42, ZN => mask16_3_port);
   U37 : INV_X1 port map( A => n72, ZN => mask08_3_port);
   U90 : INV_X1 port map( A => n82, ZN => mask16_15_port);
   U84 : INV_X1 port map( A => n94, ZN => mask00(32));
   U80 : INV_X1 port map( A => n92, ZN => mask00(34));
   U76 : INV_X1 port map( A => n90, ZN => mask00(36));
   U72 : INV_X1 port map( A => n88, ZN => mask00(38));
   U78 : INV_X1 port map( A => n91, ZN => mask00(35));
   U88 : INV_X1 port map( A => n95, ZN => mask00(31));
   U82 : INV_X1 port map( A => n93, ZN => mask00(33));
   U74 : INV_X1 port map( A => n89, ZN => mask00(37));
   U2 : INV_X1 port map( A => n36, ZN => mask16_9_port);
   U31 : INV_X1 port map( A => n66, ZN => mask16_10_port);
   U3 : INV_X1 port map( A => n37, ZN => mask16_8_port);
   U29 : INV_X1 port map( A => n64, ZN => mask16_12_port);
   U27 : INV_X1 port map( A => n62, ZN => mask16_14_port);
   U28 : INV_X1 port map( A => n63, ZN => mask16_13_port);
   U30 : INV_X1 port map( A => n65, ZN => mask16_11_port);
   U4 : INV_X1 port map( A => n68, ZN => mask08_7_port);
   U33 : INV_X1 port map( A => n38, ZN => mask16_7_port);
   U64 : NAND2_X1 port map( A1 => sel(0), A2 => A(7), ZN => n86);
   U65 : NAND2_X1 port map( A1 => n60, A2 => n86, ZN => mask00(7));
   U66 : AND2_X2 port map( A1 => sel(1), A2 => mask16_15_port, ZN => 
                           mask16_18_port);
   U86 : INV_X2 port map( A => mask16_18_port, ZN => n96);
   U87 : BUF_X1 port map( A => n85, Z => n87);
   U157 : NOR2_X2 port map( A1 => sel(0), A2 => sel(1), ZN => n85);

end SYN_behav;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity sum_gen_N32 is

   port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic_vector 
         (8 downto 0);  S : out std_logic_vector (31 downto 0));

end sum_gen_N32;

architecture SYN_STRUCTURAL of sum_gen_N32 is

   component carry_sel_gen_N4_1
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_2
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_3
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_4
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_5
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_6
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_7
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component carry_sel_gen_N4_0
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   signal net539424, net539425, net539426, net539427, net539428, net539429, 
      net539430, net539431 : std_logic;

begin
   
   csel_N_0 : carry_sel_gen_N4_0 port map( A(3) => A(3), A(2) => A(2), A(1) => 
                           A(1), A(0) => A(0), B(3) => B(3), B(2) => B(2), B(1)
                           => B(1), B(0) => B(0), Ci => Cin(0), S(3) => S(3), 
                           S(2) => S(2), S(1) => S(1), S(0) => S(0), Co => 
                           net539431);
   csel_N_1 : carry_sel_gen_N4_7 port map( A(3) => A(7), A(2) => A(6), A(1) => 
                           A(5), A(0) => A(4), B(3) => B(7), B(2) => B(6), B(1)
                           => B(5), B(0) => B(4), Ci => Cin(1), S(3) => S(7), 
                           S(2) => S(6), S(1) => S(5), S(0) => S(4), Co => 
                           net539430);
   csel_N_2 : carry_sel_gen_N4_6 port map( A(3) => A(11), A(2) => A(10), A(1) 
                           => A(9), A(0) => A(8), B(3) => B(11), B(2) => B(10),
                           B(1) => B(9), B(0) => B(8), Ci => Cin(2), S(3) => 
                           S(11), S(2) => S(10), S(1) => S(9), S(0) => S(8), Co
                           => net539429);
   csel_N_3 : carry_sel_gen_N4_5 port map( A(3) => A(15), A(2) => A(14), A(1) 
                           => A(13), A(0) => A(12), B(3) => B(15), B(2) => 
                           B(14), B(1) => B(13), B(0) => B(12), Ci => Cin(3), 
                           S(3) => S(15), S(2) => S(14), S(1) => S(13), S(0) =>
                           S(12), Co => net539428);
   csel_N_4 : carry_sel_gen_N4_4 port map( A(3) => A(19), A(2) => A(18), A(1) 
                           => A(17), A(0) => A(16), B(3) => B(19), B(2) => 
                           B(18), B(1) => B(17), B(0) => B(16), Ci => Cin(4), 
                           S(3) => S(19), S(2) => S(18), S(1) => S(17), S(0) =>
                           S(16), Co => net539427);
   csel_N_5 : carry_sel_gen_N4_3 port map( A(3) => A(23), A(2) => A(22), A(1) 
                           => A(21), A(0) => A(20), B(3) => B(23), B(2) => 
                           B(22), B(1) => B(21), B(0) => B(20), Ci => Cin(5), 
                           S(3) => S(23), S(2) => S(22), S(1) => S(21), S(0) =>
                           S(20), Co => net539426);
   csel_N_6 : carry_sel_gen_N4_2 port map( A(3) => A(27), A(2) => A(26), A(1) 
                           => A(25), A(0) => A(24), B(3) => B(27), B(2) => 
                           B(26), B(1) => B(25), B(0) => B(24), Ci => Cin(6), 
                           S(3) => S(27), S(2) => S(26), S(1) => S(25), S(0) =>
                           S(24), Co => net539425);
   csel_N_7 : carry_sel_gen_N4_1 port map( A(3) => A(31), A(2) => A(30), A(1) 
                           => A(29), A(0) => A(28), B(3) => B(31), B(2) => 
                           B(30), B(1) => B(29), B(0) => B(28), Ci => Cin(7), 
                           S(3) => S(31), S(2) => S(30), S(1) => S(29), S(0) =>
                           S(28), Co => net539424);

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity carry_tree_N32_logN5 is

   port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic;  Cout :
         out std_logic_vector (7 downto 0));

end carry_tree_N32_logN5;

architecture SYN_arch of carry_tree_N32_logN5 is

   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component pg_1
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_2
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_3
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_4
      port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
            g_BAR : in std_logic);
   end component;
   
   component pg_5
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component g_1
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_2
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_3
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_4
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_5
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_6
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_7
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component pg_6
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_7
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_8
      port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out 
            std_logic);
   end component;
   
   component pg_9
      port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
            g_BAR : in std_logic);
   end component;
   
   component pg_10
      port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
            g_BAR : in std_logic);
   end component;
   
   component pg_11
      port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
            g_BAR : in std_logic);
   end component;
   
   component pg_12
      port( p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic;  
            g_BAR : in std_logic);
   end component;
   
   component g_8
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component pg_13
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_14
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_15
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_16
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_17
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_18
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_19
      port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out 
            std_logic);
   end component;
   
   component pg_20
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_21
      port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out 
            std_logic);
   end component;
   
   component pg_22
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_23
      port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out 
            std_logic);
   end component;
   
   component pg_24
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_25
      port( g, p, g_prec, p_prec : in std_logic;  p_out, g_out_BAR : out 
            std_logic);
   end component;
   
   component pg_26
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component pg_0
      port( g, p, g_prec, p_prec : in std_logic;  g_out, p_out : out std_logic
            );
   end component;
   
   component g_9
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component g_0
      port( g, p, g_prec : in std_logic;  g_out : out std_logic);
   end component;
   
   component pg_net_1
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_2
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_3
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_4
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_5
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_6
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_7
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_8
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_9
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_10
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_11
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_12
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_13
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_14
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_15
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_16
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_17
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_18
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_19
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_20
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_21
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_22
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_23
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_24
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_25
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_26
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_27
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_28
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_29
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_30
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_31
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   component pg_net_0
      port( a, b : in std_logic;  g_out, p_out : out std_logic);
   end component;
   
   signal Cout_7_port, Cout_6_port, Cout_5_port, Cout_4_port, n9, Cout_2_port, 
      n10, n11, p_net_31_port, p_net_30_port, p_net_29_port, p_net_28_port, 
      p_net_27_port, p_net_26_port, p_net_25_port, p_net_24_port, p_net_23_port
      , p_net_22_port, p_net_21_port, p_net_20_port, p_net_19_port, 
      p_net_18_port, p_net_17_port, p_net_16_port, p_net_15_port, p_net_14_port
      , p_net_13_port, p_net_12_port, p_net_11_port, p_net_10_port, 
      p_net_9_port, p_net_8_port, p_net_7_port, p_net_6_port, p_net_5_port, 
      p_net_4_port, p_net_3_port, p_net_2_port, p_net_1_port, g_net_31_port, 
      g_net_30_port, g_net_29_port, g_net_28_port, g_net_27_port, g_net_26_port
      , g_net_25_port, g_net_24_port, g_net_23_port, g_net_22_port, 
      g_net_21_port, g_net_20_port, g_net_19_port, g_net_18_port, g_net_17_port
      , g_net_16_port, g_net_15_port, g_net_14_port, g_net_13_port, 
      g_net_12_port, g_net_11_port, g_net_10_port, g_net_9_port, g_net_8_port, 
      g_net_7_port, g_net_6_port, g_net_5_port, g_net_4_port, g_net_3_port, 
      g_net_2_port, g_net_1_port, g_net_0_port, magic_pro_1_port, 
      magic_pro_0_port, pg_1_15_1_port, pg_1_15_0_port, pg_1_14_1_port, 
      pg_1_14_0_port, pg_1_13_1_port, pg_1_13_0_port, pg_1_12_1_port, 
      pg_1_12_0_port, pg_1_11_1_port, pg_1_11_0_port, pg_1_10_1_port, 
      pg_1_10_0_port, pg_1_9_1_port, pg_1_9_0_port, pg_1_8_1_port, 
      pg_1_8_0_port, pg_1_7_1_port, pg_1_7_0_port, pg_1_6_1_port, pg_1_6_0_port
      , pg_1_5_1_port, pg_1_5_0_port, pg_1_4_1_port, pg_1_4_0_port, 
      pg_1_3_1_port, pg_1_3_0_port, pg_1_2_1_port, pg_1_2_0_port, pg_1_1_1_port
      , pg_1_1_0_port, pg_1_0_0_port, pg_n_4_7_1_port, pg_n_4_7_0_port, 
      pg_n_4_6_1_port, pg_n_4_6_0_port, pg_n_3_7_1_port, pg_n_3_7_0_port, 
      pg_n_3_5_1_port, pg_n_3_5_0_port, pg_n_3_3_1_port, pg_n_3_3_0_port, 
      pg_n_2_7_1_port, pg_n_2_7_0_port, pg_n_2_6_1_port, pg_n_2_6_0_port, 
      pg_n_2_5_1_port, pg_n_2_5_0_port, pg_n_2_4_1_port, pg_n_2_4_0_port, 
      pg_n_2_3_1_port, pg_n_2_3_0_port, pg_n_2_2_1_port, pg_n_2_2_0_port, 
      pg_n_2_1_1_port, pg_n_2_1_0_port, n1, Cout_3_port, Cout_1_port, n5, 
      Cout_0_port, n7, n8 : std_logic;

begin
   Cout <= ( Cout_7_port, Cout_6_port, Cout_5_port, Cout_4_port, Cout_3_port, 
      Cout_2_port, Cout_1_port, Cout_0_port );
   
   pg_net_x_1 : pg_net_0 port map( a => A(1), b => B(1), g_out => g_net_1_port,
                           p_out => p_net_1_port);
   pg_net_x_2 : pg_net_31 port map( a => A(2), b => B(2), g_out => g_net_2_port
                           , p_out => p_net_2_port);
   pg_net_x_3 : pg_net_30 port map( a => A(3), b => B(3), g_out => g_net_3_port
                           , p_out => p_net_3_port);
   pg_net_x_4 : pg_net_29 port map( a => A(4), b => B(4), g_out => g_net_4_port
                           , p_out => p_net_4_port);
   pg_net_x_5 : pg_net_28 port map( a => A(5), b => B(5), g_out => g_net_5_port
                           , p_out => p_net_5_port);
   pg_net_x_6 : pg_net_27 port map( a => A(6), b => B(6), g_out => g_net_6_port
                           , p_out => p_net_6_port);
   pg_net_x_7 : pg_net_26 port map( a => A(7), b => B(7), g_out => g_net_7_port
                           , p_out => p_net_7_port);
   pg_net_x_8 : pg_net_25 port map( a => A(8), b => B(8), g_out => g_net_8_port
                           , p_out => p_net_8_port);
   pg_net_x_9 : pg_net_24 port map( a => A(9), b => B(9), g_out => g_net_9_port
                           , p_out => p_net_9_port);
   pg_net_x_10 : pg_net_23 port map( a => A(10), b => B(10), g_out => 
                           g_net_10_port, p_out => p_net_10_port);
   pg_net_x_11 : pg_net_22 port map( a => A(11), b => B(11), g_out => 
                           g_net_11_port, p_out => p_net_11_port);
   pg_net_x_12 : pg_net_21 port map( a => A(12), b => B(12), g_out => 
                           g_net_12_port, p_out => p_net_12_port);
   pg_net_x_13 : pg_net_20 port map( a => A(13), b => B(13), g_out => 
                           g_net_13_port, p_out => p_net_13_port);
   pg_net_x_14 : pg_net_19 port map( a => A(14), b => B(14), g_out => 
                           g_net_14_port, p_out => p_net_14_port);
   pg_net_x_15 : pg_net_18 port map( a => A(15), b => B(15), g_out => 
                           g_net_15_port, p_out => p_net_15_port);
   pg_net_x_16 : pg_net_17 port map( a => A(16), b => B(16), g_out => 
                           g_net_16_port, p_out => p_net_16_port);
   pg_net_x_17 : pg_net_16 port map( a => A(17), b => B(17), g_out => 
                           g_net_17_port, p_out => p_net_17_port);
   pg_net_x_18 : pg_net_15 port map( a => A(18), b => B(18), g_out => 
                           g_net_18_port, p_out => p_net_18_port);
   pg_net_x_19 : pg_net_14 port map( a => A(19), b => B(19), g_out => 
                           g_net_19_port, p_out => p_net_19_port);
   pg_net_x_20 : pg_net_13 port map( a => A(20), b => B(20), g_out => 
                           g_net_20_port, p_out => p_net_20_port);
   pg_net_x_21 : pg_net_12 port map( a => A(21), b => B(21), g_out => 
                           g_net_21_port, p_out => p_net_21_port);
   pg_net_x_22 : pg_net_11 port map( a => A(22), b => B(22), g_out => 
                           g_net_22_port, p_out => p_net_22_port);
   pg_net_x_23 : pg_net_10 port map( a => A(23), b => B(23), g_out => 
                           g_net_23_port, p_out => p_net_23_port);
   pg_net_x_24 : pg_net_9 port map( a => A(24), b => B(24), g_out => 
                           g_net_24_port, p_out => p_net_24_port);
   pg_net_x_25 : pg_net_8 port map( a => A(25), b => B(25), g_out => 
                           g_net_25_port, p_out => p_net_25_port);
   pg_net_x_26 : pg_net_7 port map( a => A(26), b => B(26), g_out => 
                           g_net_26_port, p_out => p_net_26_port);
   pg_net_x_27 : pg_net_6 port map( a => A(27), b => B(27), g_out => 
                           g_net_27_port, p_out => p_net_27_port);
   pg_net_x_28 : pg_net_5 port map( a => A(28), b => B(28), g_out => 
                           g_net_28_port, p_out => p_net_28_port);
   pg_net_x_29 : pg_net_4 port map( a => A(29), b => B(29), g_out => 
                           g_net_29_port, p_out => p_net_29_port);
   pg_net_x_30 : pg_net_3 port map( a => A(30), b => B(30), g_out => 
                           g_net_30_port, p_out => p_net_30_port);
   pg_net_x_31 : pg_net_2 port map( a => A(31), b => B(31), g_out => 
                           g_net_31_port, p_out => p_net_31_port);
   pg_net_0_MAGIC : pg_net_1 port map( a => A(0), b => B(0), g_out => 
                           magic_pro_0_port, p_out => magic_pro_1_port);
   xG_0_0_MAGIC : g_0 port map( g => magic_pro_0_port, p => magic_pro_1_port, 
                           g_prec => Cin, g_out => g_net_0_port);
   xG_1_0 : g_9 port map( g => g_net_1_port, p => p_net_1_port, g_prec => 
                           g_net_0_port, g_out => pg_1_0_0_port);
   xPG_1_1 : pg_0 port map( g => g_net_3_port, p => p_net_3_port, g_prec => 
                           g_net_2_port, p_prec => p_net_2_port, g_out => 
                           pg_1_1_0_port, p_out => pg_1_1_1_port);
   xPG_1_2 : pg_26 port map( g => g_net_5_port, p => p_net_5_port, g_prec => 
                           g_net_4_port, p_prec => p_net_4_port, g_out => 
                           pg_1_2_0_port, p_out => pg_1_2_1_port);
   xPG_1_3 : pg_25 port map( g => g_net_7_port, p => p_net_7_port, g_prec => 
                           g_net_6_port, p_prec => p_net_6_port, p_out => 
                           pg_1_3_1_port, g_out_BAR => pg_1_3_0_port);
   xPG_1_4 : pg_24 port map( g => g_net_9_port, p => p_net_9_port, g_prec => 
                           g_net_8_port, p_prec => p_net_8_port, g_out => 
                           pg_1_4_0_port, p_out => pg_1_4_1_port);
   xPG_1_5 : pg_23 port map( g => g_net_11_port, p => p_net_11_port, g_prec => 
                           g_net_10_port, p_prec => p_net_10_port, p_out => 
                           pg_1_5_1_port, g_out_BAR => pg_1_5_0_port);
   xPG_1_6 : pg_22 port map( g => g_net_13_port, p => p_net_13_port, g_prec => 
                           g_net_12_port, p_prec => p_net_12_port, g_out => 
                           pg_1_6_0_port, p_out => pg_1_6_1_port);
   xPG_1_7 : pg_21 port map( g => g_net_15_port, p => p_net_15_port, g_prec => 
                           g_net_14_port, p_prec => p_net_14_port, p_out => 
                           pg_1_7_1_port, g_out_BAR => pg_1_7_0_port);
   xPG_1_8 : pg_20 port map( g => g_net_17_port, p => p_net_17_port, g_prec => 
                           g_net_16_port, p_prec => p_net_16_port, g_out => 
                           pg_1_8_0_port, p_out => pg_1_8_1_port);
   xPG_1_9 : pg_19 port map( g => g_net_19_port, p => p_net_19_port, g_prec => 
                           g_net_18_port, p_prec => p_net_18_port, p_out => 
                           pg_1_9_1_port, g_out_BAR => pg_1_9_0_port);
   xPG_1_10 : pg_18 port map( g => g_net_21_port, p => p_net_21_port, g_prec =>
                           g_net_20_port, p_prec => p_net_20_port, g_out => 
                           pg_1_10_0_port, p_out => pg_1_10_1_port);
   xPG_1_11 : pg_17 port map( g => g_net_23_port, p => p_net_23_port, g_prec =>
                           g_net_22_port, p_prec => p_net_22_port, g_out => 
                           pg_1_11_0_port, p_out => pg_1_11_1_port);
   xPG_1_12 : pg_16 port map( g => g_net_25_port, p => p_net_25_port, g_prec =>
                           g_net_24_port, p_prec => p_net_24_port, g_out => 
                           pg_1_12_0_port, p_out => pg_1_12_1_port);
   xPG_1_13 : pg_15 port map( g => g_net_27_port, p => p_net_27_port, g_prec =>
                           g_net_26_port, p_prec => p_net_26_port, g_out => 
                           pg_1_13_0_port, p_out => pg_1_13_1_port);
   xPG_1_14 : pg_14 port map( g => g_net_29_port, p => p_net_29_port, g_prec =>
                           g_net_28_port, p_prec => p_net_28_port, g_out => 
                           pg_1_14_0_port, p_out => pg_1_14_1_port);
   xPG_1_15 : pg_13 port map( g => g_net_31_port, p => p_net_31_port, g_prec =>
                           g_net_30_port, p_prec => p_net_30_port, g_out => 
                           pg_1_15_0_port, p_out => pg_1_15_1_port);
   xG_2_0 : g_8 port map( g => pg_1_1_0_port, p => pg_1_1_1_port, g_prec => 
                           pg_1_0_0_port, g_out => n11);
   xPG_2_1 : pg_12 port map( p => pg_1_3_1_port, g_prec => pg_1_2_0_port, 
                           p_prec => pg_1_2_1_port, g_out => pg_n_2_1_0_port, 
                           p_out => pg_n_2_1_1_port, g_BAR => pg_1_3_0_port);
   xPG_2_2 : pg_11 port map( p => pg_1_5_1_port, g_prec => pg_1_4_0_port, 
                           p_prec => pg_1_4_1_port, g_out => pg_n_2_2_0_port, 
                           p_out => pg_n_2_2_1_port, g_BAR => pg_1_5_0_port);
   xPG_2_3 : pg_10 port map( p => pg_1_7_1_port, g_prec => pg_1_6_0_port, 
                           p_prec => pg_1_6_1_port, g_out => pg_n_2_3_0_port, 
                           p_out => pg_n_2_3_1_port, g_BAR => pg_1_7_0_port);
   xPG_2_4 : pg_9 port map( p => pg_1_9_1_port, g_prec => pg_1_8_0_port, p_prec
                           => pg_1_8_1_port, g_out => pg_n_2_4_0_port, p_out =>
                           pg_n_2_4_1_port, g_BAR => pg_1_9_0_port);
   xPG_2_5 : pg_8 port map( g => pg_1_11_0_port, p => pg_1_11_1_port, g_prec =>
                           pg_1_10_0_port, p_prec => pg_1_10_1_port, p_out => 
                           pg_n_2_5_1_port, g_out_BAR => pg_n_2_5_0_port);
   xPG_2_6 : pg_7 port map( g => pg_1_13_0_port, p => pg_1_13_1_port, g_prec =>
                           pg_1_12_0_port, p_prec => pg_1_12_1_port, g_out => 
                           pg_n_2_6_0_port, p_out => pg_n_2_6_1_port);
   xPG_2_7 : pg_6 port map( g => pg_1_15_0_port, p => pg_1_15_1_port, g_prec =>
                           pg_1_14_0_port, p_prec => pg_1_14_1_port, g_out => 
                           pg_n_2_7_0_port, p_out => pg_n_2_7_1_port);
   xG_3_1 : g_7 port map( g => pg_n_2_1_0_port, p => pg_n_2_1_1_port, g_prec =>
                           n11, g_out => n10);
   xG_4_2 : g_6 port map( g => pg_n_2_2_0_port, p => pg_n_2_2_1_port, g_prec =>
                           n8, g_out => Cout_2_port);
   xG_4_3 : g_5 port map( g => pg_n_3_3_0_port, p => pg_n_3_3_1_port, g_prec =>
                           n10, g_out => n9);
   xG_5_4 : g_4 port map( g => n5, p => pg_n_2_4_1_port, g_prec => n9, g_out =>
                           Cout_4_port);
   xG_5_5 : g_3 port map( g => n7, p => pg_n_3_5_1_port, g_prec => n9, g_out =>
                           Cout_5_port);
   xG_5_6 : g_2 port map( g => pg_n_4_6_0_port, p => pg_n_4_6_1_port, g_prec =>
                           n9, g_out => Cout_6_port);
   xG_5_7 : g_1 port map( g => pg_n_4_7_0_port, p => pg_n_4_7_1_port, g_prec =>
                           n1, g_out => Cout_7_port);
   xPG_3_3 : pg_5 port map( g => pg_n_2_3_0_port, p => pg_n_2_3_1_port, g_prec 
                           => pg_n_2_2_0_port, p_prec => pg_n_2_2_1_port, g_out
                           => pg_n_3_3_0_port, p_out => pg_n_3_3_1_port);
   xPG_3_5 : pg_4 port map( p => pg_n_2_5_1_port, g_prec => pg_n_2_4_0_port, 
                           p_prec => pg_n_2_4_1_port, g_out => pg_n_3_5_0_port,
                           p_out => pg_n_3_5_1_port, g_BAR => pg_n_2_5_0_port);
   xPG_3_7 : pg_3 port map( g => pg_n_2_7_0_port, p => pg_n_2_7_1_port, g_prec 
                           => pg_n_2_6_0_port, p_prec => pg_n_2_6_1_port, g_out
                           => pg_n_3_7_0_port, p_out => pg_n_3_7_1_port);
   xPG_4_6 : pg_2 port map( g => pg_n_2_6_0_port, p => pg_n_2_6_1_port, g_prec 
                           => pg_n_3_5_0_port, p_prec => pg_n_3_5_1_port, g_out
                           => pg_n_4_6_0_port, p_out => pg_n_4_6_1_port);
   xPG_4_7 : pg_1 port map( g => pg_n_3_7_0_port, p => pg_n_3_7_1_port, g_prec 
                           => n7, p_prec => pg_n_3_5_1_port, g_out => 
                           pg_n_4_7_0_port, p_out => pg_n_4_7_1_port);
   U1 : CLKBUF_X1 port map( A => Cout_3_port, Z => n1);
   U2 : BUF_X1 port map( A => n9, Z => Cout_3_port);
   U3 : CLKBUF_X1 port map( A => pg_n_3_5_0_port, Z => n7);
   U4 : CLKBUF_X1 port map( A => n11, Z => Cout_0_port);
   U5 : CLKBUF_X1 port map( A => pg_n_2_4_0_port, Z => n5);
   U6 : CLKBUF_X1 port map( A => n8, Z => Cout_1_port);
   U7 : CLKBUF_X1 port map( A => n10, Z => n8);

end SYN_arch;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity xor_gen_N32 is

   port( A : in std_logic_vector (31 downto 0);  B : in std_logic;  S : out 
         std_logic_vector (31 downto 0));

end xor_gen_N32;

architecture SYN_bhe of xor_gen_N32 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component XNOR2_X2
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   signal n13, n1, n2, n3, n4, n6, n7, n8, n9, n10, n11 : std_logic;

begin
   
   U8 : XOR2_X1 port map( A => B, B => A(31), Z => S(31));
   U9 : XOR2_X1 port map( A => B, B => A(30), Z => S(30));
   U12 : XOR2_X1 port map( A => B, B => A(28), Z => S(28));
   U15 : XOR2_X1 port map( A => B, B => A(25), Z => S(25));
   U17 : XOR2_X1 port map( A => B, B => A(23), Z => S(23));
   U26 : XOR2_X1 port map( A => A(15), B => B, Z => S(15));
   U30 : XOR2_X1 port map( A => B, B => A(11), Z => S(11));
   U16 : XOR2_X1 port map( A => B, B => A(24), Z => S(24));
   U1 : XOR2_X1 port map( A => A(20), B => B, Z => S(20));
   U2 : XNOR2_X1 port map( A => n2, B => A(3), ZN => S(3));
   U3 : MUX2_X1 port map( A => B, B => n2, S => A(7), Z => S(7));
   U4 : XNOR2_X1 port map( A => A(8), B => n2, ZN => S(8));
   U5 : XOR2_X1 port map( A => B, B => A(29), Z => S(29));
   U6 : XOR2_X1 port map( A => B, B => A(26), Z => S(26));
   U7 : XNOR2_X1 port map( A => A(27), B => n2, ZN => S(27));
   U10 : XOR2_X2 port map( A => B, B => A(22), Z => S(22));
   U11 : OAI21_X1 port map( B1 => A(13), B2 => n2, A => n4, ZN => S(13));
   U13 : OAI21_X1 port map( B1 => n2, B2 => A(0), A => n1, ZN => S(0));
   U14 : NAND2_X1 port map( A1 => A(0), A2 => n2, ZN => n1);
   U18 : XNOR2_X2 port map( A => A(19), B => n2, ZN => S(19));
   U19 : INV_X2 port map( A => B, ZN => n2);
   U20 : XNOR2_X2 port map( A => A(12), B => n2, ZN => S(12));
   U21 : XNOR2_X2 port map( A => A(21), B => n2, ZN => S(21));
   U22 : XNOR2_X1 port map( A => A(17), B => n2, ZN => S(17));
   U23 : XNOR2_X2 port map( A => A(16), B => n2, ZN => S(16));
   U24 : XOR2_X1 port map( A => B, B => A(18), Z => S(18));
   U25 : XOR2_X1 port map( A => A(2), B => B, Z => S(2));
   U27 : BUF_X2 port map( A => n13, Z => S(6));
   U28 : INV_X1 port map( A => A(9), ZN => n9);
   U29 : INV_X1 port map( A => A(14), ZN => n6);
   U31 : NAND2_X1 port map( A1 => A(1), A2 => n2, ZN => n3);
   U32 : OAI21_X1 port map( B1 => A(1), B2 => n2, A => n3, ZN => S(1));
   U33 : NAND2_X1 port map( A1 => A(13), A2 => n2, ZN => n4);
   U34 : NAND2_X1 port map( A1 => n10, A2 => n11, ZN => S(9));
   U35 : NAND2_X1 port map( A1 => n7, A2 => n8, ZN => S(14));
   U36 : XOR2_X1 port map( A => B, B => A(10), Z => S(10));
   U37 : XOR2_X1 port map( A => B, B => A(5), Z => S(5));
   U38 : XOR2_X1 port map( A => B, B => A(6), Z => n13);
   U39 : XOR2_X1 port map( A => A(4), B => B, Z => S(4));
   U40 : NAND2_X1 port map( A1 => B, A2 => n6, ZN => n7);
   U41 : NAND2_X1 port map( A1 => A(14), A2 => n2, ZN => n8);
   U42 : NAND2_X1 port map( A1 => B, A2 => n9, ZN => n10);
   U43 : NAND2_X1 port map( A1 => n2, A2 => A(9), ZN => n11);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity ff32_en_SIZE32 is

   port( D : in std_logic_vector (31 downto 0);  en, clk, rst : in std_logic;  
         Q : out std_logic_vector (31 downto 0));

end ff32_en_SIZE32;

architecture SYN_behavioral of ff32_en_SIZE32 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
      n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93
      , n94, n95, n97, net549739, net549740, net549741, net549742, net549743, 
      net549744, net549745, net549746, net549747, net549748, net549749, 
      net549750, net549751, net549752, net549753, net549754, net549755, 
      net549756, net549757, net549758, net549759, net549760, net549761, 
      net549762, net549763, net549764, net549765, net549766, net549767, 
      net549768, net549769, net549770, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11
      , n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, 
      n27, n28, n29, n30, n31, n32, n33, n1, n34 : std_logic;

begin
   
   Q_reg_31_inst : DFFR_X1 port map( D => n97, CK => clk, RN => n34, Q => Q(31)
                           , QN => net549770);
   Q_reg_30_inst : DFFR_X1 port map( D => n95, CK => clk, RN => n34, Q => Q(30)
                           , QN => net549769);
   Q_reg_29_inst : DFFR_X1 port map( D => n94, CK => clk, RN => n34, Q => Q(29)
                           , QN => net549768);
   Q_reg_28_inst : DFFR_X1 port map( D => n93, CK => clk, RN => n34, Q => Q(28)
                           , QN => net549767);
   Q_reg_27_inst : DFFR_X1 port map( D => n92, CK => clk, RN => n34, Q => Q(27)
                           , QN => net549766);
   Q_reg_26_inst : DFFR_X1 port map( D => n91, CK => clk, RN => n34, Q => Q(26)
                           , QN => net549765);
   Q_reg_25_inst : DFFR_X1 port map( D => n90, CK => clk, RN => n34, Q => Q(25)
                           , QN => net549764);
   Q_reg_24_inst : DFFR_X1 port map( D => n89, CK => clk, RN => n34, Q => Q(24)
                           , QN => net549763);
   Q_reg_23_inst : DFFR_X1 port map( D => n88, CK => clk, RN => n34, Q => Q(23)
                           , QN => net549762);
   Q_reg_22_inst : DFFR_X1 port map( D => n87, CK => clk, RN => n34, Q => Q(22)
                           , QN => net549761);
   Q_reg_21_inst : DFFR_X1 port map( D => n86, CK => clk, RN => n34, Q => Q(21)
                           , QN => net549760);
   Q_reg_19_inst : DFFR_X1 port map( D => n84, CK => clk, RN => n34, Q => Q(19)
                           , QN => net549758);
   Q_reg_18_inst : DFFR_X1 port map( D => n83, CK => clk, RN => n34, Q => Q(18)
                           , QN => net549757);
   Q_reg_17_inst : DFFR_X1 port map( D => n82, CK => clk, RN => n34, Q => Q(17)
                           , QN => net549756);
   Q_reg_16_inst : DFFR_X1 port map( D => n81, CK => clk, RN => n34, Q => Q(16)
                           , QN => net549755);
   Q_reg_15_inst : DFFR_X1 port map( D => n80, CK => clk, RN => n34, Q => Q(15)
                           , QN => net549754);
   Q_reg_14_inst : DFFR_X1 port map( D => n79, CK => clk, RN => n34, Q => Q(14)
                           , QN => net549753);
   Q_reg_13_inst : DFFR_X1 port map( D => n78, CK => clk, RN => n34, Q => Q(13)
                           , QN => net549752);
   Q_reg_12_inst : DFFR_X1 port map( D => n77, CK => clk, RN => n34, Q => Q(12)
                           , QN => net549751);
   Q_reg_11_inst : DFFR_X1 port map( D => n76, CK => clk, RN => n34, Q => Q(11)
                           , QN => net549750);
   Q_reg_10_inst : DFFR_X1 port map( D => n75, CK => clk, RN => n34, Q => Q(10)
                           , QN => net549749);
   Q_reg_9_inst : DFFR_X1 port map( D => n74, CK => clk, RN => n34, Q => Q(9), 
                           QN => net549748);
   Q_reg_8_inst : DFFR_X1 port map( D => n73, CK => clk, RN => n34, Q => Q(8), 
                           QN => net549747);
   Q_reg_7_inst : DFFR_X1 port map( D => n72, CK => clk, RN => n34, Q => Q(7), 
                           QN => net549746);
   Q_reg_6_inst : DFFR_X1 port map( D => n71, CK => clk, RN => n34, Q => Q(6), 
                           QN => net549745);
   Q_reg_5_inst : DFFR_X1 port map( D => n70, CK => clk, RN => n34, Q => Q(5), 
                           QN => net549744);
   Q_reg_4_inst : DFFR_X1 port map( D => n69, CK => clk, RN => n34, Q => Q(4), 
                           QN => net549743);
   Q_reg_3_inst : DFFR_X1 port map( D => n68, CK => clk, RN => n34, Q => Q(3), 
                           QN => net549742);
   Q_reg_2_inst : DFFR_X1 port map( D => n67, CK => clk, RN => n34, Q => Q(2), 
                           QN => net549741);
   Q_reg_1_inst : DFFR_X1 port map( D => n66, CK => clk, RN => n34, Q => Q(1), 
                           QN => net549740);
   Q_reg_0_inst : DFFR_X1 port map( D => n65, CK => clk, RN => n34, Q => Q(0), 
                           QN => net549739);
   U9 : OAI21_X1 port map( B1 => en, B2 => net549767, A => n5, ZN => n93);
   U21 : OAI21_X1 port map( B1 => en, B2 => net549761, A => n11, ZN => n87);
   U7 : OAI21_X1 port map( B1 => en, B2 => net549768, A => n4, ZN => n94);
   U2 : OAI21_X1 port map( B1 => en, B2 => net549770, A => n2, ZN => n97);
   U17 : OAI21_X1 port map( B1 => en, B2 => net549763, A => n9, ZN => n89);
   U11 : OAI21_X1 port map( B1 => en, B2 => net549766, A => n6, ZN => n92);
   U19 : OAI21_X1 port map( B1 => en, B2 => net549762, A => n10, ZN => n88);
   U13 : OAI21_X1 port map( B1 => en, B2 => net549765, A => n7, ZN => n91);
   U40 : NAND2_X1 port map( A1 => en, A2 => D(13), ZN => n20);
   U39 : OAI21_X1 port map( B1 => en, B2 => net549752, A => n20, ZN => n78);
   U36 : NAND2_X1 port map( A1 => en, A2 => D(15), ZN => n18);
   U35 : OAI21_X1 port map( B1 => en, B2 => net549754, A => n18, ZN => n80);
   U32 : NAND2_X1 port map( A1 => en, A2 => D(17), ZN => n16);
   U31 : OAI21_X1 port map( B1 => en, B2 => net549756, A => n16, ZN => n82);
   U30 : NAND2_X1 port map( A1 => en, A2 => D(18), ZN => n15);
   U29 : OAI21_X1 port map( B1 => en, B2 => net549757, A => n15, ZN => n83);
   U34 : NAND2_X1 port map( A1 => en, A2 => D(16), ZN => n17);
   U33 : OAI21_X1 port map( B1 => en, B2 => net549755, A => n17, ZN => n81);
   U27 : OAI21_X1 port map( B1 => en, B2 => net549758, A => n14, ZN => n84);
   U38 : NAND2_X1 port map( A1 => en, A2 => D(14), ZN => n19);
   U37 : OAI21_X1 port map( B1 => en, B2 => net549753, A => n19, ZN => n79);
   U42 : NAND2_X1 port map( A1 => en, A2 => D(12), ZN => n21);
   U41 : OAI21_X1 port map( B1 => en, B2 => net549751, A => n21, ZN => n77);
   U44 : NAND2_X1 port map( A1 => en, A2 => D(11), ZN => n22);
   U43 : OAI21_X1 port map( B1 => en, B2 => net549750, A => n22, ZN => n76);
   U50 : NAND2_X1 port map( A1 => en, A2 => D(8), ZN => n25);
   U49 : OAI21_X1 port map( B1 => en, B2 => net549747, A => n25, ZN => n73);
   U48 : NAND2_X1 port map( A1 => en, A2 => D(9), ZN => n24);
   U47 : OAI21_X1 port map( B1 => en, B2 => net549748, A => n24, ZN => n74);
   U46 : NAND2_X1 port map( A1 => en, A2 => D(10), ZN => n23);
   U45 : OAI21_X1 port map( B1 => en, B2 => net549749, A => n23, ZN => n75);
   U52 : NAND2_X1 port map( A1 => en, A2 => D(7), ZN => n26);
   U51 : OAI21_X1 port map( B1 => en, B2 => net549746, A => n26, ZN => n72);
   U54 : NAND2_X1 port map( A1 => en, A2 => D(6), ZN => n27);
   U53 : OAI21_X1 port map( B1 => en, B2 => net549745, A => n27, ZN => n71);
   U60 : NAND2_X1 port map( A1 => en, A2 => D(3), ZN => n30);
   U59 : OAI21_X1 port map( B1 => en, B2 => net549742, A => n30, ZN => n68);
   U56 : NAND2_X1 port map( A1 => en, A2 => D(5), ZN => n28);
   U55 : OAI21_X1 port map( B1 => en, B2 => net549744, A => n28, ZN => n70);
   U58 : NAND2_X1 port map( A1 => en, A2 => D(4), ZN => n29);
   U57 : OAI21_X1 port map( B1 => en, B2 => net549743, A => n29, ZN => n69);
   U62 : NAND2_X1 port map( A1 => en, A2 => D(2), ZN => n31);
   U61 : OAI21_X1 port map( B1 => en, B2 => net549741, A => n31, ZN => n67);
   U64 : NAND2_X1 port map( A1 => en, A2 => D(1), ZN => n32);
   U63 : OAI21_X1 port map( B1 => en, B2 => net549740, A => n32, ZN => n66);
   U66 : NAND2_X1 port map( A1 => en, A2 => D(0), ZN => n33);
   U65 : OAI21_X1 port map( B1 => en, B2 => net549739, A => n33, ZN => n65);
   Q_reg_20_inst : DFFR_X1 port map( D => n85, CK => clk, RN => n34, Q => Q(20)
                           , QN => net549759);
   U3 : NAND2_X1 port map( A1 => en, A2 => D(21), ZN => n1);
   U4 : OAI21_X1 port map( B1 => en, B2 => net549760, A => n1, ZN => n86);
   U5 : INV_X2 port map( A => rst, ZN => n34);
   U6 : OAI21_X1 port map( B1 => en, B2 => net549769, A => n3, ZN => n95);
   U8 : NAND2_X1 port map( A1 => en, A2 => D(30), ZN => n3);
   U10 : OAI21_X1 port map( B1 => en, B2 => net549764, A => n8, ZN => n90);
   U12 : NAND2_X1 port map( A1 => en, A2 => D(25), ZN => n8);
   U14 : NAND2_X1 port map( A1 => en, A2 => D(24), ZN => n9);
   U15 : NAND2_X1 port map( A1 => en, A2 => D(26), ZN => n7);
   U16 : OAI21_X1 port map( B1 => en, B2 => net549759, A => n13, ZN => n85);
   U18 : NAND2_X1 port map( A1 => en, A2 => D(20), ZN => n13);
   U20 : NAND2_X1 port map( A1 => en, A2 => D(27), ZN => n6);
   U22 : NAND2_X1 port map( A1 => en, A2 => D(23), ZN => n10);
   U23 : NAND2_X1 port map( A1 => en, A2 => D(19), ZN => n14);
   U24 : NAND2_X1 port map( A1 => en, A2 => D(22), ZN => n11);
   U25 : NAND2_X1 port map( A1 => en, A2 => D(28), ZN => n5);
   U26 : NAND2_X1 port map( A1 => en, A2 => D(29), ZN => n4);
   U28 : NAND2_X1 port map( A1 => en, A2 => D(31), ZN => n2);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity piso_r_2_N32 is

   port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (31 downto 0);  
         SO : out std_logic_vector (31 downto 0));

end piso_r_2_N32;

architecture SYN_archi of piso_r_2_N32 is

   component SDFF_X1
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFF_X1
      port( D, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal SO_31_port, SO_30_port, SO_29_port, SO_28_port, SO_27_port, 
      SO_26_port, SO_25_port, SO_24_port, SO_23_port, SO_22_port, SO_21_port, 
      SO_20_port, SO_19_port, SO_18_port, SO_17_port, SO_16_port, SO_15_port, 
      SO_14_port, SO_13_port, SO_12_port, SO_11_port, SO_10_port, SO_9_port, 
      SO_8_port, SO_7_port, SO_6_port, SO_5_port, SO_4_port, SO_3_port, 
      SO_2_port, SO_1_port, SO_0_port, N3, N4, N5, N6, N7, N8, N9, N10, N11, 
      N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26
      , N27, N28, N29, N30, N31, N32, net549709, net549710, net549711, 
      net549712, net549713, net549714, net549715, net549716, net549717, 
      net549718, net549719, net549720, net549721, net549722, net549723, 
      net549724, net549725, net549726, net549727, net549728, net549729, 
      net549730, net549731, net549732, net549733, net549734, net549735, 
      net549736, net549737, net549738, n1, n3_port, n4_port, n5_port, n6_port, 
      n9_port, n10_port, n11_port, n12_port, n13_port, n14_port, n15_port, 
      n16_port, n17_port, n19_port, n20_port, n21_port, n22_port, n23_port, 
      n24_port, n25_port, n26_port, n27_port, n28_port, n29_port, n30_port, 
      n31_port, n32_port, n2, n7_port : std_logic;

begin
   SO <= ( SO_31_port, SO_30_port, SO_29_port, SO_28_port, SO_27_port, 
      SO_26_port, SO_25_port, SO_24_port, SO_23_port, SO_22_port, SO_21_port, 
      SO_20_port, SO_19_port, SO_18_port, SO_17_port, SO_16_port, SO_15_port, 
      SO_14_port, SO_13_port, SO_12_port, SO_11_port, SO_10_port, SO_9_port, 
      SO_8_port, SO_7_port, SO_6_port, SO_5_port, SO_4_port, SO_3_port, 
      SO_2_port, SO_1_port, SO_0_port );
   
   tmp_reg_1_inst : DFF_X1 port map( D => N4, CK => Clock, Q => SO_1_port, QN 
                           => net549738);
   tmp_reg_3_inst : DFF_X1 port map( D => N6, CK => Clock, Q => SO_3_port, QN 
                           => net549737);
   tmp_reg_5_inst : DFF_X1 port map( D => N8, CK => Clock, Q => SO_5_port, QN 
                           => net549736);
   tmp_reg_7_inst : DFF_X1 port map( D => N10, CK => Clock, Q => SO_7_port, QN 
                           => net549735);
   tmp_reg_9_inst : DFF_X1 port map( D => N12, CK => Clock, Q => SO_9_port, QN 
                           => net549734);
   tmp_reg_11_inst : DFF_X1 port map( D => N14, CK => Clock, Q => SO_11_port, 
                           QN => net549733);
   tmp_reg_13_inst : DFF_X1 port map( D => N16, CK => Clock, Q => SO_13_port, 
                           QN => net549732);
   tmp_reg_15_inst : DFF_X1 port map( D => N18, CK => Clock, Q => SO_15_port, 
                           QN => net549731);
   tmp_reg_17_inst : DFF_X1 port map( D => N20, CK => Clock, Q => SO_17_port, 
                           QN => net549730);
   tmp_reg_19_inst : DFF_X1 port map( D => N22, CK => Clock, Q => SO_19_port, 
                           QN => net549729);
   tmp_reg_21_inst : DFF_X1 port map( D => N24, CK => Clock, Q => SO_21_port, 
                           QN => net549728);
   tmp_reg_23_inst : DFF_X1 port map( D => N26, CK => Clock, Q => SO_23_port, 
                           QN => net549727);
   tmp_reg_25_inst : DFF_X1 port map( D => N28, CK => Clock, Q => SO_25_port, 
                           QN => net549726);
   tmp_reg_27_inst : DFF_X1 port map( D => N30, CK => Clock, Q => SO_27_port, 
                           QN => net549725);
   tmp_reg_29_inst : DFF_X1 port map( D => N32, CK => Clock, Q => SO_29_port, 
                           QN => net549724);
   tmp_reg_0_inst : DFF_X1 port map( D => N3, CK => Clock, Q => SO_0_port, QN 
                           => net549723);
   tmp_reg_2_inst : DFF_X1 port map( D => N5, CK => Clock, Q => SO_2_port, QN 
                           => net549722);
   tmp_reg_4_inst : DFF_X1 port map( D => N7, CK => Clock, Q => SO_4_port, QN 
                           => net549721);
   tmp_reg_6_inst : DFF_X1 port map( D => N9, CK => Clock, Q => SO_6_port, QN 
                           => net549720);
   tmp_reg_8_inst : DFF_X1 port map( D => N11, CK => Clock, Q => SO_8_port, QN 
                           => net549719);
   tmp_reg_10_inst : DFF_X1 port map( D => N13, CK => Clock, Q => SO_10_port, 
                           QN => net549718);
   tmp_reg_12_inst : DFF_X1 port map( D => N15, CK => Clock, Q => SO_12_port, 
                           QN => net549717);
   tmp_reg_14_inst : DFF_X1 port map( D => N17, CK => Clock, Q => SO_14_port, 
                           QN => net549716);
   tmp_reg_16_inst : DFF_X1 port map( D => N19, CK => Clock, Q => SO_16_port, 
                           QN => net549715);
   tmp_reg_18_inst : DFF_X1 port map( D => N21, CK => Clock, Q => SO_18_port, 
                           QN => net549714);
   tmp_reg_20_inst : DFF_X1 port map( D => N23, CK => Clock, Q => SO_20_port, 
                           QN => net549713);
   tmp_reg_22_inst : DFF_X1 port map( D => N25, CK => Clock, Q => SO_22_port, 
                           QN => net549712);
   tmp_reg_24_inst : DFF_X1 port map( D => N27, CK => Clock, Q => SO_24_port, 
                           QN => net549711);
   tmp_reg_26_inst : DFF_X1 port map( D => N29, CK => Clock, Q => SO_26_port, 
                           QN => net549710);
   tmp_reg_28_inst : DFF_X1 port map( D => N31, CK => Clock, Q => SO_28_port, 
                           QN => net549709);
   U26 : NAND2_X1 port map( A1 => ALOAD, A2 => D(26), ZN => n12_port);
   U25 : OAI21_X1 port map( B1 => ALOAD, B2 => net549711, A => n12_port, ZN => 
                           N29);
   U30 : NAND2_X1 port map( A1 => ALOAD, A2 => D(24), ZN => n14_port);
   U29 : OAI21_X1 port map( B1 => ALOAD, B2 => net549712, A => n14_port, ZN => 
                           N27);
   U32 : NAND2_X1 port map( A1 => ALOAD, A2 => D(23), ZN => n15_port);
   U31 : OAI21_X1 port map( B1 => ALOAD, B2 => net549728, A => n15_port, ZN => 
                           N26);
   U36 : NAND2_X1 port map( A1 => ALOAD, A2 => D(21), ZN => n17_port);
   U35 : OAI21_X1 port map( B1 => ALOAD, B2 => net549729, A => n17_port, ZN => 
                           N24);
   U38 : NAND2_X1 port map( A1 => ALOAD, A2 => D(20), ZN => n19_port);
   U37 : OAI21_X1 port map( B1 => ALOAD, B2 => net549714, A => n19_port, ZN => 
                           N23);
   U42 : NAND2_X1 port map( A1 => ALOAD, A2 => D(18), ZN => n21_port);
   U41 : OAI21_X1 port map( B1 => ALOAD, B2 => net549715, A => n21_port, ZN => 
                           N21);
   U44 : NAND2_X1 port map( A1 => ALOAD, A2 => D(17), ZN => n22_port);
   U43 : OAI21_X1 port map( B1 => ALOAD, B2 => net549731, A => n22_port, ZN => 
                           N20);
   U34 : NAND2_X1 port map( A1 => ALOAD, A2 => D(22), ZN => n16_port);
   U33 : OAI21_X1 port map( B1 => ALOAD, B2 => net549713, A => n16_port, ZN => 
                           N25);
   U46 : NAND2_X1 port map( A1 => ALOAD, A2 => D(16), ZN => n23_port);
   U45 : OAI21_X1 port map( B1 => ALOAD, B2 => net549716, A => n23_port, ZN => 
                           N19);
   U19 : NAND2_X1 port map( A1 => ALOAD, A2 => D(29), ZN => n9_port);
   U18 : OAI21_X1 port map( B1 => ALOAD, B2 => net549725, A => n9_port, ZN => 
                           N32);
   U23 : NAND2_X1 port map( A1 => ALOAD, A2 => D(27), ZN => n11_port);
   U22 : OAI21_X1 port map( B1 => ALOAD, B2 => net549726, A => n11_port, ZN => 
                           N30);
   U28 : NAND2_X1 port map( A1 => ALOAD, A2 => D(25), ZN => n13_port);
   U27 : OAI21_X1 port map( B1 => ALOAD, B2 => net549727, A => n13_port, ZN => 
                           N28);
   U21 : NAND2_X1 port map( A1 => ALOAD, A2 => D(28), ZN => n10_port);
   U20 : OAI21_X1 port map( B1 => ALOAD, B2 => net549710, A => n10_port, ZN => 
                           N31);
   U40 : NAND2_X1 port map( A1 => ALOAD, A2 => D(19), ZN => n20_port);
   U39 : OAI21_X1 port map( B1 => ALOAD, B2 => net549730, A => n20_port, ZN => 
                           N22);
   U12 : NAND2_X1 port map( A1 => ALOAD, A2 => D(2), ZN => n6_port);
   U11 : OAI21_X1 port map( B1 => ALOAD, B2 => net549723, A => n6_port, ZN => 
                           N5);
   U50 : NAND2_X1 port map( A1 => ALOAD, A2 => D(14), ZN => n25_port);
   U49 : OAI21_X1 port map( B1 => ALOAD, B2 => net549717, A => n25_port, ZN => 
                           N17);
   U54 : NAND2_X1 port map( A1 => ALOAD, A2 => D(12), ZN => n27_port);
   U53 : OAI21_X1 port map( B1 => ALOAD, B2 => net549718, A => n27_port, ZN => 
                           N15);
   U58 : NAND2_X1 port map( A1 => ALOAD, A2 => D(10), ZN => n29_port);
   U57 : OAI21_X1 port map( B1 => ALOAD, B2 => net549719, A => n29_port, ZN => 
                           N13);
   U62 : NAND2_X1 port map( A1 => ALOAD, A2 => D(8), ZN => n31_port);
   U61 : OAI21_X1 port map( B1 => ALOAD, B2 => net549720, A => n31_port, ZN => 
                           N11);
   U4 : NAND2_X1 port map( A1 => ALOAD, A2 => D(6), ZN => n1);
   U3 : OAI21_X1 port map( B1 => ALOAD, B2 => net549721, A => n1, ZN => N9);
   U8 : NAND2_X1 port map( A1 => ALOAD, A2 => D(4), ZN => n4_port);
   U7 : OAI21_X1 port map( B1 => ALOAD, B2 => net549722, A => n4_port, ZN => N7
                           );
   U64 : NAND2_X1 port map( A1 => ALOAD, A2 => D(7), ZN => n32_port);
   U63 : OAI21_X1 port map( B1 => ALOAD, B2 => net549736, A => n32_port, ZN => 
                           N10);
   U48 : NAND2_X1 port map( A1 => ALOAD, A2 => D(15), ZN => n24_port);
   U47 : OAI21_X1 port map( B1 => ALOAD, B2 => net549732, A => n24_port, ZN => 
                           N18);
   U52 : NAND2_X1 port map( A1 => ALOAD, A2 => D(13), ZN => n26_port);
   U51 : OAI21_X1 port map( B1 => ALOAD, B2 => net549733, A => n26_port, ZN => 
                           N16);
   U56 : NAND2_X1 port map( A1 => ALOAD, A2 => D(11), ZN => n28_port);
   U55 : OAI21_X1 port map( B1 => ALOAD, B2 => net549734, A => n28_port, ZN => 
                           N14);
   U60 : NAND2_X1 port map( A1 => ALOAD, A2 => D(9), ZN => n30_port);
   U59 : OAI21_X1 port map( B1 => ALOAD, B2 => net549735, A => n30_port, ZN => 
                           N12);
   U10 : NAND2_X1 port map( A1 => ALOAD, A2 => D(3), ZN => n5_port);
   U9 : OAI21_X1 port map( B1 => ALOAD, B2 => net549738, A => n5_port, ZN => N6
                           );
   U6 : NAND2_X1 port map( A1 => ALOAD, A2 => D(5), ZN => n3_port);
   U5 : OAI21_X1 port map( B1 => ALOAD, B2 => net549737, A => n3_port, ZN => N8
                           );
   U24 : AND2_X1 port map( A1 => ALOAD, A2 => D(0), ZN => N3);
   U13 : AND2_X1 port map( A1 => ALOAD, A2 => D(1), ZN => N4);
   tmp_reg_31_inst : SDFF_X1 port map( D => SO_29_port, SI => D(31), SE => 
                           ALOAD, CK => Clock, Q => SO_31_port, QN => n7_port);
   tmp_reg_30_inst : SDFF_X1 port map( D => SO_28_port, SI => D(30), SE => 
                           ALOAD, CK => Clock, Q => SO_30_port, QN => n2);

end SYN_archi;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_N9_2 is

   port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);  
         SO : out std_logic);

end shift_N9_2;

architecture SYN_archi of shift_N9_2 is

   component SDFF_X1
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal tmp_8_port, tmp_7_port, tmp_6_port, tmp_5_port, tmp_4_port, 
      tmp_3_port, tmp_2_port, tmp_1_port, n2, n3, n4, n5, n6, n7, n8, n9, n10, 
      n11 : std_logic;

begin
   
   tmp_reg_7_inst : SDFF_X1 port map( D => tmp_8_port, SI => D(7), SE => ALOAD,
                           CK => Clock, Q => tmp_7_port, QN => n11);
   tmp_reg_0_inst : SDFF_X1 port map( D => tmp_1_port, SI => D(0), SE => ALOAD,
                           CK => Clock, Q => SO, QN => n10);
   tmp_reg_6_inst : SDFF_X1 port map( D => tmp_7_port, SI => D(6), SE => ALOAD,
                           CK => Clock, Q => tmp_6_port, QN => n9);
   tmp_reg_2_inst : SDFF_X1 port map( D => tmp_3_port, SI => D(2), SE => ALOAD,
                           CK => Clock, Q => tmp_2_port, QN => n8);
   tmp_reg_5_inst : SDFF_X1 port map( D => tmp_6_port, SI => D(5), SE => ALOAD,
                           CK => Clock, Q => tmp_5_port, QN => n7);
   tmp_reg_4_inst : SDFF_X1 port map( D => tmp_5_port, SI => D(4), SE => ALOAD,
                           CK => Clock, Q => tmp_4_port, QN => n6);
   tmp_reg_3_inst : SDFF_X1 port map( D => tmp_4_port, SI => D(3), SE => ALOAD,
                           CK => Clock, Q => tmp_3_port, QN => n5);
   tmp_reg_8_inst : SDFF_X1 port map( D => n3, SI => D(8), SE => ALOAD, CK => 
                           Clock, Q => tmp_8_port, QN => n4);
   tmp_reg_1_inst : SDFF_X1 port map( D => tmp_2_port, SI => D(1), SE => ALOAD,
                           CK => Clock, Q => tmp_1_port, QN => n2);
   n3 <= '0';

end SYN_archi;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shift_N9_0 is

   port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);  
         SO : out std_logic);

end shift_N9_0;

architecture SYN_archi of shift_N9_0 is

   component SDFF_X2
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component SDFF_X1
      port( D, SI, SE, CK : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal tmp_8_port, tmp_7_port, tmp_6_port, tmp_5_port, tmp_4_port, 
      tmp_3_port, tmp_2_port, tmp_1_port, n2, n3, n4, n5, n6, n7, n8, n9, n10, 
      n11 : std_logic;

begin
   
   tmp_reg_7_inst : SDFF_X1 port map( D => tmp_8_port, SI => D(7), SE => ALOAD,
                           CK => Clock, Q => tmp_7_port, QN => n11);
   tmp_reg_3_inst : SDFF_X1 port map( D => tmp_4_port, SI => D(3), SE => ALOAD,
                           CK => Clock, Q => tmp_3_port, QN => n10);
   tmp_reg_4_inst : SDFF_X1 port map( D => tmp_5_port, SI => D(4), SE => ALOAD,
                           CK => Clock, Q => tmp_4_port, QN => n9);
   tmp_reg_5_inst : SDFF_X1 port map( D => tmp_6_port, SI => D(5), SE => ALOAD,
                           CK => Clock, Q => tmp_5_port, QN => n8);
   tmp_reg_6_inst : SDFF_X1 port map( D => tmp_7_port, SI => D(6), SE => ALOAD,
                           CK => Clock, Q => tmp_6_port, QN => n7);
   tmp_reg_1_inst : SDFF_X1 port map( D => tmp_2_port, SI => D(1), SE => ALOAD,
                           CK => Clock, Q => tmp_1_port, QN => n6);
   tmp_reg_2_inst : SDFF_X1 port map( D => tmp_3_port, SI => D(2), SE => ALOAD,
                           CK => Clock, Q => tmp_2_port, QN => n5);
   tmp_reg_8_inst : SDFF_X1 port map( D => n3, SI => D(8), SE => ALOAD, CK => 
                           Clock, Q => tmp_8_port, QN => n4);
   tmp_reg_0_inst : SDFF_X2 port map( D => tmp_1_port, SI => D(0), SE => ALOAD,
                           CK => Clock, Q => SO, QN => n2);
   n3 <= '0';

end SYN_archi;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity booth_encoder_0 is

   port( B_in : in std_logic_vector (2 downto 0);  A_out : out std_logic_vector
         (2 downto 0));

end booth_encoder_0;

architecture SYN_bhe of booth_encoder_0 is

   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal N53, N57, n5, n6 : std_logic;

begin
   A_out <= ( N57, B_in(2), N53 );
   
   U3 : INV_X1 port map( A => B_in(1), ZN => n5);
   U4 : INV_X1 port map( A => B_in(2), ZN => n6);
   U5 : NAND2_X1 port map( A1 => n6, A2 => n5, ZN => N57);
   U6 : NOR2_X1 port map( A1 => B_in(1), A2 => n6, ZN => N53);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity logic_unit_SIZE32 is

   port( IN1, IN2 : in std_logic_vector (31 downto 0);  CTRL : in 
         std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 downto
         0));

end logic_unit_SIZE32;

architecture SYN_Bhe of logic_unit_SIZE32 is

   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, 
      n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31
      , n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, 
      n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60
      , n61, n62, n63, n64, n166, n167, n169 : std_logic;

begin
   
   U25 : AOI21_X1 port map( B1 => IN2(31), B2 => IN1(31), A => CTRL(0), ZN => 
                           n17);
   U24 : OAI22_X1 port map( A1 => IN1(31), A2 => IN2(31), B1 => n2, B2 => n17, 
                           ZN => n18);
   U23 : AOI21_X1 port map( B1 => n169, B2 => n17, A => n18, ZN => OUT1(31));
   U65 : AOI21_X1 port map( B1 => n2, B2 => n45, A => n46, ZN => OUT1(19));
   U61 : AOI21_X1 port map( B1 => IN2(20), B2 => IN1(20), A => CTRL(0), ZN => 
                           n41);
   U60 : OAI22_X1 port map( A1 => IN1(20), A2 => IN2(20), B1 => n169, B2 => n41
                           , ZN => n42);
   U59 : AOI21_X1 port map( B1 => n169, B2 => n41, A => n42, ZN => OUT1(20));
   U56 : AOI21_X1 port map( B1 => n2, B2 => n39, A => n40, ZN => OUT1(21));
   U20 : AOI21_X1 port map( B1 => n169, B2 => n15, A => n16, ZN => OUT1(3));
   U54 : OAI22_X1 port map( A1 => IN1(22), A2 => IN2(22), B1 => n169, B2 => n37
                           , ZN => n38);
   U53 : AOI21_X1 port map( B1 => n169, B2 => n37, A => n38, ZN => OUT1(22));
   U49 : AOI21_X1 port map( B1 => IN2(24), B2 => IN1(24), A => CTRL(0), ZN => 
                           n33);
   U48 : OAI22_X1 port map( A1 => IN1(24), A2 => IN2(24), B1 => n2, B2 => n33, 
                           ZN => n34);
   U47 : AOI21_X1 port map( B1 => n169, B2 => n33, A => n34, ZN => OUT1(24));
   U77 : AOI21_X1 port map( B1 => n169, B2 => n53, A => n54, ZN => OUT1(15));
   U5 : AOI21_X1 port map( B1 => n2, B2 => n5, A => n6, ZN => OUT1(8));
   U11 : AOI21_X1 port map( B1 => n2, B2 => n9, A => n10, ZN => OUT1(6));
   U46 : AOI21_X1 port map( B1 => IN2(25), B2 => IN1(25), A => CTRL(0), ZN => 
                           n31);
   U45 : OAI22_X1 port map( A1 => IN1(25), A2 => IN2(25), B1 => n2, B2 => n31, 
                           ZN => n32);
   U44 : AOI21_X1 port map( B1 => n169, B2 => n31, A => n32, ZN => OUT1(25));
   U71 : AOI21_X1 port map( B1 => n169, B2 => n49, A => n50, ZN => OUT1(17));
   U86 : AOI21_X1 port map( B1 => n2, B2 => n59, A => n60, ZN => OUT1(12));
   U76 : AOI21_X1 port map( B1 => IN2(16), B2 => IN1(16), A => CTRL(0), ZN => 
                           n51);
   U75 : OAI22_X1 port map( A1 => IN1(16), A2 => IN2(16), B1 => n2, B2 => n51, 
                           ZN => n52);
   U74 : AOI21_X1 port map( B1 => n169, B2 => n51, A => n52, ZN => OUT1(16));
   U37 : AOI21_X1 port map( B1 => IN2(28), B2 => IN1(28), A => CTRL(0), ZN => 
                           n25);
   U36 : OAI22_X1 port map( A1 => IN1(28), A2 => IN2(28), B1 => n2, B2 => n25, 
                           ZN => n26);
   U35 : AOI21_X1 port map( B1 => n169, B2 => n25, A => n26, ZN => OUT1(28));
   U19 : AOI21_X1 port map( B1 => IN2(4), B2 => IN1(4), A => CTRL(0), ZN => n13
                           );
   U18 : OAI22_X1 port map( A1 => IN1(4), A2 => IN2(4), B1 => n169, B2 => n13, 
                           ZN => n14);
   U17 : AOI21_X1 port map( B1 => n169, B2 => n13, A => n14, ZN => OUT1(4));
   U40 : AOI21_X1 port map( B1 => IN2(27), B2 => IN1(27), A => CTRL(0), ZN => 
                           n27);
   U39 : OAI22_X1 port map( A1 => IN1(27), A2 => IN2(27), B1 => n2, B2 => n27, 
                           ZN => n28);
   U38 : AOI21_X1 port map( B1 => n2, B2 => n27, A => n28, ZN => OUT1(27));
   U14 : AOI21_X1 port map( B1 => n2, B2 => n11, A => n12, ZN => OUT1(5));
   U83 : AOI21_X1 port map( B1 => n169, B2 => n57, A => n58, ZN => OUT1(13));
   U2 : AOI21_X1 port map( B1 => n2, B2 => n3, A => n4, ZN => OUT1(9));
   U8 : AOI21_X1 port map( B1 => n169, B2 => n7, A => n8, ZN => OUT1(7));
   U80 : AOI21_X1 port map( B1 => n2, B2 => n55, A => n56, ZN => OUT1(14));
   U68 : AOI21_X1 port map( B1 => n169, B2 => n47, A => n48, ZN => OUT1(18));
   U50 : AOI21_X1 port map( B1 => n169, B2 => n35, A => n36, ZN => OUT1(23));
   U41 : AOI21_X1 port map( B1 => n2, B2 => n29, A => n30, ZN => OUT1(26));
   U34 : AOI21_X1 port map( B1 => IN2(29), B2 => IN1(29), A => CTRL(0), ZN => 
                           n23);
   U33 : OAI22_X1 port map( A1 => IN1(29), A2 => IN2(29), B1 => n2, B2 => n23, 
                           ZN => n24);
   U32 : AOI21_X1 port map( B1 => n169, B2 => n23, A => n24, ZN => OUT1(29));
   U31 : AOI21_X1 port map( B1 => IN2(2), B2 => IN1(2), A => CTRL(0), ZN => n21
                           );
   U30 : OAI22_X1 port map( A1 => IN1(2), A2 => IN2(2), B1 => n2, B2 => n21, ZN
                           => n22);
   U29 : AOI21_X1 port map( B1 => n2, B2 => n21, A => n22, ZN => OUT1(2));
   U62 : AOI21_X1 port map( B1 => n169, B2 => n43, A => n44, ZN => OUT1(1));
   U28 : AOI21_X1 port map( B1 => IN2(30), B2 => IN1(30), A => CTRL(0), ZN => 
                           n19);
   U27 : OAI22_X1 port map( A1 => IN1(30), A2 => IN2(30), B1 => n2, B2 => n19, 
                           ZN => n20);
   U26 : AOI21_X1 port map( B1 => n2, B2 => n19, A => n20, ZN => OUT1(30));
   U89 : AOI21_X1 port map( B1 => n169, B2 => n61, A => n62, ZN => OUT1(11));
   U92 : AOI21_X1 port map( B1 => n169, B2 => n63, A => n64, ZN => OUT1(10));
   U3 : AOI21_X1 port map( B1 => IN1(0), B2 => IN2(0), A => CTRL(0), ZN => n166
                           );
   U4 : OAI22_X1 port map( A1 => IN2(0), A2 => IN1(0), B1 => n2, B2 => n166, ZN
                           => n167);
   U6 : AOI21_X1 port map( B1 => n2, B2 => n166, A => n167, ZN => OUT1(0));
   U7 : INV_X2 port map( A => CTRL(1), ZN => n2);
   U9 : BUF_X2 port map( A => n2, Z => n169);
   U10 : OAI22_X1 port map( A1 => IN1(18), A2 => IN2(18), B1 => n169, B2 => n47
                           , ZN => n48);
   U12 : AOI21_X1 port map( B1 => IN2(18), B2 => IN1(18), A => CTRL(0), ZN => 
                           n47);
   U13 : OAI22_X1 port map( A1 => IN1(10), A2 => IN2(10), B1 => n2, B2 => n63, 
                           ZN => n64);
   U15 : AOI21_X1 port map( B1 => IN2(10), B2 => IN1(10), A => CTRL(0), ZN => 
                           n63);
   U16 : OAI22_X1 port map( A1 => IN1(21), A2 => IN2(21), B1 => n169, B2 => n39
                           , ZN => n40);
   U21 : AOI21_X1 port map( B1 => IN2(21), B2 => IN1(21), A => CTRL(0), ZN => 
                           n39);
   U22 : OAI22_X1 port map( A1 => IN1(26), A2 => IN2(26), B1 => n169, B2 => n29
                           , ZN => n30);
   U42 : AOI21_X1 port map( B1 => IN2(26), B2 => IN1(26), A => CTRL(0), ZN => 
                           n29);
   U43 : OAI22_X1 port map( A1 => IN1(12), A2 => IN2(12), B1 => n2, B2 => n59, 
                           ZN => n60);
   U51 : AOI21_X1 port map( B1 => IN2(12), B2 => IN1(12), A => CTRL(0), ZN => 
                           n59);
   U52 : OAI22_X1 port map( A1 => IN1(3), A2 => IN2(3), B1 => n169, B2 => n15, 
                           ZN => n16);
   U55 : AOI21_X1 port map( B1 => IN2(3), B2 => IN1(3), A => CTRL(0), ZN => n15
                           );
   U57 : OAI22_X1 port map( A1 => IN1(1), A2 => IN2(1), B1 => n169, B2 => n43, 
                           ZN => n44);
   U58 : AOI21_X1 port map( B1 => IN2(1), B2 => IN1(1), A => CTRL(0), ZN => n43
                           );
   U63 : OAI22_X1 port map( A1 => IN1(17), A2 => IN2(17), B1 => n169, B2 => n49
                           , ZN => n50);
   U64 : AOI21_X1 port map( B1 => IN2(17), B2 => IN1(17), A => CTRL(0), ZN => 
                           n49);
   U66 : OAI22_X1 port map( A1 => IN1(14), A2 => IN2(14), B1 => n2, B2 => n55, 
                           ZN => n56);
   U67 : AOI21_X1 port map( B1 => IN2(14), B2 => IN1(14), A => CTRL(0), ZN => 
                           n55);
   U69 : OAI22_X1 port map( A1 => IN1(23), A2 => IN2(23), B1 => n169, B2 => n35
                           , ZN => n36);
   U70 : AOI21_X1 port map( B1 => IN2(23), B2 => IN1(23), A => CTRL(0), ZN => 
                           n35);
   U72 : OAI22_X1 port map( A1 => IN1(13), A2 => IN2(13), B1 => n2, B2 => n57, 
                           ZN => n58);
   U73 : AOI21_X1 port map( B1 => IN2(13), B2 => IN1(13), A => CTRL(0), ZN => 
                           n57);
   U78 : OAI22_X1 port map( A1 => IN1(8), A2 => IN2(8), B1 => n2, B2 => n5, ZN 
                           => n6);
   U79 : AOI21_X1 port map( B1 => IN2(8), B2 => IN1(8), A => CTRL(0), ZN => n5)
                           ;
   U81 : OAI22_X1 port map( A1 => IN1(6), A2 => IN2(6), B1 => n2, B2 => n9, ZN 
                           => n10);
   U82 : AOI21_X1 port map( B1 => IN2(6), B2 => IN1(6), A => CTRL(0), ZN => n9)
                           ;
   U84 : OAI22_X1 port map( A1 => IN1(19), A2 => IN2(19), B1 => n169, B2 => n45
                           , ZN => n46);
   U85 : AOI21_X1 port map( B1 => IN2(19), B2 => IN1(19), A => CTRL(0), ZN => 
                           n45);
   U87 : OAI22_X1 port map( A1 => IN1(15), A2 => IN2(15), B1 => n2, B2 => n53, 
                           ZN => n54);
   U88 : AOI21_X1 port map( B1 => IN2(15), B2 => IN1(15), A => CTRL(0), ZN => 
                           n53);
   U90 : AOI21_X1 port map( B1 => IN2(22), B2 => IN1(22), A => CTRL(0), ZN => 
                           n37);
   U91 : OAI22_X1 port map( A1 => IN1(11), A2 => IN2(11), B1 => n2, B2 => n61, 
                           ZN => n62);
   U93 : AOI21_X1 port map( B1 => IN2(11), B2 => IN1(11), A => CTRL(0), ZN => 
                           n61);
   U94 : OAI22_X1 port map( A1 => IN1(7), A2 => IN2(7), B1 => n2, B2 => n7, ZN 
                           => n8);
   U95 : AOI21_X1 port map( B1 => IN2(7), B2 => IN1(7), A => CTRL(0), ZN => n7)
                           ;
   U96 : OAI22_X1 port map( A1 => IN1(9), A2 => IN2(9), B1 => n2, B2 => n3, ZN 
                           => n4);
   U97 : AOI21_X1 port map( B1 => IN2(9), B2 => IN1(9), A => CTRL(0), ZN => n3)
                           ;
   U98 : OAI22_X1 port map( A1 => IN1(5), A2 => IN2(5), B1 => n169, B2 => n11, 
                           ZN => n12);
   U99 : AOI21_X1 port map( B1 => IN2(5), B2 => IN1(5), A => CTRL(0), ZN => n11
                           );

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity shifter is

   port( A : in std_logic_vector (31 downto 0);  B : in std_logic_vector (4 
         downto 0);  LOGIC_ARITH, LEFT_RIGHT : in std_logic;  OUTPUT : out 
         std_logic_vector (31 downto 0));

end shifter;

architecture SYN_struct of shifter is

   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component shift_thirdLevel
      port( sel : in std_logic_vector (2 downto 0);  A : in std_logic_vector 
            (38 downto 0);  Y : out std_logic_vector (31 downto 0));
   end component;
   
   component shift_secondLevel
      port( sel : in std_logic_vector (1 downto 0);  mask00, mask08, mask16 : 
            in std_logic_vector (38 downto 0);  Y : out std_logic_vector (38 
            downto 0));
   end component;
   
   component shift_firstLevel
      port( A : in std_logic_vector (31 downto 0);  sel : in std_logic_vector 
            (1 downto 0);  mask00, mask08, mask16 : out std_logic_vector (38 
            downto 0));
   end component;
   
   signal s3_2_port, s3_1_port, s3_0_port, m0_38_port, m0_37_port, m0_36_port, 
      m0_35_port, m0_34_port, m0_33_port, m0_32_port, m0_31_port, m0_30_port, 
      m0_29_port, m0_28_port, m0_27_port, m0_26_port, m0_25_port, m0_24_port, 
      m0_23_port, m0_22_port, m0_21_port, m0_20_port, m0_19_port, m0_18_port, 
      m0_17_port, m0_16_port, m0_15_port, m0_14_port, m0_13_port, m0_12_port, 
      m0_11_port, m0_10_port, m0_9_port, m0_8_port, m0_7_port, m0_6_port, 
      m0_5_port, m0_4_port, m0_3_port, m0_2_port, m0_1_port, m0_0_port, 
      m8_38_port, m8_37_port, m8_36_port, m8_35_port, m8_34_port, m8_33_port, 
      m8_32_port, m8_31_port, m8_30_port, m8_29_port, m8_28_port, m8_27_port, 
      m8_26_port, m8_25_port, m8_24_port, m8_23_port, m8_22_port, m8_21_port, 
      m8_20_port, m8_19_port, m8_18_port, m8_17_port, m8_16_port, m8_15_port, 
      m8_14_port, m8_13_port, m8_12_port, m8_11_port, m8_10_port, m8_9_port, 
      m8_8_port, m8_7_port, m8_6_port, m8_5_port, m8_4_port, m8_3_port, 
      m8_2_port, m8_1_port, m8_0_port, m16_38_port, m16_37_port, m16_36_port, 
      m16_35_port, m16_34_port, m16_33_port, m16_32_port, m16_31_port, 
      m16_30_port, m16_29_port, m16_28_port, m16_27_port, m16_26_port, 
      m16_25_port, m16_24_port, m16_23_port, m16_15_port, m16_14_port, 
      m16_13_port, m16_12_port, m16_11_port, m16_10_port, m16_9_port, 
      m16_8_port, m16_7_port, m16_6_port, m16_5_port, m16_4_port, m16_3_port, 
      m16_2_port, m16_1_port, m16_0_port, y_38_port, y_37_port, y_36_port, 
      y_35_port, y_34_port, y_33_port, y_32_port, y_31_port, y_30_port, 
      y_29_port, y_28_port, y_27_port, y_26_port, y_25_port, y_24_port, 
      y_23_port, y_22_port, y_21_port, y_20_port, y_19_port, y_18_port, 
      y_17_port, y_16_port, y_15_port, y_14_port, y_13_port, y_12_port, 
      y_11_port, y_10_port, y_9_port, y_8_port, y_7_port, y_6_port, y_5_port, 
      y_4_port, y_3_port, y_2_port, y_1_port, y_0_port, n5, n7, n8, n9, n2, n3,
      n4, n6, n10, n11, n12, n14 : std_logic;

begin
   
   IL : shift_firstLevel port map( A(31) => A(31), A(30) => A(30), A(29) => 
                           A(29), A(28) => A(28), A(27) => A(27), A(26) => 
                           A(26), A(25) => A(25), A(24) => A(24), A(23) => 
                           A(23), A(22) => A(22), A(21) => A(21), A(20) => 
                           A(20), A(19) => A(19), A(18) => A(18), A(17) => 
                           A(17), A(16) => A(16), A(15) => A(15), A(14) => 
                           A(14), A(13) => A(13), A(12) => A(12), A(11) => 
                           A(11), A(10) => A(10), A(9) => A(9), A(8) => A(8), 
                           A(7) => A(7), A(6) => A(6), A(5) => A(5), A(4) => 
                           A(4), A(3) => A(3), A(2) => A(2), A(1) => A(1), A(0)
                           => A(0), sel(1) => LOGIC_ARITH, sel(0) => LEFT_RIGHT
                           , mask00(38) => m0_38_port, mask00(37) => m0_37_port
                           , mask00(36) => m0_36_port, mask00(35) => m0_35_port
                           , mask00(34) => m0_34_port, mask00(33) => m0_33_port
                           , mask00(32) => m0_32_port, mask00(31) => m0_31_port
                           , mask00(30) => m0_30_port, mask00(29) => m0_29_port
                           , mask00(28) => m0_28_port, mask00(27) => m0_27_port
                           , mask00(26) => m0_26_port, mask00(25) => m0_25_port
                           , mask00(24) => m0_24_port, mask00(23) => m0_23_port
                           , mask00(22) => m0_22_port, mask00(21) => m0_21_port
                           , mask00(20) => m0_20_port, mask00(19) => m0_19_port
                           , mask00(18) => m0_18_port, mask00(17) => m0_17_port
                           , mask00(16) => m0_16_port, mask00(15) => m0_15_port
                           , mask00(14) => m0_14_port, mask00(13) => m0_13_port
                           , mask00(12) => m0_12_port, mask00(11) => m0_11_port
                           , mask00(10) => m0_10_port, mask00(9) => m0_9_port, 
                           mask00(8) => m0_8_port, mask00(7) => m0_7_port, 
                           mask00(6) => m0_6_port, mask00(5) => m0_5_port, 
                           mask00(4) => m0_4_port, mask00(3) => m0_3_port, 
                           mask00(2) => m0_2_port, mask00(1) => m0_1_port, 
                           mask00(0) => m0_0_port, mask08(38) => m8_38_port, 
                           mask08(37) => m8_37_port, mask08(36) => m8_36_port, 
                           mask08(35) => m8_35_port, mask08(34) => m8_34_port, 
                           mask08(33) => m8_33_port, mask08(32) => m8_32_port, 
                           mask08(31) => m8_31_port, mask08(30) => m8_30_port, 
                           mask08(29) => m8_29_port, mask08(28) => m8_28_port, 
                           mask08(27) => m8_27_port, mask08(26) => m8_26_port, 
                           mask08(25) => m8_25_port, mask08(24) => m8_24_port, 
                           mask08(23) => m8_23_port, mask08(22) => m8_22_port, 
                           mask08(21) => m8_21_port, mask08(20) => m8_20_port, 
                           mask08(19) => m8_19_port, mask08(18) => m8_18_port, 
                           mask08(17) => m8_17_port, mask08(16) => m8_16_port, 
                           mask08(15) => m8_15_port, mask08(14) => m8_14_port, 
                           mask08(13) => m8_13_port, mask08(12) => m8_12_port, 
                           mask08(11) => m8_11_port, mask08(10) => m8_10_port, 
                           mask08(9) => m8_9_port, mask08(8) => m8_8_port, 
                           mask08(7) => m8_7_port, mask08(6) => m8_6_port, 
                           mask08(5) => m8_5_port, mask08(4) => m8_4_port, 
                           mask08(3) => m8_3_port, mask08(2) => m8_2_port, 
                           mask08(1) => m8_1_port, mask08(0) => m8_0_port, 
                           mask16(38) => m16_38_port, mask16(37) => m16_37_port
                           , mask16(36) => m16_36_port, mask16(35) => 
                           m16_35_port, mask16(34) => m16_34_port, mask16(33) 
                           => m16_33_port, mask16(32) => m16_32_port, 
                           mask16(31) => m16_31_port, mask16(30) => m16_30_port
                           , mask16(29) => m16_29_port, mask16(28) => 
                           m16_28_port, mask16(27) => m16_27_port, mask16(26) 
                           => m16_26_port, mask16(25) => m16_25_port, 
                           mask16(24) => m16_24_port, mask16(23) => m16_23_port
                           , mask16(22) => n3, mask16(21) => n11, mask16(20) =>
                           n6, mask16(19) => n2, mask16(18) => n12, mask16(17) 
                           => n4, mask16(16) => n10, mask16(15) => m16_15_port,
                           mask16(14) => m16_14_port, mask16(13) => m16_13_port
                           , mask16(12) => m16_12_port, mask16(11) => 
                           m16_11_port, mask16(10) => m16_10_port, mask16(9) =>
                           m16_9_port, mask16(8) => m16_8_port, mask16(7) => 
                           m16_7_port, mask16(6) => m16_6_port, mask16(5) => 
                           m16_5_port, mask16(4) => m16_4_port, mask16(3) => 
                           m16_3_port, mask16(2) => m16_2_port, mask16(1) => 
                           m16_1_port, mask16(0) => m16_0_port);
   IIL : shift_secondLevel port map( sel(1) => B(4), sel(0) => B(3), mask00(38)
                           => m0_38_port, mask00(37) => m0_37_port, mask00(36) 
                           => m0_36_port, mask00(35) => m0_35_port, mask00(34) 
                           => m0_34_port, mask00(33) => m0_33_port, mask00(32) 
                           => m0_32_port, mask00(31) => m0_31_port, mask00(30) 
                           => m0_30_port, mask00(29) => m0_29_port, mask00(28) 
                           => m0_28_port, mask00(27) => m0_27_port, mask00(26) 
                           => m0_26_port, mask00(25) => m0_25_port, mask00(24) 
                           => m0_24_port, mask00(23) => m0_23_port, mask00(22) 
                           => m0_22_port, mask00(21) => m0_21_port, mask00(20) 
                           => m0_20_port, mask00(19) => m0_19_port, mask00(18) 
                           => m0_18_port, mask00(17) => m0_17_port, mask00(16) 
                           => m0_16_port, mask00(15) => m0_15_port, mask00(14) 
                           => m0_14_port, mask00(13) => m0_13_port, mask00(12) 
                           => m0_12_port, mask00(11) => m0_11_port, mask00(10) 
                           => m0_10_port, mask00(9) => m0_9_port, mask00(8) => 
                           m0_8_port, mask00(7) => m0_7_port, mask00(6) => 
                           m0_6_port, mask00(5) => m0_5_port, mask00(4) => 
                           m0_4_port, mask00(3) => m0_3_port, mask00(2) => 
                           m0_2_port, mask00(1) => m0_1_port, mask00(0) => 
                           m0_0_port, mask08(38) => m8_38_port, mask08(37) => 
                           m8_37_port, mask08(36) => m8_36_port, mask08(35) => 
                           m8_35_port, mask08(34) => m8_34_port, mask08(33) => 
                           m8_33_port, mask08(32) => m8_32_port, mask08(31) => 
                           m8_31_port, mask08(30) => m8_30_port, mask08(29) => 
                           m8_29_port, mask08(28) => m8_28_port, mask08(27) => 
                           m8_27_port, mask08(26) => m8_26_port, mask08(25) => 
                           m8_25_port, mask08(24) => m8_24_port, mask08(23) => 
                           m8_23_port, mask08(22) => m8_22_port, mask08(21) => 
                           m8_21_port, mask08(20) => m8_20_port, mask08(19) => 
                           m8_19_port, mask08(18) => m8_18_port, mask08(17) => 
                           m8_17_port, mask08(16) => m8_16_port, mask08(15) => 
                           m8_15_port, mask08(14) => m8_14_port, mask08(13) => 
                           m8_13_port, mask08(12) => m8_12_port, mask08(11) => 
                           m8_11_port, mask08(10) => m8_10_port, mask08(9) => 
                           m8_9_port, mask08(8) => m8_8_port, mask08(7) => 
                           m8_7_port, mask08(6) => m8_6_port, mask08(5) => 
                           m8_5_port, mask08(4) => m8_4_port, mask08(3) => 
                           m8_3_port, mask08(2) => m8_2_port, mask08(1) => 
                           m8_1_port, mask08(0) => m8_0_port, mask16(38) => 
                           m16_38_port, mask16(37) => m16_37_port, mask16(36) 
                           => m16_36_port, mask16(35) => m16_35_port, 
                           mask16(34) => m16_34_port, mask16(33) => m16_33_port
                           , mask16(32) => m16_32_port, mask16(31) => 
                           m16_31_port, mask16(30) => m16_30_port, mask16(29) 
                           => m16_29_port, mask16(28) => m16_28_port, 
                           mask16(27) => m16_27_port, mask16(26) => m16_26_port
                           , mask16(25) => m16_25_port, mask16(24) => 
                           m16_24_port, mask16(23) => m16_23_port, mask16(22) 
                           => n3, mask16(21) => n11, mask16(20) => n6, 
                           mask16(19) => n2, mask16(18) => n12, mask16(17) => 
                           n4, mask16(16) => n10, mask16(15) => m16_15_port, 
                           mask16(14) => m16_14_port, mask16(13) => m16_13_port
                           , mask16(12) => m16_12_port, mask16(11) => 
                           m16_11_port, mask16(10) => m16_10_port, mask16(9) =>
                           m16_9_port, mask16(8) => m16_8_port, mask16(7) => 
                           m16_7_port, mask16(6) => m16_6_port, mask16(5) => 
                           m16_5_port, mask16(4) => m16_4_port, mask16(3) => 
                           m16_3_port, mask16(2) => m16_2_port, mask16(1) => 
                           m16_1_port, mask16(0) => m16_0_port, Y(38) => 
                           y_38_port, Y(37) => y_37_port, Y(36) => y_36_port, 
                           Y(35) => y_35_port, Y(34) => y_34_port, Y(33) => 
                           y_33_port, Y(32) => y_32_port, Y(31) => y_31_port, 
                           Y(30) => y_30_port, Y(29) => y_29_port, Y(28) => 
                           y_28_port, Y(27) => y_27_port, Y(26) => y_26_port, 
                           Y(25) => y_25_port, Y(24) => y_24_port, Y(23) => 
                           y_23_port, Y(22) => y_22_port, Y(21) => y_21_port, 
                           Y(20) => y_20_port, Y(19) => y_19_port, Y(18) => 
                           y_18_port, Y(17) => y_17_port, Y(16) => y_16_port, 
                           Y(15) => y_15_port, Y(14) => y_14_port, Y(13) => 
                           y_13_port, Y(12) => y_12_port, Y(11) => y_11_port, 
                           Y(10) => y_10_port, Y(9) => y_9_port, Y(8) => 
                           y_8_port, Y(7) => y_7_port, Y(6) => y_6_port, Y(5) 
                           => y_5_port, Y(4) => y_4_port, Y(3) => y_3_port, 
                           Y(2) => y_2_port, Y(1) => y_1_port, Y(0) => y_0_port
                           );
   IIIL : shift_thirdLevel port map( sel(2) => s3_2_port, sel(1) => s3_1_port, 
                           sel(0) => s3_0_port, A(38) => y_38_port, A(37) => 
                           y_37_port, A(36) => y_36_port, A(35) => y_35_port, 
                           A(34) => y_34_port, A(33) => y_33_port, A(32) => 
                           y_32_port, A(31) => y_31_port, A(30) => y_30_port, 
                           A(29) => y_29_port, A(28) => y_28_port, A(27) => 
                           y_27_port, A(26) => y_26_port, A(25) => y_25_port, 
                           A(24) => y_24_port, A(23) => y_23_port, A(22) => 
                           y_22_port, A(21) => y_21_port, A(20) => y_20_port, 
                           A(19) => y_19_port, A(18) => y_18_port, A(17) => 
                           y_17_port, A(16) => y_16_port, A(15) => y_15_port, 
                           A(14) => y_14_port, A(13) => y_13_port, A(12) => 
                           y_12_port, A(11) => y_11_port, A(10) => y_10_port, 
                           A(9) => y_9_port, A(8) => y_8_port, A(7) => y_7_port
                           , A(6) => y_6_port, A(5) => y_5_port, A(4) => 
                           y_4_port, A(3) => y_3_port, A(2) => y_2_port, A(1) 
                           => y_1_port, A(0) => y_0_port, Y(31) => OUTPUT(31), 
                           Y(30) => OUTPUT(30), Y(29) => OUTPUT(29), Y(28) => 
                           OUTPUT(28), Y(27) => OUTPUT(27), Y(26) => OUTPUT(26)
                           , Y(25) => OUTPUT(25), Y(24) => OUTPUT(24), Y(23) =>
                           OUTPUT(23), Y(22) => OUTPUT(22), Y(21) => OUTPUT(21)
                           , Y(20) => OUTPUT(20), Y(19) => OUTPUT(19), Y(18) =>
                           OUTPUT(18), Y(17) => OUTPUT(17), Y(16) => OUTPUT(16)
                           , Y(15) => OUTPUT(15), Y(14) => OUTPUT(14), Y(13) =>
                           OUTPUT(13), Y(12) => OUTPUT(12), Y(11) => OUTPUT(11)
                           , Y(10) => OUTPUT(10), Y(9) => OUTPUT(9), Y(8) => 
                           OUTPUT(8), Y(7) => OUTPUT(7), Y(6) => OUTPUT(6), 
                           Y(5) => OUTPUT(5), Y(4) => OUTPUT(4), Y(3) => 
                           OUTPUT(3), Y(2) => OUTPUT(2), Y(1) => OUTPUT(1), 
                           Y(0) => OUTPUT(0));
   U1 : AOI22_X1 port map( A1 => B(2), A2 => n5, B1 => n14, B2 => n7, ZN => 
                           s3_2_port);
   U8 : OR2_X1 port map( A1 => LOGIC_ARITH, A2 => LEFT_RIGHT, ZN => n5);
   U2 : INV_X1 port map( A => B(2), ZN => n7);
   U3 : INV_X1 port map( A => B(1), ZN => n8);
   U4 : INV_X1 port map( A => B(0), ZN => n9);
   U5 : INV_X1 port map( A => LEFT_RIGHT, ZN => n14);
   U6 : AOI22_X1 port map( A1 => B(0), A2 => n5, B1 => n14, B2 => n9, ZN => 
                           s3_0_port);
   U7 : AOI22_X1 port map( A1 => B(1), A2 => n5, B1 => n14, B2 => n8, ZN => 
                           s3_1_port);

end SYN_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity comparator_M32 is

   port( C, V : in std_logic;  SUM : in std_logic_vector (31 downto 0);  sel : 
         in std_logic_vector (2 downto 0);  sign : in std_logic;  S : out 
         std_logic);

end comparator_M32;

architecture SYN_BEHAVIORAL of comparator_M32 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI211_X1
      port( C1, C2, A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND4_X1
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR4_X1
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n3, n11, n12, n23, n22, n21, n20, n19, n18, n17, n16, n25, n26, n27, 
      n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41 : 
      std_logic;

begin
   
   U21 : NOR2_X1 port map( A1 => sel(2), A2 => sel(1), ZN => n3);
   U1 : INV_X1 port map( A => sel(2), ZN => n36);
   U2 : OR2_X1 port map( A1 => sel(0), A2 => sel(2), ZN => n25);
   U3 : NAND2_X1 port map( A1 => n38, A2 => n25, ZN => n34);
   U4 : OR3_X1 port map( A1 => SUM(4), A2 => SUM(5), A3 => SUM(3), ZN => n29);
   U5 : NOR4_X1 port map( A1 => SUM(9), A2 => SUM(8), A3 => SUM(7), A4 => 
                           SUM(6), ZN => n17);
   U6 : NOR2_X1 port map( A1 => SUM(31), A2 => n29, ZN => n16);
   U7 : NOR4_X1 port map( A1 => SUM(30), A2 => SUM(2), A3 => SUM(29), A4 => 
                           SUM(28), ZN => n19);
   U8 : NOR4_X1 port map( A1 => SUM(27), A2 => SUM(26), A3 => SUM(25), A4 => 
                           SUM(24), ZN => n18);
   U9 : AND2_X1 port map( A1 => n16, A2 => n17, ZN => n28);
   U10 : NOR4_X1 port map( A1 => SUM(17), A2 => SUM(19), A3 => SUM(18), A4 => 
                           SUM(1), ZN => n20);
   U11 : NOR4_X1 port map( A1 => SUM(12), A2 => SUM(11), A3 => SUM(10), A4 => 
                           SUM(0), ZN => n22);
   U12 : NOR4_X1 port map( A1 => SUM(16), A2 => SUM(15), A3 => SUM(14), A4 => 
                           SUM(13), ZN => n23);
   U13 : NOR4_X1 port map( A1 => SUM(23), A2 => SUM(22), A3 => SUM(20), A4 => 
                           SUM(21), ZN => n21);
   U14 : AND3_X1 port map( A1 => n28, A2 => n18, A3 => n19, ZN => n27);
   U15 : AND4_X1 port map( A1 => n21, A2 => n23, A3 => n22, A4 => n20, ZN => 
                           n26);
   U16 : NAND2_X1 port map( A1 => n26, A2 => n27, ZN => n30);
   U17 : XNOR2_X1 port map( A => n30, B => n40, ZN => n38);
   U18 : OAI21_X1 port map( B1 => n31, B2 => sel(0), A => n3, ZN => n33);
   U19 : CLKBUF_X1 port map( A => n30, Z => n31);
   U20 : OAI22_X1 port map( A1 => n37, A2 => n3, B1 => n32, B2 => n33, ZN => S)
                           ;
   U22 : NAND2_X1 port map( A1 => n11, A2 => n41, ZN => n32);
   U23 : NAND2_X1 port map( A1 => n32, A2 => n36, ZN => n35);
   U24 : AND2_X1 port map( A1 => n34, A2 => n35, ZN => n37);
   U25 : OR2_X1 port map( A1 => C, A2 => sign, ZN => n41);
   U26 : INV_X1 port map( A => n39, ZN => n40);
   U27 : OAI21_X1 port map( B1 => sel(0), B2 => sel(1), A => sel(2), ZN => n39)
                           ;
   U28 : OAI211_X1 port map( C1 => SUM(31), C2 => V, A => n12, B => sign, ZN =>
                           n11);
   U29 : NAND2_X1 port map( A1 => SUM(31), A2 => V, ZN => n12);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity p4add_N32_logN5 is

   port( A, B : in std_logic_vector (31 downto 0);  Cin, sign : in std_logic;  
         S : out std_logic_vector (31 downto 0);  Cout : out std_logic);

end p4add_N32_logN5;

architecture SYN_STRUCTURAL of p4add_N32_logN5 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component sum_gen_N32
      port( A, B : in std_logic_vector (31 downto 0);  Cin : in 
            std_logic_vector (8 downto 0);  S : out std_logic_vector (31 downto
            0));
   end component;
   
   component carry_tree_N32_logN5
      port( A, B : in std_logic_vector (31 downto 0);  Cin : in std_logic;  
            Cout : out std_logic_vector (7 downto 0));
   end component;
   
   component xor_gen_N32
      port( A : in std_logic_vector (31 downto 0);  B : in std_logic;  S : out 
            std_logic_vector (31 downto 0));
   end component;
   
   signal new_B_31_port, new_B_30_port, new_B_29_port, new_B_28_port, 
      new_B_27_port, new_B_26_port, new_B_25_port, new_B_24_port, new_B_23_port
      , new_B_22_port, new_B_21_port, new_B_20_port, new_B_18_port, 
      new_B_16_port, new_B_14_port, new_B_13_port, new_B_12_port, new_B_11_port
      , new_B_10_port, new_B_9_port, new_B_8_port, new_B_7_port, new_B_6_port, 
      new_B_5_port, new_B_4_port, new_B_3_port, new_B_2_port, new_B_1_port, 
      new_B_0_port, carry_pro_7_port, carry_pro_6_port, carry_pro_5_port, 
      carry_pro_4_port, carry_pro_3_port, carry_pro_2_port, carry_pro_1_port, 
      n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n24, n25, n26 : std_logic;

begin
   
   xor32 : xor_gen_N32 port map( A(31) => B(31), A(30) => B(30), A(29) => B(29)
                           , A(28) => B(28), A(27) => B(27), A(26) => B(26), 
                           A(25) => B(25), A(24) => B(24), A(23) => B(23), 
                           A(22) => B(22), A(21) => B(21), A(20) => B(20), 
                           A(19) => B(19), A(18) => B(18), A(17) => B(17), 
                           A(16) => B(16), A(15) => B(15), A(14) => B(14), 
                           A(13) => B(13), A(12) => B(12), A(11) => B(11), 
                           A(10) => B(10), A(9) => B(9), A(8) => B(8), A(7) => 
                           B(7), A(6) => B(6), A(5) => B(5), A(4) => B(4), A(3)
                           => B(3), A(2) => B(2), A(1) => B(1), A(0) => B(0), B
                           => sign, S(31) => new_B_31_port, S(30) => 
                           new_B_30_port, S(29) => new_B_29_port, S(28) => 
                           new_B_28_port, S(27) => new_B_27_port, S(26) => 
                           new_B_26_port, S(25) => new_B_25_port, S(24) => 
                           new_B_24_port, S(23) => new_B_23_port, S(22) => 
                           new_B_22_port, S(21) => new_B_21_port, S(20) => 
                           new_B_20_port, S(19) => n13, S(18) => new_B_18_port,
                           S(17) => n9, S(16) => new_B_16_port, S(15) => n3, 
                           S(14) => new_B_14_port, S(13) => new_B_13_port, 
                           S(12) => new_B_12_port, S(11) => new_B_11_port, 
                           S(10) => new_B_10_port, S(9) => new_B_9_port, S(8) 
                           => new_B_8_port, S(7) => new_B_7_port, S(6) => 
                           new_B_6_port, S(5) => new_B_5_port, S(4) => 
                           new_B_4_port, S(3) => new_B_3_port, S(2) => 
                           new_B_2_port, S(1) => new_B_1_port, S(0) => 
                           new_B_0_port);
   ct : carry_tree_N32_logN5 port map( A(31) => A(31), A(30) => A(30), A(29) =>
                           A(29), A(28) => A(28), A(27) => A(27), A(26) => 
                           A(26), A(25) => A(25), A(24) => A(24), A(23) => 
                           A(23), A(22) => A(22), A(21) => A(21), A(20) => 
                           A(20), A(19) => A(19), A(18) => A(18), A(17) => 
                           A(17), A(16) => A(16), A(15) => A(15), A(14) => 
                           A(14), A(13) => A(13), A(12) => A(12), A(11) => 
                           A(11), A(10) => A(10), A(9) => A(9), A(8) => A(8), 
                           A(7) => A(7), A(6) => A(6), A(5) => A(5), A(4) => 
                           A(4), A(3) => A(3), A(2) => A(2), A(1) => A(1), A(0)
                           => A(0), B(31) => new_B_31_port, B(30) => 
                           new_B_30_port, B(29) => new_B_29_port, B(28) => 
                           new_B_28_port, B(27) => new_B_27_port, B(26) => 
                           new_B_26_port, B(25) => new_B_25_port, B(24) => 
                           new_B_24_port, B(23) => new_B_23_port, B(22) => 
                           new_B_22_port, B(21) => new_B_21_port, B(20) => 
                           new_B_20_port, B(19) => n13, B(18) => new_B_18_port,
                           B(17) => n9, B(16) => new_B_16_port, B(15) => n3, 
                           B(14) => new_B_14_port, B(13) => new_B_13_port, 
                           B(12) => new_B_12_port, B(11) => new_B_11_port, 
                           B(10) => new_B_10_port, B(9) => new_B_9_port, B(8) 
                           => new_B_8_port, B(7) => new_B_7_port, B(6) => 
                           new_B_6_port, B(5) => new_B_5_port, B(4) => 
                           new_B_4_port, B(3) => new_B_3_port, B(2) => 
                           new_B_2_port, B(1) => new_B_1_port, B(0) => 
                           new_B_0_port, Cin => n20, Cout(7) => Cout, Cout(6) 
                           => carry_pro_7_port, Cout(5) => carry_pro_6_port, 
                           Cout(4) => carry_pro_5_port, Cout(3) => 
                           carry_pro_4_port, Cout(2) => carry_pro_3_port, 
                           Cout(1) => carry_pro_2_port, Cout(0) => 
                           carry_pro_1_port);
   add : sum_gen_N32 port map( A(31) => A(31), A(30) => A(30), A(29) => A(29), 
                           A(28) => A(28), A(27) => A(27), A(26) => A(26), 
                           A(25) => A(25), A(24) => A(24), A(23) => A(23), 
                           A(22) => A(22), A(21) => A(21), A(20) => A(20), 
                           A(19) => A(19), A(18) => A(18), A(17) => A(17), 
                           A(16) => A(16), A(15) => A(15), A(14) => A(14), 
                           A(13) => A(13), A(12) => A(12), A(11) => A(11), 
                           A(10) => A(10), A(9) => A(9), A(8) => A(8), A(7) => 
                           A(7), A(6) => A(6), A(5) => A(5), A(4) => A(4), A(3)
                           => A(3), A(2) => A(2), A(1) => A(1), A(0) => A(0), 
                           B(31) => new_B_31_port, B(30) => new_B_30_port, 
                           B(29) => new_B_29_port, B(28) => new_B_28_port, 
                           B(27) => new_B_27_port, B(26) => n1, B(25) => n14, 
                           B(24) => new_B_24_port, B(23) => new_B_23_port, 
                           B(22) => new_B_22_port, B(21) => new_B_21_port, 
                           B(20) => new_B_20_port, B(19) => n13, B(18) => n8, 
                           B(17) => n22, B(16) => new_B_16_port, B(15) => n3, 
                           B(14) => n16, B(13) => n6, B(12) => new_B_12_port, 
                           B(11) => n2, B(10) => n17, B(9) => n15, B(8) => n5, 
                           B(7) => n25, B(6) => new_B_6_port, B(5) => n19, B(4)
                           => n23, B(3) => n12, B(2) => n11, B(1) => n24, B(0) 
                           => n10, Cin(8) => n26, Cin(7) => carry_pro_7_port, 
                           Cin(6) => carry_pro_6_port, Cin(5) => 
                           carry_pro_5_port, Cin(4) => carry_pro_4_port, Cin(3)
                           => carry_pro_3_port, Cin(2) => carry_pro_2_port, 
                           Cin(1) => carry_pro_1_port, Cin(0) => n20, S(31) => 
                           S(31), S(30) => S(30), S(29) => S(29), S(28) => 
                           S(28), S(27) => S(27), S(26) => S(26), S(25) => 
                           S(25), S(24) => S(24), S(23) => S(23), S(22) => 
                           S(22), S(21) => S(21), S(20) => S(20), S(19) => 
                           S(19), S(18) => S(18), S(17) => S(17), S(16) => 
                           S(16), S(15) => S(15), S(14) => S(14), S(13) => 
                           S(13), S(12) => S(12), S(11) => S(11), S(10) => 
                           S(10), S(9) => S(9), S(8) => S(8), S(7) => S(7), 
                           S(6) => S(6), S(5) => S(5), S(4) => S(4), S(3) => 
                           S(3), S(2) => S(2), S(1) => S(1), S(0) => S(0));
   U1 : BUF_X1 port map( A => new_B_26_port, Z => n1);
   U2 : CLKBUF_X1 port map( A => new_B_11_port, Z => n2);
   U3 : INV_X1 port map( A => new_B_1_port, ZN => n7);
   U4 : BUF_X1 port map( A => new_B_14_port, Z => n16);
   U5 : BUF_X1 port map( A => new_B_4_port, Z => n23);
   U6 : BUF_X1 port map( A => sign, Z => n20);
   U7 : BUF_X1 port map( A => new_B_8_port, Z => n5);
   U8 : BUF_X1 port map( A => new_B_13_port, Z => n6);
   U9 : CLKBUF_X1 port map( A => new_B_0_port, Z => n10);
   U10 : CLKBUF_X1 port map( A => new_B_18_port, Z => n8);
   U11 : BUF_X1 port map( A => new_B_2_port, Z => n11);
   U12 : CLKBUF_X1 port map( A => new_B_3_port, Z => n12);
   U13 : CLKBUF_X1 port map( A => new_B_25_port, Z => n14);
   U14 : CLKBUF_X1 port map( A => new_B_7_port, Z => n25);
   U15 : INV_X1 port map( A => n18, ZN => n19);
   U16 : INV_X1 port map( A => new_B_5_port, ZN => n18);
   U17 : CLKBUF_X1 port map( A => new_B_9_port, Z => n15);
   U18 : CLKBUF_X1 port map( A => new_B_10_port, Z => n17);
   U19 : INV_X1 port map( A => n21, ZN => n22);
   U20 : INV_X1 port map( A => n9, ZN => n21);
   U21 : INV_X1 port map( A => n7, ZN => n24);
   n26 <= '0';

end SYN_STRUCTURAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity simple_booth_add_ext_N16 is

   port( Clock, Reset, sign, enable : in std_logic;  valid : out std_logic;  A,
         B : in std_logic_vector (15 downto 0);  A_to_add, B_to_add : out 
         std_logic_vector (31 downto 0);  sign_to_add : out std_logic;  
         final_out : out std_logic_vector (31 downto 0);  ACC_from_add : in 
         std_logic_vector (31 downto 0));

end simple_booth_add_ext_N16;

architecture SYN_struct of simple_booth_add_ext_N16 is

   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X4
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X8
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI221_X1
      port( B1, B2, C1, C2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component OAI211_X1
      port( C1, C2, A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFS_X1
      port( D, CK, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component ff32_en_SIZE32
      port( D : in std_logic_vector (31 downto 0);  en, clk, rst : in std_logic
            ;  Q : out std_logic_vector (31 downto 0));
   end component;
   
   component mux21_1
      port( IN0, IN1 : in std_logic_vector (31 downto 0);  CTRL : in std_logic;
            OUT1 : out std_logic_vector (31 downto 0));
   end component;
   
   component piso_r_2_N32
      port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (31 downto 0)
            ;  SO : out std_logic_vector (31 downto 0));
   end component;
   
   component shift_N9_1
      port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);
            SO : out std_logic);
   end component;
   
   component shift_N9_2
      port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);
            SO : out std_logic);
   end component;
   
   component shift_N9_0
      port( Clock, ALOAD : in std_logic;  D : in std_logic_vector (8 downto 0);
            SO : out std_logic);
   end component;
   
   component booth_encoder_1
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_2
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_3
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_4
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_5
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_6
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_7
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_8
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component booth_encoder_0
      port( B_in : in std_logic_vector (2 downto 0);  A_out : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal X_Logic0_port, valid_port, A_to_add_31_port, A_to_add_30_port, 
      A_to_add_29_port, A_to_add_28_port, A_to_add_27_port, A_to_add_26_port, 
      A_to_add_25_port, A_to_add_24_port, A_to_add_23_port, A_to_add_22_port, 
      A_to_add_21_port, A_to_add_20_port, A_to_add_19_port, A_to_add_18_port, 
      A_to_add_17_port, A_to_add_16_port, A_to_add_15_port, A_to_add_14_port, 
      A_to_add_13_port, A_to_add_12_port, A_to_add_11_port, A_to_add_10_port, 
      A_to_add_9_port, A_to_add_8_port, A_to_add_7_port, A_to_add_6_port, 
      A_to_add_5_port, A_to_add_4_port, A_to_add_3_port, A_to_add_2_port, 
      A_to_add_1_port, A_to_add_0_port, enc_N2_in_2_port, piso_0_in_8_port, 
      piso_0_in_7_port, piso_0_in_6_port, piso_0_in_5_port, piso_0_in_4_port, 
      piso_0_in_3_port, piso_0_in_2_port, piso_0_in_1_port, piso_0_in_0_port, 
      piso_1_in_8_port, piso_1_in_7_port, piso_1_in_6_port, piso_1_in_5_port, 
      piso_1_in_4_port, piso_1_in_3_port, piso_1_in_2_port, piso_1_in_1_port, 
      piso_1_in_0_port, piso_2_in_8_port, piso_2_in_7_port, piso_2_in_6_port, 
      piso_2_in_5_port, piso_2_in_4_port, piso_2_in_3_port, piso_2_in_2_port, 
      piso_2_in_1_port, piso_2_in_0_port, load, extend_vector_15_port, 
      A_to_mux_31_port, A_to_mux_30_port, A_to_mux_29_port, A_to_mux_28_port, 
      A_to_mux_27_port, A_to_mux_26_port, A_to_mux_25_port, A_to_mux_24_port, 
      A_to_mux_23_port, A_to_mux_22_port, A_to_mux_21_port, A_to_mux_20_port, 
      A_to_mux_19_port, A_to_mux_18_port, A_to_mux_17_port, A_to_mux_16_port, 
      A_to_mux_15_port, A_to_mux_14_port, A_to_mux_13_port, A_to_mux_12_port, 
      A_to_mux_11_port, A_to_mux_10_port, A_to_mux_9_port, A_to_mux_8_port, 
      A_to_mux_7_port, A_to_mux_6_port, A_to_mux_5_port, A_to_mux_4_port, 
      A_to_mux_3_port, A_to_mux_2_port, A_to_mux_1_port, A_to_mux_0_port, 
      input_mux_sel_2_port, input_mux_sel_0, next_accumulate_31_port, 
      next_accumulate_30_port, next_accumulate_29_port, next_accumulate_28_port
      , next_accumulate_27_port, next_accumulate_26_port, 
      next_accumulate_25_port, next_accumulate_24_port, next_accumulate_23_port
      , next_accumulate_22_port, next_accumulate_21_port, 
      next_accumulate_20_port, next_accumulate_19_port, next_accumulate_18_port
      , next_accumulate_17_port, next_accumulate_16_port, 
      next_accumulate_15_port, next_accumulate_14_port, next_accumulate_13_port
      , next_accumulate_12_port, next_accumulate_11_port, 
      next_accumulate_10_port, next_accumulate_9_port, next_accumulate_8_port, 
      next_accumulate_7_port, next_accumulate_6_port, next_accumulate_5_port, 
      next_accumulate_4_port, next_accumulate_3_port, next_accumulate_2_port, 
      next_accumulate_1_port, next_accumulate_0_port, reg_enable, count_4_port,
      count_3_port, count_1_port, count_0_port, N21, N23, N24, n49, n50, n51, 
      n52, n54, n11, n12, n13, net549699, n38, n39, n40, n41, n42, n43, n44, 
      n45, n46, n47, n48, n55, n56, n57, n58, n59, n60, n61, n63, n64, n65, n66
      , n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n79, n81, n82, 
      sub_213_n3, sub_213_n2, n14, n15, n16, n17, n18, n22, n23_port, net561327
      : std_logic;

begin
   valid <= valid_port;
   A_to_add <= ( A_to_add_31_port, A_to_add_30_port, A_to_add_29_port, 
      A_to_add_28_port, A_to_add_27_port, A_to_add_26_port, A_to_add_25_port, 
      A_to_add_24_port, A_to_add_23_port, A_to_add_22_port, A_to_add_21_port, 
      A_to_add_20_port, A_to_add_19_port, A_to_add_18_port, A_to_add_17_port, 
      A_to_add_16_port, A_to_add_15_port, A_to_add_14_port, A_to_add_13_port, 
      A_to_add_12_port, A_to_add_11_port, A_to_add_10_port, A_to_add_9_port, 
      A_to_add_8_port, A_to_add_7_port, A_to_add_6_port, A_to_add_5_port, 
      A_to_add_4_port, A_to_add_3_port, A_to_add_2_port, A_to_add_1_port, 
      A_to_add_0_port );
   
   X_Logic0_port <= '0';
   count_reg_1_inst : DFFR_X1 port map( D => n51, CK => Clock, RN => n23_port, 
                           Q => count_1_port, QN => n13);
   count_reg_2_inst : DFFR_X1 port map( D => n50, CK => Clock, RN => n23_port, 
                           Q => net561327, QN => n11);
   count_reg_4_inst : DFFR_X1 port map( D => n49, CK => Clock, RN => n23_port, 
                           Q => count_4_port, QN => n12);
   U85 : MUX2_X1 port map( A => A_to_add_9_port, B => ACC_from_add(9), S => 
                           input_mux_sel_2_port, Z => final_out(9));
   U86 : MUX2_X1 port map( A => A_to_add_8_port, B => ACC_from_add(8), S => 
                           input_mux_sel_2_port, Z => final_out(8));
   U87 : MUX2_X1 port map( A => A_to_add_7_port, B => ACC_from_add(7), S => 
                           input_mux_sel_2_port, Z => final_out(7));
   U88 : MUX2_X1 port map( A => A_to_add_6_port, B => ACC_from_add(6), S => 
                           input_mux_sel_2_port, Z => final_out(6));
   U89 : MUX2_X1 port map( A => A_to_add_5_port, B => ACC_from_add(5), S => 
                           input_mux_sel_2_port, Z => final_out(5));
   U90 : MUX2_X1 port map( A => A_to_add_4_port, B => ACC_from_add(4), S => 
                           input_mux_sel_2_port, Z => final_out(4));
   U91 : MUX2_X1 port map( A => A_to_add_3_port, B => ACC_from_add(3), S => 
                           input_mux_sel_2_port, Z => final_out(3));
   U92 : MUX2_X1 port map( A => A_to_add_31_port, B => ACC_from_add(31), S => 
                           input_mux_sel_2_port, Z => final_out(31));
   U93 : MUX2_X1 port map( A => A_to_add_30_port, B => ACC_from_add(30), S => 
                           input_mux_sel_2_port, Z => final_out(30));
   U94 : MUX2_X1 port map( A => A_to_add_2_port, B => ACC_from_add(2), S => 
                           input_mux_sel_2_port, Z => final_out(2));
   U95 : MUX2_X1 port map( A => A_to_add_29_port, B => ACC_from_add(29), S => 
                           input_mux_sel_2_port, Z => final_out(29));
   U96 : MUX2_X1 port map( A => A_to_add_28_port, B => ACC_from_add(28), S => 
                           input_mux_sel_2_port, Z => final_out(28));
   U97 : MUX2_X1 port map( A => A_to_add_27_port, B => ACC_from_add(27), S => 
                           input_mux_sel_2_port, Z => final_out(27));
   U98 : MUX2_X1 port map( A => A_to_add_26_port, B => ACC_from_add(26), S => 
                           input_mux_sel_2_port, Z => final_out(26));
   U99 : MUX2_X1 port map( A => A_to_add_25_port, B => ACC_from_add(25), S => 
                           input_mux_sel_2_port, Z => final_out(25));
   U100 : MUX2_X1 port map( A => A_to_add_24_port, B => ACC_from_add(24), S => 
                           input_mux_sel_2_port, Z => final_out(24));
   U101 : MUX2_X1 port map( A => A_to_add_23_port, B => ACC_from_add(23), S => 
                           input_mux_sel_2_port, Z => final_out(23));
   U102 : MUX2_X1 port map( A => A_to_add_22_port, B => ACC_from_add(22), S => 
                           input_mux_sel_2_port, Z => final_out(22));
   U103 : MUX2_X1 port map( A => A_to_add_21_port, B => ACC_from_add(21), S => 
                           input_mux_sel_2_port, Z => final_out(21));
   U104 : MUX2_X1 port map( A => A_to_add_20_port, B => ACC_from_add(20), S => 
                           input_mux_sel_2_port, Z => final_out(20));
   U105 : MUX2_X1 port map( A => A_to_add_1_port, B => ACC_from_add(1), S => 
                           input_mux_sel_2_port, Z => final_out(1));
   U106 : MUX2_X1 port map( A => A_to_add_19_port, B => ACC_from_add(19), S => 
                           input_mux_sel_2_port, Z => final_out(19));
   U107 : MUX2_X1 port map( A => A_to_add_18_port, B => ACC_from_add(18), S => 
                           input_mux_sel_2_port, Z => final_out(18));
   U108 : MUX2_X1 port map( A => A_to_add_17_port, B => ACC_from_add(17), S => 
                           input_mux_sel_2_port, Z => final_out(17));
   U109 : MUX2_X1 port map( A => A_to_add_16_port, B => ACC_from_add(16), S => 
                           input_mux_sel_2_port, Z => final_out(16));
   U110 : MUX2_X1 port map( A => A_to_add_15_port, B => ACC_from_add(15), S => 
                           input_mux_sel_2_port, Z => final_out(15));
   U111 : MUX2_X1 port map( A => A_to_add_14_port, B => ACC_from_add(14), S => 
                           input_mux_sel_2_port, Z => final_out(14));
   U112 : MUX2_X1 port map( A => A_to_add_13_port, B => ACC_from_add(13), S => 
                           input_mux_sel_2_port, Z => final_out(13));
   U113 : MUX2_X1 port map( A => A_to_add_12_port, B => ACC_from_add(12), S => 
                           input_mux_sel_2_port, Z => final_out(12));
   U114 : MUX2_X1 port map( A => A_to_add_11_port, B => ACC_from_add(11), S => 
                           input_mux_sel_2_port, Z => final_out(11));
   U115 : MUX2_X1 port map( A => A_to_add_10_port, B => ACC_from_add(10), S => 
                           input_mux_sel_2_port, Z => final_out(10));
   encod_0_0 : booth_encoder_0 port map( B_in(2) => B(1), B_in(1) => B(0), 
                           B_in(0) => X_Logic0_port, A_out(2) => 
                           piso_2_in_0_port, A_out(1) => piso_1_in_0_port, 
                           A_out(0) => piso_0_in_0_port);
   encod_i_1 : booth_encoder_8 port map( B_in(2) => B(3), B_in(1) => B(2), 
                           B_in(0) => B(1), A_out(2) => piso_2_in_1_port, 
                           A_out(1) => piso_1_in_1_port, A_out(0) => 
                           piso_0_in_1_port);
   encod_i_2 : booth_encoder_7 port map( B_in(2) => B(5), B_in(1) => B(4), 
                           B_in(0) => B(3), A_out(2) => piso_2_in_2_port, 
                           A_out(1) => piso_1_in_2_port, A_out(0) => 
                           piso_0_in_2_port);
   encod_i_3 : booth_encoder_6 port map( B_in(2) => B(7), B_in(1) => B(6), 
                           B_in(0) => B(5), A_out(2) => piso_2_in_3_port, 
                           A_out(1) => piso_1_in_3_port, A_out(0) => 
                           piso_0_in_3_port);
   encod_i_4 : booth_encoder_5 port map( B_in(2) => B(9), B_in(1) => B(8), 
                           B_in(0) => B(7), A_out(2) => piso_2_in_4_port, 
                           A_out(1) => piso_1_in_4_port, A_out(0) => 
                           piso_0_in_4_port);
   encod_i_5 : booth_encoder_4 port map( B_in(2) => B(11), B_in(1) => B(10), 
                           B_in(0) => B(9), A_out(2) => piso_2_in_5_port, 
                           A_out(1) => piso_1_in_5_port, A_out(0) => 
                           piso_0_in_5_port);
   encod_i_6 : booth_encoder_3 port map( B_in(2) => B(13), B_in(1) => B(12), 
                           B_in(0) => B(11), A_out(2) => piso_2_in_6_port, 
                           A_out(1) => piso_1_in_6_port, A_out(0) => 
                           piso_0_in_6_port);
   encod_i_7 : booth_encoder_2 port map( B_in(2) => B(15), B_in(1) => B(14), 
                           B_in(0) => B(13), A_out(2) => piso_2_in_7_port, 
                           A_out(1) => piso_1_in_7_port, A_out(0) => 
                           piso_0_in_7_port);
   encod_i_8 : booth_encoder_1 port map( B_in(2) => enc_N2_in_2_port, B_in(1) 
                           => enc_N2_in_2_port, B_in(0) => B(15), A_out(2) => 
                           piso_2_in_8_port, A_out(1) => piso_1_in_8_port, 
                           A_out(0) => piso_0_in_8_port);
   piso_0 : shift_N9_0 port map( Clock => Clock, ALOAD => n22, D(8) => 
                           piso_0_in_8_port, D(7) => piso_0_in_7_port, D(6) => 
                           piso_0_in_6_port, D(5) => piso_0_in_5_port, D(4) => 
                           piso_0_in_4_port, D(3) => piso_0_in_3_port, D(2) => 
                           piso_0_in_2_port, D(1) => piso_0_in_1_port, D(0) => 
                           piso_0_in_0_port, SO => input_mux_sel_0);
   piso_1 : shift_N9_2 port map( Clock => Clock, ALOAD => n22, D(8) => 
                           piso_1_in_8_port, D(7) => piso_1_in_7_port, D(6) => 
                           piso_1_in_6_port, D(5) => piso_1_in_5_port, D(4) => 
                           piso_1_in_4_port, D(3) => piso_1_in_3_port, D(2) => 
                           piso_1_in_2_port, D(1) => piso_1_in_1_port, D(0) => 
                           piso_1_in_0_port, SO => sign_to_add);
   piso_2 : shift_N9_1 port map( Clock => Clock, ALOAD => n22, D(8) => 
                           piso_2_in_8_port, D(7) => piso_2_in_7_port, D(6) => 
                           piso_2_in_6_port, D(5) => piso_2_in_5_port, D(4) => 
                           piso_2_in_4_port, D(3) => piso_2_in_3_port, D(2) => 
                           piso_2_in_2_port, D(1) => piso_2_in_1_port, D(0) => 
                           piso_2_in_0_port, SO => input_mux_sel_2_port);
   A_reg : piso_r_2_N32 port map( Clock => Clock, ALOAD => n22, D(31) => 
                           extend_vector_15_port, D(30) => 
                           extend_vector_15_port, D(29) => 
                           extend_vector_15_port, D(28) => 
                           extend_vector_15_port, D(27) => 
                           extend_vector_15_port, D(26) => 
                           extend_vector_15_port, D(25) => 
                           extend_vector_15_port, D(24) => 
                           extend_vector_15_port, D(23) => 
                           extend_vector_15_port, D(22) => 
                           extend_vector_15_port, D(21) => 
                           extend_vector_15_port, D(20) => 
                           extend_vector_15_port, D(19) => 
                           extend_vector_15_port, D(18) => 
                           extend_vector_15_port, D(17) => 
                           extend_vector_15_port, D(16) => 
                           extend_vector_15_port, D(15) => A(15), D(14) => 
                           A(14), D(13) => A(13), D(12) => A(12), D(11) => 
                           A(11), D(10) => A(10), D(9) => A(9), D(8) => A(8), 
                           D(7) => A(7), D(6) => A(6), D(5) => A(5), D(4) => 
                           A(4), D(3) => A(3), D(2) => A(2), D(1) => A(1), D(0)
                           => A(0), SO(31) => A_to_mux_31_port, SO(30) => 
                           A_to_mux_30_port, SO(29) => A_to_mux_29_port, SO(28)
                           => A_to_mux_28_port, SO(27) => A_to_mux_27_port, 
                           SO(26) => A_to_mux_26_port, SO(25) => 
                           A_to_mux_25_port, SO(24) => A_to_mux_24_port, SO(23)
                           => A_to_mux_23_port, SO(22) => A_to_mux_22_port, 
                           SO(21) => A_to_mux_21_port, SO(20) => 
                           A_to_mux_20_port, SO(19) => A_to_mux_19_port, SO(18)
                           => A_to_mux_18_port, SO(17) => A_to_mux_17_port, 
                           SO(16) => A_to_mux_16_port, SO(15) => 
                           A_to_mux_15_port, SO(14) => A_to_mux_14_port, SO(13)
                           => A_to_mux_13_port, SO(12) => A_to_mux_12_port, 
                           SO(11) => A_to_mux_11_port, SO(10) => 
                           A_to_mux_10_port, SO(9) => A_to_mux_9_port, SO(8) =>
                           A_to_mux_8_port, SO(7) => A_to_mux_7_port, SO(6) => 
                           A_to_mux_6_port, SO(5) => A_to_mux_5_port, SO(4) => 
                           A_to_mux_4_port, SO(3) => A_to_mux_3_port, SO(2) => 
                           A_to_mux_2_port, SO(1) => A_to_mux_1_port, SO(0) => 
                           A_to_mux_0_port);
   INPUTMUX : mux21_1 port map( IN0(31) => A_to_mux_31_port, IN0(30) => 
                           A_to_mux_30_port, IN0(29) => A_to_mux_29_port, 
                           IN0(28) => A_to_mux_28_port, IN0(27) => 
                           A_to_mux_27_port, IN0(26) => A_to_mux_26_port, 
                           IN0(25) => A_to_mux_25_port, IN0(24) => 
                           A_to_mux_24_port, IN0(23) => A_to_mux_23_port, 
                           IN0(22) => A_to_mux_22_port, IN0(21) => 
                           A_to_mux_21_port, IN0(20) => A_to_mux_20_port, 
                           IN0(19) => A_to_mux_19_port, IN0(18) => 
                           A_to_mux_18_port, IN0(17) => A_to_mux_17_port, 
                           IN0(16) => A_to_mux_16_port, IN0(15) => 
                           A_to_mux_15_port, IN0(14) => A_to_mux_14_port, 
                           IN0(13) => A_to_mux_13_port, IN0(12) => 
                           A_to_mux_12_port, IN0(11) => A_to_mux_11_port, 
                           IN0(10) => A_to_mux_10_port, IN0(9) => 
                           A_to_mux_9_port, IN0(8) => A_to_mux_8_port, IN0(7) 
                           => A_to_mux_7_port, IN0(6) => A_to_mux_6_port, 
                           IN0(5) => A_to_mux_5_port, IN0(4) => A_to_mux_4_port
                           , IN0(3) => A_to_mux_3_port, IN0(2) => 
                           A_to_mux_2_port, IN0(1) => A_to_mux_1_port, IN0(0) 
                           => A_to_mux_0_port, IN1(31) => A_to_mux_30_port, 
                           IN1(30) => A_to_mux_29_port, IN1(29) => 
                           A_to_mux_28_port, IN1(28) => A_to_mux_27_port, 
                           IN1(27) => A_to_mux_26_port, IN1(26) => 
                           A_to_mux_25_port, IN1(25) => A_to_mux_24_port, 
                           IN1(24) => A_to_mux_23_port, IN1(23) => 
                           A_to_mux_22_port, IN1(22) => A_to_mux_21_port, 
                           IN1(21) => A_to_mux_20_port, IN1(20) => 
                           A_to_mux_19_port, IN1(19) => A_to_mux_18_port, 
                           IN1(18) => A_to_mux_17_port, IN1(17) => 
                           A_to_mux_16_port, IN1(16) => A_to_mux_15_port, 
                           IN1(15) => A_to_mux_14_port, IN1(14) => 
                           A_to_mux_13_port, IN1(13) => A_to_mux_12_port, 
                           IN1(12) => A_to_mux_11_port, IN1(11) => 
                           A_to_mux_10_port, IN1(10) => A_to_mux_9_port, IN1(9)
                           => A_to_mux_8_port, IN1(8) => A_to_mux_7_port, 
                           IN1(7) => A_to_mux_6_port, IN1(6) => A_to_mux_5_port
                           , IN1(5) => A_to_mux_4_port, IN1(4) => 
                           A_to_mux_3_port, IN1(3) => A_to_mux_2_port, IN1(2) 
                           => A_to_mux_1_port, IN1(1) => A_to_mux_0_port, 
                           IN1(0) => X_Logic0_port, CTRL => input_mux_sel_0, 
                           OUT1(31) => B_to_add(31), OUT1(30) => B_to_add(30), 
                           OUT1(29) => B_to_add(29), OUT1(28) => B_to_add(28), 
                           OUT1(27) => B_to_add(27), OUT1(26) => B_to_add(26), 
                           OUT1(25) => B_to_add(25), OUT1(24) => B_to_add(24), 
                           OUT1(23) => B_to_add(23), OUT1(22) => B_to_add(22), 
                           OUT1(21) => B_to_add(21), OUT1(20) => B_to_add(20), 
                           OUT1(19) => B_to_add(19), OUT1(18) => B_to_add(18), 
                           OUT1(17) => B_to_add(17), OUT1(16) => B_to_add(16), 
                           OUT1(15) => B_to_add(15), OUT1(14) => B_to_add(14), 
                           OUT1(13) => B_to_add(13), OUT1(12) => B_to_add(12), 
                           OUT1(11) => B_to_add(11), OUT1(10) => B_to_add(10), 
                           OUT1(9) => B_to_add(9), OUT1(8) => B_to_add(8), 
                           OUT1(7) => B_to_add(7), OUT1(6) => B_to_add(6), 
                           OUT1(5) => B_to_add(5), OUT1(4) => B_to_add(4), 
                           OUT1(3) => B_to_add(3), OUT1(2) => B_to_add(2), 
                           OUT1(1) => B_to_add(1), OUT1(0) => B_to_add(0));
   ACCUMULATOR : ff32_en_SIZE32 port map( D(31) => next_accumulate_31_port, 
                           D(30) => next_accumulate_30_port, D(29) => 
                           next_accumulate_29_port, D(28) => 
                           next_accumulate_28_port, D(27) => 
                           next_accumulate_27_port, D(26) => 
                           next_accumulate_26_port, D(25) => 
                           next_accumulate_25_port, D(24) => 
                           next_accumulate_24_port, D(23) => 
                           next_accumulate_23_port, D(22) => 
                           next_accumulate_22_port, D(21) => 
                           next_accumulate_21_port, D(20) => 
                           next_accumulate_20_port, D(19) => 
                           next_accumulate_19_port, D(18) => 
                           next_accumulate_18_port, D(17) => 
                           next_accumulate_17_port, D(16) => 
                           next_accumulate_16_port, D(15) => 
                           next_accumulate_15_port, D(14) => 
                           next_accumulate_14_port, D(13) => 
                           next_accumulate_13_port, D(12) => 
                           next_accumulate_12_port, D(11) => 
                           next_accumulate_11_port, D(10) => 
                           next_accumulate_10_port, D(9) => 
                           next_accumulate_9_port, D(8) => 
                           next_accumulate_8_port, D(7) => 
                           next_accumulate_7_port, D(6) => 
                           next_accumulate_6_port, D(5) => 
                           next_accumulate_5_port, D(4) => 
                           next_accumulate_4_port, D(3) => 
                           next_accumulate_3_port, D(2) => 
                           next_accumulate_2_port, D(1) => 
                           next_accumulate_1_port, D(0) => 
                           next_accumulate_0_port, en => reg_enable, clk => 
                           Clock, rst => Reset, Q(31) => A_to_add_31_port, 
                           Q(30) => A_to_add_30_port, Q(29) => A_to_add_29_port
                           , Q(28) => A_to_add_28_port, Q(27) => 
                           A_to_add_27_port, Q(26) => A_to_add_26_port, Q(25) 
                           => A_to_add_25_port, Q(24) => A_to_add_24_port, 
                           Q(23) => A_to_add_23_port, Q(22) => A_to_add_22_port
                           , Q(21) => A_to_add_21_port, Q(20) => 
                           A_to_add_20_port, Q(19) => A_to_add_19_port, Q(18) 
                           => A_to_add_18_port, Q(17) => A_to_add_17_port, 
                           Q(16) => A_to_add_16_port, Q(15) => A_to_add_15_port
                           , Q(14) => A_to_add_14_port, Q(13) => 
                           A_to_add_13_port, Q(12) => A_to_add_12_port, Q(11) 
                           => A_to_add_11_port, Q(10) => A_to_add_10_port, Q(9)
                           => A_to_add_9_port, Q(8) => A_to_add_8_port, Q(7) =>
                           A_to_add_7_port, Q(6) => A_to_add_6_port, Q(5) => 
                           A_to_add_5_port, Q(4) => A_to_add_4_port, Q(3) => 
                           A_to_add_3_port, Q(2) => A_to_add_2_port, Q(1) => 
                           A_to_add_1_port, Q(0) => A_to_add_0_port);
   U34 : NOR2_X1 port map( A1 => n22, A2 => n59, ZN => next_accumulate_24_port)
                           ;
   U36 : NOR2_X1 port map( A1 => n22, A2 => n60, ZN => next_accumulate_23_port)
                           ;
   U58 : NOR2_X1 port map( A1 => n22, A2 => n71, ZN => next_accumulate_13_port)
                           ;
   U54 : NOR2_X1 port map( A1 => n22, A2 => n69, ZN => next_accumulate_15_port)
                           ;
   U48 : NOR2_X1 port map( A1 => n22, A2 => n66, ZN => next_accumulate_18_port)
                           ;
   U46 : NOR2_X1 port map( A1 => n22, A2 => n65, ZN => next_accumulate_19_port)
                           ;
   U60 : NOR2_X1 port map( A1 => n22, A2 => n72, ZN => next_accumulate_12_port)
                           ;
   U62 : NOR2_X1 port map( A1 => n22, A2 => n73, ZN => next_accumulate_11_port)
                           ;
   U6 : NOR2_X1 port map( A1 => n22, A2 => n39, ZN => next_accumulate_8_port);
   U4 : NOR2_X1 port map( A1 => n22, A2 => n38, ZN => next_accumulate_9_port);
   U64 : NOR2_X1 port map( A1 => n22, A2 => n74, ZN => next_accumulate_10_port)
                           ;
   U8 : NOR2_X1 port map( A1 => n22, A2 => n40, ZN => next_accumulate_7_port);
   U10 : NOR2_X1 port map( A1 => n22, A2 => n41, ZN => next_accumulate_6_port);
   U16 : NOR2_X1 port map( A1 => n22, A2 => n44, ZN => next_accumulate_3_port);
   U12 : NOR2_X1 port map( A1 => n22, A2 => n42, ZN => next_accumulate_5_port);
   U14 : NOR2_X1 port map( A1 => n22, A2 => n43, ZN => next_accumulate_4_port);
   U22 : NOR2_X1 port map( A1 => n22, A2 => n47, ZN => next_accumulate_2_port);
   U44 : NOR2_X1 port map( A1 => n22, A2 => n64, ZN => next_accumulate_1_port);
   U66 : NOR2_X1 port map( A1 => n22, A2 => n75, ZN => next_accumulate_0_port);
   U78 : AND3_X1 port map( A1 => n81, A2 => N21, A3 => net549699, ZN => 
                           valid_port);
   U72 : AOI21_X1 port map( B1 => enable, B2 => N24, A => valid_port, ZN => n77
                           );
   U71 : OAI21_X1 port map( B1 => net549699, B2 => enable, A => n77, ZN => n52)
                           ;
   U76 : NAND2_X1 port map( A1 => enable, A2 => N23, ZN => n79);
   U75 : OAI22_X1 port map( A1 => n79, A2 => valid_port, B1 => enable, B2 => 
                           n11, ZN => n50);
   U69 : AOI21_X1 port map( B1 => enable, B2 => N21, A => valid_port, ZN => n76
                           );
   U68 : OAI21_X1 port map( B1 => N21, B2 => enable, A => n76, ZN => n54);
   U59 : INV_X1 port map( A => ACC_from_add(13), ZN => n71);
   U55 : INV_X1 port map( A => ACC_from_add(15), ZN => n69);
   U63 : INV_X1 port map( A => ACC_from_add(11), ZN => n73);
   U7 : INV_X1 port map( A => ACC_from_add(8), ZN => n39);
   U5 : INV_X1 port map( A => ACC_from_add(9), ZN => n38);
   U65 : INV_X1 port map( A => ACC_from_add(10), ZN => n74);
   U9 : INV_X1 port map( A => ACC_from_add(7), ZN => n40);
   U11 : INV_X1 port map( A => ACC_from_add(6), ZN => n41);
   U17 : INV_X1 port map( A => ACC_from_add(3), ZN => n44);
   U13 : INV_X1 port map( A => ACC_from_add(5), ZN => n42);
   U15 : INV_X1 port map( A => ACC_from_add(4), ZN => n43);
   U23 : INV_X1 port map( A => ACC_from_add(2), ZN => n47);
   U45 : INV_X1 port map( A => ACC_from_add(1), ZN => n64);
   U67 : INV_X1 port map( A => ACC_from_add(0), ZN => n75);
   U79 : INV_X1 port map( A => n82, ZN => n81);
   sub_213_U4 : OAI21_X1 port map( B1 => sub_213_n3, B2 => n11, A => sub_213_n2
                           , ZN => N23);
   sub_213_U3 : XNOR2_X1 port map( A => count_3_port, B => sub_213_n2, ZN => 
                           N24);
   sub_213_U5 : NAND2_X1 port map( A1 => sub_213_n3, A2 => n11, ZN => 
                           sub_213_n2);
   sub_213_U9 : NOR2_X1 port map( A1 => count_1_port, A2 => count_0_port, ZN =>
                           sub_213_n3);
   U84 : NAND3_X1 port map( A1 => n13, A2 => n11, A3 => n12, ZN => n82);
   count_reg_0_inst : DFFS_X1 port map( D => n54, CK => Clock, SN => n23_port, 
                           Q => count_0_port, QN => N21);
   count_reg_3_inst : DFFS_X1 port map( D => n52, CK => Clock, SN => n23_port, 
                           Q => count_3_port, QN => net549699);
   U3 : NOR2_X1 port map( A1 => sub_213_n2, A2 => count_3_port, ZN => n14);
   U18 : NAND2_X1 port map( A1 => n14, A2 => count_4_port, ZN => n15);
   U19 : OAI211_X1 port map( C1 => n14, C2 => count_4_port, A => n15, B => 
                           enable, ZN => n16);
   U20 : OAI22_X1 port map( A1 => enable, A2 => n12, B1 => valid_port, B2 => 
                           n16, ZN => n49);
   U21 : MUX2_X1 port map( A => A_to_add_0_port, B => ACC_from_add(0), S => 
                           input_mux_sel_2_port, Z => final_out(0));
   U24 : INV_X1 port map( A => ACC_from_add(21), ZN => n17);
   U25 : NOR2_X1 port map( A1 => n22, A2 => n17, ZN => next_accumulate_21_port)
                           ;
   U26 : OAI221_X1 port map( B1 => sub_213_n3, B2 => count_1_port, C1 => 
                           sub_213_n3, C2 => count_0_port, A => enable, ZN => 
                           n18);
   U27 : OAI22_X1 port map( A1 => enable, A2 => n13, B1 => valid_port, B2 => 
                           n18, ZN => n51);
   U28 : BUF_X8 port map( A => load, Z => n22);
   U29 : NOR3_X1 port map( A1 => N21, A2 => net549699, A3 => n82, ZN => load);
   U30 : INV_X1 port map( A => Reset, ZN => n23_port);
   U31 : AND2_X1 port map( A1 => sign, A2 => A(15), ZN => extend_vector_15_port
                           );
   U32 : AND2_X1 port map( A1 => sign, A2 => B(15), ZN => enc_N2_in_2_port);
   U33 : INV_X1 port map( A => ACC_from_add(12), ZN => n72);
   U35 : NOR2_X1 port map( A1 => n22, A2 => n46, ZN => next_accumulate_30_port)
                           ;
   U37 : INV_X1 port map( A => ACC_from_add(30), ZN => n46);
   U38 : INV_X1 port map( A => ACC_from_add(14), ZN => n70);
   U39 : INV_X1 port map( A => ACC_from_add(19), ZN => n65);
   U40 : INV_X1 port map( A => ACC_from_add(16), ZN => n68);
   U41 : INV_X1 port map( A => ACC_from_add(25), ZN => n58);
   U42 : INV_X1 port map( A => ACC_from_add(18), ZN => n66);
   U43 : INV_X1 port map( A => ACC_from_add(17), ZN => n67);
   U47 : INV_X1 port map( A => ACC_from_add(26), ZN => n57);
   U49 : INV_X1 port map( A => ACC_from_add(23), ZN => n60);
   U50 : INV_X1 port map( A => ACC_from_add(27), ZN => n56);
   U51 : INV_X1 port map( A => ACC_from_add(24), ZN => n59);
   U52 : INV_X1 port map( A => ACC_from_add(31), ZN => n45);
   U53 : INV_X1 port map( A => ACC_from_add(20), ZN => n63);
   U56 : INV_X1 port map( A => ACC_from_add(29), ZN => n48);
   U57 : INV_X1 port map( A => ACC_from_add(22), ZN => n61);
   U61 : INV_X1 port map( A => ACC_from_add(28), ZN => n55);
   U70 : OR2_X4 port map( A1 => n22, A2 => input_mux_sel_2_port, ZN => 
                           reg_enable);
   U73 : NOR2_X1 port map( A1 => n22, A2 => n70, ZN => next_accumulate_14_port)
                           ;
   U74 : NOR2_X1 port map( A1 => n22, A2 => n68, ZN => next_accumulate_16_port)
                           ;
   U77 : NOR2_X1 port map( A1 => n22, A2 => n58, ZN => next_accumulate_25_port)
                           ;
   U80 : NOR2_X1 port map( A1 => n22, A2 => n67, ZN => next_accumulate_17_port)
                           ;
   U81 : NOR2_X1 port map( A1 => n22, A2 => n57, ZN => next_accumulate_26_port)
                           ;
   U82 : NOR2_X1 port map( A1 => n22, A2 => n56, ZN => next_accumulate_27_port)
                           ;
   U83 : NOR2_X1 port map( A1 => n22, A2 => n61, ZN => next_accumulate_22_port)
                           ;
   U116 : NOR2_X1 port map( A1 => n22, A2 => n48, ZN => next_accumulate_29_port
                           );
   U117 : NOR2_X1 port map( A1 => n22, A2 => n55, ZN => next_accumulate_28_port
                           );
   U118 : NOR2_X1 port map( A1 => n22, A2 => n63, ZN => next_accumulate_20_port
                           );
   U119 : NOR2_X1 port map( A1 => n22, A2 => n45, ZN => next_accumulate_31_port
                           );

end SYN_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux41_MUX_SIZE32_0 is

   port( IN0, IN1, IN2, IN3 : in std_logic_vector (31 downto 0);  CTRL : in 
         std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 downto
         0));

end mux41_MUX_SIZE32_0;

architecture SYN_bhe of mux41_MUX_SIZE32_0 is

   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
      n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62
      , n63, n64, n65, n66, n67, n69, n68, n70, n71, n72, n73, n74, n75, n76, 
      n77 : std_logic;

begin
   
   U42 : AOI222_X1 port map( A1 => n77, A2 => IN1(1), B1 => n76, B2 => IN0(1), 
                           C1 => n73, C2 => IN2(1), ZN => n57);
   U46 : AOI222_X1 port map( A1 => n77, A2 => IN1(18), B1 => n76, B2 => IN0(18)
                           , C1 => n73, C2 => IN2(18), ZN => n59);
   U48 : AOI222_X1 port map( A1 => n77, A2 => IN1(17), B1 => n76, B2 => IN0(17)
                           , C1 => n73, C2 => IN2(17), ZN => n60);
   U50 : AOI222_X1 port map( A1 => n77, A2 => IN1(16), B1 => n76, B2 => IN0(16)
                           , C1 => n73, C2 => IN2(16), ZN => n61);
   U44 : AOI222_X1 port map( A1 => n77, A2 => IN1(19), B1 => n76, B2 => IN0(19)
                           , C1 => n73, C2 => IN2(19), ZN => n58);
   U20 : AOI222_X1 port map( A1 => n68, A2 => IN1(2), B1 => n70, B2 => IN0(2), 
                           C1 => n74, C2 => IN2(2), ZN => n46);
   U14 : AOI222_X1 port map( A1 => n68, A2 => IN1(3), B1 => n70, B2 => IN0(3), 
                           C1 => n75, C2 => IN2(3), ZN => n43);
   U6 : AOI222_X1 port map( A1 => n68, A2 => IN1(7), B1 => n70, B2 => IN0(7), 
                           C1 => n75, C2 => IN2(7), ZN => n39);
   U10 : AOI222_X1 port map( A1 => n68, A2 => IN1(5), B1 => n70, B2 => IN0(5), 
                           C1 => n75, C2 => IN2(5), ZN => n41);
   U12 : AOI222_X1 port map( A1 => n68, A2 => IN1(4), B1 => n70, B2 => IN0(4), 
                           C1 => n75, C2 => IN2(4), ZN => n42);
   U58 : AOI222_X1 port map( A1 => n77, A2 => IN1(12), B1 => n76, B2 => IN0(12)
                           , C1 => n73, C2 => IN2(12), ZN => n65);
   U56 : AOI222_X1 port map( A1 => n77, A2 => IN1(13), B1 => n76, B2 => IN0(13)
                           , C1 => n73, C2 => IN2(13), ZN => n64);
   U52 : AOI222_X1 port map( A1 => n77, A2 => IN1(15), B1 => n76, B2 => IN0(15)
                           , C1 => n73, C2 => IN2(15), ZN => n62);
   U54 : AOI222_X1 port map( A1 => n77, A2 => IN1(14), B1 => n76, B2 => IN0(14)
                           , C1 => n73, C2 => IN2(14), ZN => n63);
   U62 : AOI222_X1 port map( A1 => n77, A2 => IN1(10), B1 => n76, B2 => IN0(10)
                           , C1 => n73, C2 => IN2(10), ZN => n67);
   U60 : AOI222_X1 port map( A1 => n77, A2 => IN1(11), B1 => n76, B2 => IN0(11)
                           , C1 => n73, C2 => IN2(11), ZN => n66);
   U4 : AOI222_X1 port map( A1 => n68, A2 => IN1(8), B1 => n70, B2 => IN0(8), 
                           C1 => n75, C2 => IN2(8), ZN => n38);
   U2 : AOI222_X1 port map( A1 => n68, A2 => IN1(9), B1 => n70, B2 => IN0(9), 
                           C1 => n75, C2 => IN2(9), ZN => n34);
   U36 : AOI222_X1 port map( A1 => n68, A2 => IN1(22), B1 => n70, B2 => IN0(22)
                           , C1 => n74, C2 => IN2(22), ZN => n54);
   U38 : AOI222_X1 port map( A1 => n68, A2 => IN1(21), B1 => n70, B2 => IN0(21)
                           , C1 => n74, C2 => IN2(21), ZN => n55);
   U40 : AOI222_X1 port map( A1 => n68, A2 => IN1(20), B1 => n70, B2 => IN0(20)
                           , C1 => n74, C2 => IN2(20), ZN => n56);
   U34 : AOI222_X1 port map( A1 => n68, A2 => IN1(23), B1 => n70, B2 => IN0(23)
                           , C1 => n74, C2 => IN2(23), ZN => n53);
   U18 : AOI222_X1 port map( A1 => n68, A2 => IN1(30), B1 => n70, B2 => IN0(30)
                           , C1 => n74, C2 => IN2(30), ZN => n45);
   U22 : AOI222_X1 port map( A1 => n68, A2 => IN1(29), B1 => n70, B2 => IN0(29)
                           , C1 => n74, C2 => IN2(29), ZN => n47);
   U24 : AOI222_X1 port map( A1 => n68, A2 => IN1(28), B1 => n70, B2 => IN0(28)
                           , C1 => n74, C2 => IN2(28), ZN => n48);
   U16 : AOI222_X1 port map( A1 => n68, A2 => IN1(31), B1 => n70, B2 => IN0(31)
                           , C1 => n75, C2 => IN2(31), ZN => n44);
   U26 : AOI222_X1 port map( A1 => n68, A2 => IN1(27), B1 => n70, B2 => IN0(27)
                           , C1 => n74, C2 => IN2(27), ZN => n49);
   U28 : AOI222_X1 port map( A1 => n68, A2 => IN1(26), B1 => n70, B2 => IN0(26)
                           , C1 => n74, C2 => IN2(26), ZN => n50);
   U30 : AOI222_X1 port map( A1 => n68, A2 => IN1(25), B1 => n70, B2 => IN0(25)
                           , C1 => n74, C2 => IN2(25), ZN => n51);
   U32 : AOI222_X1 port map( A1 => n68, A2 => IN1(24), B1 => n70, B2 => IN0(24)
                           , C1 => n74, C2 => IN2(24), ZN => n52);
   U66 : NOR2_X1 port map( A1 => CTRL(1), A2 => CTRL(0), ZN => n36);
   U68 : INV_X1 port map( A => CTRL(1), ZN => n69);
   U67 : AND2_X1 port map( A1 => n69, A2 => CTRL(0), ZN => n35);
   U41 : INV_X1 port map( A => n57, ZN => OUT1(1));
   U45 : INV_X1 port map( A => n59, ZN => OUT1(18));
   U47 : INV_X1 port map( A => n60, ZN => OUT1(17));
   U49 : INV_X1 port map( A => n61, ZN => OUT1(16));
   U43 : INV_X1 port map( A => n58, ZN => OUT1(19));
   U19 : INV_X1 port map( A => n46, ZN => OUT1(2));
   U13 : INV_X1 port map( A => n43, ZN => OUT1(3));
   U7 : INV_X1 port map( A => n40, ZN => OUT1(6));
   U5 : INV_X1 port map( A => n39, ZN => OUT1(7));
   U9 : INV_X1 port map( A => n41, ZN => OUT1(5));
   U11 : INV_X1 port map( A => n42, ZN => OUT1(4));
   U57 : INV_X1 port map( A => n65, ZN => OUT1(12));
   U55 : INV_X1 port map( A => n64, ZN => OUT1(13));
   U51 : INV_X1 port map( A => n62, ZN => OUT1(15));
   U53 : INV_X1 port map( A => n63, ZN => OUT1(14));
   U61 : INV_X1 port map( A => n67, ZN => OUT1(10));
   U59 : INV_X1 port map( A => n66, ZN => OUT1(11));
   U3 : INV_X1 port map( A => n38, ZN => OUT1(8));
   U1 : INV_X1 port map( A => n34, ZN => OUT1(9));
   U35 : INV_X1 port map( A => n54, ZN => OUT1(22));
   U37 : INV_X1 port map( A => n55, ZN => OUT1(21));
   U39 : INV_X1 port map( A => n56, ZN => OUT1(20));
   U33 : INV_X1 port map( A => n53, ZN => OUT1(23));
   U17 : INV_X1 port map( A => n45, ZN => OUT1(30));
   U21 : INV_X1 port map( A => n47, ZN => OUT1(29));
   U23 : INV_X1 port map( A => n48, ZN => OUT1(28));
   U15 : INV_X1 port map( A => n44, ZN => OUT1(31));
   U25 : INV_X1 port map( A => n49, ZN => OUT1(27));
   U27 : INV_X1 port map( A => n50, ZN => OUT1(26));
   U29 : INV_X1 port map( A => n51, ZN => OUT1(25));
   U31 : INV_X1 port map( A => n52, ZN => OUT1(24));
   U8 : BUF_X2 port map( A => n35, Z => n68);
   U63 : BUF_X1 port map( A => n36, Z => n76);
   U64 : BUF_X2 port map( A => n36, Z => n70);
   U65 : BUF_X2 port map( A => n35, Z => n77);
   U69 : AOI222_X1 port map( A1 => n68, A2 => IN1(6), B1 => n70, B2 => IN0(6), 
                           C1 => n75, C2 => IN2(6), ZN => n40);
   U70 : BUF_X2 port map( A => n37, Z => n75);
   U71 : BUF_X2 port map( A => n37, Z => n74);
   U72 : BUF_X2 port map( A => n37, Z => n73);
   U73 : NOR2_X1 port map( A1 => CTRL(0), A2 => n69, ZN => n37);
   U74 : NAND2_X1 port map( A1 => n73, A2 => IN2(0), ZN => n71);
   U75 : NAND2_X1 port map( A1 => n71, A2 => n72, ZN => OUT1(0));
   U76 : AOI22_X1 port map( A1 => n77, A2 => IN1(0), B1 => n76, B2 => IN0(0), 
                           ZN => n72);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux41_MUX_SIZE5 is

   port( IN0, IN1, IN2, IN3 : in std_logic_vector (4 downto 0);  CTRL : in 
         std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (4 downto 
         0));

end mux41_MUX_SIZE5;

architecture SYN_bhe of mux41_MUX_SIZE5 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16 : 
      std_logic;

begin
   
   U1 : NAND2_X1 port map( A1 => n2, A2 => n3, ZN => OUT1(4));
   U4 : NAND2_X1 port map( A1 => n8, A2 => n9, ZN => OUT1(3));
   U7 : NAND2_X1 port map( A1 => n10, A2 => n11, ZN => OUT1(2));
   U10 : NAND2_X1 port map( A1 => n12, A2 => n13, ZN => OUT1(1));
   U17 : AOI22_X1 port map( A1 => n5, A2 => IN2(0), B1 => n6, B2 => IN1(0), ZN 
                           => n14);
   U13 : NAND2_X1 port map( A1 => n14, A2 => n15, ZN => OUT1(0));
   U19 : NOR2_X1 port map( A1 => CTRL(0), A2 => n16, ZN => n5);
   U20 : INV_X1 port map( A => CTRL(1), ZN => n16);
   U18 : AND2_X1 port map( A1 => n16, A2 => CTRL(0), ZN => n6);
   U16 : AND2_X1 port map( A1 => CTRL(0), A2 => CTRL(1), ZN => n4);
   U2 : INV_X1 port map( A => n4, ZN => n15);
   U3 : AOI21_X1 port map( B1 => n5, B2 => IN2(1), A => n4, ZN => n13);
   U5 : NAND2_X1 port map( A1 => n6, A2 => IN1(1), ZN => n12);
   U6 : AOI21_X1 port map( B1 => n5, B2 => IN2(2), A => n4, ZN => n11);
   U8 : NAND2_X1 port map( A1 => n6, A2 => IN1(2), ZN => n10);
   U9 : AOI21_X1 port map( B1 => n5, B2 => IN2(3), A => n4, ZN => n9);
   U11 : NAND2_X1 port map( A1 => n6, A2 => IN1(3), ZN => n8);
   U12 : AOI21_X1 port map( B1 => n5, B2 => IN2(4), A => n4, ZN => n3);
   U14 : NAND2_X1 port map( A1 => n6, A2 => IN1(4), ZN => n2);

end SYN_bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity real_alu_DATA_SIZE32 is

   port( IN1, IN2 : in std_logic_vector (31 downto 0);  ALUW_i : in 
         std_logic_vector (12 downto 0);  DOUT : out std_logic_vector (31 
         downto 0);  stall_o : out std_logic;  Clock, Reset : in std_logic);

end real_alu_DATA_SIZE32;

architecture SYN_Bhe of real_alu_DATA_SIZE32 is

   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI222_X1
      port( A1, A2, B1, B2, C1, C2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component BUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component NAND2_X4
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component BUF_X2
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component logic_unit_SIZE32
      port( IN1, IN2 : in std_logic_vector (31 downto 0);  CTRL : in 
            std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 
            downto 0));
   end component;
   
   component shifter
      port( A : in std_logic_vector (31 downto 0);  B : in std_logic_vector (4 
            downto 0);  LOGIC_ARITH, LEFT_RIGHT : in std_logic;  OUTPUT : out 
            std_logic_vector (31 downto 0));
   end component;
   
   component comparator_M32
      port( C, V : in std_logic;  SUM : in std_logic_vector (31 downto 0);  sel
            : in std_logic_vector (2 downto 0);  sign : in std_logic;  S : out 
            std_logic);
   end component;
   
   component p4add_N32_logN5
      port( A, B : in std_logic_vector (31 downto 0);  Cin, sign : in std_logic
            ;  S : out std_logic_vector (31 downto 0);  Cout : out std_logic);
   end component;
   
   component simple_booth_add_ext_N16
      port( Clock, Reset, sign, enable : in std_logic;  valid : out std_logic; 
            A, B : in std_logic_vector (15 downto 0);  A_to_add, B_to_add : out
            std_logic_vector (31 downto 0);  sign_to_add : out std_logic;  
            final_out : out std_logic_vector (31 downto 0);  ACC_from_add : in 
            std_logic_vector (31 downto 0));
   end component;
   
   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal X_Logic0_port, mux_A_31_port, mux_A_30_port, mux_A_29_port, 
      mux_A_28_port, mux_A_27_port, mux_A_26_port, mux_A_25_port, mux_A_24_port
      , mux_A_23_port, mux_A_22_port, mux_A_21_port, mux_A_20_port, 
      mux_A_19_port, mux_A_18_port, mux_A_17_port, mux_A_16_port, mux_A_15_port
      , mux_A_14_port, mux_A_13_port, mux_A_12_port, mux_A_11_port, 
      mux_A_10_port, mux_A_9_port, mux_A_8_port, mux_A_7_port, mux_A_6_port, 
      mux_A_5_port, mux_A_4_port, mux_A_3_port, mux_A_2_port, mux_A_1_port, 
      mux_A_0_port, A_booth_to_add_31_port, A_booth_to_add_30_port, 
      A_booth_to_add_29_port, A_booth_to_add_28_port, A_booth_to_add_27_port, 
      A_booth_to_add_26_port, A_booth_to_add_25_port, A_booth_to_add_24_port, 
      A_booth_to_add_23_port, A_booth_to_add_22_port, A_booth_to_add_21_port, 
      A_booth_to_add_20_port, A_booth_to_add_19_port, A_booth_to_add_18_port, 
      A_booth_to_add_17_port, A_booth_to_add_16_port, A_booth_to_add_15_port, 
      A_booth_to_add_14_port, A_booth_to_add_13_port, A_booth_to_add_12_port, 
      A_booth_to_add_11_port, A_booth_to_add_10_port, A_booth_to_add_9_port, 
      A_booth_to_add_8_port, A_booth_to_add_7_port, A_booth_to_add_6_port, 
      A_booth_to_add_5_port, A_booth_to_add_4_port, A_booth_to_add_3_port, 
      A_booth_to_add_2_port, A_booth_to_add_1_port, A_booth_to_add_0_port, 
      mux_B_31_port, mux_B_30_port, mux_B_29_port, mux_B_28_port, mux_B_27_port
      , mux_B_26_port, mux_B_25_port, mux_B_24_port, mux_B_23_port, 
      mux_B_22_port, mux_B_21_port, mux_B_20_port, mux_B_19_port, mux_B_18_port
      , mux_B_17_port, mux_B_16_port, mux_B_15_port, mux_B_14_port, 
      mux_B_13_port, mux_B_12_port, mux_B_11_port, mux_B_10_port, mux_B_9_port,
      mux_B_8_port, mux_B_7_port, mux_B_6_port, mux_B_5_port, mux_B_4_port, 
      mux_B_3_port, mux_B_2_port, mux_B_1_port, mux_B_0_port, 
      B_booth_to_add_31_port, B_booth_to_add_30_port, B_booth_to_add_29_port, 
      B_booth_to_add_28_port, B_booth_to_add_27_port, B_booth_to_add_26_port, 
      B_booth_to_add_25_port, B_booth_to_add_24_port, B_booth_to_add_23_port, 
      B_booth_to_add_22_port, B_booth_to_add_21_port, B_booth_to_add_20_port, 
      B_booth_to_add_19_port, B_booth_to_add_18_port, B_booth_to_add_17_port, 
      B_booth_to_add_16_port, B_booth_to_add_15_port, B_booth_to_add_14_port, 
      B_booth_to_add_13_port, B_booth_to_add_12_port, B_booth_to_add_11_port, 
      B_booth_to_add_10_port, B_booth_to_add_9_port, B_booth_to_add_8_port, 
      B_booth_to_add_7_port, B_booth_to_add_6_port, B_booth_to_add_5_port, 
      B_booth_to_add_4_port, B_booth_to_add_3_port, B_booth_to_add_2_port, 
      B_booth_to_add_1_port, B_booth_to_add_0_port, mux_sign, sign_booth_to_add
      , valid_from_booth, mult_out_31_port, mult_out_30_port, mult_out_29_port,
      mult_out_28_port, mult_out_27_port, mult_out_26_port, mult_out_25_port, 
      mult_out_24_port, mult_out_23_port, mult_out_22_port, mult_out_21_port, 
      mult_out_20_port, mult_out_19_port, mult_out_18_port, mult_out_17_port, 
      mult_out_16_port, mult_out_15_port, mult_out_14_port, mult_out_13_port, 
      mult_out_12_port, mult_out_11_port, mult_out_10_port, mult_out_9_port, 
      mult_out_8_port, mult_out_7_port, mult_out_6_port, mult_out_5_port, 
      mult_out_4_port, mult_out_3_port, mult_out_2_port, mult_out_1_port, 
      mult_out_0_port, sum_out_31_port, sum_out_30_port, sum_out_29_port, 
      sum_out_28_port, sum_out_27_port, sum_out_26_port, sum_out_25_port, 
      sum_out_24_port, sum_out_23_port, sum_out_22_port, sum_out_21_port, 
      sum_out_20_port, sum_out_18_port, sum_out_17_port, sum_out_16_port, 
      sum_out_15_port, sum_out_14_port, sum_out_13_port, sum_out_12_port, 
      sum_out_11_port, sum_out_10_port, sum_out_9_port, sum_out_8_port, 
      sum_out_7_port, sum_out_6_port, sum_out_5_port, sum_out_4_port, 
      sum_out_3_port, sum_out_2_port, sum_out_1_port, sum_out_0_port, 
      carry_from_adder, overflow, comp_out, shift_out_31_port, 
      shift_out_30_port, shift_out_29_port, shift_out_28_port, 
      shift_out_27_port, shift_out_26_port, shift_out_25_port, 
      shift_out_24_port, shift_out_23_port, shift_out_22_port, 
      shift_out_21_port, shift_out_20_port, shift_out_19_port, 
      shift_out_18_port, shift_out_17_port, shift_out_16_port, 
      shift_out_15_port, shift_out_14_port, shift_out_13_port, 
      shift_out_12_port, shift_out_11_port, shift_out_10_port, shift_out_9_port
      , shift_out_8_port, shift_out_7_port, shift_out_6_port, shift_out_5_port,
      shift_out_4_port, shift_out_3_port, shift_out_2_port, shift_out_1_port, 
      shift_out_0_port, lu_out_31_port, lu_out_30_port, lu_out_29_port, 
      lu_out_28_port, lu_out_27_port, lu_out_26_port, lu_out_25_port, 
      lu_out_24_port, lu_out_23_port, lu_out_22_port, lu_out_21_port, 
      lu_out_20_port, lu_out_19_port, lu_out_18_port, lu_out_17_port, 
      lu_out_16_port, lu_out_15_port, lu_out_14_port, lu_out_13_port, 
      lu_out_12_port, lu_out_11_port, lu_out_10_port, lu_out_9_port, 
      lu_out_8_port, lu_out_7_port, lu_out_6_port, lu_out_5_port, lu_out_4_port
      , lu_out_3_port, lu_out_2_port, lu_out_1_port, lu_out_0_port, n9, n10, 
      n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25
      , n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, 
      n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54
      , n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, 
      n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83
      , n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, 
      n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n112, 
      n113, n115, n109, n110, n111, n114, n116, n117, n118, n119, n120, n121, 
      n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, 
      n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, 
      n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, 
      n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, 
      n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, 
      n182, n183, n184, n185, n186, n187 : std_logic;

begin
   
   X_Logic0_port <= '0';
   U112 : OAI33_X1 port map( A1 => n9, A2 => n10, A3 => IN1(31), B1 => 
                           sum_out_31_port, B2 => n11, B3 => IN2(31), ZN => 
                           overflow);
   U140 : MUX2_X1 port map( A => IN2(14), B => B_booth_to_add_14_port, S => 
                           ALUW_i(1), Z => mux_B_14_port);
   U143 : MUX2_X1 port map( A => IN2(11), B => B_booth_to_add_11_port, S => 
                           ALUW_i(1), Z => mux_B_11_port);
   U146 : MUX2_X1 port map( A => IN1(9), B => A_booth_to_add_9_port, S => 
                           ALUW_i(1), Z => mux_A_9_port);
   U147 : MUX2_X1 port map( A => IN1(8), B => A_booth_to_add_8_port, S => 
                           ALUW_i(1), Z => mux_A_8_port);
   U148 : MUX2_X1 port map( A => IN1(7), B => A_booth_to_add_7_port, S => 
                           ALUW_i(1), Z => mux_A_7_port);
   U151 : MUX2_X1 port map( A => IN1(4), B => A_booth_to_add_4_port, S => 
                           ALUW_i(1), Z => mux_A_4_port);
   U152 : MUX2_X1 port map( A => IN1(3), B => A_booth_to_add_3_port, S => 
                           ALUW_i(1), Z => mux_A_3_port);
   U153 : MUX2_X1 port map( A => IN1(31), B => A_booth_to_add_31_port, S => 
                           ALUW_i(1), Z => mux_A_31_port);
   U154 : MUX2_X1 port map( A => IN1(30), B => A_booth_to_add_30_port, S => 
                           ALUW_i(1), Z => mux_A_30_port);
   U156 : MUX2_X1 port map( A => IN1(29), B => A_booth_to_add_29_port, S => 
                           ALUW_i(1), Z => mux_A_29_port);
   U157 : MUX2_X1 port map( A => IN1(28), B => A_booth_to_add_28_port, S => 
                           ALUW_i(1), Z => mux_A_28_port);
   U158 : MUX2_X1 port map( A => IN1(27), B => A_booth_to_add_27_port, S => 
                           ALUW_i(1), Z => mux_A_27_port);
   U159 : MUX2_X1 port map( A => IN1(26), B => A_booth_to_add_26_port, S => 
                           ALUW_i(1), Z => mux_A_26_port);
   U160 : MUX2_X1 port map( A => IN1(25), B => A_booth_to_add_25_port, S => 
                           ALUW_i(1), Z => mux_A_25_port);
   U161 : MUX2_X1 port map( A => IN1(24), B => A_booth_to_add_24_port, S => 
                           ALUW_i(1), Z => mux_A_24_port);
   U162 : MUX2_X1 port map( A => IN1(23), B => A_booth_to_add_23_port, S => 
                           ALUW_i(1), Z => mux_A_23_port);
   U163 : MUX2_X1 port map( A => IN1(22), B => A_booth_to_add_22_port, S => 
                           ALUW_i(1), Z => mux_A_22_port);
   U164 : MUX2_X1 port map( A => IN1(21), B => A_booth_to_add_21_port, S => 
                           ALUW_i(1), Z => mux_A_21_port);
   U165 : MUX2_X1 port map( A => IN1(20), B => A_booth_to_add_20_port, S => 
                           ALUW_i(1), Z => mux_A_20_port);
   U167 : MUX2_X1 port map( A => IN1(19), B => A_booth_to_add_19_port, S => 
                           ALUW_i(1), Z => mux_A_19_port);
   U169 : MUX2_X1 port map( A => IN1(17), B => A_booth_to_add_17_port, S => 
                           ALUW_i(1), Z => mux_A_17_port);
   U170 : MUX2_X1 port map( A => IN1(16), B => A_booth_to_add_16_port, S => 
                           ALUW_i(1), Z => mux_A_16_port);
   U171 : MUX2_X1 port map( A => IN1(15), B => A_booth_to_add_15_port, S => 
                           ALUW_i(1), Z => mux_A_15_port);
   U172 : MUX2_X1 port map( A => IN1(14), B => A_booth_to_add_14_port, S => 
                           ALUW_i(1), Z => mux_A_14_port);
   U174 : MUX2_X1 port map( A => IN1(12), B => A_booth_to_add_12_port, S => 
                           ALUW_i(1), Z => mux_A_12_port);
   U175 : MUX2_X1 port map( A => IN1(11), B => A_booth_to_add_11_port, S => 
                           ALUW_i(1), Z => mux_A_11_port);
   U178 : NAND3_X1 port map( A1 => n12, A2 => n13, A3 => n14, ZN => DOUT(9));
   U179 : NAND3_X1 port map( A1 => n20, A2 => n21, A3 => n22, ZN => DOUT(8));
   U180 : NAND3_X1 port map( A1 => n23, A2 => n24, A3 => n25, ZN => DOUT(7));
   U181 : NAND3_X1 port map( A1 => n26, A2 => n27, A3 => n28, ZN => DOUT(6));
   U182 : NAND3_X1 port map( A1 => n29, A2 => n30, A3 => n31, ZN => DOUT(5));
   U183 : NAND3_X1 port map( A1 => n32, A2 => n33, A3 => n34, ZN => DOUT(4));
   U184 : NAND3_X1 port map( A1 => n35, A2 => n36, A3 => n37, ZN => DOUT(3));
   U185 : NAND3_X1 port map( A1 => n40, A2 => n41, A3 => n42, ZN => DOUT(30));
   U186 : NAND3_X1 port map( A1 => n43, A2 => n44, A3 => n45, ZN => DOUT(2));
   U187 : NAND3_X1 port map( A1 => n46, A2 => n47, A3 => n48, ZN => DOUT(29));
   U188 : NAND3_X1 port map( A1 => n49, A2 => n50, A3 => n51, ZN => DOUT(28));
   U189 : NAND3_X1 port map( A1 => n52, A2 => n53, A3 => n54, ZN => DOUT(27));
   U190 : NAND3_X1 port map( A1 => n55, A2 => n56, A3 => n57, ZN => DOUT(26));
   U191 : NAND3_X1 port map( A1 => n58, A2 => n59, A3 => n60, ZN => DOUT(25));
   U192 : NAND3_X1 port map( A1 => n61, A2 => n62, A3 => n63, ZN => DOUT(24));
   U193 : NAND3_X1 port map( A1 => n64, A2 => n65, A3 => n66, ZN => DOUT(23));
   U194 : NAND3_X1 port map( A1 => n67, A2 => n68, A3 => n69, ZN => DOUT(22));
   U195 : NAND3_X1 port map( A1 => n70, A2 => n71, A3 => n72, ZN => DOUT(21));
   U196 : NAND3_X1 port map( A1 => n73, A2 => n74, A3 => n75, ZN => DOUT(20));
   U197 : NAND3_X1 port map( A1 => n76, A2 => n77, A3 => n78, ZN => DOUT(1));
   U198 : NAND3_X1 port map( A1 => n79, A2 => n80, A3 => n81, ZN => DOUT(19));
   U199 : NAND3_X1 port map( A1 => n82, A2 => n83, A3 => n84, ZN => DOUT(18));
   U200 : NAND3_X1 port map( A1 => n85, A2 => n86, A3 => n87, ZN => DOUT(17));
   U201 : NAND3_X1 port map( A1 => n88, A2 => n89, A3 => n90, ZN => DOUT(16));
   U202 : NAND3_X1 port map( A1 => n91, A2 => n92, A3 => n93, ZN => DOUT(15));
   U203 : NAND3_X1 port map( A1 => n94, A2 => n95, A3 => n96, ZN => DOUT(14));
   U204 : NAND3_X1 port map( A1 => n97, A2 => n98, A3 => n99, ZN => DOUT(13));
   U205 : NAND3_X1 port map( A1 => n100, A2 => n101, A3 => n102, ZN => DOUT(12)
                           );
   U206 : NAND3_X1 port map( A1 => n103, A2 => n104, A3 => n105, ZN => DOUT(11)
                           );
   U207 : NAND3_X1 port map( A1 => n106, A2 => n107, A3 => n108, ZN => DOUT(10)
                           );
   MULT : simple_booth_add_ext_N16 port map( Clock => Clock, Reset => Reset, 
                           sign => ALUW_i(0), enable => ALUW_i(1), valid => 
                           valid_from_booth, A(15) => IN1(15), A(14) => IN1(14)
                           , A(13) => IN1(13), A(12) => IN1(12), A(11) => 
                           IN1(11), A(10) => IN1(10), A(9) => IN1(9), A(8) => 
                           IN1(8), A(7) => IN1(7), A(6) => IN1(6), A(5) => 
                           IN1(5), A(4) => IN1(4), A(3) => IN1(3), A(2) => 
                           IN1(2), A(1) => IN1(1), A(0) => IN1(0), B(15) => 
                           n177, B(14) => IN2(14), B(13) => IN2(13), B(12) => 
                           n170, B(11) => n175, B(10) => n147, B(9) => n176, 
                           B(8) => IN2(8), B(7) => n171, B(6) => n173, B(5) => 
                           n183, B(4) => n178, B(3) => n180, B(2) => n186, B(1)
                           => n181, B(0) => n184, A_to_add(31) => 
                           A_booth_to_add_31_port, A_to_add(30) => 
                           A_booth_to_add_30_port, A_to_add(29) => 
                           A_booth_to_add_29_port, A_to_add(28) => 
                           A_booth_to_add_28_port, A_to_add(27) => 
                           A_booth_to_add_27_port, A_to_add(26) => 
                           A_booth_to_add_26_port, A_to_add(25) => 
                           A_booth_to_add_25_port, A_to_add(24) => 
                           A_booth_to_add_24_port, A_to_add(23) => 
                           A_booth_to_add_23_port, A_to_add(22) => 
                           A_booth_to_add_22_port, A_to_add(21) => 
                           A_booth_to_add_21_port, A_to_add(20) => 
                           A_booth_to_add_20_port, A_to_add(19) => 
                           A_booth_to_add_19_port, A_to_add(18) => 
                           A_booth_to_add_18_port, A_to_add(17) => 
                           A_booth_to_add_17_port, A_to_add(16) => 
                           A_booth_to_add_16_port, A_to_add(15) => 
                           A_booth_to_add_15_port, A_to_add(14) => 
                           A_booth_to_add_14_port, A_to_add(13) => 
                           A_booth_to_add_13_port, A_to_add(12) => 
                           A_booth_to_add_12_port, A_to_add(11) => 
                           A_booth_to_add_11_port, A_to_add(10) => 
                           A_booth_to_add_10_port, A_to_add(9) => 
                           A_booth_to_add_9_port, A_to_add(8) => 
                           A_booth_to_add_8_port, A_to_add(7) => 
                           A_booth_to_add_7_port, A_to_add(6) => 
                           A_booth_to_add_6_port, A_to_add(5) => 
                           A_booth_to_add_5_port, A_to_add(4) => 
                           A_booth_to_add_4_port, A_to_add(3) => 
                           A_booth_to_add_3_port, A_to_add(2) => 
                           A_booth_to_add_2_port, A_to_add(1) => 
                           A_booth_to_add_1_port, A_to_add(0) => 
                           A_booth_to_add_0_port, B_to_add(31) => 
                           B_booth_to_add_31_port, B_to_add(30) => 
                           B_booth_to_add_30_port, B_to_add(29) => 
                           B_booth_to_add_29_port, B_to_add(28) => 
                           B_booth_to_add_28_port, B_to_add(27) => 
                           B_booth_to_add_27_port, B_to_add(26) => 
                           B_booth_to_add_26_port, B_to_add(25) => 
                           B_booth_to_add_25_port, B_to_add(24) => 
                           B_booth_to_add_24_port, B_to_add(23) => 
                           B_booth_to_add_23_port, B_to_add(22) => 
                           B_booth_to_add_22_port, B_to_add(21) => 
                           B_booth_to_add_21_port, B_to_add(20) => 
                           B_booth_to_add_20_port, B_to_add(19) => 
                           B_booth_to_add_19_port, B_to_add(18) => 
                           B_booth_to_add_18_port, B_to_add(17) => 
                           B_booth_to_add_17_port, B_to_add(16) => 
                           B_booth_to_add_16_port, B_to_add(15) => 
                           B_booth_to_add_15_port, B_to_add(14) => 
                           B_booth_to_add_14_port, B_to_add(13) => 
                           B_booth_to_add_13_port, B_to_add(12) => 
                           B_booth_to_add_12_port, B_to_add(11) => 
                           B_booth_to_add_11_port, B_to_add(10) => 
                           B_booth_to_add_10_port, B_to_add(9) => 
                           B_booth_to_add_9_port, B_to_add(8) => 
                           B_booth_to_add_8_port, B_to_add(7) => 
                           B_booth_to_add_7_port, B_to_add(6) => 
                           B_booth_to_add_6_port, B_to_add(5) => 
                           B_booth_to_add_5_port, B_to_add(4) => 
                           B_booth_to_add_4_port, B_to_add(3) => 
                           B_booth_to_add_3_port, B_to_add(2) => 
                           B_booth_to_add_2_port, B_to_add(1) => 
                           B_booth_to_add_1_port, B_to_add(0) => 
                           B_booth_to_add_0_port, sign_to_add => 
                           sign_booth_to_add, final_out(31) => mult_out_31_port
                           , final_out(30) => mult_out_30_port, final_out(29) 
                           => mult_out_29_port, final_out(28) => 
                           mult_out_28_port, final_out(27) => mult_out_27_port,
                           final_out(26) => mult_out_26_port, final_out(25) => 
                           mult_out_25_port, final_out(24) => mult_out_24_port,
                           final_out(23) => mult_out_23_port, final_out(22) => 
                           mult_out_22_port, final_out(21) => mult_out_21_port,
                           final_out(20) => mult_out_20_port, final_out(19) => 
                           mult_out_19_port, final_out(18) => mult_out_18_port,
                           final_out(17) => mult_out_17_port, final_out(16) => 
                           mult_out_16_port, final_out(15) => mult_out_15_port,
                           final_out(14) => mult_out_14_port, final_out(13) => 
                           mult_out_13_port, final_out(12) => mult_out_12_port,
                           final_out(11) => mult_out_11_port, final_out(10) => 
                           mult_out_10_port, final_out(9) => mult_out_9_port, 
                           final_out(8) => mult_out_8_port, final_out(7) => 
                           mult_out_7_port, final_out(6) => mult_out_6_port, 
                           final_out(5) => mult_out_5_port, final_out(4) => 
                           mult_out_4_port, final_out(3) => mult_out_3_port, 
                           final_out(2) => mult_out_2_port, final_out(1) => 
                           mult_out_1_port, final_out(0) => mult_out_0_port, 
                           ACC_from_add(31) => n185, ACC_from_add(30) => 
                           sum_out_30_port, ACC_from_add(29) => n168, 
                           ACC_from_add(28) => n172, ACC_from_add(27) => 
                           sum_out_27_port, ACC_from_add(26) => sum_out_26_port
                           , ACC_from_add(25) => n149, ACC_from_add(24) => n150
                           , ACC_from_add(23) => sum_out_23_port, 
                           ACC_from_add(22) => n169, ACC_from_add(21) => n174, 
                           ACC_from_add(20) => n179, ACC_from_add(19) => n120, 
                           ACC_from_add(18) => sum_out_18_port, 
                           ACC_from_add(17) => sum_out_17_port, 
                           ACC_from_add(16) => sum_out_16_port, 
                           ACC_from_add(15) => sum_out_15_port, 
                           ACC_from_add(14) => sum_out_14_port, 
                           ACC_from_add(13) => sum_out_13_port, 
                           ACC_from_add(12) => sum_out_12_port, 
                           ACC_from_add(11) => sum_out_11_port, 
                           ACC_from_add(10) => sum_out_10_port, ACC_from_add(9)
                           => sum_out_9_port, ACC_from_add(8) => sum_out_8_port
                           , ACC_from_add(7) => sum_out_7_port, ACC_from_add(6)
                           => sum_out_6_port, ACC_from_add(5) => sum_out_5_port
                           , ACC_from_add(4) => sum_out_4_port, ACC_from_add(3)
                           => sum_out_3_port, ACC_from_add(2) => sum_out_2_port
                           , ACC_from_add(1) => sum_out_1_port, ACC_from_add(0)
                           => sum_out_0_port);
   ADDER : p4add_N32_logN5 port map( A(31) => mux_A_31_port, A(30) => 
                           mux_A_30_port, A(29) => mux_A_29_port, A(28) => 
                           mux_A_28_port, A(27) => mux_A_27_port, A(26) => 
                           mux_A_26_port, A(25) => mux_A_25_port, A(24) => 
                           mux_A_24_port, A(23) => mux_A_23_port, A(22) => 
                           mux_A_22_port, A(21) => mux_A_21_port, A(20) => 
                           mux_A_20_port, A(19) => mux_A_19_port, A(18) => 
                           mux_A_18_port, A(17) => mux_A_17_port, A(16) => 
                           mux_A_16_port, A(15) => mux_A_15_port, A(14) => 
                           mux_A_14_port, A(13) => mux_A_13_port, A(12) => 
                           mux_A_12_port, A(11) => mux_A_11_port, A(10) => 
                           mux_A_10_port, A(9) => mux_A_9_port, A(8) => 
                           mux_A_8_port, A(7) => mux_A_7_port, A(6) => 
                           mux_A_6_port, A(5) => mux_A_5_port, A(4) => 
                           mux_A_4_port, A(3) => mux_A_3_port, A(2) => 
                           mux_A_2_port, A(1) => mux_A_1_port, A(0) => 
                           mux_A_0_port, B(31) => mux_B_31_port, B(30) => 
                           mux_B_30_port, B(29) => mux_B_29_port, B(28) => 
                           mux_B_28_port, B(27) => mux_B_27_port, B(26) => 
                           mux_B_26_port, B(25) => mux_B_25_port, B(24) => 
                           mux_B_24_port, B(23) => mux_B_23_port, B(22) => 
                           mux_B_22_port, B(21) => mux_B_21_port, B(20) => 
                           mux_B_20_port, B(19) => mux_B_19_port, B(18) => 
                           mux_B_18_port, B(17) => mux_B_17_port, B(16) => 
                           mux_B_16_port, B(15) => mux_B_15_port, B(14) => 
                           mux_B_14_port, B(13) => mux_B_13_port, B(12) => 
                           mux_B_12_port, B(11) => mux_B_11_port, B(10) => 
                           mux_B_10_port, B(9) => mux_B_9_port, B(8) => 
                           mux_B_8_port, B(7) => mux_B_7_port, B(6) => 
                           mux_B_6_port, B(5) => mux_B_5_port, B(4) => 
                           mux_B_4_port, B(3) => mux_B_3_port, B(2) => 
                           mux_B_2_port, B(1) => mux_B_1_port, B(0) => 
                           mux_B_0_port, Cin => X_Logic0_port, sign => mux_sign
                           , S(31) => sum_out_31_port, S(30) => sum_out_30_port
                           , S(29) => sum_out_29_port, S(28) => sum_out_28_port
                           , S(27) => sum_out_27_port, S(26) => sum_out_26_port
                           , S(25) => sum_out_25_port, S(24) => sum_out_24_port
                           , S(23) => sum_out_23_port, S(22) => sum_out_22_port
                           , S(21) => sum_out_21_port, S(20) => sum_out_20_port
                           , S(19) => n120, S(18) => sum_out_18_port, S(17) => 
                           sum_out_17_port, S(16) => sum_out_16_port, S(15) => 
                           sum_out_15_port, S(14) => sum_out_14_port, S(13) => 
                           sum_out_13_port, S(12) => sum_out_12_port, S(11) => 
                           sum_out_11_port, S(10) => sum_out_10_port, S(9) => 
                           sum_out_9_port, S(8) => sum_out_8_port, S(7) => 
                           sum_out_7_port, S(6) => sum_out_6_port, S(5) => 
                           sum_out_5_port, S(4) => sum_out_4_port, S(3) => 
                           sum_out_3_port, S(2) => sum_out_2_port, S(1) => 
                           sum_out_1_port, S(0) => sum_out_0_port, Cout => 
                           carry_from_adder);
   COMP : comparator_M32 port map( C => carry_from_adder, V => overflow, 
                           SUM(31) => sum_out_31_port, SUM(30) => 
                           sum_out_30_port, SUM(29) => sum_out_29_port, SUM(28)
                           => sum_out_28_port, SUM(27) => sum_out_27_port, 
                           SUM(26) => sum_out_26_port, SUM(25) => 
                           sum_out_25_port, SUM(24) => sum_out_24_port, SUM(23)
                           => sum_out_23_port, SUM(22) => sum_out_22_port, 
                           SUM(21) => sum_out_21_port, SUM(20) => 
                           sum_out_20_port, SUM(19) => n120, SUM(18) => 
                           sum_out_18_port, SUM(17) => sum_out_17_port, SUM(16)
                           => sum_out_16_port, SUM(15) => sum_out_15_port, 
                           SUM(14) => sum_out_14_port, SUM(13) => 
                           sum_out_13_port, SUM(12) => sum_out_12_port, SUM(11)
                           => sum_out_11_port, SUM(10) => sum_out_10_port, 
                           SUM(9) => sum_out_9_port, SUM(8) => sum_out_8_port, 
                           SUM(7) => sum_out_7_port, SUM(6) => sum_out_6_port, 
                           SUM(5) => sum_out_5_port, SUM(4) => sum_out_4_port, 
                           SUM(3) => sum_out_3_port, SUM(2) => sum_out_2_port, 
                           SUM(1) => sum_out_1_port, SUM(0) => sum_out_0_port, 
                           sel(2) => ALUW_i(4), sel(1) => ALUW_i(3), sel(0) => 
                           ALUW_i(2), sign => ALUW_i(0), S => comp_out);
   SHIFT : shifter port map( A(31) => IN1(31), A(30) => IN1(30), A(29) => 
                           IN1(29), A(28) => IN1(28), A(27) => IN1(27), A(26) 
                           => IN1(26), A(25) => IN1(25), A(24) => IN1(24), 
                           A(23) => IN1(23), A(22) => IN1(22), A(21) => IN1(21)
                           , A(20) => IN1(20), A(19) => IN1(19), A(18) => 
                           IN1(18), A(17) => IN1(17), A(16) => IN1(16), A(15) 
                           => IN1(15), A(14) => IN1(14), A(13) => IN1(13), 
                           A(12) => IN1(12), A(11) => IN1(11), A(10) => IN1(10)
                           , A(9) => IN1(9), A(8) => IN1(8), A(7) => IN1(7), 
                           A(6) => IN1(6), A(5) => IN1(5), A(4) => IN1(4), A(3)
                           => IN1(3), A(2) => IN1(2), A(1) => IN1(1), A(0) => 
                           IN1(0), B(4) => n178, B(3) => n180, B(2) => n186, 
                           B(1) => n181, B(0) => n184, LOGIC_ARITH => ALUW_i(8)
                           , LEFT_RIGHT => ALUW_i(9), OUTPUT(31) => 
                           shift_out_31_port, OUTPUT(30) => shift_out_30_port, 
                           OUTPUT(29) => shift_out_29_port, OUTPUT(28) => 
                           shift_out_28_port, OUTPUT(27) => shift_out_27_port, 
                           OUTPUT(26) => shift_out_26_port, OUTPUT(25) => 
                           shift_out_25_port, OUTPUT(24) => shift_out_24_port, 
                           OUTPUT(23) => shift_out_23_port, OUTPUT(22) => 
                           shift_out_22_port, OUTPUT(21) => shift_out_21_port, 
                           OUTPUT(20) => shift_out_20_port, OUTPUT(19) => 
                           shift_out_19_port, OUTPUT(18) => shift_out_18_port, 
                           OUTPUT(17) => shift_out_17_port, OUTPUT(16) => 
                           shift_out_16_port, OUTPUT(15) => shift_out_15_port, 
                           OUTPUT(14) => shift_out_14_port, OUTPUT(13) => 
                           shift_out_13_port, OUTPUT(12) => shift_out_12_port, 
                           OUTPUT(11) => shift_out_11_port, OUTPUT(10) => 
                           shift_out_10_port, OUTPUT(9) => shift_out_9_port, 
                           OUTPUT(8) => shift_out_8_port, OUTPUT(7) => 
                           shift_out_7_port, OUTPUT(6) => shift_out_6_port, 
                           OUTPUT(5) => shift_out_5_port, OUTPUT(4) => 
                           shift_out_4_port, OUTPUT(3) => shift_out_3_port, 
                           OUTPUT(2) => shift_out_2_port, OUTPUT(1) => 
                           shift_out_1_port, OUTPUT(0) => shift_out_0_port);
   LU : logic_unit_SIZE32 port map( IN1(31) => IN1(31), IN1(30) => IN1(30), 
                           IN1(29) => IN1(29), IN1(28) => IN1(28), IN1(27) => 
                           IN1(27), IN1(26) => IN1(26), IN1(25) => IN1(25), 
                           IN1(24) => IN1(24), IN1(23) => IN1(23), IN1(22) => 
                           IN1(22), IN1(21) => IN1(21), IN1(20) => IN1(20), 
                           IN1(19) => IN1(19), IN1(18) => IN1(18), IN1(17) => 
                           IN1(17), IN1(16) => IN1(16), IN1(15) => IN1(15), 
                           IN1(14) => IN1(14), IN1(13) => IN1(13), IN1(12) => 
                           IN1(12), IN1(11) => IN1(11), IN1(10) => IN1(10), 
                           IN1(9) => IN1(9), IN1(8) => IN1(8), IN1(7) => IN1(7)
                           , IN1(6) => IN1(6), IN1(5) => IN1(5), IN1(4) => 
                           IN1(4), IN1(3) => IN1(3), IN1(2) => IN1(2), IN1(1) 
                           => IN1(1), IN1(0) => IN1(0), IN2(31) => IN2(31), 
                           IN2(30) => IN2(30), IN2(29) => IN2(29), IN2(28) => 
                           IN2(28), IN2(27) => IN2(27), IN2(26) => IN2(26), 
                           IN2(25) => IN2(25), IN2(24) => IN2(24), IN2(23) => 
                           IN2(23), IN2(22) => IN2(22), IN2(21) => IN2(21), 
                           IN2(20) => IN2(20), IN2(19) => n148, IN2(18) => 
                           IN2(18), IN2(17) => n146, IN2(16) => IN2(16), 
                           IN2(15) => n177, IN2(14) => IN2(14), IN2(13) => 
                           IN2(13), IN2(12) => n170, IN2(11) => n175, IN2(10) 
                           => n147, IN2(9) => n176, IN2(8) => IN2(8), IN2(7) =>
                           n171, IN2(6) => n173, IN2(5) => n183, IN2(4) => n178
                           , IN2(3) => n180, IN2(2) => n186, IN2(1) => n181, 
                           IN2(0) => n184, CTRL(1) => ALUW_i(6), CTRL(0) => 
                           ALUW_i(5), OUT1(31) => lu_out_31_port, OUT1(30) => 
                           lu_out_30_port, OUT1(29) => lu_out_29_port, OUT1(28)
                           => lu_out_28_port, OUT1(27) => lu_out_27_port, 
                           OUT1(26) => lu_out_26_port, OUT1(25) => 
                           lu_out_25_port, OUT1(24) => lu_out_24_port, OUT1(23)
                           => lu_out_23_port, OUT1(22) => lu_out_22_port, 
                           OUT1(21) => lu_out_21_port, OUT1(20) => 
                           lu_out_20_port, OUT1(19) => lu_out_19_port, OUT1(18)
                           => lu_out_18_port, OUT1(17) => lu_out_17_port, 
                           OUT1(16) => lu_out_16_port, OUT1(15) => 
                           lu_out_15_port, OUT1(14) => lu_out_14_port, OUT1(13)
                           => lu_out_13_port, OUT1(12) => lu_out_12_port, 
                           OUT1(11) => lu_out_11_port, OUT1(10) => 
                           lu_out_10_port, OUT1(9) => lu_out_9_port, OUT1(8) =>
                           lu_out_8_port, OUT1(7) => lu_out_7_port, OUT1(6) => 
                           lu_out_6_port, OUT1(5) => lu_out_5_port, OUT1(4) => 
                           lu_out_4_port, OUT1(3) => lu_out_3_port, OUT1(2) => 
                           lu_out_2_port, OUT1(1) => lu_out_1_port, OUT1(0) => 
                           lu_out_0_port);
   U141 : MUX2_X1 port map( A => IN2(13), B => B_booth_to_add_13_port, S => 
                           ALUW_i(1), Z => mux_B_13_port);
   U137 : MUX2_X1 port map( A => IN2(17), B => B_booth_to_add_17_port, S => 
                           ALUW_i(1), Z => mux_B_17_port);
   U129 : MUX2_X1 port map( A => IN2(24), B => B_booth_to_add_24_port, S => 
                           ALUW_i(1), Z => mux_B_24_port);
   U128 : MUX2_X1 port map( A => IN2(25), B => B_booth_to_add_25_port, S => 
                           ALUW_i(1), Z => mux_B_25_port);
   U127 : MUX2_X1 port map( A => IN2(26), B => B_booth_to_add_26_port, S => 
                           ALUW_i(1), Z => mux_B_26_port);
   U126 : MUX2_X1 port map( A => IN2(27), B => B_booth_to_add_27_port, S => 
                           ALUW_i(1), Z => mux_B_27_port);
   U125 : MUX2_X1 port map( A => IN2(28), B => B_booth_to_add_28_port, S => 
                           ALUW_i(1), Z => mux_B_28_port);
   U122 : MUX2_X1 port map( A => IN2(30), B => B_booth_to_add_30_port, S => 
                           ALUW_i(1), Z => mux_B_30_port);
   U121 : MUX2_X1 port map( A => IN2(31), B => B_booth_to_add_31_port, S => 
                           ALUW_i(1), Z => mux_B_31_port);
   U118 : MUX2_X1 port map( A => IN2(5), B => B_booth_to_add_5_port, S => 
                           ALUW_i(1), Z => mux_B_5_port);
   U117 : MUX2_X1 port map( A => IN2(6), B => B_booth_to_add_6_port, S => 
                           ALUW_i(1), Z => mux_B_6_port);
   U135 : MUX2_X1 port map( A => IN2(19), B => B_booth_to_add_19_port, S => 
                           ALUW_i(1), Z => mux_B_19_port);
   U131 : MUX2_X1 port map( A => IN2(22), B => B_booth_to_add_22_port, S => 
                           ALUW_i(1), Z => mux_B_22_port);
   U29 : AOI22_X1 port map( A1 => n187, A2 => lu_out_31_port, B1 => n123, B2 =>
                           IN2(31), ZN => n39);
   U28 : NAND2_X1 port map( A1 => n38, A2 => n39, ZN => DOUT(31));
   U70 : AOI22_X1 port map( A1 => n122, A2 => shift_out_19_port, B1 => n121, B2
                           => mult_out_19_port, ZN => n81);
   U65 : AOI22_X1 port map( A1 => n187, A2 => lu_out_20_port, B1 => n123, B2 =>
                           IN2(20), ZN => n74);
   U64 : AOI22_X1 port map( A1 => n122, A2 => shift_out_20_port, B1 => n121, B2
                           => mult_out_20_port, ZN => n75);
   U61 : AOI22_X1 port map( A1 => n122, A2 => shift_out_21_port, B1 => n121, B2
                           => mult_out_21_port, ZN => n72);
   U27 : NAND2_X1 port map( A1 => sum_out_3_port, A2 => n124, ZN => n35);
   U25 : AOI22_X1 port map( A1 => n15, A2 => shift_out_3_port, B1 => n121, B2 
                           => mult_out_3_port, ZN => n37);
   U59 : AOI22_X1 port map( A1 => n187, A2 => lu_out_22_port, B1 => n123, B2 =>
                           IN2(22), ZN => n68);
   U58 : AOI22_X1 port map( A1 => n122, A2 => shift_out_22_port, B1 => n121, B2
                           => mult_out_22_port, ZN => n69);
   U53 : AOI22_X1 port map( A1 => n187, A2 => lu_out_24_port, B1 => n123, B2 =>
                           IN2(24), ZN => n62);
   U52 : AOI22_X1 port map( A1 => n122, A2 => shift_out_24_port, B1 => n121, B2
                           => mult_out_24_port, ZN => n63);
   U84 : NAND2_X1 port map( A1 => sum_out_15_port, A2 => n124, ZN => n91);
   U82 : AOI22_X1 port map( A1 => n122, A2 => shift_out_15_port, B1 => n121, B2
                           => mult_out_15_port, ZN => n93);
   U12 : NAND2_X1 port map( A1 => sum_out_8_port, A2 => n124, ZN => n20);
   U10 : AOI22_X1 port map( A1 => n122, A2 => shift_out_8_port, B1 => n121, B2 
                           => mult_out_8_port, ZN => n22);
   U18 : NAND2_X1 port map( A1 => sum_out_6_port, A2 => n124, ZN => n26);
   U16 : AOI22_X1 port map( A1 => n15, A2 => shift_out_6_port, B1 => n121, B2 
                           => mult_out_6_port, ZN => n28);
   U50 : AOI22_X1 port map( A1 => n187, A2 => lu_out_25_port, B1 => n123, B2 =>
                           IN2(25), ZN => n59);
   U49 : AOI22_X1 port map( A1 => n122, A2 => shift_out_25_port, B1 => n121, B2
                           => mult_out_25_port, ZN => n60);
   U78 : NAND2_X1 port map( A1 => sum_out_17_port, A2 => n124, ZN => n85);
   U76 : AOI22_X1 port map( A1 => n122, A2 => shift_out_17_port, B1 => n16, B2 
                           => mult_out_17_port, ZN => n87);
   U91 : AOI22_X1 port map( A1 => n122, A2 => shift_out_12_port, B1 => n121, B2
                           => mult_out_12_port, ZN => n102);
   U80 : AOI22_X1 port map( A1 => n187, A2 => lu_out_16_port, B1 => n123, B2 =>
                           IN2(16), ZN => n89);
   U79 : AOI22_X1 port map( A1 => n122, A2 => shift_out_16_port, B1 => n121, B2
                           => mult_out_16_port, ZN => n90);
   U42 : NAND2_X1 port map( A1 => n172, A2 => n124, ZN => n49);
   U41 : AOI22_X1 port map( A1 => n187, A2 => lu_out_28_port, B1 => n123, B2 =>
                           IN2(28), ZN => n50);
   U40 : AOI22_X1 port map( A1 => n15, A2 => shift_out_28_port, B1 => n121, B2 
                           => mult_out_28_port, ZN => n51);
   U24 : NAND2_X1 port map( A1 => sum_out_4_port, A2 => n124, ZN => n32);
   U23 : AOI22_X1 port map( A1 => n187, A2 => lu_out_4_port, B1 => n123, B2 => 
                           n178, ZN => n33);
   U22 : AOI22_X1 port map( A1 => n122, A2 => shift_out_4_port, B1 => n121, B2 
                           => mult_out_4_port, ZN => n34);
   U45 : NAND2_X1 port map( A1 => sum_out_27_port, A2 => n124, ZN => n52);
   U44 : AOI22_X1 port map( A1 => n187, A2 => lu_out_27_port, B1 => n123, B2 =>
                           IN2(27), ZN => n53);
   U43 : AOI22_X1 port map( A1 => n122, A2 => shift_out_27_port, B1 => n121, B2
                           => mult_out_27_port, ZN => n54);
   U21 : NAND2_X1 port map( A1 => sum_out_5_port, A2 => n124, ZN => n29);
   U19 : AOI22_X1 port map( A1 => n122, A2 => shift_out_5_port, B1 => n121, B2 
                           => mult_out_5_port, ZN => n31);
   U90 : NAND2_X1 port map( A1 => sum_out_13_port, A2 => n124, ZN => n97);
   U88 : AOI22_X1 port map( A1 => n122, A2 => shift_out_13_port, B1 => n121, B2
                           => mult_out_13_port, ZN => n99);
   U9 : NAND2_X1 port map( A1 => sum_out_9_port, A2 => n124, ZN => n12);
   U7 : AOI22_X1 port map( A1 => n122, A2 => shift_out_9_port, B1 => n121, B2 
                           => mult_out_9_port, ZN => n14);
   U15 : NAND2_X1 port map( A1 => sum_out_7_port, A2 => n124, ZN => n23);
   U13 : AOI22_X1 port map( A1 => n122, A2 => shift_out_7_port, B1 => n121, B2 
                           => mult_out_7_port, ZN => n25);
   U87 : NAND2_X1 port map( A1 => sum_out_14_port, A2 => n124, ZN => n94);
   U85 : AOI22_X1 port map( A1 => n122, A2 => shift_out_14_port, B1 => n121, B2
                           => mult_out_14_port, ZN => n96);
   U73 : AOI22_X1 port map( A1 => n122, A2 => shift_out_18_port, B1 => n16, B2 
                           => mult_out_18_port, ZN => n84);
   U55 : AOI22_X1 port map( A1 => n122, A2 => shift_out_23_port, B1 => n121, B2
                           => mult_out_23_port, ZN => n66);
   U46 : AOI22_X1 port map( A1 => n122, A2 => shift_out_26_port, B1 => n16, B2 
                           => mult_out_26_port, ZN => n57);
   U38 : AOI22_X1 port map( A1 => n187, A2 => lu_out_29_port, B1 => n123, B2 =>
                           IN2(29), ZN => n47);
   U37 : AOI22_X1 port map( A1 => n122, A2 => shift_out_29_port, B1 => n121, B2
                           => mult_out_29_port, ZN => n48);
   U36 : NAND2_X1 port map( A1 => sum_out_2_port, A2 => n124, ZN => n43);
   U35 : AOI22_X1 port map( A1 => n187, A2 => lu_out_2_port, B1 => n123, B2 => 
                           n186, ZN => n44);
   U34 : AOI22_X1 port map( A1 => n122, A2 => shift_out_2_port, B1 => n121, B2 
                           => mult_out_2_port, ZN => n45);
   U69 : NAND2_X1 port map( A1 => sum_out_1_port, A2 => n124, ZN => n76);
   U67 : AOI22_X1 port map( A1 => n122, A2 => shift_out_1_port, B1 => n121, B2 
                           => mult_out_1_port, ZN => n78);
   U32 : AOI22_X1 port map( A1 => n187, A2 => lu_out_30_port, B1 => n123, B2 =>
                           IN2(30), ZN => n41);
   U31 : AOI22_X1 port map( A1 => n122, A2 => shift_out_30_port, B1 => n121, B2
                           => mult_out_30_port, ZN => n42);
   U96 : NAND2_X1 port map( A1 => sum_out_11_port, A2 => n124, ZN => n103);
   U94 : AOI22_X1 port map( A1 => n122, A2 => shift_out_11_port, B1 => n121, B2
                           => mult_out_11_port, ZN => n105);
   U99 : NAND2_X1 port map( A1 => sum_out_10_port, A2 => n124, ZN => n106);
   U97 : AOI22_X1 port map( A1 => n122, A2 => shift_out_10_port, B1 => n121, B2
                           => mult_out_10_port, ZN => n108);
   U108 : NOR3_X1 port map( A1 => ALUW_i(12), A2 => ALUW_i(11), A3 => n115, ZN 
                           => n17);
   U166 : MUX2_X1 port map( A => IN1(1), B => A_booth_to_add_1_port, S => 
                           ALUW_i(1), Z => mux_A_1_port);
   U168 : MUX2_X1 port map( A => IN1(18), B => A_booth_to_add_18_port, S => 
                           ALUW_i(1), Z => mux_A_18_port);
   U173 : MUX2_X1 port map( A => IN1(13), B => A_booth_to_add_13_port, S => 
                           ALUW_i(1), Z => mux_A_13_port);
   U176 : MUX2_X1 port map( A => IN1(10), B => A_booth_to_add_10_port, S => 
                           ALUW_i(1), Z => mux_A_10_port);
   U149 : MUX2_X1 port map( A => IN1(6), B => A_booth_to_add_6_port, S => 
                           ALUW_i(1), Z => mux_A_6_port);
   U5 : INV_X1 port map( A => IN2(31), ZN => n10);
   U4 : INV_X1 port map( A => IN1(31), ZN => n11);
   U111 : INV_X1 port map( A => ALUW_i(10), ZN => n115);
   U105 : INV_X1 port map( A => ALUW_i(12), ZN => n112);
   U2 : NAND2_X1 port map( A1 => ALUW_i(1), A2 => B_booth_to_add_3_port, ZN => 
                           n109);
   U3 : NAND2_X1 port map( A1 => n132, A2 => n109, ZN => mux_B_3_port);
   U6 : AOI22_X1 port map( A1 => ALUW_i(1), A2 => B_booth_to_add_8_port, B1 => 
                           n127, B2 => IN2(8), ZN => n110);
   U8 : INV_X1 port map( A => n110, ZN => mux_B_8_port);
   U11 : INV_X1 port map( A => ALUW_i(1), ZN => n111);
   U14 : NOR2_X1 port map( A1 => valid_from_booth, A2 => n111, ZN => stall_o);
   U17 : AOI22_X1 port map( A1 => ALUW_i(1), A2 => B_booth_to_add_29_port, B1 
                           => n127, B2 => IN2(29), ZN => n114);
   U20 : INV_X1 port map( A => n114, ZN => mux_B_29_port);
   U26 : INV_X1 port map( A => ALUW_i(11), ZN => n116);
   U30 : NOR3_X1 port map( A1 => ALUW_i(12), A2 => n115, A3 => n116, ZN => n143
                           );
   U33 : AOI22_X1 port map( A1 => A_booth_to_add_2_port, A2 => ALUW_i(1), B1 =>
                           n127, B2 => IN1(2), ZN => n117);
   U39 : INV_X1 port map( A => n117, ZN => mux_A_2_port);
   U47 : AOI222_X1 port map( A1 => sum_out_0_port, A2 => n124, B1 => n184, B2 
                           => n123, C1 => n17, C2 => lu_out_0_port, ZN => n118)
                           ;
   U48 : INV_X1 port map( A => n118, ZN => n119);
   U51 : AOI21_X1 port map( B1 => n121, B2 => mult_out_0_port, A => n119, ZN =>
                           n141);
   U54 : CLKBUF_X1 port map( A => sum_out_20_port, Z => n179);
   U56 : INV_X2 port map( A => ALUW_i(1), ZN => n127);
   U57 : BUF_X1 port map( A => sum_out_21_port, Z => n174);
   U60 : BUF_X1 port map( A => IN2(1), Z => n181);
   U62 : MUX2_X1 port map( A => IN1(0), B => A_booth_to_add_0_port, S => 
                           ALUW_i(1), Z => mux_A_0_port);
   U63 : BUF_X2 port map( A => n16, Z => n121);
   U66 : BUF_X2 port map( A => n18, Z => n123);
   U68 : BUF_X2 port map( A => n19, Z => n124);
   U71 : BUF_X1 port map( A => IN2(2), Z => n186);
   U72 : BUF_X1 port map( A => IN2(15), Z => n177);
   U74 : MUX2_X1 port map( A => IN1(5), B => A_booth_to_add_5_port, S => 
                           ALUW_i(1), Z => mux_A_5_port);
   U75 : BUF_X2 port map( A => n17, Z => n187);
   U77 : BUF_X2 port map( A => n15, Z => n122);
   U81 : BUF_X1 port map( A => IN2(4), Z => n178);
   U83 : NAND2_X1 port map( A1 => n139, A2 => n140, ZN => mux_B_0_port);
   U86 : NAND2_X1 port map( A1 => n144, A2 => n145, ZN => DOUT(0));
   U89 : NAND2_X1 port map( A1 => IN2(4), A2 => n127, ZN => n125);
   U92 : NAND2_X1 port map( A1 => n125, A2 => n126, ZN => mux_B_4_port);
   U93 : NAND2_X1 port map( A1 => B_booth_to_add_4_port, A2 => ALUW_i(1), ZN =>
                           n126);
   U95 : NAND2_X1 port map( A1 => B_booth_to_add_20_port, A2 => ALUW_i(1), ZN 
                           => n129);
   U98 : NAND2_X1 port map( A1 => IN2(20), A2 => n127, ZN => n128);
   U100 : NAND2_X1 port map( A1 => n128, A2 => n129, ZN => mux_B_20_port);
   U101 : NAND2_X1 port map( A1 => B_booth_to_add_7_port, A2 => ALUW_i(1), ZN 
                           => n130);
   U102 : NAND2_X1 port map( A1 => n131, A2 => n130, ZN => mux_B_7_port);
   U103 : NAND2_X1 port map( A1 => IN2(7), A2 => n127, ZN => n131);
   U104 : NAND2_X1 port map( A1 => IN2(3), A2 => n127, ZN => n132);
   U106 : NAND2_X1 port map( A1 => B_booth_to_add_9_port, A2 => ALUW_i(1), ZN 
                           => n133);
   U107 : NAND2_X1 port map( A1 => n134, A2 => n133, ZN => mux_B_9_port);
   U109 : NAND2_X1 port map( A1 => IN2(9), A2 => n127, ZN => n134);
   U110 : NAND2_X1 port map( A1 => B_booth_to_add_12_port, A2 => ALUW_i(1), ZN 
                           => n136);
   U113 : NAND2_X1 port map( A1 => IN2(12), A2 => n127, ZN => n135);
   U114 : NAND2_X1 port map( A1 => n135, A2 => n136, ZN => mux_B_12_port);
   U115 : NAND2_X1 port map( A1 => B_booth_to_add_23_port, A2 => ALUW_i(1), ZN 
                           => n138);
   U116 : NAND2_X1 port map( A1 => IN2(23), A2 => n127, ZN => n137);
   U119 : NAND2_X1 port map( A1 => n137, A2 => n138, ZN => mux_B_23_port);
   U120 : NAND2_X1 port map( A1 => B_booth_to_add_0_port, A2 => ALUW_i(1), ZN 
                           => n140);
   U123 : NAND2_X1 port map( A1 => IN2(0), A2 => n127, ZN => n139);
   U124 : NAND2_X1 port map( A1 => shift_out_0_port, A2 => n15, ZN => n142);
   U130 : AND2_X1 port map( A1 => n142, A2 => n141, ZN => n145);
   U132 : NAND2_X1 port map( A1 => comp_out, A2 => n143, ZN => n144);
   U133 : NAND2_X4 port map( A1 => n156, A2 => n157, ZN => mux_sign);
   U134 : CLKBUF_X1 port map( A => IN2(17), Z => n146);
   U136 : CLKBUF_X1 port map( A => IN2(10), Z => n147);
   U138 : CLKBUF_X1 port map( A => IN2(19), Z => n148);
   U139 : BUF_X1 port map( A => sum_out_25_port, Z => n149);
   U142 : BUF_X1 port map( A => sum_out_24_port, Z => n150);
   U144 : CLKBUF_X1 port map( A => IN2(11), Z => n175);
   U145 : CLKBUF_X1 port map( A => IN2(7), Z => n171);
   U150 : CLKBUF_X1 port map( A => IN2(9), Z => n176);
   U155 : CLKBUF_X1 port map( A => IN2(5), Z => n183);
   U177 : CLKBUF_X1 port map( A => IN2(12), Z => n170);
   U208 : CLKBUF_X1 port map( A => IN2(6), Z => n173);
   U209 : INV_X1 port map( A => n182, ZN => n185);
   U210 : CLKBUF_X1 port map( A => n9, Z => n182);
   U211 : CLKBUF_X1 port map( A => sum_out_29_port, Z => n168);
   U212 : CLKBUF_X1 port map( A => sum_out_22_port, Z => n169);
   U213 : CLKBUF_X1 port map( A => sum_out_28_port, Z => n172);
   U214 : INV_X1 port map( A => ALUW_i(11), ZN => n113);
   U215 : CLKBUF_X1 port map( A => IN2(3), Z => n180);
   U216 : CLKBUF_X1 port map( A => IN2(0), Z => n184);
   U217 : INV_X1 port map( A => sum_out_31_port, ZN => n9);
   U218 : OR2_X1 port map( A1 => ALUW_i(1), A2 => n155, ZN => n157);
   U219 : INV_X1 port map( A => ALUW_i(7), ZN => n155);
   U220 : NOR2_X1 port map( A1 => n123, A2 => n112, ZN => n16);
   U221 : NOR3_X1 port map( A1 => ALUW_i(10), A2 => ALUW_i(12), A3 => n113, ZN 
                           => n15);
   U222 : NAND2_X1 port map( A1 => ALUW_i(1), A2 => sign_booth_to_add, ZN => 
                           n156);
   U223 : NOR3_X1 port map( A1 => ALUW_i(10), A2 => ALUW_i(12), A3 => 
                           ALUW_i(11), ZN => n19);
   U224 : NOR3_X1 port map( A1 => ALUW_i(10), A2 => ALUW_i(11), A3 => n112, ZN 
                           => n18);
   U225 : NAND2_X1 port map( A1 => IN2(16), A2 => n127, ZN => n151);
   U226 : NAND2_X1 port map( A1 => n151, A2 => n152, ZN => mux_B_16_port);
   U227 : NAND2_X1 port map( A1 => B_booth_to_add_16_port, A2 => ALUW_i(1), ZN 
                           => n152);
   U228 : NAND2_X1 port map( A1 => IN2(18), A2 => n127, ZN => n153);
   U229 : NAND2_X1 port map( A1 => n153, A2 => n154, ZN => mux_B_18_port);
   U230 : NAND2_X1 port map( A1 => B_booth_to_add_18_port, A2 => ALUW_i(1), ZN 
                           => n154);
   U231 : NAND2_X1 port map( A1 => B_booth_to_add_1_port, A2 => ALUW_i(1), ZN 
                           => n159);
   U232 : NAND2_X1 port map( A1 => B_booth_to_add_2_port, A2 => ALUW_i(1), ZN 
                           => n161);
   U233 : NAND2_X1 port map( A1 => B_booth_to_add_21_port, A2 => ALUW_i(1), ZN 
                           => n165);
   U234 : NAND2_X1 port map( A1 => B_booth_to_add_15_port, A2 => ALUW_i(1), ZN 
                           => n167);
   U235 : NAND2_X1 port map( A1 => IN2(1), A2 => n127, ZN => n158);
   U236 : NAND2_X1 port map( A1 => n158, A2 => n159, ZN => mux_B_1_port);
   U237 : NAND2_X1 port map( A1 => IN2(2), A2 => n127, ZN => n160);
   U238 : NAND2_X1 port map( A1 => n160, A2 => n161, ZN => mux_B_2_port);
   U239 : NAND2_X1 port map( A1 => IN2(10), A2 => n127, ZN => n162);
   U240 : NAND2_X1 port map( A1 => n162, A2 => n163, ZN => mux_B_10_port);
   U241 : NAND2_X1 port map( A1 => B_booth_to_add_10_port, A2 => ALUW_i(1), ZN 
                           => n163);
   U242 : NAND2_X1 port map( A1 => IN2(21), A2 => n127, ZN => n164);
   U243 : NAND2_X1 port map( A1 => n164, A2 => n165, ZN => mux_B_21_port);
   U244 : NAND2_X1 port map( A1 => IN2(15), A2 => n127, ZN => n166);
   U245 : NAND2_X1 port map( A1 => n166, A2 => n167, ZN => mux_B_15_port);
   U246 : AOI22_X1 port map( A1 => n187, A2 => lu_out_18_port, B1 => n123, B2 
                           => IN2(18), ZN => n83);
   U247 : NAND2_X1 port map( A1 => n169, A2 => n124, ZN => n67);
   U248 : AOI22_X1 port map( A1 => n17, A2 => lu_out_10_port, B1 => n123, B2 =>
                           n147, ZN => n107);
   U249 : NAND2_X1 port map( A1 => sum_out_26_port, A2 => n124, ZN => n55);
   U250 : AOI22_X1 port map( A1 => n187, A2 => lu_out_21_port, B1 => n123, B2 
                           => IN2(21), ZN => n71);
   U251 : AOI22_X1 port map( A1 => n187, A2 => lu_out_26_port, B1 => n123, B2 
                           => IN2(26), ZN => n56);
   U252 : NAND2_X1 port map( A1 => n168, A2 => n124, ZN => n46);
   U253 : AOI22_X1 port map( A1 => n187, A2 => lu_out_12_port, B1 => n123, B2 
                           => n170, ZN => n101);
   U254 : NAND2_X1 port map( A1 => n179, A2 => n124, ZN => n73);
   U255 : NAND2_X1 port map( A1 => n174, A2 => n124, ZN => n70);
   U256 : NAND2_X1 port map( A1 => sum_out_12_port, A2 => n124, ZN => n100);
   U257 : AOI22_X1 port map( A1 => n187, A2 => lu_out_3_port, B1 => n123, B2 =>
                           n180, ZN => n36);
   U258 : AOI22_X1 port map( A1 => n187, A2 => lu_out_1_port, B1 => n123, B2 =>
                           n181, ZN => n77);
   U259 : AOI22_X1 port map( A1 => n187, A2 => lu_out_17_port, B1 => n123, B2 
                           => n146, ZN => n86);
   U260 : AOI22_X1 port map( A1 => n17, A2 => lu_out_14_port, B1 => n123, B2 =>
                           IN2(14), ZN => n95);
   U261 : AOI22_X1 port map( A1 => n187, A2 => lu_out_23_port, B1 => n123, B2 
                           => IN2(23), ZN => n65);
   U262 : AOI22_X1 port map( A1 => n187, A2 => lu_out_13_port, B1 => n123, B2 
                           => IN2(13), ZN => n98);
   U263 : NAND2_X1 port map( A1 => n120, A2 => n124, ZN => n79);
   U264 : AOI22_X1 port map( A1 => n187, A2 => lu_out_8_port, B1 => n123, B2 =>
                           IN2(8), ZN => n21);
   U265 : AOI22_X1 port map( A1 => n187, A2 => lu_out_6_port, B1 => n123, B2 =>
                           n173, ZN => n27);
   U266 : AOI22_X1 port map( A1 => n187, A2 => lu_out_19_port, B1 => n123, B2 
                           => n148, ZN => n80);
   U267 : NAND2_X1 port map( A1 => sum_out_16_port, A2 => n124, ZN => n88);
   U268 : NAND2_X1 port map( A1 => sum_out_18_port, A2 => n124, ZN => n82);
   U269 : AOI22_X1 port map( A1 => n187, A2 => lu_out_15_port, B1 => n123, B2 
                           => n177, ZN => n92);
   U270 : AOI22_X1 port map( A1 => n187, A2 => lu_out_11_port, B1 => n123, B2 
                           => n175, ZN => n104);
   U271 : AOI22_X1 port map( A1 => n187, A2 => lu_out_7_port, B1 => n123, B2 =>
                           n171, ZN => n24);
   U272 : NAND2_X1 port map( A1 => n149, A2 => n124, ZN => n58);
   U273 : NAND2_X1 port map( A1 => sum_out_23_port, A2 => n124, ZN => n64);
   U274 : NAND2_X1 port map( A1 => sum_out_30_port, A2 => n124, ZN => n40);
   U275 : AOI222_X1 port map( A1 => n185, A2 => n124, B1 => n122, B2 => 
                           shift_out_31_port, C1 => n121, C2 => 
                           mult_out_31_port, ZN => n38);
   U276 : AOI22_X1 port map( A1 => n187, A2 => lu_out_9_port, B1 => n123, B2 =>
                           n176, ZN => n13);
   U277 : NAND2_X1 port map( A1 => n150, A2 => n124, ZN => n61);
   U278 : AOI22_X1 port map( A1 => n187, A2 => lu_out_5_port, B1 => n123, B2 =>
                           n183, ZN => n30);

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity mux21_0 is

   port( IN0, IN1 : in std_logic_vector (31 downto 0);  CTRL : in std_logic;  
         OUT1 : out std_logic_vector (31 downto 0));

end mux21_0;

architecture SYN_Bhe of mux21_0 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X2
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   signal n4, n5, n6, n7, n8, n9, n10, n11, n12 : std_logic;

begin
   
   U5 : MUX2_X1 port map( A => IN0(5), B => IN1(5), S => CTRL, Z => OUT1(5));
   U6 : MUX2_X1 port map( A => IN0(4), B => IN1(4), S => CTRL, Z => OUT1(4));
   U8 : MUX2_X1 port map( A => IN0(31), B => IN1(31), S => CTRL, Z => OUT1(31))
                           ;
   U9 : MUX2_X1 port map( A => IN0(30), B => IN1(30), S => CTRL, Z => OUT1(30))
                           ;
   U11 : MUX2_X1 port map( A => IN0(29), B => IN1(29), S => CTRL, Z => OUT1(29)
                           );
   U13 : MUX2_X1 port map( A => IN0(27), B => IN1(27), S => CTRL, Z => OUT1(27)
                           );
   U14 : MUX2_X1 port map( A => IN0(26), B => IN1(26), S => CTRL, Z => OUT1(26)
                           );
   U15 : MUX2_X1 port map( A => IN0(25), B => IN1(25), S => CTRL, Z => OUT1(25)
                           );
   U16 : MUX2_X1 port map( A => IN0(24), B => IN1(24), S => CTRL, Z => OUT1(24)
                           );
   U20 : MUX2_X1 port map( A => IN0(20), B => IN1(20), S => CTRL, Z => OUT1(20)
                           );
   U23 : MUX2_X1 port map( A => IN0(18), B => IN1(18), S => CTRL, Z => OUT1(18)
                           );
   U1 : MUX2_X1 port map( A => IN0(16), B => IN1(16), S => CTRL, Z => OUT1(16))
                           ;
   U2 : MUX2_X1 port map( A => IN0(22), B => IN1(22), S => CTRL, Z => OUT1(22))
                           ;
   U3 : MUX2_X2 port map( A => IN0(23), B => IN1(23), S => CTRL, Z => OUT1(23))
                           ;
   U4 : MUX2_X2 port map( A => IN0(13), B => IN1(13), S => CTRL, Z => OUT1(13))
                           ;
   U7 : MUX2_X2 port map( A => IN0(14), B => IN1(14), S => CTRL, Z => OUT1(14))
                           ;
   U10 : MUX2_X1 port map( A => IN0(17), B => IN1(17), S => CTRL, Z => OUT1(17)
                           );
   U12 : MUX2_X1 port map( A => IN0(15), B => IN1(15), S => CTRL, Z => OUT1(15)
                           );
   U17 : MUX2_X1 port map( A => IN0(10), B => IN1(10), S => CTRL, Z => OUT1(10)
                           );
   U18 : MUX2_X1 port map( A => IN0(8), B => IN1(8), S => CTRL, Z => OUT1(8));
   U19 : MUX2_X1 port map( A => IN0(19), B => IN1(19), S => CTRL, Z => OUT1(19)
                           );
   U21 : INV_X1 port map( A => CTRL, ZN => n4);
   U22 : NAND2_X1 port map( A1 => n5, A2 => n6, ZN => OUT1(0));
   U24 : NAND2_X1 port map( A1 => CTRL, A2 => IN1(0), ZN => n6);
   U25 : NAND2_X1 port map( A1 => IN0(0), A2 => n4, ZN => n5);
   U26 : NAND2_X1 port map( A1 => IN0(3), A2 => n4, ZN => n7);
   U27 : NAND2_X1 port map( A1 => CTRL, A2 => IN1(3), ZN => n8);
   U28 : NAND2_X1 port map( A1 => n7, A2 => n8, ZN => OUT1(3));
   U29 : NAND2_X1 port map( A1 => n9, A2 => n10, ZN => OUT1(2));
   U30 : MUX2_X1 port map( A => IN0(28), B => IN1(28), S => CTRL, Z => OUT1(28)
                           );
   U31 : MUX2_X1 port map( A => IN0(21), B => IN1(21), S => CTRL, Z => OUT1(21)
                           );
   U32 : NAND2_X1 port map( A1 => CTRL, A2 => IN1(2), ZN => n10);
   U33 : NAND2_X1 port map( A1 => IN0(2), A2 => n4, ZN => n9);
   U34 : MUX2_X1 port map( A => IN0(12), B => IN1(12), S => CTRL, Z => OUT1(12)
                           );
   U35 : MUX2_X1 port map( A => IN0(7), B => IN1(7), S => CTRL, Z => OUT1(7));
   U36 : NAND2_X1 port map( A1 => n11, A2 => n12, ZN => OUT1(6));
   U37 : MUX2_X1 port map( A => IN0(11), B => IN1(11), S => CTRL, Z => OUT1(11)
                           );
   U38 : MUX2_X1 port map( A => IN0(9), B => IN1(9), S => CTRL, Z => OUT1(9));
   U39 : NAND2_X1 port map( A1 => IN0(6), A2 => n4, ZN => n11);
   U40 : NAND2_X1 port map( A1 => IN1(6), A2 => CTRL, ZN => n12);
   U41 : MUX2_X1 port map( A => IN0(1), B => IN1(1), S => CTRL, Z => OUT1(1));

end SYN_Bhe;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_execute_block.all;

entity execute_block is

   port( IMM_i, A_i : in std_logic_vector (31 downto 0);  rB_i, rC_i : in 
         std_logic_vector (4 downto 0);  MUXED_B_i : in std_logic_vector (31 
         downto 0);  S_MUX_ALUIN_i : in std_logic;  FW_X_i, FW_W_i : in 
         std_logic_vector (31 downto 0);  S_FW_A_i, S_FW_B_i : in 
         std_logic_vector (1 downto 0);  muxed_dest : out std_logic_vector (4 
         downto 0);  muxed_B : out std_logic_vector (31 downto 0);  
         S_MUX_DEST_i : in std_logic_vector (1 downto 0);  OP : in aluOp;  
         ALUW_i : in std_logic_vector (12 downto 0);  DOUT : out 
         std_logic_vector (31 downto 0);  stall_o : out std_logic;  Clock, 
         Reset : in std_logic);

end execute_block;

architecture SYN_struct of execute_block is

   component mux41_MUX_SIZE32_1
      port( IN0, IN1, IN2, IN3 : in std_logic_vector (31 downto 0);  CTRL : in 
            std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 
            downto 0));
   end component;
   
   component mux41_MUX_SIZE32_0
      port( IN0, IN1, IN2, IN3 : in std_logic_vector (31 downto 0);  CTRL : in 
            std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (31 
            downto 0));
   end component;
   
   component mux41_MUX_SIZE5
      port( IN0, IN1, IN2, IN3 : in std_logic_vector (4 downto 0);  CTRL : in 
            std_logic_vector (1 downto 0);  OUT1 : out std_logic_vector (4 
            downto 0));
   end component;
   
   component real_alu_DATA_SIZE32
      port( IN1, IN2 : in std_logic_vector (31 downto 0);  ALUW_i : in 
            std_logic_vector (12 downto 0);  DOUT : out std_logic_vector (31 
            downto 0);  stall_o : out std_logic;  Clock, Reset : in std_logic);
   end component;
   
   component mux21_0
      port( IN0, IN1 : in std_logic_vector (31 downto 0);  CTRL : in std_logic;
            OUT1 : out std_logic_vector (31 downto 0));
   end component;
   
   signal X_Logic1_port, X_Logic0_port, muxed_B_31_port, muxed_B_30_port, 
      muxed_B_29_port, muxed_B_28_port, muxed_B_27_port, muxed_B_25_port, 
      muxed_B_24_port, muxed_B_23_port, muxed_B_22_port, muxed_B_21_port, 
      muxed_B_20_port, muxed_B_19_port, muxed_B_18_port, muxed_B_16_port, 
      muxed_B_14_port, muxed_B_13_port, muxed_B_12_port, muxed_B_11_port, 
      muxed_B_10_port, muxed_B_9_port, muxed_B_8_port, muxed_B_7_port, 
      muxed_B_6_port, muxed_B_5_port, muxed_B_4_port, muxed_B_3_port, 
      muxed_B_2_port, muxed_B_1_port, muxed_B_0_port, FWB2alu_31_port, 
      FWB2alu_30_port, FWB2alu_29_port, FWB2alu_28_port, FWB2alu_27_port, 
      FWB2alu_26_port, FWB2alu_25_port, FWB2alu_24_port, FWB2alu_23_port, 
      FWB2alu_22_port, FWB2alu_21_port, FWB2alu_20_port, FWB2alu_19_port, 
      FWB2alu_18_port, FWB2alu_17_port, FWB2alu_16_port, FWB2alu_15_port, 
      FWB2alu_14_port, FWB2alu_13_port, FWB2alu_12_port, FWB2alu_11_port, 
      FWB2alu_10_port, FWB2alu_9_port, FWB2alu_8_port, FWB2alu_7_port, 
      FWB2alu_6_port, FWB2alu_5_port, FWB2alu_4_port, FWB2alu_3_port, 
      FWB2alu_2_port, FWB2alu_1_port, FWB2alu_0_port, FWA2alu_31_port, 
      FWA2alu_30_port, FWA2alu_29_port, FWA2alu_28_port, FWA2alu_27_port, 
      FWA2alu_26_port, FWA2alu_25_port, FWA2alu_24_port, FWA2alu_23_port, 
      FWA2alu_22_port, FWA2alu_21_port, FWA2alu_20_port, FWA2alu_19_port, 
      FWA2alu_18_port, FWA2alu_17_port, FWA2alu_16_port, FWA2alu_15_port, 
      FWA2alu_14_port, FWA2alu_13_port, FWA2alu_12_port, FWA2alu_11_port, 
      FWA2alu_10_port, FWA2alu_9_port, FWA2alu_8_port, FWA2alu_7_port, 
      FWA2alu_6_port, FWA2alu_5_port, FWA2alu_4_port, FWA2alu_3_port, 
      FWA2alu_2_port, FWA2alu_1_port, FWA2alu_0_port, net536481, net536482, 
      net536483, net536484, net536485, n1, muxed_B_15_port, muxed_B_17_port, 
      muxed_B_26_port : std_logic;

begin
   muxed_B <= ( muxed_B_31_port, muxed_B_30_port, muxed_B_29_port, 
      muxed_B_28_port, muxed_B_27_port, muxed_B_26_port, muxed_B_25_port, 
      muxed_B_24_port, muxed_B_23_port, muxed_B_22_port, muxed_B_21_port, 
      muxed_B_20_port, muxed_B_19_port, muxed_B_18_port, muxed_B_17_port, 
      muxed_B_16_port, muxed_B_15_port, muxed_B_14_port, muxed_B_13_port, 
      muxed_B_12_port, muxed_B_11_port, muxed_B_10_port, muxed_B_9_port, 
      muxed_B_8_port, muxed_B_7_port, muxed_B_6_port, muxed_B_5_port, 
      muxed_B_4_port, muxed_B_3_port, muxed_B_2_port, muxed_B_1_port, 
      muxed_B_0_port );
   (net536481, net536482, net536483, net536484, net536485) <= 
      aluOp_to_std_logic_vector(OP);
   
   X_Logic1_port <= '1';
   X_Logic0_port <= '0';
   n1 <= '0';
   ALUIN_MUX : mux21_0 port map( IN0(31) => muxed_B_31_port, IN0(30) => 
                           muxed_B_30_port, IN0(29) => muxed_B_29_port, IN0(28)
                           => muxed_B_28_port, IN0(27) => muxed_B_27_port, 
                           IN0(26) => muxed_B_26_port, IN0(25) => 
                           muxed_B_25_port, IN0(24) => muxed_B_24_port, IN0(23)
                           => muxed_B_23_port, IN0(22) => muxed_B_22_port, 
                           IN0(21) => muxed_B_21_port, IN0(20) => 
                           muxed_B_20_port, IN0(19) => muxed_B_19_port, IN0(18)
                           => muxed_B_18_port, IN0(17) => muxed_B_17_port, 
                           IN0(16) => muxed_B_16_port, IN0(15) => 
                           muxed_B_15_port, IN0(14) => muxed_B_14_port, IN0(13)
                           => muxed_B_13_port, IN0(12) => muxed_B_12_port, 
                           IN0(11) => muxed_B_11_port, IN0(10) => 
                           muxed_B_10_port, IN0(9) => muxed_B_9_port, IN0(8) =>
                           muxed_B_8_port, IN0(7) => muxed_B_7_port, IN0(6) => 
                           muxed_B_6_port, IN0(5) => muxed_B_5_port, IN0(4) => 
                           muxed_B_4_port, IN0(3) => muxed_B_3_port, IN0(2) => 
                           muxed_B_2_port, IN0(1) => muxed_B_1_port, IN0(0) => 
                           muxed_B_0_port, IN1(31) => IMM_i(31), IN1(30) => 
                           IMM_i(30), IN1(29) => IMM_i(29), IN1(28) => 
                           IMM_i(28), IN1(27) => IMM_i(27), IN1(26) => 
                           IMM_i(26), IN1(25) => IMM_i(25), IN1(24) => 
                           IMM_i(24), IN1(23) => IMM_i(23), IN1(22) => 
                           IMM_i(22), IN1(21) => IMM_i(21), IN1(20) => 
                           IMM_i(20), IN1(19) => IMM_i(19), IN1(18) => 
                           IMM_i(18), IN1(17) => IMM_i(17), IN1(16) => 
                           IMM_i(16), IN1(15) => IMM_i(15), IN1(14) => 
                           IMM_i(14), IN1(13) => IMM_i(13), IN1(12) => 
                           IMM_i(12), IN1(11) => IMM_i(11), IN1(10) => 
                           IMM_i(10), IN1(9) => IMM_i(9), IN1(8) => IMM_i(8), 
                           IN1(7) => IMM_i(7), IN1(6) => IMM_i(6), IN1(5) => 
                           IMM_i(5), IN1(4) => IMM_i(4), IN1(3) => IMM_i(3), 
                           IN1(2) => IMM_i(2), IN1(1) => IMM_i(1), IN1(0) => 
                           IMM_i(0), CTRL => S_MUX_ALUIN_i, OUT1(31) => 
                           FWB2alu_31_port, OUT1(30) => FWB2alu_30_port, 
                           OUT1(29) => FWB2alu_29_port, OUT1(28) => 
                           FWB2alu_28_port, OUT1(27) => FWB2alu_27_port, 
                           OUT1(26) => FWB2alu_26_port, OUT1(25) => 
                           FWB2alu_25_port, OUT1(24) => FWB2alu_24_port, 
                           OUT1(23) => FWB2alu_23_port, OUT1(22) => 
                           FWB2alu_22_port, OUT1(21) => FWB2alu_21_port, 
                           OUT1(20) => FWB2alu_20_port, OUT1(19) => 
                           FWB2alu_19_port, OUT1(18) => FWB2alu_18_port, 
                           OUT1(17) => FWB2alu_17_port, OUT1(16) => 
                           FWB2alu_16_port, OUT1(15) => FWB2alu_15_port, 
                           OUT1(14) => FWB2alu_14_port, OUT1(13) => 
                           FWB2alu_13_port, OUT1(12) => FWB2alu_12_port, 
                           OUT1(11) => FWB2alu_11_port, OUT1(10) => 
                           FWB2alu_10_port, OUT1(9) => FWB2alu_9_port, OUT1(8) 
                           => FWB2alu_8_port, OUT1(7) => FWB2alu_7_port, 
                           OUT1(6) => FWB2alu_6_port, OUT1(5) => FWB2alu_5_port
                           , OUT1(4) => FWB2alu_4_port, OUT1(3) => 
                           FWB2alu_3_port, OUT1(2) => FWB2alu_2_port, OUT1(1) 
                           => FWB2alu_1_port, OUT1(0) => FWB2alu_0_port);
   ALU : real_alu_DATA_SIZE32 port map( IN1(31) => FWA2alu_31_port, IN1(30) => 
                           FWA2alu_30_port, IN1(29) => FWA2alu_29_port, IN1(28)
                           => FWA2alu_28_port, IN1(27) => FWA2alu_27_port, 
                           IN1(26) => FWA2alu_26_port, IN1(25) => 
                           FWA2alu_25_port, IN1(24) => FWA2alu_24_port, IN1(23)
                           => FWA2alu_23_port, IN1(22) => FWA2alu_22_port, 
                           IN1(21) => FWA2alu_21_port, IN1(20) => 
                           FWA2alu_20_port, IN1(19) => FWA2alu_19_port, IN1(18)
                           => FWA2alu_18_port, IN1(17) => FWA2alu_17_port, 
                           IN1(16) => FWA2alu_16_port, IN1(15) => 
                           FWA2alu_15_port, IN1(14) => FWA2alu_14_port, IN1(13)
                           => FWA2alu_13_port, IN1(12) => FWA2alu_12_port, 
                           IN1(11) => FWA2alu_11_port, IN1(10) => 
                           FWA2alu_10_port, IN1(9) => FWA2alu_9_port, IN1(8) =>
                           FWA2alu_8_port, IN1(7) => FWA2alu_7_port, IN1(6) => 
                           FWA2alu_6_port, IN1(5) => FWA2alu_5_port, IN1(4) => 
                           FWA2alu_4_port, IN1(3) => FWA2alu_3_port, IN1(2) => 
                           FWA2alu_2_port, IN1(1) => FWA2alu_1_port, IN1(0) => 
                           FWA2alu_0_port, IN2(31) => FWB2alu_31_port, IN2(30) 
                           => FWB2alu_30_port, IN2(29) => FWB2alu_29_port, 
                           IN2(28) => FWB2alu_28_port, IN2(27) => 
                           FWB2alu_27_port, IN2(26) => FWB2alu_26_port, IN2(25)
                           => FWB2alu_25_port, IN2(24) => FWB2alu_24_port, 
                           IN2(23) => FWB2alu_23_port, IN2(22) => 
                           FWB2alu_22_port, IN2(21) => FWB2alu_21_port, IN2(20)
                           => FWB2alu_20_port, IN2(19) => FWB2alu_19_port, 
                           IN2(18) => FWB2alu_18_port, IN2(17) => 
                           FWB2alu_17_port, IN2(16) => FWB2alu_16_port, IN2(15)
                           => FWB2alu_15_port, IN2(14) => FWB2alu_14_port, 
                           IN2(13) => FWB2alu_13_port, IN2(12) => 
                           FWB2alu_12_port, IN2(11) => FWB2alu_11_port, IN2(10)
                           => FWB2alu_10_port, IN2(9) => FWB2alu_9_port, IN2(8)
                           => FWB2alu_8_port, IN2(7) => FWB2alu_7_port, IN2(6) 
                           => FWB2alu_6_port, IN2(5) => FWB2alu_5_port, IN2(4) 
                           => FWB2alu_4_port, IN2(3) => FWB2alu_3_port, IN2(2) 
                           => FWB2alu_2_port, IN2(1) => FWB2alu_1_port, IN2(0) 
                           => FWB2alu_0_port, ALUW_i(12) => ALUW_i(12), 
                           ALUW_i(11) => ALUW_i(11), ALUW_i(10) => ALUW_i(10), 
                           ALUW_i(9) => ALUW_i(9), ALUW_i(8) => ALUW_i(8), 
                           ALUW_i(7) => ALUW_i(7), ALUW_i(6) => ALUW_i(6), 
                           ALUW_i(5) => ALUW_i(5), ALUW_i(4) => ALUW_i(4), 
                           ALUW_i(3) => ALUW_i(3), ALUW_i(2) => ALUW_i(2), 
                           ALUW_i(1) => ALUW_i(1), ALUW_i(0) => ALUW_i(0), 
                           DOUT(31) => DOUT(31), DOUT(30) => DOUT(30), DOUT(29)
                           => DOUT(29), DOUT(28) => DOUT(28), DOUT(27) => 
                           DOUT(27), DOUT(26) => DOUT(26), DOUT(25) => DOUT(25)
                           , DOUT(24) => DOUT(24), DOUT(23) => DOUT(23), 
                           DOUT(22) => DOUT(22), DOUT(21) => DOUT(21), DOUT(20)
                           => DOUT(20), DOUT(19) => DOUT(19), DOUT(18) => 
                           DOUT(18), DOUT(17) => DOUT(17), DOUT(16) => DOUT(16)
                           , DOUT(15) => DOUT(15), DOUT(14) => DOUT(14), 
                           DOUT(13) => DOUT(13), DOUT(12) => DOUT(12), DOUT(11)
                           => DOUT(11), DOUT(10) => DOUT(10), DOUT(9) => 
                           DOUT(9), DOUT(8) => DOUT(8), DOUT(7) => DOUT(7), 
                           DOUT(6) => DOUT(6), DOUT(5) => DOUT(5), DOUT(4) => 
                           DOUT(4), DOUT(3) => DOUT(3), DOUT(2) => DOUT(2), 
                           DOUT(1) => DOUT(1), DOUT(0) => DOUT(0), stall_o => 
                           stall_o, Clock => Clock, Reset => Reset);
   MUXDEST : mux41_MUX_SIZE5 port map( IN0(4) => X_Logic0_port, IN0(3) => 
                           X_Logic0_port, IN0(2) => X_Logic0_port, IN0(1) => 
                           X_Logic0_port, IN0(0) => X_Logic0_port, IN1(4) => 
                           rC_i(4), IN1(3) => rC_i(3), IN1(2) => rC_i(2), 
                           IN1(1) => rC_i(1), IN1(0) => rC_i(0), IN2(4) => 
                           rB_i(4), IN2(3) => rB_i(3), IN2(2) => rB_i(2), 
                           IN2(1) => rB_i(1), IN2(0) => rB_i(0), IN3(4) => 
                           X_Logic1_port, IN3(3) => X_Logic1_port, IN3(2) => 
                           X_Logic1_port, IN3(1) => X_Logic1_port, IN3(0) => 
                           X_Logic1_port, CTRL(1) => S_MUX_DEST_i(1), CTRL(0) 
                           => S_MUX_DEST_i(0), OUT1(4) => muxed_dest(4), 
                           OUT1(3) => muxed_dest(3), OUT1(2) => muxed_dest(2), 
                           OUT1(1) => muxed_dest(1), OUT1(0) => muxed_dest(0));
   MUX_FWA : mux41_MUX_SIZE32_0 port map( IN0(31) => A_i(31), IN0(30) => 
                           A_i(30), IN0(29) => A_i(29), IN0(28) => A_i(28), 
                           IN0(27) => A_i(27), IN0(26) => A_i(26), IN0(25) => 
                           A_i(25), IN0(24) => A_i(24), IN0(23) => A_i(23), 
                           IN0(22) => A_i(22), IN0(21) => A_i(21), IN0(20) => 
                           A_i(20), IN0(19) => A_i(19), IN0(18) => A_i(18), 
                           IN0(17) => A_i(17), IN0(16) => A_i(16), IN0(15) => 
                           A_i(15), IN0(14) => A_i(14), IN0(13) => A_i(13), 
                           IN0(12) => A_i(12), IN0(11) => A_i(11), IN0(10) => 
                           A_i(10), IN0(9) => A_i(9), IN0(8) => A_i(8), IN0(7) 
                           => A_i(7), IN0(6) => A_i(6), IN0(5) => A_i(5), 
                           IN0(4) => A_i(4), IN0(3) => A_i(3), IN0(2) => A_i(2)
                           , IN0(1) => A_i(1), IN0(0) => A_i(0), IN1(31) => 
                           FW_X_i(31), IN1(30) => FW_X_i(30), IN1(29) => 
                           FW_X_i(29), IN1(28) => FW_X_i(28), IN1(27) => 
                           FW_X_i(27), IN1(26) => FW_X_i(26), IN1(25) => 
                           FW_X_i(25), IN1(24) => FW_X_i(24), IN1(23) => 
                           FW_X_i(23), IN1(22) => FW_X_i(22), IN1(21) => 
                           FW_X_i(21), IN1(20) => FW_X_i(20), IN1(19) => 
                           FW_X_i(19), IN1(18) => FW_X_i(18), IN1(17) => 
                           FW_X_i(17), IN1(16) => FW_X_i(16), IN1(15) => 
                           FW_X_i(15), IN1(14) => FW_X_i(14), IN1(13) => 
                           FW_X_i(13), IN1(12) => FW_X_i(12), IN1(11) => 
                           FW_X_i(11), IN1(10) => FW_X_i(10), IN1(9) => 
                           FW_X_i(9), IN1(8) => FW_X_i(8), IN1(7) => FW_X_i(7),
                           IN1(6) => FW_X_i(6), IN1(5) => FW_X_i(5), IN1(4) => 
                           FW_X_i(4), IN1(3) => FW_X_i(3), IN1(2) => FW_X_i(2),
                           IN1(1) => FW_X_i(1), IN1(0) => FW_X_i(0), IN2(31) =>
                           FW_W_i(31), IN2(30) => FW_W_i(30), IN2(29) => 
                           FW_W_i(29), IN2(28) => FW_W_i(28), IN2(27) => 
                           FW_W_i(27), IN2(26) => FW_W_i(26), IN2(25) => 
                           FW_W_i(25), IN2(24) => FW_W_i(24), IN2(23) => 
                           FW_W_i(23), IN2(22) => FW_W_i(22), IN2(21) => 
                           FW_W_i(21), IN2(20) => FW_W_i(20), IN2(19) => 
                           FW_W_i(19), IN2(18) => FW_W_i(18), IN2(17) => 
                           FW_W_i(17), IN2(16) => FW_W_i(16), IN2(15) => 
                           FW_W_i(15), IN2(14) => FW_W_i(14), IN2(13) => 
                           FW_W_i(13), IN2(12) => FW_W_i(12), IN2(11) => 
                           FW_W_i(11), IN2(10) => FW_W_i(10), IN2(9) => 
                           FW_W_i(9), IN2(8) => FW_W_i(8), IN2(7) => FW_W_i(7),
                           IN2(6) => FW_W_i(6), IN2(5) => FW_W_i(5), IN2(4) => 
                           FW_W_i(4), IN2(3) => FW_W_i(3), IN2(2) => FW_W_i(2),
                           IN2(1) => FW_W_i(1), IN2(0) => FW_W_i(0), IN3(31) =>
                           n1, IN3(30) => n1, IN3(29) => n1, IN3(28) => n1, 
                           IN3(27) => n1, IN3(26) => n1, IN3(25) => n1, IN3(24)
                           => n1, IN3(23) => n1, IN3(22) => n1, IN3(21) => n1, 
                           IN3(20) => n1, IN3(19) => n1, IN3(18) => n1, IN3(17)
                           => n1, IN3(16) => n1, IN3(15) => n1, IN3(14) => n1, 
                           IN3(13) => n1, IN3(12) => n1, IN3(11) => n1, IN3(10)
                           => n1, IN3(9) => n1, IN3(8) => n1, IN3(7) => n1, 
                           IN3(6) => n1, IN3(5) => n1, IN3(4) => n1, IN3(3) => 
                           n1, IN3(2) => n1, IN3(1) => n1, IN3(0) => n1, 
                           CTRL(1) => S_FW_A_i(1), CTRL(0) => S_FW_A_i(0), 
                           OUT1(31) => FWA2alu_31_port, OUT1(30) => 
                           FWA2alu_30_port, OUT1(29) => FWA2alu_29_port, 
                           OUT1(28) => FWA2alu_28_port, OUT1(27) => 
                           FWA2alu_27_port, OUT1(26) => FWA2alu_26_port, 
                           OUT1(25) => FWA2alu_25_port, OUT1(24) => 
                           FWA2alu_24_port, OUT1(23) => FWA2alu_23_port, 
                           OUT1(22) => FWA2alu_22_port, OUT1(21) => 
                           FWA2alu_21_port, OUT1(20) => FWA2alu_20_port, 
                           OUT1(19) => FWA2alu_19_port, OUT1(18) => 
                           FWA2alu_18_port, OUT1(17) => FWA2alu_17_port, 
                           OUT1(16) => FWA2alu_16_port, OUT1(15) => 
                           FWA2alu_15_port, OUT1(14) => FWA2alu_14_port, 
                           OUT1(13) => FWA2alu_13_port, OUT1(12) => 
                           FWA2alu_12_port, OUT1(11) => FWA2alu_11_port, 
                           OUT1(10) => FWA2alu_10_port, OUT1(9) => 
                           FWA2alu_9_port, OUT1(8) => FWA2alu_8_port, OUT1(7) 
                           => FWA2alu_7_port, OUT1(6) => FWA2alu_6_port, 
                           OUT1(5) => FWA2alu_5_port, OUT1(4) => FWA2alu_4_port
                           , OUT1(3) => FWA2alu_3_port, OUT1(2) => 
                           FWA2alu_2_port, OUT1(1) => FWA2alu_1_port, OUT1(0) 
                           => FWA2alu_0_port);
   MUX_FWB : mux41_MUX_SIZE32_1 port map( IN0(31) => MUXED_B_i(31), IN0(30) => 
                           MUXED_B_i(30), IN0(29) => MUXED_B_i(29), IN0(28) => 
                           MUXED_B_i(28), IN0(27) => MUXED_B_i(27), IN0(26) => 
                           MUXED_B_i(26), IN0(25) => MUXED_B_i(25), IN0(24) => 
                           MUXED_B_i(24), IN0(23) => MUXED_B_i(23), IN0(22) => 
                           MUXED_B_i(22), IN0(21) => MUXED_B_i(21), IN0(20) => 
                           MUXED_B_i(20), IN0(19) => MUXED_B_i(19), IN0(18) => 
                           MUXED_B_i(18), IN0(17) => MUXED_B_i(17), IN0(16) => 
                           MUXED_B_i(16), IN0(15) => MUXED_B_i(15), IN0(14) => 
                           MUXED_B_i(14), IN0(13) => MUXED_B_i(13), IN0(12) => 
                           MUXED_B_i(12), IN0(11) => MUXED_B_i(11), IN0(10) => 
                           MUXED_B_i(10), IN0(9) => MUXED_B_i(9), IN0(8) => 
                           MUXED_B_i(8), IN0(7) => MUXED_B_i(7), IN0(6) => 
                           MUXED_B_i(6), IN0(5) => MUXED_B_i(5), IN0(4) => 
                           MUXED_B_i(4), IN0(3) => MUXED_B_i(3), IN0(2) => 
                           MUXED_B_i(2), IN0(1) => MUXED_B_i(1), IN0(0) => 
                           MUXED_B_i(0), IN1(31) => FW_X_i(31), IN1(30) => 
                           FW_X_i(30), IN1(29) => FW_X_i(29), IN1(28) => 
                           FW_X_i(28), IN1(27) => FW_X_i(27), IN1(26) => 
                           FW_X_i(26), IN1(25) => FW_X_i(25), IN1(24) => 
                           FW_X_i(24), IN1(23) => FW_X_i(23), IN1(22) => 
                           FW_X_i(22), IN1(21) => FW_X_i(21), IN1(20) => 
                           FW_X_i(20), IN1(19) => FW_X_i(19), IN1(18) => 
                           FW_X_i(18), IN1(17) => FW_X_i(17), IN1(16) => 
                           FW_X_i(16), IN1(15) => FW_X_i(15), IN1(14) => 
                           FW_X_i(14), IN1(13) => FW_X_i(13), IN1(12) => 
                           FW_X_i(12), IN1(11) => FW_X_i(11), IN1(10) => 
                           FW_X_i(10), IN1(9) => FW_X_i(9), IN1(8) => FW_X_i(8)
                           , IN1(7) => FW_X_i(7), IN1(6) => FW_X_i(6), IN1(5) 
                           => FW_X_i(5), IN1(4) => FW_X_i(4), IN1(3) => 
                           FW_X_i(3), IN1(2) => FW_X_i(2), IN1(1) => FW_X_i(1),
                           IN1(0) => FW_X_i(0), IN2(31) => FW_W_i(31), IN2(30) 
                           => FW_W_i(30), IN2(29) => FW_W_i(29), IN2(28) => 
                           FW_W_i(28), IN2(27) => FW_W_i(27), IN2(26) => 
                           FW_W_i(26), IN2(25) => FW_W_i(25), IN2(24) => 
                           FW_W_i(24), IN2(23) => FW_W_i(23), IN2(22) => 
                           FW_W_i(22), IN2(21) => FW_W_i(21), IN2(20) => 
                           FW_W_i(20), IN2(19) => FW_W_i(19), IN2(18) => 
                           FW_W_i(18), IN2(17) => FW_W_i(17), IN2(16) => 
                           FW_W_i(16), IN2(15) => FW_W_i(15), IN2(14) => 
                           FW_W_i(14), IN2(13) => FW_W_i(13), IN2(12) => 
                           FW_W_i(12), IN2(11) => FW_W_i(11), IN2(10) => 
                           FW_W_i(10), IN2(9) => FW_W_i(9), IN2(8) => FW_W_i(8)
                           , IN2(7) => FW_W_i(7), IN2(6) => FW_W_i(6), IN2(5) 
                           => FW_W_i(5), IN2(4) => FW_W_i(4), IN2(3) => 
                           FW_W_i(3), IN2(2) => FW_W_i(2), IN2(1) => FW_W_i(1),
                           IN2(0) => FW_W_i(0), IN3(31) => n1, IN3(30) => n1, 
                           IN3(29) => n1, IN3(28) => n1, IN3(27) => n1, IN3(26)
                           => n1, IN3(25) => n1, IN3(24) => n1, IN3(23) => n1, 
                           IN3(22) => n1, IN3(21) => n1, IN3(20) => n1, IN3(19)
                           => n1, IN3(18) => n1, IN3(17) => n1, IN3(16) => n1, 
                           IN3(15) => n1, IN3(14) => n1, IN3(13) => n1, IN3(12)
                           => n1, IN3(11) => n1, IN3(10) => n1, IN3(9) => n1, 
                           IN3(8) => n1, IN3(7) => n1, IN3(6) => n1, IN3(5) => 
                           n1, IN3(4) => n1, IN3(3) => n1, IN3(2) => n1, IN3(1)
                           => n1, IN3(0) => n1, CTRL(1) => S_FW_B_i(1), CTRL(0)
                           => S_FW_B_i(0), OUT1(31) => muxed_B_31_port, 
                           OUT1(30) => muxed_B_30_port, OUT1(29) => 
                           muxed_B_29_port, OUT1(28) => muxed_B_28_port, 
                           OUT1(27) => muxed_B_27_port, OUT1(26) => 
                           muxed_B_26_port, OUT1(25) => muxed_B_25_port, 
                           OUT1(24) => muxed_B_24_port, OUT1(23) => 
                           muxed_B_23_port, OUT1(22) => muxed_B_22_port, 
                           OUT1(21) => muxed_B_21_port, OUT1(20) => 
                           muxed_B_20_port, OUT1(19) => muxed_B_19_port, 
                           OUT1(18) => muxed_B_18_port, OUT1(17) => 
                           muxed_B_17_port, OUT1(16) => muxed_B_16_port, 
                           OUT1(15) => muxed_B_15_port, OUT1(14) => 
                           muxed_B_14_port, OUT1(13) => muxed_B_13_port, 
                           OUT1(12) => muxed_B_12_port, OUT1(11) => 
                           muxed_B_11_port, OUT1(10) => muxed_B_10_port, 
                           OUT1(9) => muxed_B_9_port, OUT1(8) => muxed_B_8_port
                           , OUT1(7) => muxed_B_7_port, OUT1(6) => 
                           muxed_B_6_port, OUT1(5) => muxed_B_5_port, OUT1(4) 
                           => muxed_B_4_port, OUT1(3) => muxed_B_3_port, 
                           OUT1(2) => muxed_B_2_port, OUT1(1) => muxed_B_1_port
                           , OUT1(0) => muxed_B_0_port);

end SYN_struct;
