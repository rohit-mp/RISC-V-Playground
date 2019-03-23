# RISC-V-Playground
This repository contains implementation of basic programs in RISC-V

## Installation steps
Install the required ubuntu packages by 
```
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config libexpat-dev
```
Clone the riscv-tools repository by 
```
https://github.com/riscv/riscv-tools.git
```
Enter the cloned repository and run and instruct git to update it's submodules by
```
git submodule update --init --recursive
```
Set the RISCV and PATH variables to the toolchain directory by
```
export RISCV=/path/to/install/riscv/toolchain
export PATH=$PATH:$RISCV/bin
```
Finally, build using the command
```
CC=gcc-5 CXX=g++-5 ./build.sh
```
