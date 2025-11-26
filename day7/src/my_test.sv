`include "uvm_macros.svh"
import uvm_pkg::*;

class my_test extends uvm_test;

    `uvm_component_utils(my_test)

    bus_sequencer m_seqr;
    bus_driver    m_drv;
    my_seq        m_seq;

    function new(string n, uvm_component p);
        super.new(n,p);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_seqr = bus_sequencer::type_id::create("m_seqr", this);
        m_drv  = bus_driver   ::type_id::create("m_drv" , this);
        m_seq  = my_seq       ::type_id::create("m_seq");
    endfunction

    function void connect_phase(uvm_phase phase);
        m_drv.seq_item_port.connect(m_seqr.seq_item_export);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        m_seq.start(m_seqr);
        phase.drop_objection(this);
    endtask

endclass