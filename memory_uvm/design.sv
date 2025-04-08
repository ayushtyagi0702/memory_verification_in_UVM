module memory(
  output reg  [7:0]dataout,
    input wire we,
    input wire clk,
  input wire  [7:0]datain,
  input wire [7:0] addr
  );
  
  
  reg [7:0] mem [0:500];
  always @(posedge clk)
    begin
      if(we) mem[addr]<=datain;
      else dataout<=mem[addr];
    end
endmodule
