// src/bus_item.sv
class bus_item extends uvm_sequence_item;

  rand logic [7:0] a;
  rand logic [7:0] b;
       logic [7:0] sum;

  `uvm_object_utils(bus_item)

  function new(string name = "bus_item");
    super.new(name);
  endfunction

endclass
