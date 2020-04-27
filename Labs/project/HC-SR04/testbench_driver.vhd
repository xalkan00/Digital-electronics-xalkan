LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench_driver IS
END testbench_driver;
 
ARCHITECTURE behavior OF testbench_driver IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT driver_7seg
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         display_A : IN  std_logic_vector(3 downto 0);
         display_B : IN  std_logic_vector(3 downto 0);
         display_C : IN  std_logic_vector(3 downto 0);
         display_D : IN  std_logic_vector(3 downto 0);
         dp_i : IN  std_logic_vector(3 downto 0);
         dp_o : OUT  std_logic;
         seg_o : OUT  std_logic_vector(6 downto 0);
         dig_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal display_A : std_logic_vector(3 downto 0) := (others => '0');
   signal display_B : std_logic_vector(3 downto 0) := (others => '0');
   signal display_C : std_logic_vector(3 downto 0) := (others => '0');
   signal display_D : std_logic_vector(3 downto 0) := (others => '0');
   signal dp_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dp_o : std_logic;
   signal seg_o : std_logic_vector(6 downto 0);
   signal dig_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: driver_7seg PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          display_A => display_A,
          display_B => display_B,
          display_C => display_C,
          display_D => display_D,
          dp_i => dp_i,
          dp_o => dp_o,
          seg_o => seg_o,
          dig_o => dig_o
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
    stim_proc: process
   begin
	
	--
	
	en_i <= '0';
        srst_n_i <= '1'; wait for clk_i_period;
   
        -- Reset activation
        srst_n_i <= '0'; wait for clk_i_period;
        srst_n_i <= '1';

        -- Clock enable pulses
        for i in 0 to 10 loop
            en_i <= '1'; wait for clk_i_period;
            en_i <= '0'; wait for clk_i_period*3;
        end loop;

        -- Reset activation
        srst_n_i <= '0'; wait for clk_i_period;
        srst_n_i <= '1';

        -- Clock enable pulses
        for i in 0 to 100 loop
            en_i <= '1'; wait for clk_i_period;
            en_i <= '0'; wait for clk_i_period*3;
        end loop;
      wait;
   end process;

END;
