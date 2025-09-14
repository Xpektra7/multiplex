library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplex is
    port(
        x : in  std_logic_vector(4 downto 1);
        y : in  std_logic_vector(8 downto 5);
        s : in  std_logic;
        m : out std_logic_vector(3 downto 0)
    );
end multiplex;

architecture behavior of multiplex is
begin
    m(0) <= (s and y(5)) or ((not s) and x(1));
	 m(1) <= (s and y(6)) or ((not s) and x(2));
	 m(2) <= (s and y(7)) or ((not s) and x(3));
	 m(3) <= (s and y(8)) or ((not s) and x(4));
end behavior;
