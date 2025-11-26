module tail_lamp_ctrl2 (
    input  logic       clk,         // clock input
    input  logic       rst_n,       // async reset, active low

    input  logic       turn_left,   // turn left signal,  active high
    input  logic       turn_right,  // turn right signal, active high
    input  logic       brake,       // brake signal,      active high
    input  logic       fault,       // fault signal,      active high

    output logic [2:0] left_lamp,   // left side lamps
    output logic [2:0] right_lamp   // right side lamps
);

    // 5 个工作状态
    typedef enum logic [2:0] {
        S_IDLE,     // 直线行驶
        S_LEFT,     // 左转
        S_RIGHT,    // 右转
        S_BRAKE,    // 刹车
        S_FAULT     // 故障双闪
    } state_t;

    state_t state, next;

    // step 控制流水顺序：0~4，对应一个完整序列
    logic [2:0] step;
    // 故障双闪用
    logic       blink;

    // 是否是“需要流水效果”的模式
    logic turning_mode;
    assign turning_mode =
           (next == S_LEFT) ||
           (next == S_RIGHT) ||
           (next == S_BRAKE && (turn_left || turn_right));

    //================================================
    // 状态寄存器 + step + blink（时序逻辑）
    //================================================
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            step  <= 3'd0;
            blink <= 1'b0;
        end else begin
            state <= next;

            // 左/右转或转弯刹车时，step 在 0~4 循环
            if (turning_mode) begin
                if (step == 3'd4)
                    step <= 3'd0;
                else
                    step <= step + 3'd1;
            end else begin
                step <= 3'd0;
            end

            // 故障时翻转 blink，实现 000↔111 闪烁
            if (next == S_FAULT)
                blink <= ~blink;
            else
                blink <= 1'b0;
        end
    end

    //================================================
    // 主状态机转移逻辑（组合逻辑）
    // 优先级：fault > brake > turn_left > turn_right > idle
    //================================================
    always_comb begin
        next = state;

        if (fault)
            next = S_FAULT;
        else if (brake)
            next = S_BRAKE;
        else if (turn_left)
            next = S_LEFT;
        else if (turn_right)
            next = S_RIGHT;
        else
            next = S_IDLE;
    end

    //================================================
    // 左右转流水 pattern
    // 左：000 001 011 110 100 000 ...
    // 右：000 100 110 011 001 000 ...
    //================================================
    function automatic logic [2:0] left_pattern (input logic [2:0] s);
        case (s)
            3'd0: left_pattern = 3'b000;
            3'd1: left_pattern = 3'b001;
            3'd2: left_pattern = 3'b011;
            3'd3: left_pattern = 3'b110;
            3'd4: left_pattern = 3'b100;
            default: left_pattern = 3'b000;
        endcase
    endfunction

    function automatic logic [2:0] right_pattern (input logic [2:0] s);
        case (s)
            3'd0: right_pattern = 3'b000;
            3'd1: right_pattern = 3'b100;
            3'd2: right_pattern = 3'b110;
            3'd3: right_pattern = 3'b011;
            3'd4: right_pattern = 3'b001;
            default: right_pattern = 3'b000;
        endcase
    endfunction

    //================================================
    // 输出逻辑：根据 state / 输入 / step / blink 决定灯
    //================================================
    always_comb begin
        left_lamp  = 3'b000;
        right_lamp = 3'b000;

        unique case (state)
            // 直线：两边全灭
            S_IDLE: begin
                left_lamp  = 3'b000;
                right_lamp = 3'b000;
            end

            // 左转：右灭，左流水
            S_LEFT: begin
                left_lamp  = left_pattern(step);
                right_lamp = 3'b000;
            end

            // 右转：左灭，右流水
            S_RIGHT: begin
                left_lamp  = 3'b000;
                right_lamp = right_pattern(step);
            end

            // 刹车：
            // 直行刹车：两边 111
            // 左转+刹车：左流水，右 111
            // 右转+刹车：右流水，左 111
            S_BRAKE: begin
                if (turn_left) begin
                    left_lamp  = left_pattern(step);
                    right_lamp = 3'b111;
                end else if (turn_right) begin
                    left_lamp  = 3'b111;
                    right_lamp = right_pattern(step);
                end else begin
                    left_lamp  = 3'b111;
                    right_lamp = 3'b111;
                end
            end

            // 故障：两侧 000 ↔ 111 交替闪烁
            S_FAULT: begin
                left_lamp  = blink ? 3'b111 : 3'b000;
                right_lamp = left_lamp;
            end

            default: begin
                left_lamp  = 3'b000;
                right_lamp = 3'b000;
            end
        endcase
    end

endmodule