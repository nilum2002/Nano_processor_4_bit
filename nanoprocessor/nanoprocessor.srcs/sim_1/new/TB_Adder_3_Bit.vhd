----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 11:12:02 PM
-- Design Name: 
-- Module Name: TB_Adder_3_Bit - Behavioral
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

entity TB_Adder_3_Bit is
--  Port ( );
end TB_Adder_3_Bit;

architecture Behavioral of TB_Adder_3_Bit is

component Adder_3_Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal a,s : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : Adder_3_Bit

    port map (
        A => a,
        S => s);
        
 process
 begin
 
    a <= "000";
    wait for 100ns;
    
    a <= "001";
    wait for 100ns;
    
    a <= "010";
    wait for 100ns;
    
    a <= "011";
    wait for 100ns;
    
    a <= "100";
    wait for 100ns;
    
    a <= "111";
    wait;
    
 end process;



end Behavioral;
