----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 09:13:01 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reg_7 : out STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Register_Bank
Port ( Clk : in STD_LOGIC;
           RegEN : in STD_LOGIC_VECTOR (2 downto 0);
           Data : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_W_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8_W_4 
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
end component;

component MUX_2_W_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Arithmatic_Unit 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;


component Adder_3_Bit 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component P_Counter 
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Instruction_Decoder 
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
end component;

component Program_Rom 
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal SClk,load_sel,sub,jflag : STD_LOGIC;
signal Pointer,MemSel,reg_en, jump_add,adderOut,mux_1,mux_2 : STD_LOGIC_VECTOR (2 downto 0);
signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal IVal,result,reg_data,r0,r1,r2,r3,r4,r5,r6,r7,data1,data2 :STD_LOGIC_VECTOR (3 downto 0);


begin

Slow_Clk_0 : Slow_Clk

port map (
    Clk_in=> Clk,
    Clk_out => SClk);
    
P_Counter_0 : P_Counter

port map(
           D => Pointer,
           Res => Reset,
           Clk => SClk,
           Q => MemSel);

Program_Rom_0 : Program_Rom
port map (
           address => MemSel,
           data => Instruction);

Instruction_Decoder_0 : Instruction_Decoder
port map (
           Ins => Instruction,
           Check => data1,
           RegEN => reg_en,
           LoadSel => load_sel,
           ImVal => IVal,
           MSel1 => mux_1,
           MSel2 => mux_2,
           Sub => sub,
           JFlag => jflag,
           Address => jump_add );

MUX_2_W_4_0 : MUX_2_W_4
 Port map( 
    --load_sel = 0 , result of add sub (A)
    --load_sel =1 , Immediate Value (B)
               A => result,
               B => IVal,
               S => load_sel,
               Q => reg_data);

Register_Bank_0 : Register_Bank
Port map ( 
           Clk => SClk,
           RegEN => reg_en,
           Data => reg_data,
           Res => Reset,
           R0 => r0,
           R1 => r1,
           R2 => r2,
           R3 => r3,
           R4 => r4,
           R5 => r5,
           R6 => r6,
           R7 => r7 );

MUX_8_W_4_0 : MUX_8_W_4
Port map ( 
           A0 => r0,
           A1 => r1,
           A2 => r2,
           A3 => r3,
           A4 => r4,
           A5 => r5,
           A6 => r6,
           A7 => r7,
           S => mux_1,
           Q => data1);

MUX_8_W_4_1 : MUX_8_W_4
Port map ( 
           A0 => r0,
           A1 => r1,
           A2 => r2,
           A3 => r3,
           A4 => r4,
           A5 => r5,
           A6 => r6,
           A7 => r7,
           S => mux_2,
           Q => data2);

Arithmati_Unit_0 : Arithmatic_Unit
Port map( 
           A => data1,
           B => data2,
           Sel => sub,
           S => result,
           Zero => Zero,
           Carry => Overflow);

Adder_3_Bit_0 : Adder_3_Bit
Port map ( 
           A => MemSel,
           S => adderOut);

MUX_2_W_3_0 : MUX_2_W_3
    Port map (
           A => adderOut,
           B => jump_add,
           S => jflag,
           Q => Pointer);

LUT_16_7_0 : LUT_16_7
    Port map ( 
           address => r7,
           data => Output);
           
Reg_7 <=r7;
Anode <= "1110";



end Behavioral;
