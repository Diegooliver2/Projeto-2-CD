library ieee;
use ieee.std_logic_1164.all;

entity RDM is
port(
		recMemoria : in std_logic_vector(7 downto 0);
		recAC : in std_logic_vector(7 downto 0);
		clearRDM : in std_logic;
		clkRDM : in std_logic;
		cargaRDM : in std_logic_vector(1 downto 0);
		saidaRDM : out std_logic_vector(7 downto 0)
	);
end RDM;

architecture archRDM of RDM is

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
	
	with cargaRDM select
		aux <= "00000000" when "00",
					recMemoria when "01",
					recAC when "10",
					recMemoria when "11",
					"00000000" when others;
	
	Q0 : Registrador8Bits port map(aux, clearRDM, clkRDM, saidaRDM);
	
end archRDM;