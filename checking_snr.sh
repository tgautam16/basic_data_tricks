#!/bin/bash

file1=$1
echo $1
grep -i "Prob(Noise)" $1/raw_*.bestprof > list_snrs.txt

awk '{split($5,array,"~"); print array[2]}' list_snrs.txt > snrs.txt

echo "The SNR values are listed in file snrs.txt"

rm -rf list_snrs.txt











