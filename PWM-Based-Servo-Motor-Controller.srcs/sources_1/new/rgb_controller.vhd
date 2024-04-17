library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-------------------------------------------------

entity rgb_controller is
    Port ( led_b : out STD_LOGIC;
           led_r : out STD_LOGIC;
           led_g : out STD_LOGIC;
           pos   : in STD_LOGIC_VECTOR (6 downto 0);
           reset : in STD_LOGIC);
end rgb_controller;

-------------------------------------------------

architecture Behavioral of rgb_controller is

    signal pos_status: unsigned(6 downto 0);
begin
    pos_status <= unsigned(pos);
    pos_statusessss: process (pos, reset) begin
       
    if (reset = '0') then   
        if (pos_status <= 43) then
            led_r <= '1';
            led_g <= '0';
            led_b <= '0';
        elsif ( (pos_status > 43) AND (pos_status <= 86)) then
            led_b <= '1';
            led_r <= '0';
            led_g <= '0';
        elsif ( (pos_status > 86) AND (pos_status < 128)) then
            led_g <= '1';
            led_r <= '0';
            led_b <= '0';            
        end if;
    else
        led_g <= '0';
        led_r <= '0';
        led_b <= '0'; 
    end if;       

end process pos_statusessss;

end Behavioral;
