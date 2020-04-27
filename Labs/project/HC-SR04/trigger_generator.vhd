library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity trigger_generator is
    Port ( clk_i 		: in  STD_LOGIC;
           trigger_o : out  STD_LOGIC);
end trigger_generator;

architecture Behavioral of trigger_generator is
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
signal cnt_srst_s : STD_LOGIC;
signal cnt_o_s : STD_LOGIC_VECTOR(23 downto 0);

begin
trigger : entity work.binary_cnt
generic map(24)
	port map(
			clk_i,
			'1',
			cnt_srst_s,
			cnt_o_s
	);	
Proces_const :	process(clk_i,cnt_o_s)
		constant ms250 : STD_LOGIC_VECTOR(23 downto 0) := "101111101011110000100000";	--250ms (1/250ms=4Hz) -> 50MHz/4Hz=12500000
		constant ms250AND100us : STD_LOGIC_VECTOR(23 downto 0) := "101111101100111110101000";	--250ms + 100us (1/(250ms+100us)=3,9984Hz) -> 50MHz/3,9984Hz=12505000
	begin
		if(cnt_o_s > ms250 and cnt_o_s <ms250AND100us)then
			trigger_o <= '1';
		else
			trigger_o <= '0';
		end if;
		if(cnt_o_s = ms250AND100us or cnt_o_s = "XXXXXXXXXXXXXXXXXXXXXXXX")then
			cnt_srst_s <= '0';
		else
			cnt_srst_s <= '1';
		end if;
	end process;
	
end Behavioral;

