library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity traffic is

	port ( 
		clk_i		: in STD_LOGIC;
		srst_n_i	: in STD_LOGIC;
		lights	: out STD_LOGIC_VECTOR(5 downto 0)
	);
end entity traffic;

architecture traffic of traffic is
		type state_type is (stav0,stav1,stav2,stav3,stav4,stav5);
		signal state	: state_type;
		
		--signal count: std_logic_vector(3 downto 0);
		--constant SEC5: std_logic_vector(3 downto 0) := "1111";
		--constant SEC1: std_logic_vector(3 downto 0) := "0011";
		
		signal count 	: unsigned(3 downto 0);
		constant SEC5	: unsigned(3 downto 0) := "1111";
		constant SEC1	: unsigned(3 downto 0) := "0011";
	begin
		process (clk_i,srst_n_i)
	begin
	
		if srst_n_i = '1' then
							state <= stav0;
							count <= X"0";
		--elsif clk'event and clk = '1' then	
		elsif rising_edge(clk_i) then
		
			case state is 
				when stav0 =>
							if count < SEC5 then
								state <= stav0;
								count <= count + 1;
							else 
								state <= stav1;
								count <= X"0";
							end if;
				when stav1 =>
							if count < SEC1 then
								state <= stav1;
								count <= count + 1;
							else 
								state <= stav2;
								count <= X"0";
							end if;
				when stav2 =>
							if count < SEC1 then
								state <= stav2;
								count <= count + 1;
							else 
								state <= stav3;
								count <= X"0";
							end if;
				when stav3 =>
							if count < SEC5 then
								state <= stav3;
								count <= count + 1;
							else 
								state <= stav4;
								count <= X"0";
							end if;
				when stav4 =>
							if count < SEC1 then
								state <= stav4;
								count <= count + 1;
							else 
								state <= stav5;
								count <= X"0";
							end if;
				when stav5 =>
							if count < SEC1 then
								state <= stav5;
								count <= count + 1;
							else 
								state <= stav0;
								count <= X"0";
							end if;
				when others =>
								state <= stav0;
			end case;
		end if;
end process;

c2: process(state)
	begin
		case state is
				when stav0 		=> lights 	<= "100001";
				when stav1 		=> lights 	<= "100010";
				when stav2 		=> lights 	<= "100100";
				when stav3 		=> lights 	<= "001100";
				when stav4 		=> lights 	<= "010100";
				when stav5 		=> lights 	<= "100100";
				when others 	=> lights 	<= "100001";
		end case;
end process;

end traffic;