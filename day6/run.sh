
#!/bin/bash
# Day6 UVM 一键编译 + 运行（代码在 src/，中间文件在 sim/）

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SRC_DIR="$SCRIPT_DIR/src"
SIM_DIR="$SCRIPT_DIR/sim"

mkdir -p "$SIM_DIR"

echo "📂 当前目录: $SCRIPT_DIR"
echo "📁 源码目录: $SRC_DIR"
echo "📁 仿真输出目录: $SIM_DIR"

echo "▶️ 编译 Day6 (-ntb_opts uvm)..."

vcs -full64 -sverilog \
    -debug_access+all -kdb \
    -ntb_opts uvm \
    -timescale=1ns/1ps\
    "$SRC_DIR/bus_item.sv" \
    "$SRC_DIR/bus_seq.sv" \
    "$SRC_DIR/tb_day6_uvm.sv" \
    -o "$SIM_DIR/simv" \
    -l "$SIM_DIR/comp.log"

echo "✅ 编译完成: $SIM_DIR/comp.log"

echo "▶️ 运行仿真..."

"$SIM_DIR/simv" -l "$SIM_DIR/run.log"

echo "✅ 仿真结束!"
echo "📄 运行日志: $SIM_DIR/run.log"
