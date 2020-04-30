
Library IEEE;
Use IEEE.Std_Logic_1164.all;

entity QDEC is port
   (
     clk_i : in    std_logic;
     A   : in    std_logic;
     B   : in    std_logic;
     FWD : out   std_logic;
     REV : out   std_logic;
     MOV : out   std_logic
   );
end QDEC;

architecture Structure of QDEC is

-- Signal Declarations
signal code      : std_logic_vector(1 downto 0) := B"00";
signal code_prev : std_logic_vector(1 downto 0) := B"00";
signal MOV_del   : std_logic := '0';

begin
    main:process(clk_i) is
    begin
       if rising_edge(clk_i) then
          code_prev <= code;
          code(0) <= A;
          code(1) <= B;
          MOV <= MOV_del;
          if (code(0) = '1' and code_prev(0) = '0') then -- A rising edge
              if (B='0') then -- forward
                 FWD <= '1';
                 MOV_del <= '1';
                 REV <= '0';
              elsif (B='1') then -- reverse
                 FWD <= '0';
                 MOV_del <= '1';
                 REV <= '1';
              end if;
          elsif (code(1) = '1' and code_prev(1) = '0') then -- B rising edge
              if (A='1') then -- forward
                 FWD <= '1';
                 MOV_del <= '1';
                 REV <= '0';
              elsif (A='0') then -- reverse
                 FWD <= '0';
                 MOV_del <= '1';
                 REV <= '1';
              end if;
          elsif (code(0) = '0' and code_prev(0) = '1') then -- A falling edge
              if (B='1') then -- forward
                 FWD <= '1';
                 MOV_del <= '1';
                 REV <= '0';
              elsif (B='0') then -- reverse
                 FWD <= '0';
                 MOV_del <= '1';
                 REV <= '1';
              end if;
          elsif (code(1) = '0' and code_prev(1) = '1') then -- B falling edge
              if (A='0') then -- forward
                 FWD <= '1';
                 MOV_del <= '1';
                 REV <= '0';
              elsif (A='1') then -- reverse
                 FWD <= '0';
                 MOV_del <= '1';
                 REV <= '1';
              end if;
          else
              FWD <= '0';
              REV <= '0';
              MOV_del <= '0';
          end if;
       end if;
    end process;
end Structure;
--------------------------------------------------------------------------------