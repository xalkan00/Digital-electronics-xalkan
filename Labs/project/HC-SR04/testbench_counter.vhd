LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench_counter IS
END testbench_counter;
 
ARCHITECTURE behavior OF testbench_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_cnt
    PORT(
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         en_i : IN  std_logic;
         cnt_o : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   signal en_i : std_logic := '0';

 	--Outputs
   signal cnt_o : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_cnt PORT MAP (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          en_i => en_i,
          cnt_o => cnt_o
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
      clk_i <= '0';
      wait for 100000 ns;
      clk_i <= '1';
      wait for 100000 ns;
  end process;

	--Reset process
  reset: process
    begin
      srst_n_i <= '1';
      wait for 20 ns;
      srst_n_i <= '0';
      wait;
  end process;

	--Enable process
  enable: process
    begin
      en_i <= '1';
      wait for 50 ns;
  end process;  

END;
