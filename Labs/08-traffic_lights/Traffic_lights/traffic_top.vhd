----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_top is
	port (
		clk_i	: in STD_LOGIC;
		BTN0	: in STD_LOGIC_VECTOR(3 downto 3);
		LD0	: out STD_LOGIC_VECTOR(7 downto 2)
	);
end traffic_top;

architecture Behavioral of traffic_top is

component clock_enable is
	port (
		clk_i          : in  std_logic;
		srst_n_i       : in  std_logic; -- Synchronous reset (active low)
		clock_enable_o : out std_logic
	);
end component;

component traffic is
	port(
		clk_i		: in STD_LOGIC;
		srst_n_i	: in STD_LOGIC;
		lights	: out STD_LOGIC_VECTOR(5 downto 0)
	);
end component;

	signal srst_n_i, clock_enable_o	: STD_LOGIC;

begin
	
	srst_n_i <= BTN0(3);
	U1: clock_enable
			port map (
					clk_i				=>	clk_i,
					srst_n_i			=>	srst_n_i,
					clock_enable_o	=>	clock_enable_o
			);
	U2: traffic
			port map (
					clk_i				=>	clock_enable_o,
					srst_n_i			=>	srst_n_i,
					lights			=>	LD0
			);

end Behavioral;