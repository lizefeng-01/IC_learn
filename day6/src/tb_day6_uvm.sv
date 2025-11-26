// tb_day6_uvm.sv
`include "uvm_macros.svh"
import uvm_pkg::*;
// 一个最简单的 UVM test，用来启动我们的 bus_seq
class day6_test extends uvm_test;

    `uvm_component_utils(day6_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        bus_seq seq;

        phase.raise_objection(this);

        // 用 factory 创建一个 sequence
        seq = bus_seq::type_id::create("seq");

        // 可以在这里改 num_trans，比如发 10 个事务
        seq.num_trans = 5;

        // standalone 运行：不依赖 sequencer，直接 start(null)
        seq.start(null);

        phase.drop_objection(this);
    endtask

endclass

// 顶层模块，启动 UVM
module tb_day6_uvm;
    initial begin
        run_test("day6_test");
    end
endmodule
