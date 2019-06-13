library ieee;
use ieee.std_logic_1164.all;

entity somador is
port
	(
		Ci, A, B : in std_logic;
		Co, So    : out std_logic
	);
end somador;

architecture archSomador of somador is
begin
	So <= Ci xor (A xor B);
	Co <= (Ci and (A xor B)) or (A and B);
end archSomador;
	