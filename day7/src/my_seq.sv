`include "uvm_macros.svh"
import uvm_pkg::*;
class my_seq extends uvm_sequence #(bus_item);

    `uvm_object_utils(my_seq)

    function new(string name="my_seq");
        super.new(name);
    endfunction

    task body();
        bus_item it;

        repeat (5) begin
            it = bus_item::type_id::create("it");
            assert(it.randomize());
            start_item(it);
            finish_item(it);
        end
    endtask

endclass