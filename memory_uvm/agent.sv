class mem_agent extends uvm_agent;
  `uvm_component_utils(mem_agent);
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  mem_driver driver;
  mem_sequencer sequencer;
  mem_monitor monitor;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active==UVM_ACTIVE)
      begin
       driver    = mem_driver::type_id::create("driver", this);
      sequencer = mem_sequencer::type_id::create("sequencer", this);
    end
    monitor=mem_monitor::type_id ::create ("monitor",this);
    `uvm_info ("MEM_AGENT","BUILD_PHASE",UVM_LOW)
  endfunction
  
    function void connect_phase(uvm_phase phase);
       `uvm_info("MEM_AGENT","CONNECT_PHASE",UVM_LOW)
      if(get_is_active()== UVM_ACTIVE) begin
        driver.seq_item_port.connect(sequencer.seq_item_export);
      end
  endfunction
  
 
endclass
