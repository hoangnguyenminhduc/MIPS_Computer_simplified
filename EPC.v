module EPC
	(
		input EPC_flag,
		input [7:0] EPC_PC,
		output reg [7:0] EPC_PC_prev
	);
	
	always @(EPC_flag) begin
		if (EPC_flag) begin
			EPC_PC_prev = EPC_PC - 8'd1;
		end
		else begin
			EPC_PC_prev = 8'd0;
		end
	end
	
endmodule 