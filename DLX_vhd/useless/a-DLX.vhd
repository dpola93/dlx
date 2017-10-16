library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity DLX is
  generic (
    IR_SIZE      : integer := 32;       -- Instruction Register Size
    PC_SIZE      : integer := 32       -- Program Counter Size
    );       -- ALU_OPC_SIZE if explicit ALU Op Code Word Size
  port (
    Clk : in std_logic;
    Rst : in std_logic);                -- Active Low
end DLX;


-- This architecture is currently not complete
-- it just includes:
-- instruction register (complete)
-- program counter (complete)
-- instruction ram memory (complete)
-- control unit (UNCOMPLETE)
--
architecture dlx_rtl of DLX is

 --------------------------------------------------------------------
 -- Components Declaration
 --------------------------------------------------------------------
  
  --Instruction Ram
  component IRAM
--     generic (
--       RAM_DEPTH : integer;
--       I_SIZE    : integer);
    port (
      Rst  : in  std_logic;
      Addr : in  std_logic_vector(PC_SIZE - 1 downto 0);
      Dout : out std_logic_vector(IR_SIZE - 1 downto 0));
  end component;

  -- Data Ram (MISSING!You must include it in your final project!)

  -- Datapath (MISSING!You must include it in your final project!)
  
  -- REGISTER FILE
  component dlx_regfile
  generic(
    databit            : integer := 32;
    addrbit            : integer := 5
    );
  port(
    Clk  		: in std_logic;
    Rst                 : in std_logic;
    ENABLE              : in std_logic;
    RD1		        : in std_logic;
    RD2		        : in std_logic;
    WR		        : in std_logic;
    ADD_WR	        : in std_logic_vector(addrbit-1 downto 0);
    ADD_RD1             : in std_logic_vector(addrbit-1 downto 0);
    ADD_RD2             : in std_logic_vector(addrbit-1 downto 0);
    DATAIN              : in std_logic_vector(databit-1 downto 0);
    OUT1                : out std_logic_vector(databit-1 downto 0);
    OUT2                : out std_logic_vector(databit-1 downto 0)
    );
end component;




  -- Control Unit
  component dlx_cu
  generic (
    MICROCODE_MEM_SIZE :     integer := 64;  -- Microcode Memory Size
    FUNC_SIZE          :     integer := 11;  -- Func Field Size for R-Type Ops
    OP_CODE_SIZE       :     integer := 6;  -- Op Code Size
    -- ALU_OPC_SIZE       :     integer := 6;  -- ALU Op Code Word Size
    IR_SIZE            :     integer := 32;  -- Instruction Register Size    
    CW_SIZE            :     integer := 28);  -- Control Word Size
  port (
    Clk                : in  std_logic;  -- Clock
    Rst                : in  std_logic;  -- Reset:Active-Low
    -- Instruction Register
    IR_IN              : in  std_logic_vector(IR_SIZE - 1 downto 0);
    
    --LATCH ENABLES
    IR_LATCH_EN : out std_logic;
    PC_LATCH_EN : out std_logic;  
    NPC_F_LATCH_EN : out std_logic;  

    JUMP_D_LATCH_EN : out std_logic;   
    NPC_D_LATCH_EN : out std_logic;  
    A_LATCH_EN : out std_logic;  
    B_LATCH_EN : out std_logic;   
    IMM_LATCH_EN : out std_logic;  
    RD_D_LATCH_EN : out std_logic;
   
    ALUOUT_LATCH_EN : out std_logic;    
    B_E_LATCH_EN : out std_logic;  
    PC8_E_LATCH_EN : out std_logic;  
    RD_E_LATCH_EN : out std_logic;  
  
    OUT_M_LATCH_EN : out std_logic;   
    RD_M_LATCH_EN : out std_logic;
  
--MULTIPLEXERS
    Sel_PC_D : out std_logic;
    Sel_JUMP : out std_logic;
    Sel_RD : out std_logic_vector(1 downto 0);
    Sel_ALU2 : out std_logic;
    Sel_OUT : out std_logic_vector(1 downto 0);
    Sel_ext_26_16 : out std_logic;    
    Sel_ext_sign_unsign : out std_logic;

-- OTHERS
    branch : out std_logic;
    is_jump : out std_logic;

    RF_WE : out std_logic;
    RF_RD1 : out std_logic;
    RF_RD2 : out std_logic;
    DMEM_WE : out std_logic;
    DMEM_RE : out std_logic;
    ALU_OPCODE : out aluOp

);

  end component;

