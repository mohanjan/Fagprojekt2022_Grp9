CAPNA
=======================

## What is CAPNA?
CAPNA (Complementary Audio Processor Network Ar- chitecture), is a network configuration of individual CAPs (Complementary Audio Processor), each running different DSP applications. This network is synthesized from a con- figuration XML file, which allows the user to specify the interconnections between multible CAPs and the program each CAP runs. The intention with this architecture is to be an uncomplicated, scalable and application tailored digital signal processing.
CAPNA enables the user to accelerate algorithms within digital signal processing (DSP) such as FIR-filtering, machine learning (ML) such as Wavenet and arithmetic calculations such as summation or multiplication. For further explanation of our project please see the [poster](Poster-GRP09-COMPUTE22-1-DSP.pdf) and the [paper](PAPER_GRP09_COMPUTE22-1.pdf)


## Usage
CAPNA is setup using an [XML configuration file](Config) and programmed using [assembly files](Programs).
Once programmed and configured, chisel3 is then used to compile the CAPNA-network into a verilog file which is called DSP.V.

## Recomended development environment
To ease any development on or using CAPNA, we've made a dockerfile from which an working development ubuntu enviroment can be created and used. 
The environment contains the following tools:
- [SDKMan](https://sdkman.io/) (An java SDK manager)
- [Java version 11 from Termurin](https://adoptium.net/).
- [SBT 1.6.2](https://www.scala-sbt.org/)
- [Chisel3](https://github.com/chipsalliance/chisel3)
- [Verilator](https://www.veripool.org/verilator/)
- [Icaros verilog](http://iverilog.icarus.com/)
### Instalation
To install the docker image do the following (insert instruction).

To install the tools mentioned above on a linux distribution or WSL(windows subsystem linux) the following (instert instructions)
