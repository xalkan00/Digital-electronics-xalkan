------------------------------------------------------------------------
--
-- VHDL template for combinational logic circuits.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2018-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------
--knihovny
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
--popisuje vstupy a vzstupy
entity top is
    port (BTN1, BTN0:    in  std_logic;
          LD2, LD1, LD0: out std_logic);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
--chování desky uvnitř
architecture Behavioral of top is
begin
    LD2 <= not BTN1 and BTN0;
    LD1 <= ((not BTN1 and not BTN0) or (BTN1 and BTN0));
    LD0 <=((BTN1 OR BTN0)and(not BTN1 OR not BTN0)and(not BTN1 OR BTN0));
	 
	 
end architecture Behavioral;

