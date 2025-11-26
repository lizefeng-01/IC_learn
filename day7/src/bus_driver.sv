import uvm_pkg::*;
`include "uvm_macros.svh"
class bus_driver extends uvm_driver #(bus_item);

    `uvm_component_utils(bus_driver)

    //uvm_seq_item_port #(bus_item) seq_item_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        //seq_item_port = new("seq_item_port", this);
    endfunction


    task run_phase(uvm_phase phase);
        bus_item it;

        forever begin
            seq_item_port.get_next_item(it);

            $display("[DRIVER] Got item: addr=%0h data=%0h write=%0b",
                     it.addr, it.data, it.write);

            seq_item_port.item_done();
        end
    endtask

endclass
