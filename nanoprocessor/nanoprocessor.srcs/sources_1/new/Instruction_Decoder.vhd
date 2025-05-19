----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2022 05:53:28 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Check : in STD_LOGIC_VECTOR (3 downto 0);
           RegEN : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);
           MSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           MSel2 : out STD_LOGIC_VECTOR (2 downto 0);
           Sub : out STD_LOGIC;
           JFlag : out STD_LOGIC;
           Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

process (Ins,Check) 
begin

RegEn <= "000";
JFlag <= '0';
if Ins (11 downto 10)="10" then   --MOVI
    RegEN <= Ins(9 downto 7);
    ImVal <= Ins(3 downto 0);
    LoadSel <= '1';
    

elsif Ins(11 downto 10)= "00" then --ADD
    RegEN <= Ins( 9 downto 7);
    MSel1 <= Ins( 9 downto 7);
    MSel2 <= Ins( 6 downto 4);
    LoadSel <= '0';
    Sub <= '0';

elsif Ins( 11 downto 10) ="01" then -- NEG
    RegEN <= Ins( 9 downto 7);
    MSel1 <= "000";
    MSel2 <= Ins( 9 downto 7);
    Sub <= '1';
    LoadSel <= '0';
    
elsif Ins( 11 downto 10) ="11" then -- JUMP
        MSel1 <= Ins (9 downto 7);
        if Check="0000" then
            JFlag <= '1';
            Address <= Ins( 2 downto 0);
        end if;
    

end if;
end process;


end Behavioral;
