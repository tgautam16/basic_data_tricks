#!/bin/bash

echo "Taking ts bestprof file directory as input"

file1=$1
echo $1 
grep -i "P_bary" $1/ts_*.bestprof > list_ps.txt

awk '{print $5}' list_ps.txt > Pvals.txt

echo "The topocentric period values are listed in file Pvals.txt"

rm -rf list_ps.txt











