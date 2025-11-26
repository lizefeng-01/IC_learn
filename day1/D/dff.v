module dff (
    input wire clk,      // 时钟信号
    input wire rst_n,    // 复位信号 (低电平有效)
    input wire d,        // 输入数据
    output reg q         // 输出数据
);

    // 时序逻辑的核心：只在时钟上升沿 或 复位下降沿 触发
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 1. 如果复位信号为低，立马清零 (最高优先级)
            q <= 1'b0;
        end
        else begin
            // 2. 否则，在时钟上升沿把 d 传给 q
            q <= d;
        end
    end

endmodule