--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:56 03/20/2020
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Digital-electronics-1/Labs/07-stopwatch/stopwatch/testbench.vhd
-- Project Name:  stopwatch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stopwatch
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
--empty
end testbench;

architecture tb of testbench is
-- DUT component
component driver_7seg is
port(
	clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    cnt_en_i : in  std_logic;	
    seg_o    : out unsigned(7-1 downto 0);
    dig_o    : out unsigned(4-1 downto 0)
);
end component;

signal clk_in   	: std_logic := '0';
signal srst_n_in 	:   std_logic := '0';   
signal cnt_en_in	:   std_logic := '0';
signal seg_out   	:  unsigned(7-1 downto 0);
signal dig_out    	:  unsigned(4-1 downto 0);


BEGIN
	UUT: driver_7seg port map(
     						clk_i => clk_in, 
     						srst_n_i => srst_n_in, 
    						cnt_en_i => cnt_en_in,
      						seg_o => seg_out, 
      						dig_o => dig_out
    						);


	Clk_gen: process	-- NEW
  	begin
    	while Now < 1000 NS loop		-- NEW: DEFINE SIMULATION TIME
      		clk_in <= '0';
      		wait for 0.5 NS;
      		clk_in <= '1';
      		wait for 0.5 NS;
    	end loop;
    	wait;
  	end process Clk_gen;
   
   -- Stimulus process
   stim_proc: process
   begin		
 
      srst_n_in <= '1';
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      srst_n_in <= '0';
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      srst_n_in <= '1';
      
      wait;
   end process;
end tb;
