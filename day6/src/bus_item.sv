// bus_item.sv
`include "uvm_macros.svh"
import uvm_pkg::*;
class bus_item extends uvm_sequence_item;

    // 随机字段（地址、数据、读写方向）
    rand bit [7:0] addr;
    rand bit [7:0] data;
    rand bit       write;  // 1=写，0=读

    `uvm_object_utils(bus_item)

    function new(string name = "bus_item");
        super.new(name);
    endfunction

    // 简单打印一下，方便调试
    function void display();
        $display("[ITEM] addr=%0h data=%0h write=%0b",
                 addr, data, write);
    endfunction

endclass
