// src/bus_env.sv
class bus_env extends uvm_env;

  `uvm_component_utils(bus_env)

  bus_agent      agt;
  bus_scoreboard scb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = bus_agent     ::type_id::create("agt", this);
    scb = bus_scoreboard::type_id::create("scb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.ap.connect(scb.imp);
  endfunction

endclass
