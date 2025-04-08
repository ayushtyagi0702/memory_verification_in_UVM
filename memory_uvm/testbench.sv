`include "uvm_macros.svh"
`include "package.sv"
`include "interface.sv"

module top;
  import uvm_pkg::*;
  import pack::*;
  
  bit clk;
  bit reset;
  always #5 clk=~clk;
  
  initial
    begin
     reset =1;
      #5 reset=0;
    end
 
  
  mem_intf inf(clk,reset);
  
  memory memory_inst(
    .datain(inf.datain),
    .dataout(inf.dataout),
    .addr(inf.addr),
    .we(inf.we),
    .clk(inf.clk)
  
  );
   initial
    begin
      uvm_config_db#(virtual mem_intf)::set(null,"*","vif",inf);
    end
  
  
  initial begin
    run_test("mem_test");
  end
  initial
    begin
      #1000;
      $finish();
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
