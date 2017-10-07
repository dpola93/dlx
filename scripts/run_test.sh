#!/bin/bash
cd ~/Desktop/dlx/assembler/
./assembler.sh $1.asm
cat "$1"_dump.txt > ../DLX_vhd/test_bench/test.asm.mem
cd -
