library ieee;
use ieee.std_logic_1164.all;

entity Memor1 is
port
	(
				S : out std_logic_vector(7 downto 0)
	);
end Memor1;
architecture archMemor1 of Memor1 is
	signal En : std_logic;
	signal Dados : std_logic_vector (7 downto 0);
	begin
		
		Dados <= "11110000";
		En <= '1';
		
		S <= En and Dados;
	
end archMemor1;