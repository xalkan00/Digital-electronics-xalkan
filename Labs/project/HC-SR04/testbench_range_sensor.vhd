LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench_range_sensor IS
END testbench_range_sensor;
 
ARCHITECTURE behavior OF testbench_range_sensor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT range_sensor
    PORT(
         clk_i : IN  std_logic;
         pulse_i : IN  std_logic;	--echo
         trigger_o : OUT  std_logic;
         meters_o : OUT  std_logic_vector(3 downto 0);
         decimeters_o : OUT  std_logic_vector(3 downto 0);
         centimeters_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal pulse_i : std_logic := '0';

 	--Outputs
   signal trigger_o : std_logic;
   signal meters_o : std_logic_vector(3 downto 0);
   signal decimeters_o : std_logic_vector(3 downto 0);
   signal centimeters_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Sensor: range_sensor PORT MAP (
					clk_i => clk_i,
					pulse_i => pulse_i,
					trigger_o => trigger_o,
					meters_o => meters_o,
					decimeters_o => decimeters_o,
					centimeters_o => centimeters_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
  stim_proc: process
   begin		

     wait for 100 ns;	
	  trigger_o <= '1'; 
      wait for clk_i_period*10;
	  pulse_i <= '1';
	  wait for clk_i_period*100;
	  pulse_i <= '0';
	  
      wait;
   end process;

END;
