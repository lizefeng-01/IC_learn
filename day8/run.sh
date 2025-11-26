#!/usr/bin/env bash

# ================================
# UVM Day8 一键编译 + 运行脚本（使用 -ntb_opts uvm）
# 中间文件 & 仿真可执行文件输出到 ./sim
# 用法：
#   chmod +x run.sh
#   ./run.sh
# ================================

set -e  # 有错误立刻退出

# 切到脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "✅ 当前工程目录 = $SCRIPT_DIR"

# 中间文件目录改为 sim
BUILD_DIR="$SCRIPT_DIR/sim"
mkdir -p "$BUILD_DIR"

# 1) 编译
echo "🔨 Compiling with VCS ( -ntb_opts uvm ) ..."
vcs -full64 -sverilog -ntb_opts uvm \
     +incdir+"$SCRIPT_DIR/src" \
     +timescale+1ns/1ps \
    "$SCRIPT_DIR/src/bus_if.sv" \
    "$SCRIPT_DIR/src/bus_pkg.sv" \
    "$SCRIPT_DIR/src/design.sv" \
    "$SCRIPT_DIR/src/top.sv" \
    -debug_access+all -kdb \
    -o "$BUILD_DIR/simv" \
    -l "$BUILD_DIR/comp.log"


echo "✅ Compile done, log: $BUILD_DIR/comp.log"

# 2) 运行仿真
echo "▶️ Running simulation ..."
"$BUILD_DIR/simv" -l "$BUILD_DIR/run.log"

echo "✅ Sim finished, log: $BUILD_DIR/run.log"
