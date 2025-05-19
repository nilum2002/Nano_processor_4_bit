----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2022 05:27:40 PM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is

type rom_type is array (0 to 7) of STD_LOGIC_VECTOR (11 downto 0);

    signal PROGRAM_ROM: rom_type := (
        
        "100010000011", --MOVI R1,3  --0
        "100100000001", --MOVI R2,1  --1
        "010100000000", --NEG R2     --2
        "001110010000", --ADD R7,R1  --3
        "000010100000", --ADD R1,R2  --4
        "110010000111", --JZR R1 7   --5
        "110000000011", --JZR R0 3   --6
        "110000000111"  --JZR R0 7   --7
        );
                   
begin

data <= PROGRAM_ROM(to_integer(unsigned(address)));

end Behavioral;