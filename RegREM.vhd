library ieee;
use ieee.std_logic_1164.all;

entity RegREM is
port(
		recMux: in std_logic_vector(7 downto 0);
		clearREM : in std_logic;
		clkREM : in std_logic;
		cargaREM : in std_logic;
		saidaREM : out std_logic_vector(7 downto 0)
	);
end RegREM;

architecture archRegREM of RegREM is

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
	
	with cargaREM select
		aux <= "00000000" when '0',
					recMux when '1',
					"00000000" when others;
	
	Q1 : Registrador8Bits port map(aux,clearREM,(clkREM), saidaREM);
	
end archRegREM;