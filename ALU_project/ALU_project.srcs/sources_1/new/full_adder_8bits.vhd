----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/04/2024 02:23:07 PM
-- Design Name: 
-- Module Name: full_adder_8bits - Behavioral
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

entity full_adder_8bits is
 Port ( a, b : in std_logic_vector(7 downto 0);
     cin : in std_logic;
      sum : out std_logic_vector(7 downto 0);
      co : out std_logic ); 
end full_adder_8bits;

architecture Behavioral of full_adder_8bits is

signal carry : std_logic_vector(6 downto 0);

component full_adder is
port (
a : in std_logic; 
b : in std_logic; 
c :  in std_logic; 
summ : out std_logic;
carry : out std_logic
);
end component;

  begin
     a0:full_adder port map (a(0),b(0),cin,sum(0),carry(0));
     a1:full_adder port map (a(1),b(1),carry(0),sum(1),carry(1));
     a2:full_adder port map (a(2),b(2),carry(1),sum(2),carry(2));
     a3:full_adder port map (a(3),b(3),carry(2),sum(3),carry(3));
     a4:full_adder port map (a(4),b(4),carry(3),sum(4),carry(4));
     a5:full_adder port map (a(5),b(5),carry(4),sum(5),carry(5));
     a6:full_adder port map (a(6),b(6),carry(5),sum(6),carry(6));
     a7:full_adder port map (a(7),b(7),carry(6),sum(7),co);

end Behavioral;
