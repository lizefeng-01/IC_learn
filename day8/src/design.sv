// src/design.sv

module adder (
    input  logic       clk,
    input  logic       valid,
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] sum
);
    // 简单写法：valid=1 时输出 a+b，否则 0
    always_comb begin
        if (valid)
            sum = a + b;
        else
            sum = '0;
    end
endmodule