component fakealu   
generic (
    DATA_SIZE : integer := 32);
  port (
    IN1 : in  std_logic_vector(DATA_SIZE - 1 downto 0);
    IN2 : in  std_logic_vector(DATA_SIZE - 1 downto 0);
    OP : in AluOp;
    DOUT : out std_logic_vector(DATA_SIZE - 1 downto 0);
    ZEROUT : out std_logic
    );
end component;

component ext_16_32
  generic (
    IN_SIZE : integer := 16;
    OUT_SIZE : integer := 32
);
  port (
    IN1 : in  std_logic_vector(IN_SIZE - 1 downto 0);
    CTRL: in std_logic; -- when 0 sign extend , when 1 unsigned extend
    OUT1 : out  std_logic_vector(OUT_SIZE - 1 downto 0)

    );
end component;

component sign_ext_16_26_32
  generic (
    IN_SIZE : integer := 26;
    SHRINK_SIZE : integer := 16;
    OUT_SIZE : integer := 32
);
  port (
    IN1 : in  std_logic_vector(IN_SIZE - 1 downto 0);
    CTRL: in std_logic; -- when 0 extend 16 bits, when 1 extend 26 bits
    OUT1 : out  std_logic_vector(OUT_SIZE - 1 downto 0)

    );
end component;

  ----------------------------------------------------------------
  -- Signals Declaration
  ----------------------------------------------------------------
  
  -- Instruction Register (IR) and Program Counter (PC) declaration
  signal IR : std_logic_vector(IR_SIZE - 1 downto 0);
  signal PC : std_logic_vector(PC_SIZE - 1 downto 0);

  -- Instruction Ram Bus signals
  signal IRam_DOut : std_logic_vector(IR_SIZE - 1 downto 0);

  -- Datapath Bus signals
  signal PC_BUS : std_logic_vector(PC_SIZE -1 downto 0);


  signal RF_WE_i : std_logic;
  signal RF_RD1_i : std_logic;
  signal RF_RD2_i : std_logic;
  --signal RF_RD1_i : std_logic;
  signal DMEM_RE_i : std_logic;
  signal DMEM_WE_i : std_logic;



  -- Data Ram Bus signals
  -- REGFILE SIGNALS

  signal PC4 : std_logic_vector(31 downto 0);
  signal NPC_F : std_logic_vector(31 downto 0);

  signal prop_A : std_logic_vector(31 downto 0);
  signal prop_B : std_logic_vector(31 downto 0);

  signal NPC_D : std_logic_vector(31 downto 0);
  signal A : std_logic_vector(31 downto 0);
  signal B : std_logic_vector(31 downto 0);
  signal RD_D : std_logic_vector(4 downto 0);
  signal IMM : std_logic_vector(31 downto 0);

  signal ALU_IN_2 : std_logic_vector(31 downto 0);
  signal muxed_NPC : std_logic_vector(31 downto 0);
  signal PC8 : std_logic_vector(31 downto 0);
  signal muxed_RD : std_logic_vector(4 downto 0);
  signal prop_ZERO : std_logic;
  signal prop_ALUOUT : std_logic_vector(31 downto 0);

  signal JUMP_D : std_logic_vector(31 downto 0);
  signal JUMP_E : std_logic_vector(31 downto 0);
  signal ZERO : std_logic;
  signal ALUOUT : std_logic_vector(31 downto 0);
  signal B_E : std_logic_vector(31 downto 0);
  signal PC8_E : std_logic_vector(31 downto 0);
  signal RD_E : std_logic_vector(4 downto 0);

  signal branch_i : std_logic := '0';
  signal is_jump_i : std_logic;
  signal branch_taken : std_logic;
  signal prop_DMEMOUT : std_logic_vector(31 downto 0);

  signal OUT_M : std_logic_vector(31 downto 0);
  signal RD_M : std_logic_vector(4 downto 0);
  
  signal muxed_OUT : std_logic_vector(31 downto 0);

  signal muxed_BRANCH: std_logic_vector(31 downto 0);
  signal calc_NPC: std_logic_vector(31 downto 0);
  signal ext_26_16_out: std_logic_vector(31 downto 0);
  signal ext_sign_unsign_out: std_logic_vector(31 downto 0);
  

