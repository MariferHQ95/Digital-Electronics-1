--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:47 04/30/2020
-- Design Name:   
-- Module Name:   C:/Users/MariferHQ/Desktop/2D/Labs/Prtyec1/ProjectTest5/EncoderTB.vhd
-- Project Name:  ProjectTest5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encoder_ky040
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
 
ENTITY EncoderTB IS
END EncoderTB;
 
ARCHITECTURE behavior OF EncoderTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder_ky040
    PORT(
         srst_n_i : IN  std_logic;
         clk_i : IN  std_logic;
         pinA : IN  std_logic;
         pinB : IN  std_logic;
         enc_sw : IN  std_logic;
         POS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal srst_n_i : std_logic := '0';
   signal clk_i : std_logic := '0';
   signal pinA : std_logic := '0';
   signal pinB : std_logic := '0';
   signal enc_sw : std_logic := '0';

 	--Outputs
   signal POS : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_ky040 PORT MAP (
          srst_n_i => srst_n_i,
          clk_i => clk_i,
          pinA => pinA,
          pinB => pinB,
          enc_sw => enc_sw,
          POS => POS
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
