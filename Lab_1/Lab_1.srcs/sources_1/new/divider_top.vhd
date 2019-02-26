----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 09:10:47 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
    Port( signal clk : in std_logic;
          signal led0 : out std_logic
          );
end divider_top;

architecture my_divider_top of divider_top is
component clock_div is
    port ( clock_in : in std_logic;
           clock_out : out std_logic
           );
end component;

signal led0_temp : std_logic;
signal div : std_logic;

begin
division : clock_div port map(clock_in => clk, clock_out => div);
process(clk)
begin
if (rising_edge(clk)) then
    if div ='1' then
        led0_temp <= not led0_temp;
    end if;
end if;
end process;

led0 <= led0_temp;


end my_divider_top;
