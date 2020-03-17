library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is
port(
     hth_l_o : out std_logic_vector(4-1 downto 0); --setiny sekundy
     hth_h_o : out std_logic_vector(4-1 downto 0); --desetiny sekundy
     sec_l_o : out std_logic_vector(4-1 downto 0); --sekundy
     sec_h_o : out std_logic_vector(4-1 downto 0); --desítky sekund
        
     clk_i    : in  std_logic;   -- clock
     srst_n_i : in  std_logic;   -- Synchronous reset (active low)
   ce_100Hz_i : in  std_logic;   -- clock enable
     cnt_en_i : in  std_logic    -- stopwatch enable
    );
end entity stopwatch;

architecture Behavioral of stopwatch is
    signal s_cnt0 : unsigned(4-1 downto 0) := (others => '0');
 --   ...
begin
    stopwatch_0 : process (clk_i)
begin
    if rising_edge(clk_i) then
        
        if srst_n_i = '0' then
                s_cnt0 <= 0;
                hth_l_o <= 0;
                hth_h_o <= 0;
                sec_l_o <= 0;
                sec_h_o <= 0;
else
    if s_cnt0 = ce_100Hz_i - 1 then
    Ticks <= 0;
        else
            s_cnt0 <= s_cnt0 + 1;
        end if;

    if hth_l_o = 9 then
    hth_l_o <= 0;
        else
            hth_l_o <= hth_l_o + 1;
        end if;

    if hth_h_o = 9 then
    hth_h_o <= 0;
        else
            hth_h_o <= hth_h_o + 1;
        end if;
            
    if sec_l_o = 9 then
    sec_l_o <= 0;
        else
            sec_l_o <= sec_l_o + 1;
        end if;
    
    if sec_h_o = 5 then
    sec_h_o <= 0;
        else
            sec_h_o <= sec_h_o + 1;
        end if;

    end if;
    end if;
    end process stopwatch_0;
            
    hth_l_o <= std_logic_vector(s_cnt0);
end architecture Behavioral;
