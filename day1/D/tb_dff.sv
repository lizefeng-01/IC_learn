`timescale 1ns/1ps

module tb_dff;

    // 1. 声明信号
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // 2. 连接硬件 (例化 DUT)
    dff u_dff (
        .clk   (clk),
        .rst_n (rst_n),
        .d     (d),
        .q     (q)
    );

    // 3. 产生时钟 (周期 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 4. 产生激励 (输入数据)
    initial begin
        // 准备录制波形
        $fsdbDumpfile("dff.fsdb");
        $fsdbDumpvars(0, tb_dff);

        // 初始化
        rst_n = 0;
        d = 0;

        // 等待 20ns 后释放复位
        #20 rst_n = 1;

        // 随机测试 10 次
        repeat(10) begin
            // 为了看清波形，我们在时钟下降沿改变数据
            // 这样在上升沿采样时数据就是稳定的
            @(negedge clk); 
            d = $random; 
        end

        // 再跑一会儿看看保持特性
        #20;
        $finish;
    end

endmodule