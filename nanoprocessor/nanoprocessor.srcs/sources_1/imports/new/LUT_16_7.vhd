----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2022 19:05:18
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

type rom_type is array (0 to 15) of STD_LOGIC_VECTOR (6 downto 0);

    signal sevenSegment_ROM: rom_type := (
                   --ABCDEFG
                    "0000001", ---0
                    "1001111", ---1
                    "0010010", ---2
                    "0000110", ---3
                    "1001100", ---4
                    "0100100", ---5
                    "0100000", ---6
                    "0001111", ---7
                    "0000000", ---8
                    "0000100", ---9
                    "0001000", ---A
                    "1100000", ---b
                    "0110001", ---C
                    "1000010", ---D
                    "0110000", ---E
                    "0111000" ); ---F
begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
