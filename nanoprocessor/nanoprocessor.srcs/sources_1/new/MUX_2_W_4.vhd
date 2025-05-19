----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:15:54 AM
-- Design Name: 
-- Module Name: MUX_2_W_4 - Behavioral
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

entity MUX_2_W_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_W_4;

architecture Behavioral of MUX_2_W_4 is
component MUX_2_to_1
Port     ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin

 MUX_2_to_1_0 : MUX_2_to_1
    port map (
        D0 => A(0),
        D1 => B(0),
        S => S,
        Q => Q(0));
 
 MUX_2_to_1_1 : MUX_2_to_1
     port map (
        D0 => A(1),
        D1 => B(1),
        S => S,
        Q => Q(1));
        
 MUX_2_to_1_2 : MUX_2_to_1
     port map (
         D0 => A(2),
         D1 => B(2),
         S => S,
         Q => Q(2));
        
MUX_2_to_1_3 : MUX_2_to_1
    port map (
        D0 => A(3),
        D1 => B(3),
        S => S,
        Q => Q(3));

end Behavioral;
