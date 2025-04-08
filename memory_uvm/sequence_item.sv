class mem_sequence_item extends uvm_sequence_item;
  
  rand bit [7:0]datain;
  rand bit [7:0]addr;
  bit we=1;
  bit [7:0]dataout;
  
  `uvm_object_utils_begin(mem_sequence_item)
  `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(datain, UVM_ALL_ON)
  `uvm_field_int(dataout, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "mem_sequence_item");
    super.new(name);
  endfunction
endclass
