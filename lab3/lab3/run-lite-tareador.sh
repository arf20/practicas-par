#!/bin/bash
filename=$1
shift
options=$@
echo "filename:$filename"
echo "options:$options"
rm -rf .tareador_precomputed_$filename
source /Soft/PAR/environment.bash
export LD_PRELOAD_TMP=$LD_PRELOAD
echo "Removing LD_PRELOAD"
export -n LD_PRELOAD
echo "Calling tareador"
tareador_gui.py --llvm --lite $filename -b "$options"
export LD_PRELOAD=$LD_PRELOAD_TMP
echo "Exporting again LD_PRELOAD"
