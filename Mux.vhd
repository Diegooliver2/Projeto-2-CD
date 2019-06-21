library ieee;
use ieee.std_logic_1164.all;
entity Mux is

port(
  Sel : in std_logic;
  Xpc,Xrdm : in std_logic_vector(7 downto 0);
  Y : out std_logic_vector(7 downto 0)
);
end Mux;

architecture archM of Mux is
begin
  
  WITH Sel SELECT
	  Y <= Xpc WHEN '0',
			 Xrdm WHEN '1',
			"00000000" WHEN OTHERS;
end archM;
