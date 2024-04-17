library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    
-------------------------------------------------

entity top_level is
    port(
        CLK100MHZ   : in  STD_LOGIC;
        BTNC        : in  STD_LOGIC;
        pos         : in  STD_LOGIC_VECTOR(6 downto 0);
        pos2        : in  STD_LOGIC_VECTOR(6 downto 0);
        LED         : out STD_LOGIC_VECTOR(6 downto 0);
        LED2        : out STD_LOGIC_VECTOR(6 downto 0);
        servo       : out STD_LOGIC;
        servo2      : out STD_LOGIC;
        LED_B       : out STD_LOGIC;
        LED_G       : out STD_LOGIC;
        LED_R       : out STD_LOGIC;
        LED_B2      : out STD_LOGIC;
        LED_G2      : out STD_LOGIC;
        LED_R2      : out STD_LOGIC
    );
end top_level;

-------------------------------------------------

architecture Behavioral of top_level is
     component clock_enable is
        generic (
            N_PERIODS : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;
    
    component servo_controller
        port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            pos   : in  STD_LOGIC_VECTOR(6 downto 0);
            servo : out STD_LOGIC
        );
    end component;
    
    component rgb_controller
        port (
            reset : in  STD_LOGIC;
            pos   : in  STD_LOGIC_VECTOR(6 downto 0);
            led_b : out STD_LOGIC;
            led_r : out STD_LOGIC;
            led_g : out STD_LOGIC
        );
    end component;
    
    signal clk_out : STD_LOGIC := '0';
begin
    clock_enable_map : component clock_enable
        generic map (
            N_PERIODS => 1562
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => clk_out
        );
    
    servo_controller1_map: servo_controller 
        port map(
            clk   => clk_out,
            reset => BTNC, 
            pos   => pos, 
            servo => servo
        );
        
    servo_controller2_map: servo_controller 
        port map(
            clk   => clk_out,
            reset => BTNC, 
            pos   => pos2, 
            servo => servo2
        );
        
    RGB_LED_controller1_map: rgb_controller 
        port map(
            reset => BTNC, 
            pos   => pos, 
            led_g => LED_G,
            led_b => LED_B,
            led_r => LED_R    
        );
    RGB_LED_controller2_map: rgb_controller 
        port map(
            reset => BTNC, 
            pos   => pos2, 
            led_g => LED_G2,
            led_b => LED_B2,
            led_r => LED_R2    
        );
   
    LED  <= pos;
    LED2 <= pos2;
    
end Behavioral;