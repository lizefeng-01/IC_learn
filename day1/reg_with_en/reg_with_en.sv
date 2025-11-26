// reg_with_en.sv
module reg_with_en(
    input  logic clk,
    input  logic rst_n,   // 低电平复位
    input  logic en,      // 使能信号
    input  logic d,       // 输入数据
    output logic q        // 输出寄存器
);

    // 时序逻辑：在时钟上升沿或复位沿触发
    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            q <= 1'b0;        // 复位，把 q 清零
        end
        else if(en) begin
            q <= d;           // 只有 en=1 时才更新 q
        end
        else begin
            q <= q;           // en=0，保持原值（其实这一句可以省略）
        end
    end

endmodule
