// Code your design here
module ALU(
    input clk,
  	input [7:0] A,B,
  	input [3:0] ALU_Sel,
  	output reg [7:0] ALU_out
);

  reg [7:0] ALU_result;

always@(posedge clk) //Triggered on rising edge clock
    begin
      	ALU_out = 8'b00000101;
        case(ALU_Sel)
            4'b0000:  //Manually enumerate Addition = 0000
                ALU_result = A + B;
            
            4'b0001:  //Manually enumerate Subtraction1 = 0001
                ALU_result = A - B;

            4'b0010:  //Manually enumerate multiplication = 0010
                ALU_result = A * B;
            
            4'b0011:  //Manually enumerate Division = 0011
                ALU_result = A / B;
          
          	4'b0100:  //Manually enumerate addA = 0100
                ALU_result += A;
          
          	4'b0101:  //Manually enumerate mulA = 0101
                ALU_result *= A;
          
          	4'b0110:  //Manually enumerate MAC = 0110
              	ALU_result += (A * B);
          
          	4'b0111:  //Manually enumerate ROL = 0111
              	ALU_result = {A[6:0],A[7:0]};
          
          	4'b1000:  //Manually enumerate ROR = 1000
              	ALU_result = {A[0],A[7:1]} ;
          
          	4'b1001:  //Manually enumerate AND = 1001
                ALU_result = A & B;
          
          	4'b1010:  //Manually enumerate OR = 1010
                ALU_result = A | B;
          
          	4'b1011:  //Manually enumerate XOR = 1011
                ALU_result = A ^ B;
          
          	4'b1100:  //Manually enumerate NAND = 1100
              	ALU_result = ~(A & B);
          
          	4'b1101:  //Manually enumerate ETH = 1101 with ternary
              	ALU_result = (A == B) ? 8'b11111111 :8'b00000000;
          
          	4'b1110:  //Manually enumerate GTH = 1110 with ternary
              	ALU_result = (A > B) ? 8'b11111111 :8'b00000000;
          
          	4'b1111:  //Manually enumerate LTH = 1111 with ternary
              	ALU_result = (A < B) ? 8'b11111111 :8'b00000000;
          
            default: ALU_result = A;
        endcase

        ALU_out <= ALU_result;
    end    
endmodule