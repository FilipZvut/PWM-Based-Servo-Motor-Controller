library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
-------------------------------------------------

entity servo_controller_clk64kHz_tb is
end servo_controller_clk64kHz_tb;

-------------------------------------------------
 
architecture behavior of servo_controller_clk64kHz_tb IS
    
    component top_level
        Port(
            CLK100MHZ   : in  std_logic;
            BTNC        : in  std_logic;
            pos         : in  std_logic_vector(6 downto 0);
            pos2        : in  std_logic_vector(6 downto 0);
            servo       : out std_logic;
            servo2      : out std_logic
        );
    end component;

-------------------------------------------------
   
    signal clk          : std_logic := '0';
    signal reset        : std_logic := '0';
    signal pos          : std_logic_vector(6 downto 0) := (others => '0');
    signal pos2         : std_logic_vector(6 downto 0) := (others => '0');
    signal servo        : std_logic;
    signal servo2       : std_logic;
    constant CLK_PERIOD : time := 10 ns;

-------------------------------------------------

begin
   
    dut : top_level port map (
        CLK100MHZ => clk,
        BTNC      => reset,
        pos       => pos,
        pos2      => pos2,
        servo     => servo,
        servo2    => servo2
    );

  
   clk_process : process begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
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
    
    stimuli2: process begin
        wait for 100 ns;
        pos2 <= "0000000";
        wait for 20 ms;
        pos2 <= "0101000";
        wait for 20 ms;
        pos2 <= "1010000";
        wait for 20 ms;
        pos2 <= "1111000";
        wait for 20 ms;
        pos2 <= "1111111";
        wait;
    end process;
end;