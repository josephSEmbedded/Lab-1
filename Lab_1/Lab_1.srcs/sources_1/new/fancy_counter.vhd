----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 03:34:11 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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
use IEEE.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter is
    Port ( signal clk : in std_logic;
           signal clk_en : in std_logic;
           signal dir : in std_logic;
           signal en : in std_logic;
           signal ld : in std_logic;
           signal rst : in std_logic;
           signal updn : in std_logic;
           signal val : in std_logic_vector(3 downto 0);
           signal cnt : out std_logic_vector(3 downto 0) := (others => '0'));
end fancy_counter;

architecture Behavioral of fancy_counter is

signal dirPrev : std_logic;
signal counter : std_logic_vector(3 downto 0):="0000";

begin


process(clk)
begin
dirPrev <= dir;
if(rising_edge(clk) ) then
-- enable must be one for anything to happen 
    if en = '1' then
    --The only operation that can occur when enable set to 1 is reset
        if rst = '1' then
            counter <= (others => '0');
        end if;
        --Perform operations when clk enable is 1
        if clk_en = '1' then
             if updn = '1' then
                if dir = '1' then
--                    counter <= std_logic_vector(unsigned(counter)+1);
                    if counter /= val then
                        counter <=  std_logic_vector(unsigned(counter)+1);
                    else
                        counter <= "0000";
                    end if;
                    dirPrev <= dir;
                else
--                    counter <= std_logic_vector(unsigned(counter)-1);
                    if counter /= "0000" then
                        counter <= std_logic_vector(unsigned(counter)-1);
                    else
                        counter <= val;
                    end if;
                    dirPrev <= dir;
                end if;
             else
                if dirPrev = '1' then
--                    counter <= std_logic_vector(unsigned(counter)+1);
                      if counter /= val then
                        counter <= std_logic_vector(unsigned(counter)+1);
                      else 
                        counter <= "0000";
                      end if;
                else
--                    counter <= std_logic_vector(unsigned(counter)-1);
                     if counter /= "0000" then
                        counter <= std_logic_vector(unsigned(counter)-1);
                     else
                        counter <= val;
                     end if;
                end if;
             end if;
             if ld = '1' then
                counter <= val;
             end if;
         end if;
      end if;
end if;    
end process;

cnt <= counter;

end Behavioral;
