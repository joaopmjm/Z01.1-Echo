library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

architecture rtl of DMux4Way is
begin
	process (sel, a)
	begin
		if (sel="00") then
			q0 <= a;
			q1 <= '0';
			q2 <= '0';
			q3 <= '0';
		elsif (sel="01") then
			q0 <= '0';
			q1 <= a;
			q2 <= '0';
			q3 <= '0';
		elsif (sel="10") then
			q0 <= '0';
			q1 <= '0';
			q2 <= a;
			q3 <= '0';
		elsif (sel="11") then
			q0 <= '0';
			q1 <= '0';
			q2 <= '0';
			q3 <= a;
		end if;
	end process;
end architecture;

