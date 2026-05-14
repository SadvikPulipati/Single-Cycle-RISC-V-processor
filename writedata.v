module writedata(write_data,pc,imm,alu_op,alu_result,read_data);
input [31:0]pc,imm;
input [3:0]alu_op;
input [31:0]alu_result,read_data;
output reg [31:0]write_data;
always@(*) 
    case(alu_op)
    4'b0000: write_data=alu_result;  //r-type
    4'b0001: write_data=alu_result;  //i-type
    4'b0010: write_data=read_data;   //load 
    4'b0011: write_data=alu_result;  //store(regwrite =0)
    4'b0100: write_data=alu_result;  //branch(regwrite =0)
    4'b0101: write_data=pc+32'd4;    //jump
    4'b0110: write_data=pc+32'd4;    //jalr
    4'b0111: write_data=imm;         //LUI
    4'b1000: write_data=pc+imm;      //AUIPC
    default: write_data=alu_result;
    endcase
endmodule