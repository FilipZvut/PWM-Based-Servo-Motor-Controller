library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-------------------------------------------------

entity servo_controller is
    Port (
        clk   : in  std_logic;
        reset : in  std_logic;
        pos   : in  std_logic_vector(6 downto 0);
        servo : out std_logic
    );
end servo_controller;

-------------------------------------------------

architecture Behavioral of servo_controller is
    
    signal sig_cnt : unsigned(10 downto 0);
    
    signal sig_pwmi: unsigned(7 downto 0);
begin
    
    sig_pwmi <= unsigned('0' & pos) + 32;
    
    p_counter: process (reset, clk) begin
        if (reset = '1') then
            sig_cnt <= (others => '0');
        elsif rising_edge(clk) then
            if (sig_cnt = 1279) then
                sig_cnt <= (others => '0');
            else
                sig_cnt <= sig_cnt + 1;
            end if;
        end if;
    end process p_counter;
    
    servo <= '1' when (sig_cnt < sig_pwmi) else '0';
end Behavioral;