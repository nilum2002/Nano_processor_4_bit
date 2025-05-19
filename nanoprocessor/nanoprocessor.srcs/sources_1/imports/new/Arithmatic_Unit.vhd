----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 11:11:46 AM
-- Design Name: 
-- Module Name: Arithmatic_Unit - Behavioral
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

entity Arithmatic_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Arithmatic_Unit;

architecture Behavioral of Arithmatic_Unit is
component RCA_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

component MUX_2_W_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal bcom,b1,rca_s : STD_LOGIC_VECTOR (3 downto 0);
signal overflow : STD_LOGIC;

begin

MUX_2_W_4_0 : MUX_2_W_4
Port map  ( 
           A => b,
           B => bcom,
           S => Sel,
           Q => b1);
           
          --if sel=1 then out put is negative of B

RCA_4_0 : RCA_4
    Port map ( 
           A => A,
           B =>b1,
           C_in => Sel,
           S => rca_s,
           C_out => overflow);  
           --if sel=1
           --A+[NOT(B)+1]=A+(-B)
           --else
           --A+B+0=A+B
bcom <= NOT(B);
Carry <= overflow;          
S <= rca_s;
process(rca_s)
begin
    if rca_s="0000" and overflow='0'  then
        Zero <= '1';
    else 
        Zero <= '0';
    end if;
        
end process;

end Behavioral;
