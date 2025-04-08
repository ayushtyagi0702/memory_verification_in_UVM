class mem_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(mem_scoreboard);
  uvm_analysis_imp#(mem_sequence_item,mem_scoreboard)  item_collected_export;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    item_collected_export=new("item_collected_export",this);
  endfunction
   
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MEM_SCOREBOARD","BUILD_PHASE",UVM_LOW)

  endfunction
  
  virtual function void write(mem_sequence_item pkt);
    $display("SCB ::pkt received");
    pkt.print();

    if(pkt.datain == pkt.dataout)
      begin
        $display("Result is expected");
      end
      else
        begin
        $error("Wrong output");
        end
    $display("adderess = %0d, input data = %0d, Output data= %0d", pkt.addr,pkt.datain,pkt.dataout);
    
    
  endfunction

 
endclass
