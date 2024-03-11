----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2024 07:57:31 PM
-- Design Name: 
-- Module Name: complement - Behavioral
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

entity complement is
port (
b : in std_logic_vector(7 downto 0);
output : out std_logic_vector(7 downto 0)
);
end complement;

architecture Behavioral of complement is

signal add_out : std_logic_vector(7 downto 0);
signal carry_out : std_logic;
signal not_b: std_logic_vector(7 downto 0);

component addition is
Port(
a: in STD_LOGIC_VECTOR(7 downto 0);
b: in STD_LOGIC_VECTOR(7 downto 0);
carry_in: in STD_LOGIC;
output: out STD_LOGIC_VECTOR(7 downto 0);
carry_out: out STD_LOGIC
);
end component;

begin
not_b <= not(b);
add2: addition port map (not_b, "00000001",'0',add_out, carry_out);
output <= add_out; 

end Behavioral;
