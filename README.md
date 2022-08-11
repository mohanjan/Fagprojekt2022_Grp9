CAPNA
=======================

## What is CAPNA?
CAPNA (Complementary Audio Processor Network Architecture), is a network configuration of individual CAPs (Complementary Audio Processor), each running different DSP applications. This network is synthesized from a con- figuration XML file, which allows the user to specify the interconnections between multible CAPs and the program each CAP runs. The intention with this architecture is to be an uncomplicated, scalable and application tailored digital signal processing.
CAPNA enables the user to accelerate algorithms within digital signal processing (DSP) such as FIR-filtering, machine learning (ML) such as Wavenet and arithmetic calculations such as summation or multiplication. For further explanation of our project please see the [poster](Poster-GRP09-COMPUTE22-1-DSP.pdf) and the [paper](PAPER_GRP09_COMPUTE22-1.pdf)


## Usage
CAPNA is setup using an [XML configuration file](Config) and programmed using [assembly files](Programs).
Once programmed and configured, chisel3 is then used to compile the CAPNA-network into a verilog file which is called DSP.V.

## Recomended development environment
To ease any development on or using CAPNA, [vowstar](https://github.com/vowstar) has made a dockerfile from which an working development debian enviroment can be created and used. we have added verilator to this file and included it here. his original repo can be found here: [https://github.com/vowstar/chisel3-docker](https://github.com/vowstar/chisel3-docker).
The environment contains the following tools:
- [git](https://git-scm.com/)
- [curl](https://curl.se/)
- [zip/unzip](http://infozip.sourceforge.net/)
- [make](https://www.gnu.org/software/make/)
- [SBT](https://www.scala-sbt.org/)
- [Chisel3](https://github.com/chipsalliance/chisel3)
- [Verilator](https://www.veripool.org/verilator/)
- [Icaros verilog](http://iverilog.icarus.com/)
- [gtkwave](http://gtkwave.sourceforge.net/)
- [python3](https://www.python.org/)
- [build essentials(GNU debugger, g++/GNU compiler collection)]()
- [default-jdk-headless]()
- [tools for vivado]()


### Installation
To install the docker image do the following (insert instruction).

To install the tools mentioned above on a linux distribution or WSL(windows subsystem linux) copy paste the following into a bash terminal:
```bash
sudo apt-get update \
&& apt-get install -y \
git \
curl \
unzip \
zip \
verilator \
iverilog \
make \
gtkwave \
&& sudo curl -s "https://get.sdkman.io" | bash \
&& sdk install sbt \
&& sdk install java 11.0.15-tem \
```
### Uninstalling
To uninstall the tools used in the development environment cope paste the following into a bash terminal:
```bash
apt remove \
git \
curl \
unzip \
zip \
verilator \
iverilog \
make \
gtkwave \
rm -rf ~/.sdkman
```
