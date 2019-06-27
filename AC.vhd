library ieee;
use ieee.std_logic_1164.all;

entity AC is
port(
		recULA: in std_logic_vector(7 downto 0);
		clearAC : in std_logic;
		clkAC : in std_logic;
		cargaAC : in std_logic;
		saidaAC : out std_logic_vector(7 downto 0)
	);
end AC;

architecture archAC of AC is

component Registrador8Bits is
port(
		I   : in std_logic_vector(7 downto 0);
		clear : in std_logic;
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
	);
end component;

	signal aux : std_logic_vector(7 downto 0);
	
begin
	
	with cargaAC select
		aux <= "00000000" when '0',
					recULA when '1',
					"00000000" when others;
	
	Q1 : Registrador8Bits port map(aux, clearAC, clkAC, saidaAC);
	
end archAC;