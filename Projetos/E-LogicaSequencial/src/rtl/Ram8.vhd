-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of ram8 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component Register16  is
  	port (
  		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
  		);
  	end component;

  component Mux8Way16 is
  	port ( 
		a:   in  STD_LOGIC_VECTOR(15 downto 0);
		b:   in  STD_LOGIC_VECTOR(15 downto 0);
		c:   in  STD_LOGIC_VECTOR(15 downto 0);
		d:   in  STD_LOGIC_VECTOR(15 downto 0);
		e:   in  STD_LOGIC_VECTOR(15 downto 0);
		f:   in  STD_LOGIC_VECTOR(15 downto 0);
		g:   in  STD_LOGIC_VECTOR(15 downto 0);
		h:   in  STD_LOGIC_VECTOR(15 downto 0);
		sel: in  STD_LOGIC_VECTOR(2 downto 0);
		q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

  component Dmux8Way is
  	port (
  		a:   in  STD_LOGIC;
		sel: in  STD_LOGIC_VECTOR(2 downto 0);
		q0:  out STD_LOGIC;
		q1:  out STD_LOGIC;
		q2:  out STD_LOGIC;
		q3:  out STD_LOGIC;
		q4:  out STD_LOGIC;
		q5:  out STD_LOGIC;
		q6:  out STD_LOGIC;
		q7:  out STD_LOGIC
  		);
  	end component;

signal S0, S1, S2, S3, S4, S5, S6, S7: STD_LOGIC_VECTOR(15 downto 0);
signal D0, D1, D2, D3, D4, D5, D6, D7: STD_LOGIC;

begin
	Set_Mem: DMux8Way port map(load, address, D0, D1, D2, D3, D4, D5, D6, D7);

	Slot0: Register16 port map(clock, input, D0, S0);
	Slot1: Register16 port map(clock, input, D1, S1);
	Slot2: Register16 port map(clock, input, D2, S2);
	Slot3: Register16 port map(clock, input, D3, S3);
	Slot4: Register16 port map(clock, input, D4, S4);
	Slot5: Register16 port map(clock, input, D5, S5);
	Slot6: Register16 port map(clock, input, D6, S6);
	Slot7: Register16 port map(clock, input, D7, S7);

	Ret_Mem: Mux8Way16 port map(S0, S1, S2, S3, S4, S5, S6, S7, address, output);
		
end architecture;