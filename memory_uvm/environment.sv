class mem_environment extends uvm_env;
  `uvm_component_utils(mem_environment);
  function new(string name,uvm_component parent);
  super.new(name,parent);
  endfunction
   mem_agent agent;
   mem_scoreboard scoreboard;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   agent=mem_agent ::type_id::create("mem_agent",this);
    scoreboard=mem_scoreboard :: type_id::create("mem_scoreboard",this);
    `uvm_info ("MEM_ENVIRONMENT","BUILD_PHASE",UVM_LOW);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    
    agent.monitor.item_collected_port.connect(scoreboard.item_collected_export);
    
  endfunction
  
endclass
