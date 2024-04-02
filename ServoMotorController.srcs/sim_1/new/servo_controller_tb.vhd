-- servo_controller_tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_controller_tb is
end servo_controller_tb;

architecture Behavioral of servo_controller_tb is
    signal clk : STD_LOGIC := '0';
    signal btn : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal pwm_output : STD_LOGIC_VECTOR(7 downto 0);
    signal servo_enable : STD_LOGIC;
    signal servo_pwm : STD_LOGIC;
    signal servo_direction : STD_LOGIC;
begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.servo_controller_top
        port map (
            clk => clk,
            btn => btn,
            pwm_output => pwm_output,
            servo_enable => servo_enable,
            servo_pwm => servo_pwm,
            servo_direction => servo_direction
           
        );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for 5 ns; -- 100 MHz clock (10 ns period)
        end loop;
        wait;
    end process clk_process;

    -- Stimulus process
    stim_process: process
    begin
        btn <= "0001"; -- Set button 0 to pressed initially
        wait for 500 ns;
        btn <= "0000"; -- Release button 0
        wait for 500 ns;
        btn <= "0010"; -- Set button 1 to pressed
        wait for 500 ns;
        btn <= "0000"; -- Release button 1
        wait for 500 ns;
        btn <= "0100"; -- Set button 2 to pressed
        wait for 500 ns;
        btn <= "0000"; -- Release button 2
        wait for 500 ns;
        btn <= "1000"; -- Set button 3 to pressed
        wait for 500 ns;
        btn <= "0000"; -- Release button 3
        wait;
    end process stim_process;

end Behavioral;
