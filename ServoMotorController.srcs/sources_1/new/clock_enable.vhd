library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clk64kHz is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clk64kHz;
 
architecture Behavioral of clk64kHz is
    signal sig_temp: STD_LOGIC;
    signal sig_counter : integer range 0 to 780 := 0;
    
begin
    freq_divider: process (reset, clk) begin
        if (reset = '1') then
            sig_temp <= '0';
            sig_counter  <= 0;
        elsif rising_edge(clk) then
            if (sig_counter = 780) then
                sig_temp     <= NOT(sig_temp);
                sig_counter  <= 0;
            else
                sig_counter  <= sig_counter + 1;
            end if;
        end if;
    end process;
 
    clk_out <= sig_temp;
end Behavioral;