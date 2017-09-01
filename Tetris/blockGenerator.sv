module blockCreator(input Clk, Reset, newShape,
						  output logic [9:0] square1_x, square1_y,
						  output logic [9:0] square2_x, square2_y,
						  output logic [9:0] square3_x, square3_y,
						  output logic [9:0] square4_x, square4_y,
						  output logic [6:0] currentShape);
						
						  
						 /*
							Last Edit:
								Added color output/variable to allow shapes to be different colors
						 */
						 logic [2:0] count;
						 logic [6:0] color;
						  
						  always_ff @ (posedge Clk or posedge Reset)
								begin
									if (Reset)
										begin
											count = 0;
											currentShape = 0;
										end
									else if (newShape)
										begin
											currentShape = color;
											count = count + 1;
										end
									else
										begin
											currentShape = currentShape;
											count = count + 3; // was + 1
										end
								end
								
								
						  always_comb 
								begin
										square1_x = 0;
										square1_y = 0;
										square2_x = 0;
										square2_y = 0;
										square3_x = 0;
										square3_y = 0;
										square4_x = 0;
										square4_y = 0;
										color = 0;
										
									 unique case (count)
						  
						   0 : begin
								
									
										// L
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 120;
										square3_y = 72;
										square4_x = 144;
										square4_y = 72;
										color = 7'b0000001;
									end
								
								
						   1 : begin
								
									
										// reverse L
										square1_x = 144;
										square1_y = 24;
										square2_x = 144;
										square2_y = 48;
										square3_x = 144;
										square3_y = 72;
										square4_x = 120;
										square4_y = 72;
										color = 7'b0000010;
									end
								
								
							2 : begin
								
									
										// T
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 120;
										square3_y = 72;
										square4_x = 144;
										square4_y = 48;
										color = 7'b0000100;
									end
								
								
							3 : begin
								
									
										// Z
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 144;
										square3_y = 48;
										square4_x = 144;
										square4_y = 72;
										color = 7'b0001000;
									end
								
								
							4 : begin
								
										// reverse Z
										square1_x = 144;
										square1_y = 24;
										square2_x = 144;
										square2_y = 48;
										square3_x = 120;
										square3_y = 48;
										square4_x = 120;
										square4_y = 72;
										color = 7'b0010000;
									end
								
								
							5 : begin
								
										// '|'
										square1_x = 144;
										square1_y = 24;
										square2_x = 144;
										square2_y = 48;
										square3_x = 144;
										square3_y = 72;
										square4_x = 144;
										square4_y = 96;
										color = 7'b0100000;
									end
								
								
							6 : begin
								
										// Square
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 144;
										square3_y = 24;
										square4_x = 144;
										square4_y = 48;
										color = 7'b1000000;
									end
								
								
							7 : begin
								
										// Square
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 144;
										square3_y = 24;
										square4_x = 144;
										square4_y = 48;
										color = 7'b1000000;
									end
								
							
							default : begin
										// Square
										square1_x = 120;
										square1_y = 24;
										square2_x = 120;
										square2_y = 48;
										square3_x = 144;
										square3_y = 24;
										square4_x = 144;
										square4_y = 48;
										color = 7'b1000000;
								end	
						endcase
					end
endmodule
						  
						  