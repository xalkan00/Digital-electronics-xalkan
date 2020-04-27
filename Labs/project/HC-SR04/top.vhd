library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 	pulse_pin 	: in  STD_LOGIC;
				trigger_pin : out  STD_LOGIC;
				clk_i			: in  STD_LOGIC;
				srst_n_i 	: in  std_logic;   -- Synchronous reset (active low)
				disp_dp    	: out std_logic; -- Decimal point
			   disp_seg_o 	: out std_logic_vector(7-1 downto 0);
				disp_dig_o 	: out std_logic_vector(4-1 downto 0));
end top;

architecture Behavioral of top is
component driver_7seg is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    display_A  : in  std_logic_vector(4-1 downto 0);  -- Input values
    display_B  : in  std_logic_vector(4-1 downto 0);
    display_C  : in  std_logic_vector(4-1 downto 0);
    display_D  : in  std_logic_vector(4-1 downto 0);
    dp_i     : in  std_logic_vector(4-1 downto 0);  -- Decimal points
    
    dp_o     : out std_logic;                       -- Decimal point
    seg_o    : out std_logic_vector(7-1 downto 0);
    dig_o    : out std_logic_vector(4-1 downto 0)
);
end component;

component range_sensor is
    Port ( clk_i 				: in  STD_LOGIC;
           pulse_i 			: in  STD_LOGIC;
           trigger_o 		: out  STD_LOGIC;
           meters_o 			: out  STD_LOGIC_VECTOR (3 downto 0);
           decimeters_o 	: out  STD_LOGIC_VECTOR (3 downto 0);
           centimeters_o 	: out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A_i : STD_LOGIC_VECTOR(3 downto 0);
signal B_i : STD_LOGIC_VECTOR(3 downto 0);
signal C_i : STD_LOGIC_VECTOR(3 downto 0);
signal D_i : STD_LOGIC_VECTOR(3 downto 0);

signal meters_s : STD_LOGIC_VECTOR (3 downto 0);
signal decimeters_s : STD_LOGIC_VECTOR (3 downto 0);
signal centimeters_s : STD_LOGIC_VECTOR (3 downto 0);

begin

Driver: entity work.driver_7seg
	port map (
			display_A => A_i,
			display_B => B_i,
			display_C => C_i,
			display_D => D_i,
			clk_i => clk_i,
			srst_n_i => srst_n_i,
			dp_i => "1011",
		 	dp_o => disp_dp,
			dig_o => disp_dig_o,
			seg_o => disp_seg_o
			
	);
Sensor: entity work.range_sensor
	port map (
			clk_i => clk_i,
			trigger_o => trigger_pin,
			pulse_i => pulse_pin,
			meters_o => meters_s,
			decimeters_o => decimeters_s,
			centimeters_o => centimeters_s
	);
		A_i <= centimeters_s;
		B_i <= decimeters_s;
		C_i <= meters_s;
		D_i <= "0000";
		
end Behavioral;

