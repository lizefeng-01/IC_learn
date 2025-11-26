import uvm_pkg::*;
`include "uvm_macros.svh"
class bus_item extends uvm_sequence_item;

    rand bit [7:0] addr;
    rand bit [7:0] data;
    rand bit write;

    `uvm_object_utils(bus_item)

    function new(string name = "bus_item");
        super.new(name);
    endfunction

    function void display();
        $display("[ITEM] addr=%0h data=%0h write=%0b", addr, data, write);
    endfunction

endclass
