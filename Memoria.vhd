library ieee;
use ieee.std_logic_1164.all;

entity Memoria is
generic (N : integer := 16);
generic (M : integer := 8);
port

	(
		A : in std_logic_vector(3 downto 0);
		E : in std_logic_vector(M-1 downto 0);
		S : out std_logic_vector(M-1 downto 0);
		re, rw, clk : in std_logic
	);
end Memoria;

architecture archMemoria of Memoria is

component Celula is
port
	(
		clk, en, rw : in std_logic;
		E : in std_logic_vector(M-1 downto 0);
		S : out std_logic_vector(M-1 downto 0)
	);
end component;

signal write : std_logic_vector(N-1 downto 0);
signal Sout : std_logic_vector(M-1 downto 0);

begin

-- o signal write vai definir em qual célula o dado vai ser inserido;
-- eu nao tenho certeza se a sintaxe do with ta certo, pode ser melhor substituir por um case;

	WITH A SELECT
	write(0) <= "1" WHEN "0000",
	write(1) <= "1" WHEN "0001",
	write(2) <= "1" WHEN "0010",
	write(3) <= "1" WHEN "0011",
	write(4) <= "1" WHEN "0100",
	write(5) <= "1" WHEN "0101",
	write(6) <= "1" WHEN "0110",
	write(7) <= "1" WHEN "0111",
	write(8) <= "1" WHEN "1000",
	write(9) <= "1" WHEN "1001",
	write(10) <= "1" WHEN "1010",
	write(11) <= "1" WHEN "1011",
	write(12) <= "1" WHEN "1100",
	write(13) <= "1" WHEN "1101",
	write(14) <= "1" WHEN "1110",
	write(15) <= "1" WHEN "1111";
	
	FOR01: for i in 0 to (N-1) generate
		cont1: Celula
		port map(
		clk,
		write(i),
		rw,
		E,
		Sout);

		S(0) <= rw and Sout(0);
		S(1) <= rw and Sout(1);
		S(2) <= rw and Sout(2);
		S(3) <= rw and Sout(3);
		S(4) <= rw and Sout(4);
		S(5) <= rw and Sout(5);
		S(6) <= rw and Sout(6);
		S(7) <= rw and Sout(7);

	end generate;
end archMemoria; 