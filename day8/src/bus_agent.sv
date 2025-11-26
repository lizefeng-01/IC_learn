// src/bus_agent.sv
class bus_agent extends uvm_agent;

  `uvm_component_utils(bus_agent)

  bus_driver    drv;
  bus_sequencer sqr;
  bus_monitor   mon;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    drv = bus_driver   ::type_id::create("drv", this);
    sqr = bus_sequencer::type_id::create("sqr", this);
    mon = bus_monitor  ::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction

endclass
