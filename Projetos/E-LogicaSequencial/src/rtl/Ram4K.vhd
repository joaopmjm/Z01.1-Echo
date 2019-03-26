-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4k is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

	component Ram512 is
	port (
  		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
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
signal N0, N1, N2, N3, N4, N5, N6, N7: STD_LOGIC;

begin
	SD: Dmux8Way port map(load, address(2 downto 0), N0, N1, N2, N3, N4, N5, N6, N7);

	MEM0: Ram512 port map(clock, input, N0, address(11 downto 3), M0);
	MEM1: Ram512 port map(clock, input, N1, address(11 downto 3), M1);
	MEM2: Ram512 port map(clock, input, N2, address(11 downto 3), M2);
	MEM3: Ram512 port map(clock, input, N3, address(11 downto 3), M3);
	MEM4: Ram512 port map(clock, input, N4, address(11 downto 3), M4);
	MEM5: Ram512 port map(clock, input, N5, address(11 downto 3), M5);
	MEM6: Ram512 port map(clock, input, N6, address(11 downto 3), M6);
	MEM7: Ram512 port map(clock, input, N7, address(11 downto 3), M7);

	SM: Mux8Way16 port map(M0, M1, M2, M3, M4, M5, M6, M7, address(2 downto 0), output);


end architecture;
