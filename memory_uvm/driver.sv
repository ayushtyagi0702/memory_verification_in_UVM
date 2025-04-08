class mem_driver extends uvm_driver #(mem_sequence_item) ;
  
  virtual mem_intf vif;
  mem_sequence_item sequence1;
 
  `uvm_component_utils(mem_driver);
  function new (string name="mem_driver", uvm_component parent);
    super.new(name, parent);
  endfunction 


  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
    
    sequence1 = new();
    
     `uvm_info ("MEM_SEQUENCER","BUILD_PHASE",UVM_LOW)
    if(!uvm_config_db#(virtual mem_intf)::get(this, "", "vif", vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
    
endfunction
  
  task run_phase(uvm_phase phase);
    forever
      begin
        if(sequence1.we)
          begin
        seq_item_port.get_next_item(req);
        $display("print in driver",$time);
        req.print();
        
        vif.datain<=req.datain;
        vif.addr<=req.addr;
        vif.dataout<=req.dataout;
        vif.we <= 1;
            
 
        
        seq_item_port.item_done();
            
           @(posedge vif.clk);
            vif.we <= 0;
            vif.addr<=req.addr;
          end
      end
  endtask
endclass
