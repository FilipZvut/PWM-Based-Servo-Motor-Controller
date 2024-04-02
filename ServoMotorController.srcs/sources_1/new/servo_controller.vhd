-- servo_controller.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_controller is
    Port (
        clk : in STD_LOGIC;
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        pwm_output : out STD_LOGIC_VECTOR(7 downto 0);
        servo_enable : out STD_LOGIC;
        servo_pwm : out STD_LOGIC;
        servo_direction : out STD_LOGIC
    );
end servo_controller;

architecture Behavioral of servo_controller is
    constant CLK_FREQ : integer := 100_000_000; -- 100MHz clock frequency
    constant PWM_FREQ : integer := 50; -- PWM frequency in Hz (50 Hz for servo motors)
    constant PERIOD_COUNT : integer := CLK_FREQ / PWM_FREQ;
    signal counter : unsigned(15 downto 0) := (others => '0');
    signal servo_angle : unsigned(7 downto 0) := (others => '0');
    signal servo_enabled : boolean := false;
begin

    -- Servo PWM generation process
    servo_pwm_process: process(clk)
    begin
        if rising_edge(clk) then
            if servo_enabled then
                if counter = to_unsigned(0, counter'length) then
                    servo_pwm <= '1'; -- High for duty cycle period
                    if servo_angle < 255 then
                        servo_angle <= servo_angle + 1;
                    else
                        servo_angle <= (others => '0');
                    end if;
                else
                    servo_pwm <= '0'; -- Low for remaining period
                end if;
                counter <= counter + 1;
            else
                servo_pwm <= '0'; -- Keep PWM low when servo is disabled
            end if;
        end if;
    end process servo_pwm_process;

    -- Servo control process
    servo_control_process: process(clk)
    begin
        if rising_edge(clk) then
            if btn(0) = '1' then -- Enable servo when button 0 is pressed
                servo_enabled <= true;
            elsif btn(1) = '1' then -- Disable servo when button 1 is pressed
                servo_enabled <= false;
            end if;
            
            -- Example of servo angle control based on button presses
            if btn(2) = '1' then -- Rotate servo clockwise
                servo_direction <= '1';
            elsif btn(3) = '1' then -- Rotate servo counterclockwise
                servo_direction <= '0';
            end if;
        end if;
    end process servo_control_process;

    -- Output servo control signals
    servo_enable <= '1'; -- Always enable servo
    pwm_output <= std_logic_vector(servo_angle); -- Output current servo angle

end Behavioral;
