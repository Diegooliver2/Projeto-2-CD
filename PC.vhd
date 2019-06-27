library ieee;
use ieee.std_logic_1164.all;

entity PC is
port(
		recRDM: in std_logic_vector(7 downto 0);
		clearPC : in std_logic;
		clkPC : in std_logic;
		cargaIncPC : in std_logic_vector(1 downto 0);
		saidaPC : out std_logic_vector(7 downto 0)
	);
end PC;

architecture archPC of PC is

component Registrador8Bits is
port(
		I   : in std_logic_vector(7 downto 0);
		clear : in std_logic;
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
	);
end component;

component soma is
port(
		A, B: in std_logic_vector(7 downto 0);
		S : out std_logic_vector(7 downto 0);
		Co   : out std_logic
);
end component;
 
	signal aux : std_logic_vector(7 downto 0);
	signal somado : std_logic_vector(7 downto 0);
	signal auxCO : std_logic;
	
begin
	
	
	S0 : soma port map(recRDM, "00000001", somado, auxCo);
	
	with cargaIncPC select
		aux <=	recRDM when "01",
					somado when "10",
					"00000000" when others;
					
			
	Q1 : Registrador8Bits port map(aux,clearPC,clkPC, saidaPC);
	
end archPC;