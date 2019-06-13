library ieee;
use ieee.std_logic_1164.all;

entity ULA is
port
	(
		X, Y : in std_logic_vector(7 downto 0);
		setULA : in std_logic_vector(2 downto 0);
		N, Z : out std_logic;
		SU : out std_logic_vector(7 downto 0)
	);
end ULA;

architecture archULA of ULA is

component soma is
port
	(
		A, B: in std_logic_vector(7 downto 0);
		S : out std_logic_vector(7 downto 0);
		Co   : out std_logic
	);
end component;

component contador is
port(
	clk: in std_logic;
	Q: out std_logic_vector(2 downto 0)

);
end component;


signal RS : std_logic_vector(7 downto 0);
signal suAux : std_logic_vector(7 downto 0);
signal clkAux : std_logic;
signal setAux : std_logic_vector(2 downto 0);

begin

	S0 : soma port map(X, Y, RS);
	
	
	WITH setAux SELECT
		 suAux <= RS WHEN "000",
						  (X AND Y) WHEN "001",
						  (X OR Y) WHEN "010",
						  (not(X)) WHEN "011",
							Y  WHEN "100",
						  "00000000" WHEN OTHERS;
							  
	SU <= suAux;
						  
	WITH suAux SELECT
		 Z <= ('1') WHEN "00000000",
				('0') WHEN OTHERS;

end archULA; 