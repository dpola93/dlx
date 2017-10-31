library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity carry_tree is 
	generic (
	         N     :   integer := 32;
		 logN  :   integer := 5);
	Port (	A:	In	std_logic_vector(N-1 downto 0);
		B:      In	std_logic_vector(N-1 downto 0);
		  Cin : In std_logic;
		Cout:	Out	std_logic_vector(N/4-1 	downto 0));
end carry_tree; 

architecture arch of carry_tree is

signal g_net : std_logic_vector(N-1 downto 0);
signal p_net : std_logic_vector(N-1 downto 0);
type pg_couples_n is array (N/4-1 downto 0) of std_logic_vector(1 downto 0); -- propagate 1 -- generate 0
type pg_couples_1 is array (N/2-1 downto 0) of std_logic_vector(1 downto 0); -- propagate 1 -- generate 0
type pg_type is array (logN downto 2) of pg_couples_n;

signal pg_1 : pg_couples_1;

signal pg_n : pg_type;

signal magic_pro : std_logic_vector(1 downto 0); -- propagate 1 -- generate 0

component pg  
	Port (	g:	In	std_logic;
		p:      In	std_logic;
		g_prec: In	std_logic;
		p_prec: In	std_logic;		
		g_out:	Out	std_logic;
		p_out:	Out	std_logic);
end component; 

component g  
	Port (	g:	In	std_logic;
		p:      In	std_logic;
		g_prec: In	std_logic;
		g_out:	Out	std_logic);
end component; 

component pg_net 
      Port (	a:	In	std_logic;
         b:      In	std_logic;	
         g_out:	Out	std_logic;
         p_out:	Out	std_logic);
end component;


begin

pg_net_loop: for i in 1 to N-1 generate
   pg_net_x : pg_net port map(a(i),b(i),g_net(i),p_net(i));
end generate pg_net_loop;
      
   pg_net_0_MAGIC : pg_net port map (a(0),b(0),magic_pro(0),magic_pro(1));
   xG_0_0_MAGIC : g port map (magic_pro(0),magic_pro(1),Cin,g_net(0)); --
   
	xG_1_0 : g port map(g_net(1),p_net(1), g_net(0),pg_1(0)(0)); --level =1
	pg_0_loop: for j in 1 to N/2-1 generate
		xPG_1 : pg port map (g_net(j*2+1),p_net(j*2+1),g_net(j*2),p_net(j*2), pg_1(j)(0), pg_1(j)(1));
		end generate pg_0_loop;

	xG_2_0 : g port map(pg_1(1)(0),pg_1(1)(1),pg_1(0)(0),pg_n(2)(0)(0)); --level =2
 	pg_1_loop: for j in 1 to N/4-1 generate
		xPG_2 : pg port map (pg_1(j*2+1)(0),pg_1(j*2+1)(1),pg_1(j*2)(0),pg_1(j*2)(1), pg_n(2)(j)(0), pg_n(2)(j)(1));
		end generate pg_1_loop;



	for_loop_g: for level in 3 to logN generate
	   inner_loop_g:	for j in 0 to (2**(level-2)-1) generate
	      if_ok_g:	if((j rem (2**(level-2))) >= (2**(level-3))) generate
				xG : g port map (pg_n(level-1)(j)(0),pg_n(level-1)(j)(1),pg_n(level-1)(2**(level-3)-1)(0),pg_n(level)(j)(0));
			end generate if_ok_g;
		   if_fake_g:	if(j rem (2**(level-2)) < (2**(level-3))) generate
		      pg_n(level)(j)<=pg_n(level-1)(j);
			end generate if_fake_g;
		end generate inner_loop_g;
	end generate for_loop_g;
	
	for_loop_pg: for level in 3 to logN-1 generate
		inner_loop_pg: for j in (2**(level-2)) to ((N/4)-1) generate
			if_ok_pg: if(j mod (2**(level-2)) >= (2**(level-3))) generate 
				xPG : pg port map (pg_n(level-1)(j)(0),pg_n(level-1)(j)(1),pg_n(level-1)(j-(j mod (2**(level-3)))-1)(0),pg_n(level-1)(j-(j mod (2**(level-3)))-1)(1),pg_n(level)(j)(0),pg_n(level)(j)(1));
			end generate if_ok_pg;	
			if_fake_pg: if(j mod (2**(level-2)) < (2**(level-3))) generate 
			   pg_n(level)(j)<=pg_n(level-1)(j);
         		end generate if_fake_pg;
		end generate inner_loop_pg;
	end generate for_loop_pg;			
	
	final: for i in 0 to N/4-1 generate
	   Cout(i)<=pg_n(logN)(i)(0);
	 end generate;



	
 

end arch;
