// src/bus_monitor.sv
class bus_monitor extends uvm_monitor;

  `uvm_component_utils(bus_monitor)

  uvm_analysis_port #(bus_item) ap;
  virtual bus_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  // ★ 从 config_db 里取出 vif
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", "bus_monitor: virtual interface must be set for 'vif'")
    end
  endfunction

  task run_phase(uvm_phase phase);
    bus_item item;
    forever begin
      @(posedge vif.clk);
      if (vif.valid) begin
        item = bus_item::type_id::create("item", this);
        item.a   = vif.a;
        item.b   = vif.b;
        item.sum = vif.sum;
        ap.write(item);
      end
    end
  endtask

endclass