--LATCH ENABLES
  signal IR_LATCH_EN_i : std_logic := '1';
  signal PC_LATCH_EN_i : std_logic := '1';  
  signal NPC_F_LATCH_EN_i : std_logic := '1';  

  signal JUMP_D_LATCH_EN_i : std_logic;  
  signal NPC_D_LATCH_EN_i : std_logic;  
  signal A_LATCH_EN_i : std_logic;  
  signal B_LATCH_EN_i : std_logic;  
  signal IMM_LATCH_EN_i : std_logic;  
  signal RD_D_LATCH_EN_i : std_logic;  
  
  signal JUMP_E_LATCH_EN_i : std_logic;  
  signal ZERO_LATCH_EN_i : std_logic;
  signal ALUOUT_LATCH_EN_i : std_logic;  
  signal B_E_LATCH_EN_i : std_logic;  
  signal PC8_E_LATCH_EN_i : std_logic;  
  signal RD_E_LATCH_EN_i : std_logic;  

  signal OUT_M_LATCH_EN_i : std_logic;  
  signal RD_M_LATCH_EN_i : std_logic;
  
--MULTIPLEXERS
  signal Sel_PC_D_i : std_logic;
  signal Sel_PC_E : std_logic;
--  signal Sel_PC_M_i : std_logic;
  signal Sel_JUMP_i : std_logic;
  signal Sel_RD_i : std_logic_vector(1 downto 0);
  signal Sel_ALU2_i : std_logic;
  signal Sel_OUT_i : std_logic_vector(1 downto 0);
  signal Sel_ext_26_16_i  : std_logic;
  signal Sel_ext_sign_unsign_i  : std_logic;

--
  signal ALU_OPCODE_i : AluOp;

  begin  -- DLX

    -- This is the input to program counter: currently zero 
    -- so no uptade of PC happens
    -- TO BE REMOVED AS SOON AS THE DATAPATH IS INSERTED!!!!!
    -- a proper connection must be made here if more than one
    -- instruction must be executed
    --PC_BUS <= (others => '0'); -- PC BUS IS AT THE OUTPUT OF THE PC_MUX CONTROLLED BY A SIGNAL DRIVEN BY CU AND RESULT OF BRANCH OPERATION
    
    PC_BUS <=  muxed_BRANCH when Sel_PC_D_i = '0' else calc_NPC ;
    muxed_BRANCH <= PC4 when Sel_PC_E = '0' else muxed_NPC ;
    calc_NPC <= std_logic_vector(unsigned(ext_26_16_out) + unsigned(NPC_F));
    PC4 <= std_logic_vector(unsigned(PC) + to_unsigned(4,32));

    muxed_NPC <= JUMP_D when Sel_JUMP_i = '0' else A ;  
    ALU_IN_2 <= B when Sel_ALU2_i = '0' else IMM;
    PC8 <= std_logic_vector(unsigned(NPC_D) + to_unsigned(4,32));
    muxed_RD <= IR(20 downto 16) when Sel_RD_i = "00" else "11111" when Sel_RD_i = "01" else IR(15 downto 11);
    branch_taken <= branch_i and prop_ZERO;
    muxed_OUT <= prop_DMEMOUT when Sel_OUT_i = "00" else ALUOUT when Sel_OUT_i = "01" else PC8_E;
    Sel_PC_E <= branch_taken or is_jump_i;

