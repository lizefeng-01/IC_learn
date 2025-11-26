module fsm(input logic clk,input logic rst_n,input logic in,output logic out);always_ff @(posedge clk) if(!rst_n) state<=IDLE; else   state <= next;endmodule

typedef enum logic [1:0] {IDLE, S1, S2} state_t;

state_t state;
