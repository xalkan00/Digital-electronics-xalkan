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

entity range_sensor is
    Port ( 	clk_i 				: in  STD_LOGIC;
				pulse_i 				: in  STD_LOGIC;	--echo
				trigger_o 			: out  STD_LOGIC;
				meters_o 			: out  STD_LOGIC_VECTOR (3 downto 0);
				decimeters_o 		: out  STD_LOGIC_VECTOR (3 downto 0);
				centimeters_o 		: out  STD_LOGIC_VECTOR (3 downto 0));
end range_sensor;

architecture Behavioral of range_sensor is
component distance_calculation is
	Port ( clk_i 						: in  STD_LOGIC;
			 calculation_reset_i 	: in  STD_LOGIC;
			 pulse_i 					: in  STD_LOGIC;
			 distance_o 				: out  STD_LOGIC_VECTOR (8 downto 0));
end component;

component trigger_generator is
	port ( clk_i 		: in  STD_LOGIC;
          trigger_o 	: out  STD_LOGIC);
end component;

component BCD_convertor is
	Port ( distance_i 	: in  STD_LOGIC_VECTOR (8 downto 0);
			 hundreds_o 	: out  STD_LOGIC_VECTOR (3 downto 0);
			 tens_o 			: out  STD_LOGIC_VECTOR (3 downto 0);
			 unit_o 			: out  STD_LOGIC_VECTOR (3 downto 0));
end component;
signal distance_o_s : STD_LOGIC_VECTOR(8 downto 0);
signal trigger_o_s : STD_LOGIC;

begin
trigger_gen : entity work.trigger_generator
	port map(
			clk_i,
			trigger_o_s
	);
distance_calc : entity work.distance_calculation
port map(
		clk_i,
		trigger_o_s,
		pulse_i,
		distance_o_s
	);
BCD_conv : entity work.BCD_convertor
port map(
		distance_o_s,
		meters_o,
		decimeters_o,
		centimeters_o
		
	);
	
trigger_o <= trigger_o_s;

end Behavioral;