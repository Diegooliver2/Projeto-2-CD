library ieee;
use ieee.std_logic_1164.all;

entity OPcode is
port(
		recDoRDM: in std_logic_vector(7 downto 0);
		clearOP : in std_logic;
		clkOP : in std_logic;
		cargaOP : in std_logic;
		saidaOP : out std_logic_vector(7 downto 0)
	);
end OPcode;

architecture archOPcode of OPcode is

component Registrador8Bits is
port(
		I   : in std_logic_vector(7 downto 0);
		clear : in std_logic;
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
	);
end component;

	signal aux : std_logic_vector(7 downto 0);
	signal auxRecRDM : std_logic_vector(7 downto 0);
	
begin

	auxRecRDM(7) <= recDoRDM(7);
	auxRecRDM(6) <= recDoRDM(6);
	auxRecRDM(5) <= recDoRDM(5);
	auxRecRDM(4) <= recDoRDM(4);
	auxRecRDM(3) <= '0';
	auxRecRDM(2) <= '0';
	auxRecRDM(1) <= '0';
	auxRecRDM(0) <= '0';
	
	with cargaOP select
		aux <= 	auxRecRDM when '1',
					"00000000" when others;
	
	Q1 : Registrador8Bits port map(aux, clearOP, clkOP, saidaOP);
	
end archOPcode;