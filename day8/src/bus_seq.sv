// src/bus_seq.sv
class bus_seq extends uvm_sequence #(bus_item);

  `uvm_object_utils(bus_seq)

  function new(string name = "bus_seq");
    super.new(name);
  endfunction

  task body();
    bus_item item;
    repeat (10) begin
      `uvm_do(item)   // 简单写法：每次随机一个 item
    end
  endtask

endclass
