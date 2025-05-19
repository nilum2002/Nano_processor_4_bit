----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 11:03:22 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component Nanoprocessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reg_7 : out STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk :  STD_LOGIC :='0';
signal Reset :  STD_LOGIC;
signal Overflow :  STD_LOGIC;
signal Zero :  STD_LOGIC;
signal Reg_7 :  STD_LOGIC_VECTOR (3 downto 0);
signal Output :  STD_LOGIC_VECTOR (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Nanoprocessor
port map (
           Clk => Clk,
           Reset => Reset,
           Overflow => Overflow,
           Zero => Zero,
           Reg_7 => Reg_7,
           Output => Output,
           Anode => Anode);
           
process
begin
    wait for 2ns;
    Clk <= NOT(Clk);
end process;

process
begin
    Reset <= '1';
    wait for 100ns;
    
    Reset <= '0';
    wait;
end process;
           



end Behavioral;
