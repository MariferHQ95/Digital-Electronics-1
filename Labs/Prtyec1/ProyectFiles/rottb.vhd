--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:59:11 04/30/2020
-- Design Name:   
-- Module Name:   C:/Users/MariferHQ/Desktop/2D/Labs/Prtyec1/ProyectFiles/rottb.vhd
-- Project Name:  ProjectTry7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: QDEC
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
 
ENTITY rottb IS
END rottb;
 
ARCHITECTURE behavior OF rottb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT QDEC
    PORT(
         clk_i : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         FWD : OUT  std_logic;
         REV : OUT  std_logic;
         MOV : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal FWD : std_logic;
   signal REV : std_logic;
   signal MOV : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: QDEC PORT MAP (
          clk_i => clk_i,
          A => A,
          B => B,
          FWD => FWD,
          REV => REV,
          MOV => MOV
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
