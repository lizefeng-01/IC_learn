#!/bin/bash
set -e

SRC=./src
SIM=./sim

mkdir -p $SIM

vcs -full64 -sverilog -debug_access+all -kdb -ntb_opts uvm \
    $SRC/bus_item.sv \
    $SRC/bus_sequencer.sv \
    $SRC/bus_driver.sv \
    $SRC/my_seq.sv \
    $SRC/my_test.sv \
    $SRC/top.sv \
    -o $SIM/simv

echo "[INFO] Compile done: $SIM/simv"
