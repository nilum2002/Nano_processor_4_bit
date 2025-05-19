----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 10:07:20 PM
-- Design Name: 
-- Module Name: TB_RCA_ADDSUB - Behavioral
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

entity TB_RCA_ADDSUB is
--  Port ( );
end TB_RCA_ADDSUB;

architecture Behavioral of TB_RCA_ADDSUB is
component RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           Sub: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

SIGNAL a0,a1,a2,a3,b0,b1,b2,b3,c_in,c_out,s0,s1,s2,s3,sub,zero: std_logic; 
begin
UUT : RCA_4
PORT MAP(
    A(0) => a0, 
    A(1) => a1,
    A(2) => a2,
    A(3) => a3,
    B(0) => b0,
    B(1) => b1,
    B(2) => b2,
    B(3) => b3,
    Zero => zero,
    C_in =>c_in,
    Sub => sub, 
    C_out =>c_out, 
    S(0) => s0,
    S(1) => s1, 
    S(2) => s2, 
    S(3) => s3);
    
process 
begin

sub <= '0';
--0000+0110
a0 <= '0'; --Index a1 <= '0';
a1 <= '0';
a2 <= '0';
a3 <= '0';

b0 <= '0';
b1 <= '1';
b2 <= '1';
b3 <= '0';
c_in <= '0'; 

wait for 100ns;

--0101+0101
a0 <= '1';
a1 <= '0';
a2 <= '1';
a3 <= '0';

b0 <= '1';
b1 <= '0';
b2 <= '1';
b3 <= '0';
wait for 100ns;

sub <= '1';
--0111-0101
a0 <= '1'; --Given a1 <= '1'; '
a1 <= '1';
a2 <= '1';
a3 <= '0';

b0 <= '1';
b1 <= '0';
b2 <= '1';
b3 <= '0';

wait for 100ns;

--1011-0101
a0 <= '1';
a1 <= '1';
a2 <= '0';
a3 <= '1';

b0 <= '1';
b1 <= '0';
b2 <= '1';
b3 <= '0';
 


wait;
end process;


end Behavioral;
