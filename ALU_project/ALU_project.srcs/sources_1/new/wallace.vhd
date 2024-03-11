----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/05/2024 02:28:50 PM
-- Design Name: 
-- Module Name: wallace - Behavioral
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

entity wallace is
	Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           prod : out  STD_LOGIC_VECTOR (15 downto 0));
end wallace;

architecture Behavioral of wallace is

component full_adder is
port (
a : in std_logic; 
b : in std_logic; 
c :  in std_logic; 
summ : out std_logic;
carry : out std_logic
);
end component;

component half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

signal s : std_logic_vector(77 downto 0);
signal k : std_logic_vector(68 downto 0); --suma produselor partiale
signal c : std_logic_vector(68 downto 0);
begin

s(0) <= A(0) and B(0);
s(10) <= A(1) and B(0);
s(20) <= A(2) and B(0);
s(30) <= A(3) and B(0);
s(40) <= A(4) and B(0);
s(50) <= A(5) and B(0);
s(60) <= A(6) and B(0);
s(70) <= A(7) and B(0);

s(01) <= A(0) and B(1);
s(11) <= A(1) and B(1);
s(21) <= A(2) and B(1);
s(31) <= A(3) and B(1);
s(41) <= A(4) and B(1);
s(51) <= A(5) and B(1);
s(61) <= A(6) and B(1);
s(71) <= A(7) and B(1);

s(02) <= A(0) and B(2);
s(12) <= A(1) and B(2);
s(22) <= A(2) and B(2);
s(32) <= A(3) and B(2);
s(42) <= A(4) and B(2);
s(52) <= A(5) and B(2);
s(62) <= A(6) and B(2);
s(72) <= A(7) and B(2);

s(03) <= A(0) and B(3);
s(13) <= A(1) and B(3);
s(23) <= A(2) and B(3);
s(33) <= A(3) and B(3);
s(43) <= A(4) and B(3);
s(53) <= A(5) and B(3);
s(63) <= A(6) and B(3);
s(73) <= A(7) and B(3);

s(04) <= A(0) and B(4);
s(14) <= A(1) and B(4);
s(24) <= A(2) and B(4);
s(34) <= A(3) and B(4);
s(44) <= A(4) and B(4);
s(54) <= A(5) and B(4);
s(64) <= A(6) and B(4);
s(74) <= A(7) and B(4);

s(05) <= A(0) and B(5);
s(15) <= A(1) and B(5);
s(25) <= A(2) and B(5);
s(35) <= A(3) and B(5);
s(45) <= A(4) and B(5);
s(55) <= A(5) and B(5);
s(65) <= A(6) and B(5);
s(75) <= A(7) and B(5);

s(06) <= A(0) and B(6);
s(16) <= A(1) and B(6);
s(26) <= A(2) and B(6);
s(36) <= A(3) and B(6);
s(46) <= A(4) and B(6);
s(56) <= A(5) and B(6);
s(66) <= A(6) and B(6);
s(76) <= A(7) and B(6);

s(07) <= A(0) and B(7);
s(17) <= A(1) and B(7);
s(27) <= A(2) and B(7);
s(37) <= A(3) and B(7);
s(47) <= A(4) and B(7);
s(57) <= A(5) and B(7);
s(67) <= A(6) and B(7);
s(77) <= A(7) and B(7);


--stage zero - initializam sumele partiale

ha00: half_adder port map(s(1),s(10),k(1),c(1));  --k1 suma c1 carry
fa00: full_adder port map(s(20),s(2),s(11),k(2),c(2));
fa01: full_adder port map(s(30),s(21),s(12),k(3),c(3));
fa02: full_adder port map(s(40),s(31),s(22),k(4),c(4));
ha01: half_adder port map(s(13),s(4),k(5),c(5));
fa03: full_adder port map(s(50),s(41),s(32),k(6),c(6));
fa04: full_adder port map(s(23),s(14),s(5),k(7),c(7));
fa05: full_adder port map(s(60),s(51),s(42),k(8),c(8));
fa06: full_adder port map(s(33),s(24),s(15),k(9),c(9));
fa07: full_adder port map(s(70),s(61),s(52),k(10),c(10));
fa08: full_adder port map(s(43),s(34),s(25),k(11),c(11));
ha02: half_adder port map(s(16),s(7),k(12),c(12));
fa09: full_adder port map(s(71),s(62),s(53),k(13),c(13));
fa90: full_adder port map(s(44),s(35),s(26),k(14),c(14));
fa31: full_adder port map(s(72),s(63),s(54),k(15),c(15));
fa32: full_adder port map(s(45),s(36),s(27),k(16),c(16));
fa33: full_adder port map(s(73),s(64),s(55),k(17),c(17));
ha03: half_adder port map(s(46),s(37),k(18),c(18));
fa34: full_adder port map(s(74),s(65),s(56),k(19),c(19));
fa35: full_adder port map(s(75),s(66),s(57),k(20),c(20));
ha04: half_adder port map(s(76),s(67),k(21),c(21));

