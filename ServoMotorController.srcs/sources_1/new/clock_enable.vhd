-- clock_generator.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_generator is
    Port (
        clk : out STD_LOGIC
    );
end clock_generator;

architecture Behavioral of clock_generator is
    constant CLOCK_PERIOD : time := 10 ns; -- 100 MHz clock
begin
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
    end process clk_process;
end Behavioral;
