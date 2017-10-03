#!/bin/bash
cd ~/Desktop/dlx/assembler/
./assembler.sh test.asm
cat test_dump.txt > ../DLX_vhd/test_bench/test.asm.mem
cd -
