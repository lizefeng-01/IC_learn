`timescale 1ns/1ps

// fsm.sv
module fsm (
    input  logic clk,
    input  logic rst_n,
    input  logic in,
    output logic out,
    output logic [1:0] state_dbg   // 方便在波形里看状态
);

    // 1. 定义状态类型（3 个状态）
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        S1   = 2'b01,
        S2   = 2'b10
    } state_t;

    state_t state, next;

    // 2. 状态寄存器：always_ff（时序逻辑）
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end
        else begin
            state <= next;
        end
    end

    // 3. 状态转移 + 输出逻辑：always_comb（组合逻辑）
    always_comb begin
        // 默认值（非常重要，防止 latch）
        next = state;
        out  = 1'b0;

        unique case (state)
            IDLE: begin
                // in=1 时进入 S1
                if (in)
                    next = S1;
            end

            S1: begin
                // in=1 时进入 S2，in=0 回到 IDLE
                if (in)
                    next = S2;
                else
                    next = IDLE;
            end

            S2: begin
                // 在 S2 状态输出 out=1，并回到 IDLE
                out  = 1'b1;
                next = IDLE;
            end

            default: begin
                next = IDLE;
            end
        endcase
    end

    // 4. 状态输出给外面观察（调试用）
    assign state_dbg = state;

endmodule
