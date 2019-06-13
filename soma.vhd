library ieee;
use ieee.std_logic_1164.all;

entity soma is
port
	(
		A, B: in std_logic_vector(7 downto 0);
		S : out std_logic_vector(7 downto 0);
		Co   : out std_logic
	);
end soma;

architecture archSoma of soma is

component somador is
	port
		(
			Ci, A, B : in std_logic;
			Co, So    : out std_logic
		);
end component;

signal carry : std_logic_vector(7 downto 0);
signal Sx : std_logic_vector(7 downto 0);

begin
	S0 : somador port map('0', A(0), B(0), carry(0), Sx(0));
	S1 : somador port map(carry(0), A(1), B(1), carry(1), Sx(1));
	S2 : somador port map(carry(1), A(2), B(2), carry(2), Sx(2));
	S3 : somador port map(carry(2), A(3), B(3), carry(3), Sx(3));
	S4 : somador port map(carry(3), A(4), B(4), carry(4), Sx(4));
	S5 : somador port map(carry(4), A(5), B(5), carry(5), Sx(5));
	S6 : somador port map(carry(5), A(6), B(6), carry(6), Sx(6));
	S7 : somador port map(carry(6), A(7), B(7), carry(7), Sx(7));
	
	Co <= carry(7);
	
	S <= Sx;
end archSoma;