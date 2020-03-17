library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is
port(
    hth_l_o : out std_logic_vector(4-1 downto 0);
--...

architecture Behavioral of stopwatch is
    signal s_cnt0 : unsigned(4-1 downto 0) := (others => '0');
 --   ...

    s_cnt0 <= s_cnt0 + 1;
  --  ...

    hth_l_o <= std_logic_vector(s_cnt0);
end architecture Behavioral;
