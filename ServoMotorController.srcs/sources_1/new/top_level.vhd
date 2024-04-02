-- servo_controller_top.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_controller_top is
    Port (
        clk : in STD_LOGIC;
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        pwm_output : out STD_LOGIC_VECTOR(7 downto 0);
        servo_enable : out STD_LOGIC;
        servo_pwm : out STD_LOGIC;
        servo_direction : out STD_LOGIC
    );
end servo_controller_top;

architecture Behavioral of servo_controller_top is
    component servo_controller
        Port (
            clk : in STD_LOGIC;
            btn : in STD_LOGIC_VECTOR(3 downto 0);
            pwm_output : out STD_LOGIC_VECTOR(7 downto 0);
            servo_enable : out STD_LOGIC;
            servo_pwm : out STD_LOGIC;
            servo_direction : out STD_LOGIC
        );
    end component;
begin
    servo_inst : servo_controller
        port map (
            clk => clk,
            btn => btn,
            pwm_output => pwm_output,
            servo_enable => servo_enable,
            servo_pwm => servo_pwm,
            servo_direction => servo_direction
        );
end Behavioral;