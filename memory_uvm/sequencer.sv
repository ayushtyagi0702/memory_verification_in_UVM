class mem_sequencer extends uvm_sequencer #(mem_sequence_item) ;
  `uvm_component_utils(mem_sequencer);
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info ("MEM_SEQUENCER","BUILD_PHASE",UVM_LOW)
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("SEQUENCER", "START_OF_SIMULATION_PHASE", UVM_LOW)
     
    uvm_top.print_topology ();

  endfunction: start_of_simulation_phase
endclass
