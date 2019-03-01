--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		HEX0    : out std_logic_vector(6 downto 0); -- 7seg0
		HEX1    : out std_logic_vector(6 downto 0); -- 7seg1
		HEX2    : out std_logic_vector(6 downto 0); -- 7seg2
		HEX3    : out std_logic_vector(6 downto 0); -- 7seg3
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

---------------
-- implementacao
---------------
begin
 
process(SW)
 	begin
		if (SW(3 downto 0) = "0000") then
			HEX0 <= "1000000";
		elsif (SW(3 downto 0) = "0001") then
			HEX0 <= "1111001";
		elsif (SW(3 downto 0) = "0010") then
			HEX0 <= "0100100";
		elsif (SW(3 downto 0) = "0011") then
			HEX0 <= "0110000";
		elsif (SW(3 downto 0) = "0100") then
			HEX0 <= "0011001";
		elsif (SW(3 downto 0) = "0101") then
			HEX0 <= "0010010";
		elsif (SW(3 downto 0) = "0110") then
			HEX0 <= "0000010";
		elsif (SW(3 downto 0) = "0111") then
			HEX0 <= "1111000";
		elsif (SW(3 downto 0) = "1000") then
			HEX0 <= "0000000";
		elsif (SW(3 downto 0) = "1001") then
			HEX0 <= "0010000";
		elsif (SW(3 downto 0) = "1010") then
			HEX0 <= "0001000";
		elsif (SW(3 downto 0) = "1011") then
			HEX0 <= "0000011";
		elsif (SW(3 downto 0) = "1100") then
			HEX0 <= "1000110";
		elsif (SW(3 downto 0) = "1101") then
			HEX0 <= "0100001";
		elsif (SW(3 downto 0) = "1110") then
			HEX0 <= "0000110";
		elsif (SW(3 downto 0) = "1111") then
			HEX0 <= "0001110";
		end if;
end process;

process(SW)
 	begin
		if (SW(3 downto 0) = "0000") then
			HEX1 <= "1000000";
		elsif (SW(3 downto 0) = "0001") then
			HEX1 <= "1111001";
		elsif (SW(3 downto 0) = "0010") then
			HEX1 <= "0100100";
		elsif (SW(3 downto 0) = "0011") then
			HEX1 <= "0110000";
		elsif (SW(3 downto 0) = "0100") then
			HEX1 <= "0011001";
		elsif (SW(3 downto 0) = "0101") then
			HEX1 <= "0010010";
		elsif (SW(3 downto 0) = "0110") then
			HEX1 <= "0000010";
		elsif (SW(3 downto 0) = "0111") then
			HEX1 <= "1111000";
		elsif (SW(3 downto 0) = "1000") then
			HEX1 <= "0000000";
		elsif (SW(3 downto 0) = "1001") then
			HEX1 <= "0010000";
		elsif (SW(3 downto 0) = "1010") then
			HEX1 <= "0001000";
		elsif (SW(3 downto 0) = "1011") then
			HEX1 <= "0000011";
		elsif (SW(3 downto 0) = "1100") then
			HEX1 <= "1000110";
		elsif (SW(3 downto 0) = "1101") then
			HEX1 <= "0100001";
		elsif (SW(3 downto 0) = "1110") then
			HEX1 <= "0000110";
		elsif (SW(3 downto 0) = "1111") then
			HEX1 <= "0001110";
		end if;
end process;

process(SW)
 	begin
		if (SW(3 downto 0) = "0000") then
			HEX2 <= "1000000";
		elsif (SW(3 downto 0) = "0001") then
			HEX2 <= "1111001";
		elsif (SW(3 downto 0) = "0010") then
			HEX2 <= "0100100";
		elsif (SW(3 downto 0) = "0011") then
			HEX2 <= "0110000";
		elsif (SW(3 downto 0) = "0100") then
			HEX2 <= "0011001";
		elsif (SW(3 downto 0) = "0101") then
			HEX2 <= "0010010";
		elsif (SW(3 downto 0) = "0110") then
			HEX2 <= "0000010";
		elsif (SW(3 downto 0) = "0111") then
			HEX2 <= "1111000";
		elsif (SW(3 downto 0) = "1000") then
			HEX2 <= "0000000";
		elsif (SW(3 downto 0) = "1001") then
			HEX2 <= "0010000";
		elsif (SW(3 downto 0) = "1010") then
			HEX2 <= "0001000";
		elsif (SW(3 downto 0) = "1011") then
			HEX2 <= "0000011";
		elsif (SW(3 downto 0) = "1100") then
			HEX2 <= "1000110";
		elsif (SW(3 downto 0) = "1101") then
			HEX2 <= "0100001";
		elsif (SW(3 downto 0) = "1110") then
			HEX2 <= "0000110";
		elsif (SW(3 downto 0) = "1111") then
			HEX2 <= "0001110";
		end if;
end process;

process(SW)
 	begin
		if (SW(3 downto 0) = "0000") then
			HEX3 <= "1000000";
		elsif (SW(3 downto 0) = "0001") then
			HEX3 <= "1111001";
		elsif (SW(3 downto 0) = "0010") then
			HEX3 <= "0100100";
		elsif (SW(3 downto 0) = "0011") then
			HEX3 <= "0110000";
		elsif (SW(3 downto 0) = "0100") then
			HEX3 <= "0011001";
		elsif (SW(3 downto 0) = "0101") then
			HEX3 <= "0010010";
		elsif (SW(3 downto 0) = "0110") then
			HEX3 <= "0000010";
		elsif (SW(3 downto 0) = "0111") then
			HEX3 <= "1111000";
		elsif (SW(3 downto 0) = "1000") then
			HEX3 <= "0000000";
		elsif (SW(3 downto 0) = "1001") then
			HEX3 <= "0010000";
		elsif (SW(3 downto 0) = "1010") then
			HEX3 <= "0001000";
		elsif (SW(3 downto 0) = "1011") then
			HEX3 <= "0000011";
		elsif (SW(3 downto 0) = "1100") then
			HEX3 <= "1000110";
		elsif (SW(3 downto 0) = "1101") then
			HEX3 <= "0100001";
		elsif (SW(3 downto 0) = "1110") then
			HEX3 <= "0000110";
		elsif (SW(3 downto 0) = "1111") then
			HEX3 <= "0001110";
		end if;
end process;

end rtl;
