// src/bus_scoreboard.sv
class bus_scoreboard extends uvm_component;

  `uvm_component_utils(bus_scoreboard)

  // 从 monitor 接收 transaction 的端口
  uvm_analysis_imp #(bus_item, bus_scoreboard) imp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

  // monitor 调 ap.write(item) 时，最终调用到这里
  function void write(bus_item item);
    int expected;

    expected = item.a + item.b;

    if (item.sum !== expected) begin
      `uvm_error("SCB", $sformatf(
        "Mismatch: a=%0d b=%0d DUT=%0d exp=%0d",
        item.a, item.b, item.sum, expected))
    end
    else begin
      `uvm_info("SCB", $sformatf(
        "PASS: a=%0d b=%0d sum=%0d",
        item.a, item.b, item.sum),
        UVM_LOW)
    end
  endfunction

endclass
