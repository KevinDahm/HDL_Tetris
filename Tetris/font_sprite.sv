module font_sprite( input[10:0] addr,
						  output[7:0] data);
						  
						  parameter ADDR_WIDTH = 11;
						  parameter DATA_WIDTH = 8;
						  
						  logic [ADDR_WIDTH - 1:0] addr_reg;
						  
						  parameter [0:2**ADDR_WIDTH - 1][DATA_WIDTH - 1:0] ROM = {
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000
						  8'b00000000};
						  
						  logic square_on;
						  logic[10:0] square_x = 300; // not accurate
						  logic[10:0] square_y = 300; // also not accurate
						  logic[10:0] square_size_x = 24; // accurate
						  logic[10:0] square_size_y = 24; // also accurate
						  
						  