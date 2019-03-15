-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component FullAdder is
    port(
        a, b, c: in STD_LOGIC;  -- entradas
        soma, vaium: out STD_LOGIC -- sum e carry
    );
  end component;

signal car1, car2, car3, car4, car5, car6, car7, car8, car9, car10, car11, car12, car13, car14, car15, car16: STD_LOGIC;

  -- Implementação vem aqui!
begin
    C0: FullAdder port map (a => a(0), b => b(0), c => '0', soma => q(0), vaium => car1);
    C1: FullAdder port map (a => a(1), b => b(1), c => car1, soma => q(1), vaium => car2);
    C2: FullAdder port map (a => a(2), b => b(2), c => car2, soma => q(2), vaium => car3);
    C3: FullAdder port map (a => a(3), b => b(3), c => car3, soma => q(3), vaium => car4);
    C4: FullAdder port map (a => a(4), b => b(4), c => car4, soma => q(4), vaium => car5);
    C5: FullAdder port map (a => a(5), b => b(5), c => car5, soma => q(5), vaium => car6);
    C6: FullAdder port map (a => a(6), b => b(6), c => car6, soma => q(6), vaium => car7);
    C7: FullAdder port map (a => a(7), b => b(7), c => car7, soma => q(7), vaium => car8);
    C8: FullAdder port map (a => a(8), b => b(8), c => car8, soma => q(8), vaium => car9);
    C9: FullAdder port map (a => a(9), b => b(9), c => car9, soma => q(9), vaium => car10);
    C10: FullAdder port map (a => a(10), b => b(10), c => car10, soma => q(10), vaium => car11);
    C11: FullAdder port map (a => a(11), b => b(11), c => car11, soma => q(11), vaium => car12);
    C12: FullAdder port map (a => a(12), b => b(12), c => car12, soma => q(12), vaium => car13);
    C13: FullAdder port map (a => a(13), b => b(13), c => car13, soma => q(13), vaium => car14);
    C14: FullAdder port map (a => a(14), b => b(14), c => car14, soma => q(14), vaium => car15);
    C15: FullAdder port map (a => a(15), b => b(15), c => car15, soma => q(15), vaium => car16);

end architecture;
