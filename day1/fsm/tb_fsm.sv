`timescale 1ns/1ps

// tb_fsm.sv
module tb_fsm;

    logic clk;
    logic rst_n;
    logic in;
    logic out;
    logic [1:0] state_dbg;

    // 例化 DUT
    fsm u_fsm (
        .clk      (clk),
        .rst_n    (rst_n),
        .in       (in),
        .out      (out),
        .state_dbg(state_dbg)
    );

    // 1. 时钟：10ns 周期
    initial clk = 0;
    always #5 clk = ~clk;

    // 2. dump VCD 波形
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_fsm);
    end

    // 3. 复位 + 激励
    initial begin
        rst_n = 0;
        in    = 0;

        $display("time\t rst_n in | state out");

        #12;
        rst_n = 1;   // 释放复位

        // 让 in 变化几次，触发状态机跳转
        #10 in = 1;  // 期望：IDLE -> S1
        #20 in = 1;  // 期望：S1 -> S2 -> IDLE，out 会拉高一拍
        #20 in = 0;  // 期望：回到 IDLE，不再跳转
        #20 in = 1;  // 再来一轮 IDLE->S1->S2->IDLE

        #50;
        $finish;
    end

    // 4. 打印监视
    initial begin
        $monitor("t=%0t rst_n=%0b in=%0b | state=%0d out=%0b",
                 $time, rst_n, in, state_dbg, out);
    end

endmodule
