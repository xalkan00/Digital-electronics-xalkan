-- Testbench for driver_7seg
library ieee;
use ieee.std_logic_1164.all;
  
entity testbench is
--empty
end testbench;
 
architecture tb of testbench is 
 
    -- DUT Component
 
    component driver_7seg is
    port(
    clk_i: in std_logic;    
    srst_n_i: in std_logic; 
    data0_i: in std_logic_vector(3 downto 0);  
    data1_i: in std_logic_vector(3 downto 0); 
    data2_i: in std_logic_vector(3 downto 0);  
    data3_i: in std_logic_vector(3 downto 0);  
    dp_i: in std_logic_vector(3 downto 0);     
    dp_o: out std_logic;     
    seg_o: out std_logic_vector(6 downto 0);    
    dig_o: out std_logic_vector(3 downto 0);
    en_i: in std_logic
);   
    end component;
    

   --Inputs 
   signal clk_i: std_logic := '0';
   signal srst_n_i: std_logic := '0';
   signal data0_i: std_logic_vector(3 downto 0) := (others => '0');
   signal data1_i: std_logic_vector(3 downto 0) := (others => '0');
   signal data2_i: std_logic_vector(3 downto 0) := (others => '0');
   signal data3_i: std_logic_vector(3 downto 0) := (others => '0');
   signal dp_i: std_logic_vector(3 downto 0) := (others => '0');
   signal en_i: std_logic;

 	--Outputs
   signal dp_o  : std_logic;
   signal seg_o : std_logic_vector(6 downto 0);
   signal dig_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 100 us;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: driver_7seg 
   port map (
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          data0_i => data0_i,
          data1_i => data1_i,
          data2_i => data2_i,
          data3_i => data3_i,
          dp_i => dp_i,
          dp_o => dp_o,
          seg_o => seg_o,
          dig_o => dig_o,
          en_i => en_i
        );

   -- Clock process definitions
   clk_i_process: process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

    -- Stimulus process
    stim_proc: process
    begin
        -- insert stimulus here
        en_i <= '1';
        srst_n_i <= '0';
        data0_i  <= "0000";
        data1_i  <= "0011";
        data2_i  <= "0001";
        data3_i  <= "0100";
        dp_i <= "1101";
        wait for clk_i_period;

        srst_n_i <= '1';
        wait for clk_i_period*200;
        wait;
    end process;

end tb;