module instr_fetch(instr,pc);
input [31:0]pc;
output reg [31:0]instr;
reg [31:0] mem [0:31];                     //J,L,S,U types
initial begin                                      // OUTPUTS
        mem[0] = 32'h000f00b7; //lui x1,240      --->240*(2^12)=983040
        mem[1] = 32'h000f0117; //auipc x2,240    --->983040+4=983044
        mem[2] = 32'h01b00193; //addi x3,x0,27   --->x3=27
        mem[3] = 32'h00d00213; //addi x4,x0,13   --->x4=13
        mem[4] = 32'h7c300293;  //addi x5 x0 1987--->x5=1987
        mem[5] = 32'h02502023; //sw x5 32(x0)    --->32
        mem[6] = 32'h00000613; //addi x12 x0 0   --->x12=0
        mem[7] = 32'h02002303; //lw x6 32(x0)    --->1987
        mem[8] = 32'h00000613; //addi x12 x0 0   --->x12=0
        mem[9] = 32'h403203b3; //sub x7 x4 x3    --->x7=2's(-14)
        mem[10] = 32'h00320433; //add x8,x4,x3   --->x8=40
        mem[11] = 32'h000004e7; //jalr x9,x0,0   --->48
end
always@(*) instr = mem[pc[6:2]];
endmodule
