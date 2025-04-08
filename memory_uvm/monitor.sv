`define MON_IF vif.MONITOR.monitor_cb

class mem_monitor extends uvm_monitor;
  virtual mem_intf vif;

  `uvm_component_utils(mem_monitor);
  mem_sequence_item transcollected;
  uvm_analysis_port #(mem_sequence_item) item_collected_port;
 
 
  function new(string name ,uvm_component parent);
    super.new(name,parent);
     transcollected = new();
    item_collected_port=new("item_collected_port",this);
  endfunction
 
  function  void build_phase(uvm_phase phase);
     super.build_phase(phase);
    `uvm_info ("MEM_MONITOR","BUILD_PHASE",UVM_LOW)
     if(!uvm_config_db#(virtual mem_intf)::get(this, "", "vif", vif))
       begin
         `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});end
    else 
      $display("getting vif in monitor");
  endfunction
  
  
  
  task run_phase(uvm_phase phase);
      @(posedge vif.clk);
      @(posedge vif.clk);
   
    
     transcollected.datain=`MON_IF.datain;
     transcollected.addr=`MON_IF.addr;
     transcollected.we=`MON_IF.we;
      @(posedge vif.clk);
      @(posedge vif.clk);
      transcollected.dataout=`MON_IF.dataout;
    $display("sequence item handle in monitor",$time);
    transcollected.print();
   
    item_collected_port.write(transcollected);
    
    
  endtask

endclass
