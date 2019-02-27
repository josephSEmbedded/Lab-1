----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 01:46:32 PM
-- Design Name: 
-- Module Name: counter_top - Structural
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

entity counter_top is
    Port( signal clk : in std_logic;
          signal btn : in std_logic_vector(3 downto 0);
          signal sw : in std_logic_vector(3 downto 0);
          signal led : out std_logic_vector(3 downto 0)
          );
end counter_top;

architecture Structural of counter_top is

signal dbnc0 : std_logic;
signal dbnc1 : std_logic;
signal dbnc2 : std_logic;
signal dbnc3 : std_logic;

signal div_out : std_logic;



component debounce is
    port( clk : in std_logic;
          btn : in std_logic;
          dbnc : out std_logic
          );
end component;

component clock_div is
    port( clock_in : in std_logic;
          clock_out : out std_logic
          );
end component;

component fancy_counter is
    port(  clk : in std_logic;
           clk_en : in std_logic;
           dir : in std_logic;
           en : in std_logic;
           ld : in std_logic;
           rst : in std_logic;
           updn : in std_logic;
           val : in std_logic_vector(3 downto 0);
           cnt : out std_logic_vector(3 downto 0));
end component;
          

begin

u1 : debounce port map(clk => clk, btn => btn(0), dbnc => dbnc0);
u2 : debounce port map(clk => clk, btn => btn(1), dbnc => dbnc1);
u3 : debounce port map(clk => clk, btn => btn(2), dbnc => dbnc2);
u4 : debounce port map(clk => clk, btn => btn(3), dbnc => dbnc3);

u5 : clock_div port map(clock_in => clk , clock_out => div_out);

u6 : fancy_counter 
    port map(clk => clk ,
             clk_en => div_out,
             dir => sw(0),
             en => dbnc1,
             ld => dbnc3,
             rst => dbnc0,
             updn => dbnc2,
             val => sw,
             cnt => led);
 
 
             
           
                   
end Structural;
