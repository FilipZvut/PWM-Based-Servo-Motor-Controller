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
    
    signal cnt : unsigned(10 downto 0);
    
    signal pwmi: unsigned(7 downto 0);
begin
    
    pwmi <= unsigned('0' & pos) + 32;
    
    counter: process (reset, clk) begin
        if (reset = '1') then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if (cnt = 1279) then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;
    
    servo <= '1' when (cnt < pwmi) else '0';
end Behavioral;