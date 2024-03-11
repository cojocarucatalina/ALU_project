----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2023 03:15:38 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity main is
port(
    a : in std_logic_vector(7 downto 0);--:=x"33";
    b : in std_logic_vector(7 downto 0);--:=x"22";
    c : in std_logic_vector(15 downto 0);--:=b"0101010111111111"; --55FF
    clk: in std_logic;
    an: out STD_LOGIC_VECTOR(3 downto 0);
    cat: out STD_LOGIC_VECTOR(6 downto 0);
    --sout: out std_logic_vector(15 downto 0);
    alu_sel: in STD_LOGIC_VECTOR(3 downto 0)); --impartire
    --sw: in std_logic_vector(15 downto 0);
    --led: in std_logic_vector(15 downto 0);
    --btn: in std_logic_vector(4 downto 0));
end main;

architecture Behavioral of main is

signal sout: std_logic_vector(15 downto 0);
signal en: std_logic := '1';

component MPG is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

component ALU is
    Port ( clk: in std_logic; 
           a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           c : in STD_LOGIC_VECTOR(15 downto 0);
           alu_sel : in STD_LOGIC_VECTOR(3 downto 0);
           alu_out : out STD_LOGIC_VECTOR(15 downto 0));
end component;


component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(15 downto 0);
           an: out STD_LOGIC_VECTOR(3 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component;


--component ALU
--Port(--intarri iesire 7 downto 0)
--signal a: 
begin

--monopulse: MPG port map(en, alu_sel(3 downto 0), clk);
--monopulse: MPG port map (clk,btn(0), en);
monopulse: MPG port map (clk, '1', en);
ual: ALU port map (clk, x"33", x"22", b"0101010111111111", alu_sel, sout);
--ual: ALU port map (clk, a, b, c, alu_sel, sout);
--sout<= sout_ssd;
display : SSD port map (clk, sout, an, cat);

--process
--begin

--alu_sel <= x"0";

--for i in (0 to 15) loop

--alu_sel <= alu_sel+x"1";
--wait for (100ns);

--end loop;


--wait;

--end process;

end Behavioral;
