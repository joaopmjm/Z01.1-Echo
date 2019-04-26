library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is
   PORT(
     -- Sistema
     CLK_SLOW : IN  STD_LOGIC;
     CLK_FAST : IN  STD_LOGIC;
     RST      : IN  STD_LOGIC;

     -- RAM 16K
     ADDRESS  : IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
     INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
     LOAD	  	: IN  STD_LOGIC ;
     OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

     -- LCD EXTERNAL I/OS
     LCD_CS_N     : OUT   STD_LOGIC;
     LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
     LCD_RD_N     : OUT   STD_LOGIC;
     LCD_RESET_N  : OUT   STD_LOGIC;
     LCD_RS       : OUT   STD_LOGIC;
     LCD_WR_N     : OUT   STD_LOGIC;
     LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
     LCD_INIT_OK  : OUT   STD_LOGIC;

     -- I/Os
     SW  : in std_logic_vector(9 downto 0);
     LED : OUT std_logic_vector(9 downto 0)

		);
end entity;


ARCHITECTURE logic OF MemoryIO IS

  component Screen is
    PORT(
      -- Sistema
      CLK_FAST : IN  STD_LOGIC;
      CLK_SLOW : IN  STD_LOGIC;
      RST 	   : IN  STD_LOGIC;

      -- interface
      INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
      LOAD         : IN  STD_LOGIC;
      ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);

      -- LCD EXTERNAL I/OS
      LCD_INIT_OK  : OUT STD_LOGIC;
      LCD_CS_N     : OUT   STD_LOGIC;
      LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
      LCD_RD_N     : OUT   STD_LOGIC;
      LCD_RESET_N  : OUT   STD_LOGIC;
      LCD_RS       : OUT   STD_LOGIC;
      LCD_WR_N     : OUT   STD_LOGIC);	
  end component;

  component RAM16K is
    port  (
      clock		: IN STD_LOGIC;
      address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
      data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
      wren		: IN STD_LOGIC;
      q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
  end component;

  component Mux2Way is
    Port (
      sel : in  STD_LOGIC_VECTOR ( 1 downto 0);
      a   : in  STD_LOGIC_VECTOR (15 downto 0);
      b   : in  STD_LOGIC_VECTOR (15 downto 0);
      c   : in  STD_LOGIC_VECTOR (15 downto 0);
      d   : in  STD_LOGIC_VECTOR (15 downto 0);
      q   : out STD_LOGIC_VECTOR (15 downto 0));
  end component;
  component DMux4Way is
  	Port (
  		a:   in  STD_LOGIC;
		sel: in  STD_LOGIC_VECTOR(1 downto 0);
		q0:  out STD_LOGIC;
		q1:  out STD_LOGIC;
		q2:  out STD_LOGIC;
		q3:  out STD_LOGIC)
  	);
  	end component;
  	component Register16 is
  	Port (
  		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"
  	);
  	end component;
signal load0, load1 : STD_LOGIC;
signal dec : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal wren0 : STD_LOGIC_VECTOR(13 DOWNTO 0);
signal data0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
process
begin
	if (ADRESS < "100000000000000") then dec <= "00";
	elsif (ADRESS < "101001011000000") then dec <= "01";
	elsif (ADRESS < "101001011000001") dec <= "10";
	else dec <= "11";
	end if;

	DMUX0 : DMux4Way port map(LOAD,dec,wren0,load0,load2);
	R16 : RAM16k port map(CLK_FAST,ADRESS(13 downto 0),INPUT,wren0,data0);
	INPUT(15 downto 10) <= "000000";
	REG16 : Register16 port map(CLK_SLOW, INPUT,load0,LED);
	SCR : Screen port map(CLK_FAST,CLK_SLOW,'0',INPUT,LOAD,ADRESS,LCD_INIT_OK,LCD_CS_N,LCD_D,LCD_RD_N,LCD_RESET_N,LCD_RS,LCD_WR_N);
	SW(15 downto 10) <= "000000";
	MUX0 : Mux2Way(dec,data0,"0000000000000000","0000000000000000",SW);

end process;
END logic;



-----------------------------------
-- Dicas de uso, screen e RAM16k --
-----------------------------------

--    DISPLAY: Screen  port map (
--          RST         => RST,
--          CLK_FAST    => CLK_FAST,
--          CLK_SLOW    => CLK_SLOW,
--          INPUT       =>
--          LOAD        =>
--          ADDRESS     =>
--          LCD_INIT_OK => LCD_INIT_OK,
--          LCD_CS_N 	  => LCD_CS_N ,
--          LCD_D       => LCD_D,
--          LCD_RD_N 	  => LCD_RD_N,
--          LCD_RESET_N => LCD_RESET_N,
--          LCD_RS 	    => LCD_RS,
--          LCD_WR_N 	  => LCD_WR_N
--    );


--    RAM: RAM16K  PORT MAP(
--         clock		=> CLK_FAST,
--         address  =>
--         data		  =>
--         wren		  =>
--         q		    =>
--    );