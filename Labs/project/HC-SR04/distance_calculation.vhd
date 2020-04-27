library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity distance_calculation is
    Port ( clk_i 						: in  STD_LOGIC;
           calculation_reset_i 	: in  STD_LOGIC;
           pulse_i 					: in  STD_LOGIC;
           distance_o 				: out  STD_LOGIC_VECTOR (8 downto 0));
end distance_calculation;

architecture Behavioral of distance_calculation is
component binary_cnt is
generic(
    g_NBIT : positive := 10      -- Number of bits
);
port(
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    en_i     : in  std_logic;   -- Enable
    cnt_o    : out std_logic_vector(g_NBIT-1 downto 0)
);
end component;
signal pulse_s : STD_LOGIC_VECTOR(21 downto 0);

begin
counter_pulse : entity work.binary_cnt 
generic map (22)
	port map (
			clk_i,
			pulse_i,
			not calculation_reset_i,
			pulse_s
	);
	
	Distance_calculation : process(pulse_i,pulse_s)
				variable result : integer;
				variable multiplier : STD_LOGIC_VECTOR(23 downto 0);
			begin
					if(pulse_i = '0') then
						multiplier := pulse_s * "11";
						result := to_integer(unsigned(multiplier(23 downto 13)));
							if(result > 458) then
								distance_o <= "111111111";
							else
								distance_o <= STD_LOGIC_VECTOR(to_unsigned(result,9));
							end if;
					else
							
					end if;
					
	end process;
	
end Behavioral;