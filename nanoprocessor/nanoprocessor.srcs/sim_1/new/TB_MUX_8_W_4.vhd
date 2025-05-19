----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:49:41 AM
-- Design Name: 
-- Module Name: TB_MUX_8_W_4 - Behavioral
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

entity TB_MUX_8_W_4 is
--  Port ( );
end TB_MUX_8_W_4;

architecture Behavioral of TB_MUX_8_W_4 is
component MUX_8_W_4
    Port ( 
       A0 : in STD_LOGIC_VECTOR (3 downto 0);
       A1 : in STD_LOGIC_VECTOR (3 downto 0);
       A2 : in STD_LOGIC_VECTOR (3 downto 0);
       A3 : in STD_LOGIC_VECTOR (3 downto 0);
       A4 : in STD_LOGIC_VECTOR (3 downto 0);
       A5 : in STD_LOGIC_VECTOR (3 downto 0);
       A6 : in STD_LOGIC_VECTOR (3 downto 0);
       A7 : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (2 downto 0);
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal a0,a1,a2,a3,a4,a5,a6,a7,q : STD_LOGIC_VECTOR ( 3 downto 0);
signal s : STD_LOGIC_VECTOR (2 downto 0);
begin

UUT : MUX_8_W_4

port map (
    A0 => a0,
    A1 => a1,
    A2 => a2,
    A3 => a3,
    A4 => a4,
    A5 => a5,
    A6 => a6,
    A7 => a7,
    Q => q,
    S => s );
    
process 
begin

    s <= "000";
    
    a0 <= "0000";
    a1 <= "0001";
    a2 <= "0010";
    a3 <= "0011";
    a4 <= "0100";
    a5 <= "0101";
    a6 <= "0110";
    a7 <= "0111";
    
    wait for 50 ns;
    
    s <= "001";
    wait for 50 ns;
    
    s <= "010";
    wait for 50 ns;
    
    s <= "011";
    wait ;
    end process;


end Behavioral;
