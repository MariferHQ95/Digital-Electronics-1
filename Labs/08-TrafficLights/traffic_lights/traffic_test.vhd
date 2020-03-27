--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:36:05 03/27/2020
-- Design Name:   
-- Module Name:   C:/Users/MariferHQ/Desktop/08trafic light/traffic_lights/traffic_test.vhd
-- Project Name:  traffic_lights
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: traffic
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY traffic_test IS
END traffic_test;
 
ARCHITECTURE behavior OF traffic_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traffic
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         lights : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal lights : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 3.33333333 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traffic PORT MAP (
          clk => clk,
          clr => clr,
          lights => lights
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
