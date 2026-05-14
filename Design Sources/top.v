module top(an,seg,clkout,regwrite,clk,reset);

output [3:0]an;
output [6:0]seg;
output regwrite;
input clk,reset;

output clkout;
wire [31:0]result;
wire [3:0]thousands,hundreds,tens,ones;

clkDivider cd(clkout,clk,reset);
processor risc(result,regwrite,clkout,reset);
bintobcd con(thousands,hundreds,tens,ones,result);
displaymux dm(an,seg,thousands,hundreds,tens,ones,clk);
endmodule