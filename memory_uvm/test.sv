class mem_test extends uvm_test;
  `uvm_component_utils(mem_test);
  function new(string name="mem_test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   mem_environment env;
  mem_sequence seq_h;
  
  function void build_phase(uvm_phase phase);
      env=mem_environment ::type_id::create ("mem_environment",this);
    seq_h=mem_sequence ::type_id::create ("mem_sequence",this);
  `uvm_info("MEM_TEST","BUILD_PHASE",UVM_LOW)
  endfunction
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_h.start(env.agent.sequencer);
    phase.drop_objection(this);
  endtask
 
endclass
