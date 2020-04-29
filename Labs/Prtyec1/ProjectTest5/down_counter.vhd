----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:29 04/29/2020 
-- Design Name: 
-- Module Name:    down_s_cnter - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity down_s_cnter is
  port (
    clk_i: in std_logic;
    srst_n_i: in std_logic;
    en_i: in std_logic;
    load_data: in std_logic_vector(3 downto 0);
    cnt_o: out std_logic_vector(3 downto 0)
  );
end;

architecture rtl of down_s_cnter is
    signal s_cnt: std_logic_vector(3 downto 0);
begin
    process (clk_i, srst_n_i) begin
        if srst_n_i then
            s_cnt <= (others => '0');
        elsif rising_edge(clk_i) then
            if en_i then
                s_cnt <= load_data;
            else
                s_cnt <= s_cnt - 1;
            end if;
        end if;
    end process;

    cnt_o <= s_cnt;
end;