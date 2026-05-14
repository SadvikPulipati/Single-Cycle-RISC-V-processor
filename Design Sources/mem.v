reg [31:0] mem [0:31];
initial begin
        mem[0] = 32'h01100493; //lui x1,240
        mem[1] = 32'h00000513; //auipc x2,240
        mem[2] = 32'h00000093; //addi x3,x0,27
        mem[3] = 32'h00100093; //addi x4,x0,13
        mem[4] = 32'h00100113; //lw x5,40(x0)
        mem[5] = 32'h000081b3; //addi x12,x0,0
        mem[6] = 32'h000101b3; //sw x5,32(x0)
        mem[7] = 32'h001101b3; //addi x12,x0,0
        mem[8] = 32'h004005ef; 
        mem[9] = 32'h00a48c63; //sub x7,x4,x3
        mem[10] = 32'h000100b3; //add x8,x4,x3
        mem[11] = 32'h00018133; //jalr x9,x0,0
        mem[12] = 32'h001101b3;
        mem[13] = 32'h00150513;
        mem[14] = 32'hfedff5ef;
        mem[15] = 32'h000005e7;
end