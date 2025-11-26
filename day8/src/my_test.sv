// src/my_test.sv
class my_test extends uvm_test;

  `uvm_component_utils(my_test)

  // 环境
  bus_env env;

  // 在类里声明 sequence 句柄（重点）
  bus_seq seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = bus_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    // 在 run_phase 里只负责 create + start
    seq = bus_seq::type_id::create("seq");
    seq.start(env.agt.sqr);

    phase.drop_objection(this);
  endtask

endclass
