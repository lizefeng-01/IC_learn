// src/top.sv


import uvm_pkg::*;
import bus_pkg::*;


module top;

  logic clk = 0;

  // 例化接口
  bus_if bus_if_inst (clk);

  // 例化 DUT
  adder dut (
    .clk   (clk),
    .valid (bus_if_inst.valid),
    .a     (bus_if_inst.a),
    .b     (bus_if_inst.b),
    .sum   (bus_if_inst.sum)
  );

  // 时钟
  always #5 clk = ~clk;

  initial begin
    
      $fsdbDumpfile("day8.fsdb");
      $fsdbDumpvars(0, top);
      
    // 把接口传给 driver 和 monitor
    uvm_config_db#(virtual bus_if)::set(
      null, "uvm_test_top.env.agt.drv", "vif", bus_if_inst);

    uvm_config_db#(virtual bus_if)::set(
      null, "uvm_test_top.env.agt.mon", "vif", bus_if_inst);

    run_test("my_test");
  end

endmodule
