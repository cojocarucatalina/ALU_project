----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/22/2023 05:06:29 PM
-- Design Name: 
-- Module Name: addition - Behavioral
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


entity addition is
Port(
a: in STD_LOGIC_VECTOR(7 downto 0);
b: in STD_LOGIC_VECTOR(7 downto 0);
carry_in: in STD_LOGIC;
output: out STD_LOGIC_VECTOR(7 downto 0);
carry_out: out STD_LOGIC
);
end addition;



architecture Behavioral of addition is
begin
    process(a, b, carry_in)
    begin
        output(0) <= a(0) XOR b(0) XOR carry_in;
        output(1) <= (a(1) XOR b(1) XOR carry_in) OR (a(0) AND b(0)) OR (a(1) AND b(0)) OR (a(0) AND b(1));
        output(2) <= (a(2) XOR b(2) XOR carry_in) OR (a(1) AND b(1)) OR (a(2) AND b(1)) OR (a(1) AND b(2));
        output(3) <= (a(3) XOR b(3) XOR carry_in) OR (a(2) AND b(2)) OR (a(3) AND b(2)) OR (a(2) AND b(3));
        output(4) <= (a(4) XOR b(4) XOR carry_in) OR (a(3) AND b(3)) OR (a(4) AND b(3)) OR (a(3) AND b(4));
        output(5) <= (a(5) XOR b(5) XOR carry_in) OR (a(4) AND b(4)) OR (a(5) AND b(4)) OR (a(4) AND b(5));
        output(6) <= (a(6) XOR b(6) XOR carry_in) OR (a(5) AND b(5)) OR (a(6) AND b(5)) OR (a(5) AND b(6));
        output(7) <= (a(7) XOR b(7) XOR carry_in) OR (a(6) AND b(6)) OR (a(7) AND b(6)) OR (a(6) AND b(7));
        carry_out <= (a(7) AND b(7)) OR (a(6) AND b(6)) OR (a(7) AND b(6)) OR (carry_in AND (a(6) OR b(6)));
    end process;
    
end Behavioral;
