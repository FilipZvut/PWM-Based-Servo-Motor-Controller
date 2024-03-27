----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2024 10:15:20 AM
-- Design Name: 
-- Module Name: top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           servo_pwm : out STD_LOGIC_VECTOR (7 downto 0);
           servo_position : out STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end top_level;

architecture Behavioral of top_level is
    signal pwm_counter : integer range 0 to 255 := 0;
    signal servo_angle : integer range 0 to 180 := 0;
    signal pwm_out : STD_LOGIC := '0';
    constant PWM_PERIOD : integer := 100;
    constant MAX_ANGLE : integer := 180;
    constant MIN_ANGLE : integer := 0;
begin
    if reset = '1' then
        pwm_counter <= 0;
        pwm_out <= '0';
    elseif rising_edge(clk) then

end Behavioral;