-- ***** STAGE 1 ********
    -- purpose: Instruction Register Process
    -- type   : sequential
    -- inputs : Clk, Rst, IRam_DOut, IR_LATCH_EN_i
    -- outputs: IR_IN_i
    IR_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        IR <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (IR_LATCH_EN_i = '1') then
          IR <= IRam_DOut;
        end if;
      end if;
    end process IR_P;

    -- purpose: NPC4_L1 Process
    -- type   : sequential
    -- inputs : Clk, Rst, PC+4, **SIGNAL FROM CU **
    -- outputs: IR_IN_i
    NPC_F_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        NPC_F <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (NPC_F_LATCH_EN_i = '1') then
          NPC_F <= PC4;
        end if;
      end if;
    end process NPC_F_P;

--***** STAGE 0 ******
    -- purpose: Program Counter Process
    -- type   : sequential
    -- inputs : Clk, Rst, PC_BUS
    -- outputs: IRam_Addr
    PC_P: process (Clk, Rst)
    begin  -- process PC_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        PC <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (PC_LATCH_EN_i = '1') then
          PC <= PC_BUS;
        end if;
      end if;
    end process PC_P;

-- ***** STAGE 2 ********

    JUMP_D_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        JUMP_D <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (JUMP_D_LATCH_EN_i = '1') then
          JUMP_D <= calc_NPC;
        end if;
      end if;
    end process JUMP_D_P;

    NPC_D_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        NPC_D <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (NPC_D_LATCH_EN_i = '1') then
          NPC_D <= NPC_F;
        end if;
      end if;
    end process NPC_D_P;

    A_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        A <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (A_LATCH_EN_i = '1') then
          A <= prop_A;
        end if;
      end if;
    end process A_P;

    B_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        B <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (B_LATCH_EN_i = '1') then
          B <= prop_B;
        end if;
      end if;
    end process B_P;

    RD_D_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        RD_D <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (RD_D_LATCH_EN_i = '1') then
          RD_D <= muxed_RD;
        end if;
      end if;
    end process RD_D_P;

    IMM_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        IMM <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (IMM_LATCH_EN_i = '1') then
          IMM <= ext_sign_unsign_out;
        end if;
      end if;
    end process IMM_P;

-- ***** STAGE 3 ********


    ALUOUT_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        ALUOUT <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (ALUOUT_LATCH_EN_i = '1') then
          ALUOUT <= prop_ALUOUT;
        end if;
      end if;
    end process ALUOUT_P;

    B_E_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        B_E <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (B_E_LATCH_EN_i = '1') then
          B_E <= B;
        end if;
      end if;
    end process B_E_P;

    PC8_E_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        PC8_E <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (PC8_E_LATCH_EN_i = '1') then
          PC8_E <= PC8;
        end if;
      end if;
    end process PC8_E_P;

    RD_E_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        RD_E <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (RD_E_LATCH_EN_i = '1') then
          RD_E <= RD_D;
        end if;
      end if;
    end process RD_E_P;

-- ***** STAGE 4 ********

    OUT_M_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        OUT_M <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (OUT_M_LATCH_EN_i = '1') then
          OUT_M <= muxed_OUT;
        end if;
      end if;
    end process OUT_M_P;

    RD_M_P: process (Clk, Rst)
    begin  -- process IR_P
      if Rst = '0' then                 -- asynchronous reset (active low)
        RD_M <= (others => '0');
      elsif Clk'event and Clk = '1' then  -- rising clock edge
        if (RD_M_LATCH_EN_i = '1') then
          RD_M <= RD_E;
        end if;
      end if;
    end process RD_M_P;




