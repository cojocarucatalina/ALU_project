library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity booth_multiplier is
  Port ( 
  signal clk: in STD_LOGIC;
  signal rst: in STD_LOGIC;
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal P : out STD_LOGIC_VECTOR (31 downto 0)
  );
end booth_multiplier;

architecture Behavioral of booth_multiplier is



component addition is
  Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ti : in STD_LOGIC;
  signal S : out STD_LOGIC_VECTOR (15 downto 0);
  signal Tout: out STD_LOGIC
   );
end component;

component subtraction is
  Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ti : in STD_LOGIC;
  signal S : out STD_LOGIC_VECTOR (15 downto 0);
  signal Tout: out STD_LOGIC
   );
end component;


type states is (INIT, LOOPstart, SUB_AB, ADD_AB, SHRA, DEC);
signal current_state : states:= INIT;
signal next_state: states:= INIT;

signal Q : STD_LOGIC_VECTOR(15 downto 0);
signal Qr : STD_LOGIC;
signal Qcond : STD_LOGIC_VECTOR(1 downto 0);
signal A, B, ABadd, ABsub : STD_LOGIC_VECTOR(15 downto 0);
signal C : INTEGER := 16;
signal Tadd, Tsub: STD_LOGIC;

begin

QCond <= Q(0) & Qr;
P <= A(14 downto 0) & Q;


ADD: addition port map(A, B, '0', ABadd, Tadd);
SUB: subtraction port map(A, B, '0', ABsub, Tsub);



process(clk, rst)
begin
    if rst = '1' then
        current_state <= INIT;
    elsif clk = '1'  and clk'event then
        current_state <= next_state;
    end if;
end process;


--Calcul next_state
process(current_state, Qcond, C)
begin
    case current_state is
        when INIT => 
            next_state <= LOOPstart;
         when LOOPstart =>
             if Qcond = "10" then
                 next_state <= SUB_AB;
             elsif QCond = "01" then
                 next_state <= ADD_AB;
             else
                 next_state <= SHRA;
             end if;
         when SUB_AB =>
            next_state <= SHRA;
         when ADD_AB =>
            next_state <= SHRA;
         when SHRA => 
            next_state <= DEC;
         when DEC =>
            if C /= 0 then
                next_state <= LOOPstart;
            end if;
         when others =>
            next_state <= INIT;
      end case;
end process;     


--Operatii din stari


process(current_state)
begin
    case current_state is
        when INIT =>
            B <= X;
            Q <= Y;
            Qr <= '0';
            A <= (others => '0');
            C <= 16;
        WHEN LOOPstart=>
            
        when ADD_AB =>
            A <= ABadd;
        when SUB_AB =>
            A <= ABsub;
        when SHRA =>
            Qr <= Q(0);    
            Q <= A(0) & Q(15 downto 1);
            A <= A(15) & A(15 downto 1);
        when DEC =>
            C <= C - 1;
    end case;
end process;


end Behavioral;
