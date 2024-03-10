// Code your design here
module vending_machine(in,clk,rst,out,change);
  input [1:0]in;
  input clk,rst;
  output reg [1:0]change; 
  output reg out;

parameter s0 =2'b00;
parameter s1 =2'b01;
parameter s2 =2'b10;
 
  reg[1:0] c_state ,n_state;

 always@(posedge clk)
 if(rst)
 begin
    c_state=2'b00;
    n_state=2'b00;
    change =2'b00;
  end 
  else 
  c_state=n_state;

always@(*)
  case(c_state)
  s0: // state for 0 rs
  if(in==0)
  begin 
    n_state=s0;
    out=0;
    change =0;
  end
  else if(in==2'b01)
  begin
      n_state=s1;
      out=0;
      change = 0;
  end 
  else if(in==2'b10)
  begin 
     n_state=s2;
     out=0;
     change =0;
  end 


  s1: // state for 0 rs
  if(in==0)
  begin 
    n_state=s0;
    out=0;
    change =2'b01;
  end
  else if(in==2'b01)
  begin
      n_state=s2;
      out=0;
      change =0;
  end 
  else if(in==2'b10)
  begin 
     n_state=s0;
     out=1;
     change =0;
  end 

   
  s2: // state for 0 rs
  if(in==0)
  begin 
    n_state=s0;
    out=0;
    change =0;
  end
  else if(in==2'b01)
  begin
      n_state=s0;
      out=1;
      change =0;
  end 
  else if(in==2'b10)
  begin 
      n_state=s0;
      out=1;
     change =2'b01;
  end 
  endcase 
endmodule