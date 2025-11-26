// bus_seq.sv
`include "uvm_macros.svh"
import uvm_pkg::*;
class bus_seq extends uvm_sequence #(bus_item);

    `uvm_object_utils(bus_seq)

    // 要产生多少个事务，默认 5 个；可以在 test 里改
    int unsigned num_trans = 5;

    function new(string name="bus_seq");
        super.new(name);
    endfunction

    // UVM 规定：sequence 的主逻辑写在 body() 里
    task body();
        bus_item req;

        repeat (num_trans) begin
            // 1) 用 UVM factory 创建事务对象
            req = bus_item::type_id::create("req");

            // 2) 告诉 UVM：我要开始这个事务（standalone 时也可以这么写）
            //start_item(req);

            // 3) 随机化事务（示例：addr 为偶数）
            if (!req.randomize() with { addr[0] == 0; }) begin
                `uvm_error("SEQ", "Randomization failed for req");
            end

            // 4) 提交事务结束
            //finish_item(req);

            // 5) 打一条 UVM 日志
            `uvm_info("SEQ", $sformatf(
                "Generated item: addr=%0h data=%0h write=%0b",
                req.addr, req.data, req.write
            ), UVM_LOW)
        end
    endtask

endclass
