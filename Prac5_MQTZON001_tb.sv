// Code your testbench here
// or browse Examples
module ALU_tb();    
//inputs
reg clk; 
reg[7:0] A,B;
reg[3:0] ALU_Sel;
// output
wire [7:0] ALU_Out; 
//Instantiate the design under test
integer index;
ALU dut(
    .clk(clk),
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_out(ALU_Out));

initial begin //Initial means this only happens once
    $display("A  B  ALU_Sel  ALU_Out");
    $monitor("%b  %b  %b     %b",A,B,ALU_Sel,ALU_Out);
  	$dumpfile("dump.vcd");
	$dumpvars;
    clk = 1'b1;
    A = 8'b10110001;
    B = 8'b00100000;
    ALU_Sel = 4'b0000;
  
  for(index = 0; index < 15; index++)
    begin
      #5
      ALU_Sel += 4'b0001;
      clk = !clk;
      #5
      clk = !clk;
    end
//     #5  //Note: This is not synthesizable and only available in simulation
//         clk=!clk;
//     #5
//         clk=!clk;
//         ALU_Sel = 2'b01;
//     #5
//         clk=!clk;
//     #5
//         clk=!clk;
//         ALU_Sel = 2'b10;
//     #5
//         clk=!clk;
//     #5
//         clk=!clk;
//         ALU_Sel = 2'b11;
//     #5
//         clk = !clk;
    end
endmodule