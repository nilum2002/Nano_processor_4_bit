🚀 Nanoprocessor (VHDL-Based Design)



A simple VHDL-based 8-bit nanoprocessor designed for implementation on Xilinx FPGA boards. This project supports basic instructions like MOVI, ADD, and JZR, and includes a test program to compute the sum of integers from 1 to 3.





📁 File Structure

        nanoprocessor/
        ├── nanoprocessor.xpr             # Vivado project file
        ├── nanoprocessor.srcs/           # Source directory
        │   ├── alu.vhd                   # Arithmetic Logic Unit
        │   ├── control_unit.vhd          # Control Unit
        │   ├── datapath.vhd              # Datapath Module
        │   ├── instruction_memory.vhd    # ROM: Program Instructions
        │   ├── register_file.vhd         # Register Bank
        │   ├── top.vhd                   # Top-Level Design
        │   └── ...                       # Add other VHDL source files here
        ├── nanoprocessor.sim/            # Simulation setup
        │   ├── testbench.vhd             # Simulation testbench
        │   └── waveform.wcfg             # Optional waveform configuration
        ├── README.md
        └── sum_program.asm               # Assembly code example
        ✅ Make sure to update the nanoprocessor.srcs/ section with your actual VHDL module filenames.

🧰 Prerequisites
Xilinx Vivado Design Suite (e.g., version 2019.1 or newer)

FPGA Board: e.g.,Basys 3

Optional: A UART interface or display modules for visual output

⚙️ Setup & Usage
1. Clone the Repository
bash
Copy
Edit
git clone <repository-url>
cd nanoprocessor
2. Open in Vivado
Launch Xilinx Vivado, then:

Go to File > Open Project

Select nanoprocessor.xpr

3. Run Simulation
Use Behavioral Simulation to test individual modules and the complete system.

Observe waveform results in .wcfg (optional).

4. Synthesize & Implement
Click Run Synthesis

Then Run Implementation

Finally, Generate Bitstream

5. Hardware Verification
Connect your FPGA development board.

Open Hardware Manager, connect to the device.

Program the FPGA with the generated bitstream.

Monitor outputs on LEDs, 7-segment displays, or UART.

💻 Example Program: Sum of Integers 1 to 3
A simple program to compute 1 + 2 + 3 = 6 and store it in register R7.

assembly
Copy
Edit
; Goal: R7 = 1 + 2 + 3. R0 is always 0.
; R1 = 1, R2 = 2, R3 = 3, R7 = sum

MOVI R1, 1      ; R1 <- 1
MOVI R2, 2      ; R2 <- 2
MOVI R3, 3      ; R3 <- 3
MOVI R7, 0      ; R7 <- 0 (Initialize sum)
ADD  R7, R1     ; R7 <- R7 + R1 (R7 = 0 + 1 = 1)
ADD  R7, R2     ; R7 <- R7 + R2 (R7 = 1 + 2 = 3)
ADD  R7, R3     ; R7 <- R7 + R3 (R7 = 3 + 3 = 6)
JZR  R0, 7      ; Infinite loop to halt (R0 is always 0)
📄 This code is usually stored in your instruction ROM (instruction_memory.vhd) in binary or hex format.
![image](https://github.com/user-attachments/assets/92c44a16-bd4f-41c5-93b1-732c0f5be3d5)

