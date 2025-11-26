// src/bus_driver.sv
class bus_driver extends uvm_driver #(bus_item);

  `uvm_component_utils(bus_driver)

  virtual bus_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // ★ 从 config_db 里取出 vif
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", "bus_driver: virtual interface must be set for 'vif'")
    end
  endfunction

  task run_phase(uvm_phase phase);
    bus_item req;

    forever begin
      seq_item_port.get_next_item(req);

      vif.valid <= 1'b1;
      vif.a     <= req.a;
      vif.b     <= req.b;

      @(posedge vif.clk);
      vif.valid <= 1'b0;

      req.sum = vif.sum;

      seq_item_port.item_done();
    end
  endtask

endclass
