# DSPHDL

# Introduction
This project aims to use VHDL for Digital Signal Processing (DSP) applications. In this repo, we will learn how to generate some prevalent modulations. You can download the whole project from repository and try your desired setting (e.g. output frequency, bit-width, etc.).\
For more information on Phase-shift keying please visit [here](https://en.wikipedia.org/wiki/Phase-shift_keying), and for LFM (Linear Frequency Modulation) [here](https://en.wikipedia.org/wiki/Chirp):

# Prerequisites
Xilinx ISE, ModelSim SE, Vivado softwares
# BPSK and QPSK Outputs of ISE
By running the BPSK project, you will see results similar to Fig.1

![BPSK - Copy](https://user-images.githubusercontent.com/43655559/207133471-e31dbfcb-42a8-4a80-b342-2e6bb85c07c3.png)

And by running the QPSK project, the result will be similar to Fig.2

![QPSK - Copy](https://user-images.githubusercontent.com/43655559/211168743-a3b0d0b6-71ed-44e7-ad60-0bdbddcd8d0a.png)

   
# BPSK and QPSK Outputs of Vivado
Please pay attention:

- My Vivado version was 2021.1.
- After the project folder is created from the tcl file, copy the "BPSK_Selector_21" folder to it.
- To prevent confusion, it is recommended to run the TCL file "section by section" in TCL Console.
- Location addresses of files may be different from yours.
- The PC configuration may be different from yours (Mine had 12 cores).
 
By running the .tcl file, you will have a Bock Design similar to the:
 
![BPSK_VIVADO_21_Block_Design](https://user-images.githubusercontent.com/43655559/220721557-81bbe3c7-9019-478a-a28f-d83bdd75cbb9.png)
 
If you finish the stages in order, you will see the following simulation:
 
![BPSK_VIVADO_21_Waveform](https://user-images.githubusercontent.com/43655559/220719483-0bf9745e-87f1-4553-a522-59bff4ca48f6.png)

# LFM Outputs of Vivado
By running the BPSK project, you will see results similar to this:

![Screenshot from 2024-02-18 18-31-08](https://github.com/efard/DSPHDL/assets/43655559/63bad7f7-bdac-424f-b253-1de718cc45c5)


# NB: If you find this project useful, I would appreciate it if you cite this page and give it a star :)
