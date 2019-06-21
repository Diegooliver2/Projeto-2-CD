library ieee;
use ieee.std_logic_1164.all;

entity Memoria is
port
	(
		X, Y : in std_logic_vector(1 downto 0);
		E : in std_logic_vector(7 downto 0);
		S : out std_logic_vector(7 downto 0)
	);
end Memoria;



architecture archMemoria of Memoria is

component Celula is
generic (N : integer := 8);
port
	(
		clk, en, rw : in std_logic;
		E : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)
	);
end component;



begin

for 