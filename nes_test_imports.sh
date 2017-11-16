#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: nes_test_imports.sh <kernel module filename>"
  exit
fi

# get imported symbols from kernel module
symbols=$(nm -u $1 | awk '{print $2}')

# get directory that script is in so we can fine the symbols file in the same dir
scriptdir=$(dirname "$BASH_SOURCE")

# check if each symbol is exported by kernel
for symbol in $symbols; do
  # try to find symbol in list of symbols exported by kernel
  result=$(grep -w $symbol $scriptdir/NES_mini_kernel_symbols-all.txt)
  
  # if symbol wasn't found, then tell us about it
  if [[ -z $result ]]; then
  	echo $symbol
  fi
done

