----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:23 03/27/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.std_logic_unsigned.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
port (
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- Synchronous reset     
	 LD0, LD1, LD2  : out std_logic;
	 LD15, LD14, LD13 : out std_logic
	 );
end entity top;
	 

architecture Behavioral of top is
signal s_light: std_logic_vector(5 downto 0);
signal s_cnt_en_i : std_logic;
attribute KEEP : string;
attribute KEEP of  s_cnt_en_i: signal is "TRUE";


begin

clock_enable : entity work.clock_enable
			generic map(
				g_NPERIOD => x"0064" 
			)
			port map (
				clk_i => clk_i,
				srst_n_i => BTN0,			
				clock_enable_o => s_cnt_en_i
			);

	 
	 TRAFFIC_DRIVE : entity work.traffic
    port map(clk_i	 => clk_i,
				 clken_in => s_cnt_en_i,
				 clr => BTN0,
             lights  => s_light);
				 
	LD0 <= s_light(0);
	LD1 <= s_light(1);
	LD2 <= s_light(2);
	LD13 <= s_light(3);
	LD14 <= s_light(4);
	LD15 <= s_light(5);
	 


end Behavioral;

