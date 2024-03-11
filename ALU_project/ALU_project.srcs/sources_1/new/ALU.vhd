----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2023 03:21:01 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( clk: in std_logic; 
           a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           c : in STD_LOGIC_VECTOR(15 downto 0);
           alu_sel : in STD_LOGIC_VECTOR(3 downto 0);
           alu_out : out STD_LOGIC_VECTOR(15 downto 0));
end ALU;

architecture Behavioral of ALU is

signal alu_rez: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
signal alu_add: std_logic_vector(7 downto 0);
signal alu_sub: std_logic_vector(7 downto 0);
signal alu_div: std_logic_vector(7 downto 0);

signal alu_mul: std_logic_vector(15 downto 0);

signal div_remainder: std_logic_vector(7 downto 0);

signal div_ready: std_logic;
signal div_ovf: std_logic;

signal b_c2 : std_logic_vector(7 downto 0);

signal carry_out: STD_LOGIC;

component complement is
port (
b : in std_logic_vector(7 downto 0);
output : out std_logic_vector(7 downto 0));
end component;

component full_adder_8bits is
 Port ( a, b : in std_logic_vector(7 downto 0);
     cin : in std_logic;
      sum : out std_logic_vector(7 downto 0);
      co : out std_logic );
end component;

component wallace is
	Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           prod : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component divider is
    port (
        clk, rst : in std_logic;
        in1, in2 : in std_logic_vector (0 to 7); 
        output : out std_logic_vector (0 to 7);
        start : in std_logic;
        done : out std_logic
    );
end component;

begin


add: full_adder_8bits port map(a,b,'0',alu_add,carry_out);
c2: complement port map(b, b_c2);
sub: full_adder_8bits port map(a,b_c2,'0',alu_sub,carry_out);
mul: wallace port map (a, b, alu_mul);
--div: divider port map (clk, '0', a, b, alu_div, '1', div_ready);

process(alu_sel)
begin

    case (alu_sel) is 
        when "0000" => alu_rez <= x"00" & (alu_add); --55
        when "0001" => alu_rez <= x"00" & (alu_sub); --11
        when "0010" => alu_rez <=  alu_mul;  --6C6
        when "0011" => alu_rez <=  x"00" & (alu_div(7 downto 0)); --1 ?
        
        when "0100" => alu_rez <= x"00" & (a AND b) ;  --22
        when "0101" => alu_rez <= x"00" & (a OR b ); --33
        when "0110" => alu_rez <= x"00" & (a NAND b );  --FFDD
        when "0111" => alu_rez <= x"00" & (a NOR b) ;  --FFCC
        when "1000" => alu_rez <= x"00" & (a XNOR b) ;  --33
        when "1001" => alu_rez <= x"00" & (a XOR b) ;  --11
        
        -- c = 0101010111111111
        when "1010" => alu_rez <= NOT c ;  --AA00
        when "1011" => alu_rez <= c(14 downto 0) & '0';    --1010101111111110    ABFE
        when "1100" => alu_rez <= '0' & c(15 downto 1);    --0010101011111111    2AFF
        when "1101" => alu_rez <= c(14 downto 0) & c(15);  --1010101111111110    ABFE
        when "1110" => alu_rez <= c(0) & c(15 downto 1);   --1010101011111111    AAFF
        when others => alu_rez<=x"0000";
    end case;
    
end process;

alu_out <= alu_rez;

end Behavioral;
