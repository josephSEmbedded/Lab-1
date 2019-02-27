----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 02:53:46 PM
-- Design Name: 
-- Module Name: fancy_test - Behavioral
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

entity fancy_test is
end fancy_test;

architecture Behavioral of fancy_test is


signal clock : std_logic;
signal clk_enable : std_logic;
signal count : std_logic_vector(3 downto 0);
signal direction : std_logic;
signal updown : std_logic;
signal enable : std_logic;
signal load : std_logic;
signal reset : std_logic;
signal value : std_logic_vector(3 downto 0);

component fancy_counter is
    port (  clk : in std_logic;
            clk_en : in std_logic;
            dir : in std_logic;
            en : in std_logic;
            ld : in std_logic;
            rst : in std_logic;
            updn : in std_logic;
            val : in std_logic_vector(3 downto 0);
            cnt : out std_logic_vector(3 downto 0)
            );
 end component;
 
begin

fancycounter: fancy_counter 
    port map(clk => clock, 
             clk_en => clk_enable,
             dir => direction,
             updn => updown,
             en => enable,
             ld => load,
             rst => reset,
             val => value,
             cnt => count);
             
 enable <='1';
 clk_enable <= '1';
 
 
 process 
 begin
 
 clock <= '1';
 wait for 4ns;
 clock <= '0';
 wait for 4ns;

end process;
 




end Behavioral;
