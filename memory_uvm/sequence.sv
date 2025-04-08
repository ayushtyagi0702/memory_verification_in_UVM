class mem_sequence extends uvm_sequence #(mem_sequence_item);
  
  `uvm_object_utils(mem_sequence)
  
  function new (string name = "mem_sequence");
    super.new(name);
  endfunction
  
  task body();
    req=mem_sequence_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    $display("print in sequence",$time);
    req.print();
    send_request(req);
  
    wait_for_item_done();
    get_response(rsp);
   
  endtask
endclass
