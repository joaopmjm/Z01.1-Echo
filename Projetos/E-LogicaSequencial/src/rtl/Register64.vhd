-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register64 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(63 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(63 downto 0)
	);
end entity;

architecture arch of Register16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

component Register32 is
	port(clock: in STD_LOGIC;
		 input: in STD_LOGIC_VECTOR(7 downto 0);
		 load:  in STD_LOGIC;
		 output: out STD_LOGIC_VECTOR(7 downto 0)
		 );
end component

begin
	G1 : Register32 port map(clock,input(31 downto 0), load, output(31 downto 0));
	G2 : Register32 port map(clock,input(63 downto 32), load, output(63 downto 32));

end architecture;
