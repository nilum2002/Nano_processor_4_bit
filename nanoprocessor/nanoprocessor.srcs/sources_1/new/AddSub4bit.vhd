----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2025 11:08:59 AM
-- Design Name: 
-- Module Name: AddSub_4bit - Behavioral
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

entity AddSub4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Op : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AddSub4bit;

architecture Behavioral of AddSub4bit is

COMPONENT FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end COMPONENT;

SIGNAL B_modified, C_generated, Q_out : std_logic_vector (3 downto 0);

begin

B_modified(0) <= B(0) XOR Op;
B_modified(1) <= B(1) XOR Op;
B_modified(2) <= B(2) XOR Op;
B_modified(3) <= B(3) XOR Op;

FA0: FA
port map(
A => A(0),
B => B_modified(0),
C_in => Op,
S => Q_out(0),
C_out => C_generated(0)
);

FA1: FA
port map(
A => A(1),
B => B_modified(1),
C_in => C_generated(0),
S => Q_out(1),
C_out => C_generated(1)
);

FA2: FA
port map(
A => A(2),
B => B_modified(2),
C_in => C_generated(1),
S => Q_out(2),
C_out => C_generated(2)
);

FA3: FA
port map(
A => A(3),
B => B_modified(3),
C_in => C_generated(2),
S => Q_out(3),
C_out => C_generated(3)
);

Q <= Q_out;
Zero <= NOT (Q_out(0) OR Q_out(1) OR Q_out(2) OR Q_out(3));
Overflow <= C_generated(3) XOR C_generated(2);

end Behavioral;