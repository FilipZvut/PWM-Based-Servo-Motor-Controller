library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_pwm_clk64kHz is
    Port(
        clk  : in  STD_LOGIC;
        reset: in  STD_LOGIC;
        pos  : in  STD_LOGIC_VECTOR(6 downto 0);
        pos2  : in  STD_LOGIC_VECTOR(6 downto 0);
        LED  : out STD_LOGIC_VECTOR(6 downto 0);
        LED2  : out STD_LOGIC_VECTOR(6 downto 0);
        servo: out STD_LOGIC;
        servo2: out STD_LOGIC
    );
end servo_pwm_clk64kHz;

architecture Behavioral of servo_pwm_clk64kHz is
    component clk64kHz
        port(
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    end component;
    
    component servo_pwm
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            pos   : in  STD_LOGIC_VECTOR(6 downto 0);
            servo : out STD_LOGIC
        );
    end component;
    
    signal clk_out : STD_LOGIC := '0';
begin
    clk64kHz_map: clk64kHz port map(
        clk => clk, 
        reset => reset, 
        clk_out => clk_out
    );
    
    servo_pwm_map: servo_pwm port map(
        clk=> clk_out,
        reset => reset, 
        pos => pos, 
        servo =>servo
    );
        
    servo_pwm_map2: servo_pwm port map(
        clk=> clk_out,
        reset => reset, 
        pos => pos2, 
        servo =>servo2
    );
   
    LED  <= pos;
    LED2 <= pos2;
    
end Behavioral;