-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram64 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component Ram8  is
  	port (
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
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

signal M0, M1, M2, M3, M4, M5, M6, M7: STD_LOGIC_VECTOR(15 downto 0);
signal L0, L1, L2, L3, L4, L5, L6, L7: STD_LOGIC;

begin

	Dmux: Dmux8Way port map(load, address(2 downto 0), L0, L1, L2, L3, L4, L5, L6, L7);

	Ram0: Ram8 port map(clock, input, L0, address(5 downto 3), M0);
	Ram1: Ram8 port map(clock, input, L1, address(5 downto 3), M1);
	Ram2: Ram8 port map(clock, input, L2, address(5 downto 3), M2);
	Ram3: Ram8 port map(clock, input, L3, address(5 downto 3), M3);
	Ram4: Ram8 port map(clock, input, L4, address(5 downto 3), M4);
	Ram5: Ram8 port map(clock, input, L5, address(5 downto 3), M5);
	Ram6: Ram8 port map(clock, input, L6, address(5 downto 3), M6);
	Ram7: Ram8 port map(clock, input, L7, address(5 downto 3), M7);

	Mux: Mux8Way16 port map(M0, M1, M2, M3, M4, M5, M6, M7, address(2 downto 0), output);

end architecture;
