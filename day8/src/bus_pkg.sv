package bus_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "bus_item.sv"
  `include "bus_seq.sv"
  `include "bus_driver.sv"
  `include "bus_sequencer.sv"
  `include "bus_monitor.sv"
  `include "bus_scoreboard.sv"  // ⬅ 先 include scoreboard
  `include "bus_agent.sv"
  `include "bus_env.sv"         // ⬅ 再 include env
  `include "my_test.sv"

endpackage : bus_pkg
