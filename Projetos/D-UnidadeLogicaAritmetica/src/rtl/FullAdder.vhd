-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  signal fio : std_logic;
  signal fio2 : std_logic;
  signal fio3 : std_logic;


begin
  -- Implementação vem aqui!
  fio <= a xor b;
  fio2 <= fio and c;
  fio3 <= a and b;

  soma <= fio xor c;
  vaium <= fio2 or fio3;


end architecture;
