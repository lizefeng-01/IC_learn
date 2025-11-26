#!/bin/bash
set -e

SIM=./sim/simv

if [[ ! -x $SIM ]]; then
    echo "[ERROR] simv not found. Run ./compile.sh first."
    exit 1
fi

$SIM +UVM_TESTNAME=my_test