--stage one -- k de la 28 la 36 
ha10: half_adder port map(k(2),c(1),k(22),c(22));
fa10: full_adder port map(s(3),c(2),k(3),k(23),c(23));
fa11: full_adder port map(k(4),k(5),c(3),k(24),c(24));
fa12: full_adder port map(k(6),k(7),c(4),k(25),c(25));
fa13: full_adder port map(k(8),k(9),s(6),k(26),c(26));
ha11: half_adder port map(c(6),c(7),k(27),c(27));
fa14: full_adder port map(k(10),k(11),k(12),k(28),c(28));
ha12: half_adder port map(c(8),c(9),k(29),c(29));
fa15: full_adder port map(k(13),k(14),s(17),k(30),c(30));
fa16: full_adder port map(c(10),c(11),c(12),k(31),c(31));
fa17: full_adder port map(k(15),k(16),c(13),k(32),c(32));
fa18: full_adder port map(k(17),k(18),c(15),k(33),c(33));
fa19: full_adder port map(k(19),c(17),c(18),k(34),c(34));
ha13: half_adder port map(k(20),c(19),k(35),c(35));
ha14: half_adder port map(k(21),c(20),k(36),c(36));

--stage two -- k de la 37 la 48 urmatorul set de adunari
ha40: half_adder port map(k(23),c(22),k(37),c(37));
ha41: half_adder port map(c(23),k(24),k(38),c(38));
fa40: full_adder port map(c(24),k(25),c(5),k(39),c(39));
fa41: full_adder port map(c(25),k(26),k(27),k(40),c(40));
fa42: full_adder port map(c(26),c(27),k(28),k(41),c(41));
fa43: full_adder port map(c(28),c(29),k(30),k(42),c(42));
fa44: full_adder port map(c(30),c(31),k(32),k(43),c(43));
fa45: full_adder port map(c(32),c(16),k(33),k(44),c(44));
fa46: full_adder port map(c(33),s(47),k(34),k(45),c(45));
ha42: half_adder port map(k(35),c(34),k(46),c(46));
ha43: half_adder port map(c(35),k(36),k(47),c(47));
fa47: full_adder port map(s(77),c(21),c(36),k(48),c(48));

--stage three
ha50: half_adder port map(c(37),k(38),k(49),c(49));
fa50: full_adder port map(k(39),c(38),c(49),k(50),c(50));
fa51: full_adder port map(k(40),c(39),c(50),k(51),c(51));
fa52: full_adder port map(c(40),k(41),k(29),k(52),c(52));
fa53: full_adder port map(c(41),k(31),k(42),k(53),c(53));
fa54: full_adder port map(c(14),c(42),k(43),k(54),c(54));
fa55: full_adder port map(k(44),c(43),c(54),k(55),c(55));
fa56: full_adder port map(c(44),k(45),c(55),k(56),c(56));
fa57: full_adder port map(k(46),c(45),c(56),k(57),c(57));
fa58: full_adder port map(c(46),k(47),c(57),k(58),c(58));
fa59: full_adder port map(k(48),c(47),c(58),k(59),c(59));

--stage four
ha70: half_adder port map(c(51),k(52),k(60),c(60));
fa70: full_adder port map(c(52),k(53),c(60),k(61),c(61));
fa71: full_adder port map(c(53),k(54),c(61),k(62),c(62));
ha71: half_adder port map(k(55),c(62),k(63),c(63));
ha72: half_adder port map(k(56),c(63),k(64),c(64));
ha73: half_adder port map(k(57),c(64),k(65),c(65));
ha74: half_adder port map(k(58),c(65),k(66),c(66));
ha75: half_adder port map(k(59),c(66),k(67),c(67));
fa81: full_adder port map(c(48),c(59),c(67),k(68),c(68));


prod(0) <= s(0);
prod(1) <= k(1);
prod(2) <= k(22);
prod(3) <= k(37);
prod(4) <= k(49);
prod(5) <= k(50);
prod(6) <= k(51);
prod(7) <= k(60);
prod(8) <= k(61);
prod(9) <= k(62);
prod(10) <= k(63);
prod(11) <= k(64);
prod(12) <= k(65);
prod(13) <= k(66);
prod(14) <= k(67);
prod(15) <= k(68) or c(68);



end Behavioral;

