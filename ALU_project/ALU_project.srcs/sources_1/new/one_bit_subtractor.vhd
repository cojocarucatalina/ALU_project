----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2024 12:02:18 PM
-- Design Name: 
-- Module Name: one_bit_subtractor - Behavioral
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

library IEEE;

use IEEE.std_logic_1164.all;

entity one_bit_subtractor is 
    port(
        x, y, b_in : in std_logic; 
        d, b_out : out std_logic
    );
end one_bit_subtractor;

architecture behavioral of one_bit_subtractor is

begin

    d <= b_in xor (x xor y);
    b_out <= ((not x) and y) or (b_in and (not (x xor y)));
    
end behavioral;
