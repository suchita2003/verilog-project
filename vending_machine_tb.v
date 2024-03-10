module vending_machine_tb;
// input declaration 
wire out;
  wire [1:0] change;
  
  reg clk,rst;
  reg [1:0]in;

// instantiation 
vending_machine uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change (change));

initial begin 
           $monitor($time,"clk=%b,rst=%b,in=%b,out=%b,change=%b",clk,rst,in,out,change);
    // initialization 
    $dumpfile("vending_machine.vcd");
    $dumpvars(0,vending_machine_tb);

 rst=1;
    clk=0;
    
    #6 rst=0;
    in=2;
    #11 in=2;
    #16 in=2;
    
    
    #30 $finish;
end
always #5 clk=~clk;
endmodule