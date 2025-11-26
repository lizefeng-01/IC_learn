
// tb_reg_with_en.sv
module tb_reg_with_en;

    // 信号声明
    logic clk;
    logic rst_n;
    logic en;
    logic d;
    logic q;

    // 例化待测模块
    reg_with_en dut(
        .clk  (clk),
        .rst_n(rst_n),
        .en   (en),
        .d    (d),
        .q    (q)
    );

    // 1. 生成时钟：每 5ns 翻转一次 => 周期 10ns
    initial clk = 0;
    always #5 clk = ~clk;

    // 2. dump 波形（后面看 Verdi 要用）
    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars(0, tb_reg_with_en);
    end
    // 3. 复位和激励
      initial begin
        // 初始值
        rst_n = 0;
        en    = 0;
        d     = 0;

        $display("time\t rst_n en d | q");

        // 先保持复位一段时间
        #12;
        rst_n = 1;   // 释放复位

        // 此时 en=0，d 切换，q 应该保持不变
        #10;
        d = 1;
        #10;
        d = 0;

        // 使能打开，q 应该在时钟上升沿跟随 d
        #10;
        en = 1;
        d  = 1;
        #10;
        d  = 0;
        #10;
        d  = 1;

        // 再关掉使能，观察 q 是否保持
        #10;
        en = 0;
        d  = 0;

        #30;
        $finish;
       end

    // 4. 监视信号变化
       initial begin
        $monitor("t=%0t rst_n=%0b en=%0b d=%0b | q=%0b",
                 $time, rst_n, en, d, q);
       end

endmodule
