library ieee;
use ieee.std_logic_1164.ALL;
 
entity servo_pwm_clk64kHz_tb is

end servo_pwm_clk64kHz_tb;
 
architecture behavior of servo_pwm_clk64kHz_tb IS
    
    component servo_pwm_clk64kHz
        Port(
            clk   : IN  std_logic;
            reset : IN  std_logic;
            pos   : IN  std_logic_vector(6 downto 0);
            servo : OUT std_logic
        );
    end component;

    
    signal clk  : std_logic := '0';
    signal reset: std_logic := '0';
    signal pos  : std_logic_vector(6 downto 0) := (others => '0');
    signal servo : std_logic;
    constant clk_period : time := 10 ns;
begin
   
    dut : servo_pwm_clk64kHz port map (
        clk => clk,
        reset => reset,
        pos => pos,
        servo => servo
    );

  
   clk_process : process begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;
 
   
    stimuli: process begin
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 50 ns;
        pos <= "0000000";
        wait for 20 ms;
        pos <= "0101000";
        wait for 20 ms;
        pos <= "1010000";
        wait for 20 ms;
        pos <= "1111000";
        wait for 20 ms;
        pos <= "1111111";
        wait;
    end process;
end;