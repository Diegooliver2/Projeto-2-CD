library ieee;
use ieee.std_logic_1164.all;

entity Celula is
generic (N : integer := 8);
port
	(
		clk, en, rw : in std_logic;
		E : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(N-1 downto 0)
	);
end Celula;

architecture archCelula of Celula is
	
component FlipFlopJK is
port(
		J, K: in std_logic;
		clear : in std_logic;
		preset : in std_logic;
		clk : in std_logic;
		Q, Qbar : out std_logic
	);
end component;

signal Qs : std_logic_vector(N-1 downto 0);

begin 
		
	FOR01: for i in 0 to (N - 1) generate	
		cont1: FlipFlopJK 
		port map(
		not(E(i)) or not(en),
		E(i) or not(en),
		'1', '1',
		clk and not(rw),
		Qs(i));
		S(i) <= Qs(i) and rw;
	end generate;
end archCelula;