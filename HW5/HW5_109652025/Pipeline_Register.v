module Pipeline_Register( clk_i, rst_i, data_i, data_o);

// I/O ports
input clk_i, rst_i;
input [size-1:0] data_i;
output reg [size-1:0] data_o;  
          
parameter size = 0;

// Writing data when postive edge clk_i
always @(negedge rst_i or posedge clk_i) begin
	if (~rst_i)
		data_o <= 0;
	else
		data_o <= data_i;
end

endmodule 