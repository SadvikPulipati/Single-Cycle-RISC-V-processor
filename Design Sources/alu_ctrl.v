module alu_ctrl(alu_result,B_taken,func7,func3,rd1,srcb,alu_op);
 input[31:0]rd1,srcb;
 input [3:0]alu_op;
 input [2:0]func3;
 input [6:0]func7;
 output reg B_taken;
 output reg [31:0]alu_result;

always@(*)begin
 case(alu_op)                               
  4'b0000:                                      ////R-type////
    begin
      if(func7==7'b0000000)begin
        if(func3==3'b000)                       // add
          alu_result = rd1 + srcb;
        else if(func3 == 3'b100)                // xor
          alu_result = rd1 ^ srcb;
        else if(func3 == 3'b110)                // or
          alu_result = rd1 | srcb;              
        else if(func3 == 3'b111)                //and
          alu_result = rd1 & srcb;              
        else if(func3 == 3'b001)                //shift_l_logical
          alu_result = rd1 << srcb;             
        else if(func3 == 3'b101)                //shift_r_logical
          alu_result = rd1 >> srcb;             
        else if(func3 == 3'b010)                //set_less_than_S
          alu_result = ($signed(rd1) < $signed(srcb))?32'b1:32'b0;       
        else if(func3 == 3'b011)                //set_less_than_U
          alu_result = (rd1 < srcb)? 32'b1:32'b0;
      end
      else if (func7 == 7'b0100000)begin  
        if (func3 == 3'b000)                    //sub       
          alu_result = rd1 - srcb;
        else if (func3 == 3'b101)               //shift_r_arithmetic
        alu_result = $signed(rd1) >>> srcb ;                 
      end
    end
  4'b0001:                                      ////I_type////
    begin
        if(func3==3'b000)                       // addi
          alu_result = rd1 + srcb;
        else if(func3 == 3'b100)                // xori
          alu_result = rd1 ^ srcb;
        else if(func3 == 3'b110)                // ori
          alu_result = rd1 | srcb;              
        else if(func3 == 3'b111)                //andi
          alu_result = rd1 & srcb;              
        else if(func3 == 3'b001 && func7 == 7'b0000000)   //shift_l_logical_Imm
          alu_result = rd1 << srcb[4:0];             
        else if(func3 == 3'b101 && func7 == 7'b0000000)   //shift_r_logical_Imm
          alu_result = rd1 >> srcb[4:0];             
        else if(func3 == 3'b010)                          //set_less_than_S_Imm
          alu_result = ($signed(rd1) < $signed(srcb))?32'b1:32'b0;       
        else if(func3 == 3'b011)                          //set_less_than_U_imm
          alu_result = (rd1 < srcb)? 1:0;
        else if (func3 == 3'b101 && func7 == 7'b0100000)  //shift_r_arithmetic_Imm
          alu_result = $signed(rd1) >>> srcb[4:0];                     
    end
  4'b0010:                                      ////load_type////
      alu_result = rd1 + srcb;
  4'b0011:                                      //// s_type////
      alu_result = rd1 + srcb;
  4'b0100:                                      //// B_type////
      if (func3 == 3'b000)begin                 // beq
        B_taken = (rd1 == srcb)? 1:0;
      end  
      else if (func3 == 3'b001)begin           // bnq
        B_taken = (rd1 != srcb)? 1:0;
      end 
      else if (func3 == 3'b100)begin            // blt_s
        B_taken = ($signed(rd1) < $signed(srcb))? 1:0; 
      end     
      else if (func3 == 3'b101)begin           // bge_s
        B_taken = ($signed(rd1) >= $signed(srcb))? 1:0;
      end
      else if (func3 == 3'b110)begin           // bge_u
        B_taken = (rd1 >= srcb)? 1:0; 
      end
      else if (func3 == 3'b111)begin            // blt_u
        B_taken = (rd1 < srcb)? 1:0;
      end
  default: alu_result = 32'b0;
 endcase
end
endmodule