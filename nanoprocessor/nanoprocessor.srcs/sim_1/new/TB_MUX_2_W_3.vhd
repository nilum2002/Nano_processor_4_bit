----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:05:17 AM
-- Design Name: 
-- Module Name: TB_MUX_2_W_3 - Behavioral
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

entity TB_MUX_2_W_3 is
--  Port ( );
end TB_MUX_2_W_3;

architecture Behavioral of TB_MUX_2_W_3 is
component MUX_2_W_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal a,b,q : STD_LOGIC_VECTOR (2 downto 0);
signal s : STD_LOGIC;

begin

UUT : MUX_2_W_3

port map (
    A => a,
    B => b,
    S => s,
    Q => q);
    
process
begin
    s <='0';
    a <= "010";
    b <= "011";
    wait for 100ns;
    
    s <= '1';
    
    wait for 100ns;
    
    s <='0';
    a <= "111";
    b <= "101";
    wait for 100ns;
    
    s <= '1';
    wait ;
end process;


end Behavioral;