EXT_A_I : sign_ext_16_26_32
  port map(
    IN1 => IR(25 downto 0),
    CTRL=> Sel_ext_26_16_i,
    OUT1 => ext_26_16_out
    );

EXT_B_I : ext_16_32
  port map(
    IN1 => IR(15 downto 0),
    CTRL=> Sel_ext_sign_unsign_i,
    OUT1 => ext_sign_unsign_out
    );



    -- Control Unit Instantiation
    -- **** ADD AND FIX SIGNALS!! ****** --
    CU_I: dlx_cu
      port map (
	Clk      => Clk,
    	Rst      => Rst,      
    	IR_IN    => IR,       

    	IR_LATCH_EN =>   IR_LATCH_EN_i,  
    	PC_LATCH_EN =>  PC_LATCH_EN_I,  
    	NPC_F_LATCH_EN => NPC_F_LATCH_EN_i,   

        JUMP_D_LATCH_EN => JUMP_D_LATCH_EN_i,
    	NPC_D_LATCH_EN => NPC_D_LATCH_EN_i,   
    	A_LATCH_EN => A_LATCH_EN_i,   
    	B_LATCH_EN => B_LATCH_EN_i,   
        IMM_LATCH_EN => IMM_LATCH_EN_i,    
   	RD_D_LATCH_EN => RD_D_LATCH_EN_i,     
 
  	ALUOUT_LATCH_EN => ALUOUT_LATCH_EN_i,    
  	B_E_LATCH_EN => B_E_LATCH_EN_i,   
  	PC8_E_LATCH_EN => PC8_E_LATCH_EN_i,    
  	RD_E_LATCH_EN => RD_E_LATCH_EN_i,   
     
 	OUT_M_LATCH_EN => OUT_M_LATCH_EN_i,   
  	RD_M_LATCH_EN => RD_M_LATCH_EN_i,   
  
--MULTIPLEXERS
        Sel_PC_D => Sel_PC_D_i,
  	Sel_JUMP => Sel_JUMP_i,   
  	Sel_RD => Sel_RD_i,   
  	Sel_ALU2 => Sel_ALU2_i,    
   	Sel_OUT => Sel_OUT_i,
        Sel_ext_26_16 => Sel_ext_26_16_i,  
        Sel_ext_sign_unsign => Sel_ext_sign_unsign_i,   

-- BRANCH
   	branch => branch_i,  
        is_jump => is_jump_i, 

   	RF_WE => RF_WE_i,   
   	RF_RD1 => RF_RD1_i,   
   	RF_RD2 => RF_RD2_i,    
   	DMEM_WE => DMEM_WE_i,  
   	DMEM_RE => DMEM_RE_i,   
   	ALU_OPCODE => ALU_OPCODE_i    

);

    -- Instruction Ram Instantiation
    IRAM_i: IRAM
      port map (
          Rst  => Rst,
          Addr => PC,
          Dout => IRam_DOut);

 
    -- FAKEALU instantiation
    RF_I: dlx_regfile
      port map(
          Clk  	  => Clk,
          Rst     => Rst,         
          ENABLE  => '1', -- hardwired 1       
          RD1	  => RF_RD1_i,
          RD2     => RF_RD2_i,
          WR      => RF_WE_i,
          ADD_WR  => RD_M,	      
          ADD_RD1 => IR(25 downto 21),          
          ADD_RD2 => IR(20 downto 16),         
          DATAIN  => OUT_M,       
          OUT1    => prop_A,       
          OUT2    => prop_B      
          );

    -- REGIFLE instantiation
    ALU_I: fakealu
      port map(      
      
          IN1	  => A,
          IN2     => ALU_IN_2,
          OP      => ALU_OPCODE_i,
          DOUT  => prop_ALUOUT,
	  ZEROUT => prop_ZERO   
    
          );
    
    
end dlx_rtl;
