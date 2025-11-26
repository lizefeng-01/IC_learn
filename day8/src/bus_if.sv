// src/bus_if.sv


interface bus_if (input logic clk);
    logic       valid;
    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] sum;

    // 可选 modport，将来 driver/monitor 也可以用
    modport drv_mp (output valid, output a, output b, input sum);
    modport mon_mp (input valid, input a, input b, input sum);
endinterface
