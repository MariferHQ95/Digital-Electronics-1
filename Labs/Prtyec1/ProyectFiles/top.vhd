------------------------------------------------------------------------
--
-- Implementation of 4-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
port (
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- Synchronous reset
    disp_seg_o : out std_logic_vector(7-1 downto 0);
    disp_dig_o : out std_logic_vector(4-1 downto 0);
	 
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    data0_i  : in  std_logic_vector(4-1 downto 0);  -- Input values
    data1_i  : in  std_logic_vector(4-1 downto 0);
    data2_i  : in  std_logic_vector(4-1 downto 0);
    data3_i  : in  std_logic_vector(4-1 downto 0);
    dp_i     : in  std_logic_vector(4-1 downto 0);  -- Decimal points
    A   : in    std_logic;
    B   : in    std_logic;
	 en_i     : in  std_logic;   -- Enable
    dp_o     : out std_logic;                       -- Decimal point
    seg_o    : out std_logic_vector(7-1 downto 0);
    dig_o    : out std_logic_vector(4-1 downto 0);
    cnt_o    : out std_logic_vector(g_NBIT-1 downto 0);
    FWD : out   std_logic;
    REV : out   std_logic;
    MOV : out   std_logic
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    constant c_NBIT0 : positive := 4;   -- Number of bits for Counter0
	 signal s_en  : std_logic;
	 signal s_cnt : std_logic_vector(16-1 downto 0) := x"0000";
    signal s_hex : std_logic_vector(4-1 downto 0);
    signal s_cnt2 : std_logic_vector(2-1 downto 0) := "00";
	 signal fwd_c      : std_logic_vector(1 downto 0) := B"00";
    signal rev_c : std_logic_vector(1 downto 0) := B"00";
    signal MOV_del   : std_logic := '0';
	 

    --- WRITE YOUR CODE HERE
    
begin

    --------------------------------------------------------------------
    -- Sub-block of clock_enable entity
    --- WRITE YOUR CODE HERE
    Clock_Enable : entity work.clock_enable
	 generic map(
				g_NPERIOD => x"0028"
			)
			port map (
				clk_i => clk_i,
				srst_n_i => srst_n_i,			
				clock_enable_o => s_en
			);

    --------------------------------------------------------------------
    -- Sub-block of binary_cnt entity
    --- WRITE YOUR CODE HERE
	 Rotary: entity work.QDEC
    port map (
       clk_i=> clk_i,
       B => B,
       A => A,
       FWD=> fwd_c,
	    REV=> rev_c,
	    MOV=> MOV_del,
	 )
	 
    binary_counter: entity work.binary_cnt
    port map (
    srst_n_i=> MOV_del,
    en_i=> fwd_c,
    clk_i=> clk_i,
    cnt_o=> s_cnt
    
    );


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    --- WRITE YOUR CODE HERE
    Hex7Seg : entity work.hex_to_7seg
			port map (
				hex_i => s_hex,
				seg_o => seg_o
			);


    --------------------------------------------------------------------
    -- p_select_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements an internal 2-bit counter s_cnt for multiplexer 
    -- selection bits.
    --------------------------------------------------------------------
    p_select_cnt : process (clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt2 <= (others => '0');  -- Clear all bits
            elsif s_en = '1' then
                s_cnt2 <= s_cnt + 1; -- Normal operation
            end if;
        end if;
    end process p_select_cnt;

    --------------------------------------------------------------------
    -- p_mux:
    -- Combinational process which implements a 4-to-1 mux.
    --------------------------------------------------------------------
    p_mux : process (s_cnt2, data0_i, data1_i, data2_i, data3_i, dp_i)
    begin
        case s_cnt2 is
        when "00" =>
            s_hex <= data0_i;
            dp_o   <= dp_i(0);
            dig_o  <= "1110";
        when "01" =>
            s_hex <= data1_i;
            dp_o   <= dp_i(1);
            dig_o  <= "1101";
        when "10" =>
            s_hex <= data2_i;
            dp_o   <= dp_i(2);
            dig_o  <= "1011";
        when others =>
            s_hex <= data3_i;
            dp_o   <= dp_i(3);
            dig_o  <= "0111";
        end case;
    end process p_mux;


end architecture Behavioral;