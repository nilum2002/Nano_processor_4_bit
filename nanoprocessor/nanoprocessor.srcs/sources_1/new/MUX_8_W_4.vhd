----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:32:19 AM
-- Design Name: 
-- Module Name: MUX_8_W_4 - Behavioral
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

entity MUX_8_W_4 is
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_W_4;

architecture Behavioral of MUX_8_W_4 is

component Mux_8_to_1
Port     ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC := '1';
           Y : out STD_LOGIC);
end component;

begin

Mux_8_to_1_0 : Mux_8_to_1
port map (
    D(0)=> A0(0),
    D(1)=> A1(0),
    D(2)=> A2(0),
    D(3)=> A3(0),
    D(4)=> A4(0),
    D(5)=> A5(0),
    D(6)=> A6(0),
    D(7)=> A7(0),
    S => S,
    Y => Q(0));

Mux_8_to_1_1 : Mux_8_to_1
port map (
    D(0)=> A0(1),
    D(1)=> A1(1),
    D(2)=> A2(1),
    D(3)=> A3(1),
    D(4)=> A4(1),
    D(5)=> A5(1),
    D(6)=> A6(1),
    D(7)=> A7(1),
    S => S,
    Y => Q(1));

Mux_8_to_1_2 : Mux_8_to_1
port map (
    D(0)=> A0(2),
    D(1)=> A1(2),
    D(2)=> A2(2),
    D(3)=> A3(2),
    D(4)=> A4(2),
    D(5)=> A5(2),
    D(6)=> A6(2),
    D(7)=> A7(2),
    S => S,
    Y => Q(2));
    
Mux_8_to_1_3 : Mux_8_to_1
    port map (
        D(0)=> A0(3),
        D(1)=> A1(3),
        D(2)=> A2(3),
        D(3)=> A3(3),
        D(4)=> A4(3),
        D(5)=> A5(3),
        D(6)=> A6(3),
        D(7)=> A7(3),
        S => S,
        Y => Q(3));    


end Behavioral;
