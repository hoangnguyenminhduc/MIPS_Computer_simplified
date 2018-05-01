module ALU
	(
		input [3:0] ALU_ctrl,
		input [31:0] ALU_operand_1,
		input [31:0] ALU_operand_2,
		output reg [31:0] ALU_result,
		output reg [7:0] ALU_status
	);
	
	initial ALU_status = 8'b0000_0000;
	
	always @(ALU_ctrl) begin
		case (ALU_ctrl) 
		4'b0010: ALU_result = ALU_operand_1 + ALU_operand_2;
		4'b0110: ALU_result = ALU_operand_1 - ALU_operand_2;
		4'b0000: ALU_result = ALU_operand_1 & ALU_operand_2;
		4'b0001: ALU_result = ALU_operand_1 | ALU_operand_2;
		4'b0111: ALU_result = (ALU_operand_1 < ALU_operand_2)?32'd1:32'd0;
		4'b1100: ALU_result = ~(ALU_operand_1 | ALU_operand_2);
		4'b1000: ALU_result = ALU_operand_1 * ALU_operand_2; // mul
		4'b1001: ALU_result = ALU_operand_1 / ALU_operand_2; // div
		4'b1010: ALU_result = ALU_operand_1 ^ ALU_operand_2; // xor
		default: ALU_result = 32'd0;
		endcase
	end

	always @(*) begin
		if (ALU_result == 0) begin // zero
			ALU_status[7] = 1'b1;
		end
		else if () begin // overflow
			
		end
		else if () begin // carry
			
		end
		else if (ALU_result[31] == 1'b1) begin // negative
			ALU_status[4] = 1'b1;
		end
		else if () begin // invalid_address
			
		end
		else if ((ALU_ctrl == 1001) && (ALU_operand_2 == 0)) begin // divide by zero
			ALU_status[2] = 1'b1;
		end
		else begin
			ALU_status = 8'b0000_0000;
		end
	end
	
endmodule 