library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        pos   : in  STD_LOGIC_VECTOR(6 downto 0);
        servo : out STD_LOGIC
    );
end servo_pwm;

architecture Behavioral of servo_pwm is
    
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