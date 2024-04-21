library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    
-------------------------------------------------

entity top_level is
    port(
        CLK100MHZ   : in  std_logic;
        BTNC        : in  std_logic;
        pos         : in  std_logic_vector(6 downto 0);
        pos2        : in  std_logic_vector(6 downto 0);
        LED         : out std_logic_vector(6 downto 0);
        LED2        : out std_logic_vector(6 downto 0);
        servo       : out std_logic;
        servo2      : out std_logic;
        LED_B       : out std_logic;
        LED_G       : out std_logic;
        LED_R       : out std_logic;
        LED_B2      : out std_logic;
        LED_G2      : out std_logic;
        LED_R2      : out std_logic
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
            clk   : in  std_logic;
            reset : in  std_logic;
            pos   : in  std_logic_vector(6 downto 0);
            servo : out std_logic
        );
    end component;
    
    component rgb_controller
        port (
            reset : in  std_logic;
            pos   : in  std_logic_vector(6 downto 0);
            led_b : out std_logic;
            led_r : out std_logic;
            led_g : out std_logic
        );
    end component;
    
    signal clk_out : std_logic := '0';
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