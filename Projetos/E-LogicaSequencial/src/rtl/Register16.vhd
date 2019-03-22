-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"
	);
end entity;

architecture arch of Register16 is
  -- Aqui declaramos sinaisim:/tb_register16/outOutputs (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  	component Register8 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(7 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;

	
begin


	B1 : Register8 PORT MAP(clock,input(7 downto 0),load,output(7 downto 0));
	B2 : Register8 PORT MAP(clock,input(15 downto 8),load,output(15 downto 8));

end architecture;
