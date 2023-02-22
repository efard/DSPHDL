# DSPHDL

# Introduction
The aim of this project is using VHDL for Digital Signal Processing (DSP) applications. In this repo, we will learn how to generate some prevalent modulations. You can download the whole project from repository and try your desired setting (e.g. output frequency, bitwidth, etc.).\
For more information on Phase-shift keying please visit here:
https://en.wikipedia.org/wiki/Phase-shift_keying

# Prerequisites
Xilinx ISE software
ModelSim SE software
# Outputs
By running BPSK project, you will see the results similar to Fig.1

![BPSK - Copy](https://user-images.githubusercontent.com/43655559/207133471-e31dbfcb-42a8-4a80-b342-2e6bb85c07c3.png)

And by running QPSK project, the result will be simillar to Fig.2

![QPSK - Copy](https://user-images.githubusercontent.com/43655559/211168743-a3b0d0b6-71ed-44e7-ad60-0bdbddcd8d0a.png)

   
# Vivado 2021.1 Version
Please pay attention:

- My Vivado version was 2021.1.
- After the project folder created from tcl file, copy the "BPSK_Selector_21" folder to it.
- To prevent from confusing, it is recommended running tcl file "section by section" in Tcl Console.
- Location addresses of files may be different from yours.
- PC configuration may be different from yours (Mine had 12 cores).

If you finish the stages in order, you will see the following simulation:
 
![BPSK_VIVADO_21_Waveform](https://user-images.githubusercontent.com/43655559/220719483-0bf9745e-87f1-4553-a522-59bff4ca48f6.png)


NB: If you find this project useful, I will be appreciated it if you cite this page and give it a star :)
