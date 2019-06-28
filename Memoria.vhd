library ieee;
use ieee.std_logic_1164.all;

entity Memoria is
generic (M : integer := 8);
port

	(
		A : in std_logic_vector(3 downto 0);
		E : in std_logic_vector(M-1 downto 0);
		S : out std_logic_vector(M-1 downto 0);
		re, srw, clk : in std_logic
		
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

type t_matrix is array (0 to 15) of std_logic_vector (7 downto 0);
signal write : std_logic_vector(15 downto 0);
signal Sout : t_matrix;
signal rwsig : std_logic;
begin

-- o signal write vai definir em qual célula o dado vai ser inserido;

	WITH A SELECT write <=
		"1000000000000000" when "0000",
		"0100000000000000" when "0001",
		"0010000000000000" when "0010",
		"0001000000000000" when "0011",
		"0000100000000000" when "0100",
		"0000010000000000" when "0101",
		"0000001000000000" when "0110",
		"0000000100000000" when "0111",
		"0000000010000000" when "1000",
		"0000000001000000" when "1001",
		"0000000000100000" when "1010",
		"0000000000010000" when "1011",
		"0000000000001000" when "1100",
		"0000000000000100" when "1101",
		"0000000000000010" when "1110",
		"0000000000000001" when "1111";
	
	--	case A is
	--	when "0000" => write(0) <= '1';
	--	when "0001" => write(1) <= '1';
	--	when "0010" => write(2) <= '1';
	--	when "0011" => write(3) <= '1';
	--	when "0100" => write(4) <= '1';
	--	when "0101" => write(5) <= '1';
	--	when "0110" => write(6) <= '1';
	--	when "0111" => write(7) <= '1';
	--	when "1000" => write(8) <= '1';
	--	when "1001" => write(9) <= '1';
	--	when "1010" => write(10) <= '1';
	--	when "1011" => write(11) <= '1';
	--	when "1100" => write(12) <= '1';
	--	when "1101" => write(13) <= '1';
	--	when "1110" => write(14) <= '1';
	-- when "1111" => write(15) <= '1';
	--	end case;

	FOR01: for i in 0 to (15) generate
		cont1: Celula generic map (N => 8) port map (
		clk,
		write(i),
		srw,
		E,
		Sout(i));
	end generate;	
		
	
		S <= Sout(0) or 
		Sout(1) or 
		Sout(2) or 
		Sout(3) or 
		Sout(4) or 
		Sout(5) or 
		Sout(6) or 
		Sout(7) or 
		Sout(8) or 
		Sout(9) or 
		Sout(10) or 
		Sout(11) or 
		Sout(12) or
		Sout(13) or 
		Sout(14) or 
		Sout(15);
		
	
end archMemoria; 