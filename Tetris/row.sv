module row(input Clk, Reset, spawnShape,
			  input [9:0] square1_x, square1_y,
			  input [9:0] square2_x, square2_y,
			  input [9:0] square3_x, square3_y,
			  input [9:0] square4_x, square4_y,
			  //input new_grid[0:9][0:17],
			  output logic grid[0:9][0:17]);
			  
	logic [9:0] row_temp1 ;
	logic [9:0] row_temp2 ;
	logic [9:0] row_temp3 ;
	logic [9:0] row_temp4 ;
	logic [9:0] row_temp5 ;
	logic [9:0] row_temp6 ;
	logic [9:0] row_temp7 ;
	logic [9:0] row_temp8 ;
	logic [9:0] row_temp9 ;
	logic [9:0] row_temp10 ;
	logic [9:0] row_temp11 ;
	logic [9:0] row_temp12 ;
	logic [9:0] row_temp13 ;
	logic [9:0] row_temp14 ;
	logic [9:0] row_temp15 ;
	logic [9:0] row_temp16 ;
	logic [9:0] row_temp17 ; 
	logic [9:0] row_temp18 ;
	
	logic [9:0] current_row1 ;
	logic [9:0] current_row2 ;
	logic [9:0] current_row3 ;
	logic [9:0] current_row4 ;
	logic [9:0] current_row5 ;
	logic [9:0] current_row6 ;
	logic [9:0] current_row7 ;
	logic [9:0] current_row8 ;
	logic [9:0] current_row9 ;
	logic [9:0] current_row10 ;
	logic [9:0] current_row11 ;
	logic [9:0] current_row12 ;
	logic [9:0] current_row13 ;
	logic [9:0] current_row14 ;
	logic [9:0] current_row15 ;
	logic [9:0] current_row16 ;
	logic [9:0] current_row17 ; 
	logic [9:0] current_row18 ;
	
	logic [9:0] filled;
	logic [9:0] empty_row;
	assign filled = 10'b1111111111;
	assign empty_row = 10'b0000000000;
	
	//logic [9:0] filled ;// = 10'b1111111111;
	//logic [9:0] empty_row;// = 10'b0000000000;
								
				integer i,j;
				
				always_ff @ (posedge Clk or posedge Reset)
					begin
						if (Reset)
							begin
								for (i = 0; i < 10; i = i + 1)
									begin
										for(j = 0; j < 18; j = j + 1)
											begin
												grid[i][j] <= 0;
											end
									end
							end

						else if (spawnShape)
							begin

							//grid = new_grid;
								case (square1_x)
										24:
											begin
												case (square1_y)
													
														24:
															grid[0][0] = 1;
														48:
															grid[0][1] = 1;
														72:
															grid[0][2] = 1;
														96:
															grid[0][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[0][5] = 1;
														168:
															grid[0][6] = 1;
														192:
															grid[0][7] = 1; 
														216:
															grid[0][8] = 1;
														240:
															grid[0][9] = 1;
														264:
															grid[0][10] = 1;
														288:
															grid[0][11] = 1;
														312:
															grid[0][12] = 1;
														336:
															grid[0][13] = 1;
														360:
															grid[0][14] = 1;
														384:
															grid[0][15] = 1;
														408:
															grid[0][16] = 1;
														432: // Bottom Left Square
															grid[0][17] = 1;
													endcase
											end
											
										48:
											begin
												case (square1_y)
													
														24:
															grid[1][0] = 1;
														48:
															grid[1][1] = 1;
														72:
															grid[1][2] = 1;
														96:
															grid[1][3] = 1;
														120:
															grid[1][4] = 1;
														144:
															grid[1][5] = 1;
														168:
															grid[1][6] = 1;
														192:
															grid[1][7] = 1; 
														216:
															grid[1][8] = 1;
														240:
															grid[1][9] = 1;
														264:
															grid[1][10] = 1;
														288:
															grid[1][11] = 1;
														312:
															grid[1][12] = 1;
														336:
															grid[1][13] = 1;
														360:
															grid[1][14] = 1;
														384:
															grid[1][15] = 1;
														408:
															grid[1][16] = 1;
														432: 
															grid[1][17] = 1;
														
													endcase
											end
											
										72:
											begin
												case (square1_y)
													
														24:
															grid[2][0] = 1;
														48:
															grid[2][1] = 1;
														72:
															grid[2][2] = 1;
														96:
															grid[2][3] = 1;
														120:
															grid[2][4] = 1;
														144:
															grid[2][5] = 1;
														168:
															grid[2][6] = 1;
														192:
															grid[2][7] = 1; 
														216:
															grid[2][8] = 1;
														240:
															grid[2][9] = 1;
														264:
															grid[2][10] = 1;
														288:
															grid[2][11] = 1;
														312:
															grid[2][12] = 1;
														336:
															grid[2][13] = 1;
														360:
															grid[2][14] = 1;
														384:
															grid[2][15] = 1;
														408:
															grid[2][16] = 1;
														432: 
															grid[2][17] = 1;
													endcase
											end
											
										96:
											begin
												case (square1_y)
													
														24:
															grid[3][0] = 1;
														48:
															grid[3][1] = 1;
														72:
															grid[3][2] = 1;
														96:
															grid[3][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[3][5] = 1;
														168:
															grid[3][6] = 1;
														192:
															grid[3][7] = 1; 
														216:
															grid[3][8] = 1;
														240:
															grid[3][9] = 1;
														264:
															grid[3][10] = 1;
														288:
															grid[3][11] = 1;
														312:
															grid[3][12] = 1;
														336:
															grid[3][13] = 1;
														360:
															grid[3][14] = 1;
														384:
															grid[3][15] = 1;
														408:
															grid[3][16] = 1;
														432: 
															grid[3][17] = 1;
													endcase
											end
											
										120:
											begin
												case (square1_y)
													
														24:
															grid[4][0] = 1;
														48:
															grid[4][1] = 1;
														72:
															grid[4][2] = 1;
														96:
															grid[4][3] = 1;
														120:
															grid[4][4] = 1;
														144:
															grid[4][5] = 1;
														168:
															grid[4][6] = 1;
														192:
															grid[4][7] = 1; 
														216:
															grid[4][8] = 1;
														240:
															grid[4][9] = 1;
														264:
															grid[4][10] = 1;
														288:
															grid[4][11] = 1;
														312:
															grid[4][12] = 1;
														336:
															grid[4][13] = 1;
														360:
															grid[4][14] = 1;
														384:
															grid[4][15] = 1;
														408:
															grid[4][16] = 1;
														432: 
															grid[4][17] = 1;
													endcase
											end
											
										144:
											begin
												case (square1_y)
													
														24:
															grid[5][0] = 1;
														48:
															grid[5][1] = 1;
														72:
															grid[5][2] = 1;
														96:
															grid[5][3] = 1;
														120:
															grid[5][4] = 1;
														144:
															grid[5][5] = 1;
														168:
															grid[5][6] = 1;
														192:
															grid[5][7] = 1; 
														216:
															grid[5][8] = 1;
														240:
															grid[5][9] = 1;
														264:
															grid[5][10] = 1;
														288:
															grid[5][11] = 1;
														312:
															grid[5][12] = 1;
														336:
															grid[5][13] = 1;
														360:
															grid[5][14] = 1;
														384:
															grid[5][15] = 1;
														408:
															grid[5][16] = 1;
														432: 
															grid[5][17] = 1;
													endcase
											end
											
										168:
											begin
												case (square1_y)
													
														24:
															grid[6][0] = 1;
														48:
															grid[6][1] = 1;
														72:
															grid[6][2] = 1;
														96:
															grid[6][3] = 1;
														120:
															grid[6][4] = 1;
														144:
															grid[6][5] = 1;
														168:
															grid[6][6] = 1;
														192:
															grid[6][7] = 1; 
														216:
															grid[6][8] = 1;
														240:
															grid[6][9] = 1;
														264:
															grid[6][10] = 1;
														288:
															grid[6][11] = 1;
														312:
															grid[6][12] = 1;
														336:
															grid[6][13] = 1;
														360:
															grid[6][14] = 1;
														384:
															grid[6][15] = 1;
														408:
															grid[6][16] = 1;
														432: 
															grid[6][17] = 1;
													endcase
											end
											
										192:
											begin
												case (square1_y)
													
														24:
															grid[7][0] = 1;
														48:
															grid[7][1] = 1;
														72:
															grid[7][2] = 1;
														96:
															grid[7][3] = 1;
														120:
															grid[7][4] = 1;
														144:
															grid[7][5] = 1;
														168:
															grid[7][6] = 1;
														192:
															grid[7][7] = 1; 
														216:
															grid[7][8] = 1;
														240:
															grid[7][9] = 1;
														264:
															grid[7][10] = 1;
														288:
															grid[7][11] = 1;
														312:
															grid[7][12] = 1;
														336:
															grid[7][13] = 1;
														360:
															grid[7][14] = 1;
														384:
															grid[7][15] = 1;
														408:
															grid[7][16] = 1;
														432: // Bottom Left Square
															grid[7][17] = 1;
													endcase
											end
											
										216:
											begin
												case (square1_y)
													
														24:
															grid[8][0] = 1;
														48:
															grid[8][1] = 1;
														72:
															grid[8][2] = 1;
														96:
															grid[8][3] = 1;
														120:
															grid[8][4] = 1;
														144:
															grid[8][5] = 1;
														168:
															grid[8][6] = 1;
														192:
															grid[8][7] = 1; 
														216:
															grid[8][8] = 1;
														240:
															grid[8][9] = 1;
														264:
															grid[8][10] = 1;
														288:
															grid[8][11] = 1;
														312:
															grid[8][12] = 1;
														336:
															grid[8][13] = 1;
														360:
															grid[8][14] = 1;
														384:
															grid[8][15] = 1;
														408:
															grid[8][16] = 1;
														432: 
															grid[8][17] = 1;
													endcase
											end
										240:
											begin
												case (square1_y)
													
														24:
															grid[9][0] = 1;
														48:
															grid[9][1] = 1;
														72:
															grid[9][2] = 1;
														96:
															grid[9][3] = 1;
														120:
															grid[9][4] = 1;
														144:
															grid[9][5] = 1;
														168:
															grid[9][6] = 1;
														192:
															grid[9][7] = 1; 
														216:
															grid[9][8] = 1;
														240:
															grid[9][9] = 1;
														264:
															grid[9][10] = 1;
														288:
															grid[9][11] = 1;
														312:
															grid[9][12] = 1;
														336:
															grid[9][13] = 1;
														360:
															grid[9][14] = 1;
														384:
															grid[9][15] = 1;
														408:
															grid[9][16] = 1;
														432: 
															grid[9][17] = 1;
													endcase
											end
											
									endcase
									
									case (square2_x)
										24:
											begin
												case (square2_y)
													
														24:
															grid[0][0] = 1;
														48:
															grid[0][1] = 1;
														72:
															grid[0][2] = 1;
														96:
															grid[0][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[0][5] = 1;
														168:
															grid[0][6] = 1;
														192:
															grid[0][7] = 1; 
														216:
															grid[0][8] = 1;
														240:
															grid[0][9] = 1;
														264:
															grid[0][10] = 1;
														288:
															grid[0][11] = 1;
														312:
															grid[0][12] = 1;
														336:
															grid[0][13] = 1;
														360:
															grid[0][14] = 1;
														384:
															grid[0][15] = 1;
														408:
															grid[0][16] = 1;
														432: // Bottom Left Square
															grid[0][17] = 1;
													endcase
											end
											
										48:
											begin
												case (square2_y)
													
														24:
															grid[1][0] = 1;
														48:
															grid[1][1] = 1;
														72:
															grid[1][2] = 1;
														96:
															grid[1][3] = 1;
														120:
															grid[1][4] = 1;
														144:
															grid[1][5] = 1;
														168:
															grid[1][6] = 1;
														192:
															grid[1][7] = 1; 
														216:
															grid[1][8] = 1;
														240:
															grid[1][9] = 1;
														264:
															grid[1][10] = 1;
														288:
															grid[1][11] = 1;
														312:
															grid[1][12] = 1;
														336:
															grid[1][13] = 1;
														360:
															grid[1][14] = 1;
														384:
															grid[1][15] = 1;
														408:
															grid[1][16] = 1;
														432: 
															grid[1][17] = 1;
														
													endcase
											end
											
										72:
											begin
												case (square2_y)
													
														24:
															grid[2][0] = 1;
														48:
															grid[2][1] = 1;
														72:
															grid[2][2] = 1;
														96:
															grid[2][3] = 1;
														120:
															grid[2][4] = 1;
														144:
															grid[2][5] = 1;
														168:
															grid[2][6] = 1;
														192:
															grid[2][7] = 1; 
														216:
															grid[2][8] = 1;
														240:
															grid[2][9] = 1;
														264:
															grid[2][10] = 1;
														288:
															grid[2][11] = 1;
														312:
															grid[2][12] = 1;
														336:
															grid[2][13] = 1;
														360:
															grid[2][14] = 1;
														384:
															grid[2][15] = 1;
														408:
															grid[2][16] = 1;
														432: 
															grid[2][17] = 1;
													endcase
											end
											
										96:
											begin
												case (square2_y)
													
														24:
															grid[3][0] = 1;
														48:
															grid[3][1] = 1;
														72:
															grid[3][2] = 1;
														96:
															grid[3][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[3][5] = 1;
														168:
															grid[3][6] = 1;
														192:
															grid[3][7] = 1; 
														216:
															grid[3][8] = 1;
														240:
															grid[3][9] = 1;
														264:
															grid[3][10] = 1;
														288:
															grid[3][11] = 1;
														312:
															grid[3][12] = 1;
														336:
															grid[3][13] = 1;
														360:
															grid[3][14] = 1;
														384:
															grid[3][15] = 1;
														408:
															grid[3][16] = 1;
														432: 
															grid[3][17] = 1;
													endcase
											end
											
										120:
											begin
												case (square2_y)
													
														24:
															grid[4][0] = 1;
														48:
															grid[4][1] = 1;
														72:
															grid[4][2] = 1;
														96:
															grid[4][3] = 1;
														120:
															grid[4][4] = 1;
														144:
															grid[4][5] = 1;
														168:
															grid[4][6] = 1;
														192:
															grid[4][7] = 1; 
														216:
															grid[4][8] = 1;
														240:
															grid[4][9] = 1;
														264:
															grid[4][10] = 1;
														288:
															grid[4][11] = 1;
														312:
															grid[4][12] = 1;
														336:
															grid[4][13] = 1;
														360:
															grid[4][14] = 1;
														384:
															grid[4][15] = 1;
														408:
															grid[4][16] = 1;
														432: 
															grid[4][17] = 1;
													endcase
											end
											
										144:
											begin
												case (square2_y)
													
														24:
															grid[5][0] = 1;
														48:
															grid[5][1] = 1;
														72:
															grid[5][2] = 1;
														96:
															grid[5][3] = 1;
														120:
															grid[5][4] = 1;
														144:
															grid[5][5] = 1;
														168:
															grid[5][6] = 1;
														192:
															grid[5][7] = 1; 
														216:
															grid[5][8] = 1;
														240:
															grid[5][9] = 1;
														264:
															grid[5][10] = 1;
														288:
															grid[5][11] = 1;
														312:
															grid[5][12] = 1;
														336:
															grid[5][13] = 1;
														360:
															grid[5][14] = 1;
														384:
															grid[5][15] = 1;
														408:
															grid[5][16] = 1;
														432: 
															grid[5][17] = 1;
													endcase
											end
											
										168:
											begin
												case (square2_y)
													
														24:
															grid[6][0] = 1;
														48:
															grid[6][1] = 1;
														72:
															grid[6][2] = 1;
														96:
															grid[6][3] = 1;
														120:
															grid[6][4] = 1;
														144:
															grid[6][5] = 1;
														168:
															grid[6][6] = 1;
														192:
															grid[6][7] = 1; 
														216:
															grid[6][8] = 1;
														240:
															grid[6][9] = 1;
														264:
															grid[6][10] = 1;
														288:
															grid[6][11] = 1;
														312:
															grid[6][12] = 1;
														336:
															grid[6][13] = 1;
														360:
															grid[6][14] = 1;
														384:
															grid[6][15] = 1;
														408:
															grid[6][16] = 1;
														432: 
															grid[6][17] = 1;
													endcase
											end
											
										192:
											begin
												case (square2_y)
													
														24:
															grid[7][0] = 1;
														48:
															grid[7][1] = 1;
														72:
															grid[7][2] = 1;
														96:
															grid[7][3] = 1;
														120:
															grid[7][4] = 1;
														144:
															grid[7][5] = 1;
														168:
															grid[7][6] = 1;
														192:
															grid[7][7] = 1; 
														216:
															grid[7][8] = 1;
														240:
															grid[7][9] = 1;
														264:
															grid[7][10] = 1;
														288:
															grid[7][11] = 1;
														312:
															grid[7][12] = 1;
														336:
															grid[7][13] = 1;
														360:
															grid[7][14] = 1;
														384:
															grid[7][15] = 1;
														408:
															grid[7][16] = 1;
														432: // Bottom Left Square
															grid[7][17] = 1;
													endcase
											end
											
										216:
											begin
												case (square2_y)
													
														24:
															grid[8][0] = 1;
														48:
															grid[8][1] = 1;
														72:
															grid[8][2] = 1;
														96:
															grid[8][3] = 1;
														120:
															grid[8][4] = 1;
														144:
															grid[8][5] = 1;
														168:
															grid[8][6] = 1;
														192:
															grid[8][7] = 1; 
														216:
															grid[8][8] = 1;
														240:
															grid[8][9] = 1;
														264:
															grid[8][10] = 1;
														288:
															grid[8][11] = 1;
														312:
															grid[8][12] = 1;
														336:
															grid[8][13] = 1;
														360:
															grid[8][14] = 1;
														384:
															grid[8][15] = 1;
														408:
															grid[8][16] = 1;
														432: 
															grid[8][17] = 1;
													endcase
											end
										240:
											begin
												case (square2_y)
													
														24:
															grid[9][0] = 1;
														48:
															grid[9][1] = 1;
														72:
															grid[9][2] = 1;
														96:
															grid[9][3] = 1;
														120:
															grid[9][4] = 1;
														144:
															grid[9][5] = 1;
														168:
															grid[9][6] = 1;
														192:
															grid[9][7] = 1; 
														216:
															grid[9][8] = 1;
														240:
															grid[9][9] = 1;
														264:
															grid[9][10] = 1;
														288:
															grid[9][11] = 1;
														312:
															grid[9][12] = 1;
														336:
															grid[9][13] = 1;
														360:
															grid[9][14] = 1;
														384:
															grid[9][15] = 1;
														408:
															grid[9][16] = 1;
														432: 
															grid[9][17] = 1;
													endcase
											end
											
									endcase
									
									case (square3_x)
									
										24:
											begin
												case (square3_y)
													
														24:
															grid[0][0] = 1;
														48:
															grid[0][1] = 1;
														72:
															grid[0][2] = 1;
														96:
															grid[0][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[0][5] = 1;
														168:
															grid[0][6] = 1;
														192:
															grid[0][7] = 1; 
														216:
															grid[0][8] = 1;
														240:
															grid[0][9] = 1;
														264:
															grid[0][10] = 1;
														288:
															grid[0][11] = 1;
														312:
															grid[0][12] = 1;
														336:
															grid[0][13] = 1;
														360:
															grid[0][14] = 1;
														384:
															grid[0][15] = 1;
														408:
															grid[0][16] = 1;
														432: // Bottom Left Square
															grid[0][17] = 1;
													endcase
											end
											
										48:
											begin
												case (square3_y)
													
														24:
															grid[1][0] = 1;
														48:
															grid[1][1] = 1;
														72:
															grid[1][2] = 1;
														96:
															grid[1][3] = 1;
														120:
															grid[1][4] = 1;
														144:
															grid[1][5] = 1;
														168:
															grid[1][6] = 1;
														192:
															grid[1][7] = 1; 
														216:
															grid[1][8] = 1;
														240:
															grid[1][9] = 1;
														264:
															grid[1][10] = 1;
														288:
															grid[1][11] = 1;
														312:
															grid[1][12] = 1;
														336:
															grid[1][13] = 1;
														360:
															grid[1][14] = 1;
														384:
															grid[1][15] = 1;
														408:
															grid[1][16] = 1;
														432: 
															grid[1][17] = 1;
														
													endcase
											end
											
										72:
											begin
												case (square3_y)
													
														24:
															grid[2][0] = 1;
														48:
															grid[2][1] = 1;
														72:
															grid[2][2] = 1;
														96:
															grid[2][3] = 1;
														120:
															grid[2][4] = 1;
														144:
															grid[2][5] = 1;
														168:
															grid[2][6] = 1;
														192:
															grid[2][7] = 1; 
														216:
															grid[2][8] = 1;
														240:
															grid[2][9] = 1;
														264:
															grid[2][10] = 1;
														288:
															grid[2][11] = 1;
														312:
															grid[2][12] = 1;
														336:
															grid[2][13] = 1;
														360:
															grid[2][14] = 1;
														384:
															grid[2][15] = 1;
														408:
															grid[2][16] = 1;
														432: 
															grid[2][17] = 1;
													endcase
											end
											
										96:
											begin
												case (square3_y)
													
														24:
															grid[3][0] = 1;
														48:
															grid[3][1] = 1;
														72:
															grid[3][2] = 1;
														96:
															grid[3][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[3][5] = 1;
														168:
															grid[3][6] = 1;
														192:
															grid[3][7] = 1; 
														216:
															grid[3][8] = 1;
														240:
															grid[3][9] = 1;
														264:
															grid[3][10] = 1;
														288:
															grid[3][11] = 1;
														312:
															grid[3][12] = 1;
														336:
															grid[3][13] = 1;
														360:
															grid[3][14] = 1;
														384:
															grid[3][15] = 1;
														408:
															grid[3][16] = 1;
														432: 
															grid[3][17] = 1;
													endcase
											end
											
										120:
											begin
												case (square3_y)
													
														24:
															grid[4][0] = 1;
														48:
															grid[4][1] = 1;
														72:
															grid[4][2] = 1;
														96:
															grid[4][3] = 1;
														120:
															grid[4][4] = 1;
														144:
															grid[4][5] = 1;
														168:
															grid[4][6] = 1;
														192:
															grid[4][7] = 1; 
														216:
															grid[4][8] = 1;
														240:
															grid[4][9] = 1;
														264:
															grid[4][10] = 1;
														288:
															grid[4][11] = 1;
														312:
															grid[4][12] = 1;
														336:
															grid[4][13] = 1;
														360:
															grid[4][14] = 1;
														384:
															grid[4][15] = 1;
														408:
															grid[4][16] = 1;
														432: 
															grid[4][17] = 1;
													endcase
											end
											
										144:
											begin
												case (square3_y)
													
														24:
															grid[5][0] = 1;
														48:
															grid[5][1] = 1;
														72:
															grid[5][2] = 1;
														96:
															grid[5][3] = 1;
														120:
															grid[5][4] = 1;
														144:
															grid[5][5] = 1;
														168:
															grid[5][6] = 1;
														192:
															grid[5][7] = 1; 
														216:
															grid[5][8] = 1;
														240:
															grid[5][9] = 1;
														264:
															grid[5][10] = 1;
														288:
															grid[5][11] = 1;
														312:
															grid[5][12] = 1;
														336:
															grid[5][13] = 1;
														360:
															grid[5][14] = 1;
														384:
															grid[5][15] = 1;
														408:
															grid[5][16] = 1;
														432: 
															grid[5][17] = 1;
													endcase
											end
											
										168:
											begin
												case (square3_y)
													
														24:
															grid[6][0] = 1;
														48:
															grid[6][1] = 1;
														72:
															grid[6][2] = 1;
														96:
															grid[6][3] = 1;
														120:
															grid[6][4] = 1;
														144:
															grid[6][5] = 1;
														168:
															grid[6][6] = 1;
														192:
															grid[6][7] = 1; 
														216:
															grid[6][8] = 1;
														240:
															grid[6][9] = 1;
														264:
															grid[6][10] = 1;
														288:
															grid[6][11] = 1;
														312:
															grid[6][12] = 1;
														336:
															grid[6][13] = 1;
														360:
															grid[6][14] = 1;
														384:
															grid[6][15] = 1;
														408:
															grid[6][16] = 1;
														432: 
															grid[6][17] = 1;
													endcase
											end
											
										192:
											begin
												case (square3_y)
													
														24:
															grid[7][0] = 1;
														48:
															grid[7][1] = 1;
														72:
															grid[7][2] = 1;
														96:
															grid[7][3] = 1;
														120:
															grid[7][4] = 1;
														144:
															grid[7][5] = 1;
														168:
															grid[7][6] = 1;
														192:
															grid[7][7] = 1; 
														216:
															grid[7][8] = 1;
														240:
															grid[7][9] = 1;
														264:
															grid[7][10] = 1;
														288:
															grid[7][11] = 1;
														312:
															grid[7][12] = 1;
														336:
															grid[7][13] = 1;
														360:
															grid[7][14] = 1;
														384:
															grid[7][15] = 1;
														408:
															grid[7][16] = 1;
														432: // Bottom Left Square
															grid[7][17] = 1;
													endcase
											end
											
										216:
											begin
												case (square3_y)
													
														24:
															grid[8][0] = 1;
														48:
															grid[8][1] = 1;
														72:
															grid[8][2] = 1;
														96:
															grid[8][3] = 1;
														120:
															grid[8][4] = 1;
														144:
															grid[8][5] = 1;
														168:
															grid[8][6] = 1;
														192:
															grid[8][7] = 1; 
														216:
															grid[8][8] = 1;
														240:
															grid[8][9] = 1;
														264:
															grid[8][10] = 1;
														288:
															grid[8][11] = 1;
														312:
															grid[8][12] = 1;
														336:
															grid[8][13] = 1;
														360:
															grid[8][14] = 1;
														384:
															grid[8][15] = 1;
														408:
															grid[8][16] = 1;
														432: 
															grid[8][17] = 1;
													endcase
											end
										240:
											begin
												case (square3_y)
													
														24:
															grid[9][0] = 1;
														48:
															grid[9][1] = 1;
														72:
															grid[9][2] = 1;
														96:
															grid[9][3] = 1;
														120:
															grid[9][4] = 1;
														144:
															grid[9][5] = 1;
														168:
															grid[9][6] = 1;
														192:
															grid[9][7] = 1; 
														216:
															grid[9][8] = 1;
														240:
															grid[9][9] = 1;
														264:
															grid[9][10] = 1;
														288:
															grid[9][11] = 1;
														312:
															grid[9][12] = 1;
														336:
															grid[9][13] = 1;
														360:
															grid[9][14] = 1;
														384:
															grid[9][15] = 1;
														408:
															grid[9][16] = 1;
														432: 
															grid[9][17] = 1;
													endcase
											end
											
									endcase
									
									case (square4_x)
									
										24:
											begin
												case (square4_y)
													
														24:
															grid[0][0] = 1;
														48:
															grid[0][1] = 1;
														72:
															grid[0][2] = 1;
														96:
															grid[0][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[0][5] = 1;
														168:
															grid[0][6] = 1;
														192:
															grid[0][7] = 1; 
														216:
															grid[0][8] = 1;
														240:
															grid[0][9] = 1;
														264:
															grid[0][10] = 1;
														288:
															grid[0][11] = 1;
														312:
															grid[0][12] = 1;
														336:
															grid[0][13] = 1;
														360:
															grid[0][14] = 1;
														384:
															grid[0][15] = 1;
														408:
															grid[0][16] = 1;
														432: // Bottom Left Square
															grid[0][17] = 1;
													endcase
											end
											
										48:
											begin
												case (square4_y)
													
														24:
															grid[1][0] = 1;
														48:
															grid[1][1] = 1;
														72:
															grid[1][2] = 1;
														96:
															grid[1][3] = 1;
														120:
															grid[1][4] = 1;
														144:
															grid[1][5] = 1;
														168:
															grid[1][6] = 1;
														192:
															grid[1][7] = 1; 
														216:
															grid[1][8] = 1;
														240:
															grid[1][9] = 1;
														264:
															grid[1][10] = 1;
														288:
															grid[1][11] = 1;
														312:
															grid[1][12] = 1;
														336:
															grid[1][13] = 1;
														360:
															grid[1][14] = 1;
														384:
															grid[1][15] = 1;
														408:
															grid[1][16] = 1;
														432: 
															grid[1][17] = 1;
														
													endcase
											end
											
										72:
											begin
												case (square4_y)
													
														24:
															grid[2][0] = 1;
														48:
															grid[2][1] = 1;
														72:
															grid[2][2] = 1;
														96:
															grid[2][3] = 1;
														120:
															grid[2][4] = 1;
														144:
															grid[2][5] = 1;
														168:
															grid[2][6] = 1;
														192:
															grid[2][7] = 1; 
														216:
															grid[2][8] = 1;
														240:
															grid[2][9] = 1;
														264:
															grid[2][10] = 1;
														288:
															grid[2][11] = 1;
														312:
															grid[2][12] = 1;
														336:
															grid[2][13] = 1;
														360:
															grid[2][14] = 1;
														384:
															grid[2][15] = 1;
														408:
															grid[2][16] = 1;
														432: 
															grid[2][17] = 1;
													endcase
											end
											
										96:
											begin
												case (square4_y)
													
														24:
															grid[3][0] = 1;
														48:
															grid[3][1] = 1;
														72:
															grid[3][2] = 1;
														96:
															grid[3][3] = 1;
														120:
															grid[0][4] = 1;
														144:
															grid[3][5] = 1;
														168:
															grid[3][6] = 1;
														192:
															grid[3][7] = 1; 
														216:
															grid[3][8] = 1;
														240:
															grid[3][9] = 1;
														264:
															grid[3][10] = 1;
														288:
															grid[3][11] = 1;
														312:
															grid[3][12] = 1;
														336:
															grid[3][13] = 1;
														360:
															grid[3][14] = 1;
														384:
															grid[3][15] = 1;
														408:
															grid[3][16] = 1;
														432: 
															grid[3][17] = 1;
													endcase
											end
											
										120:
											begin
												case (square4_y)
													
														24:
															grid[4][0] = 1;
														48:
															grid[4][1] = 1;
														72:
															grid[4][2] = 1;
														96:
															grid[4][3] = 1;
														120:
															grid[4][4] = 1;
														144:
															grid[4][5] = 1;
														168:
															grid[4][6] = 1;
														192:
															grid[4][7] = 1; 
														216:
															grid[4][8] = 1;
														240:
															grid[4][9] = 1;
														264:
															grid[4][10] = 1;
														288:
															grid[4][11] = 1;
														312:
															grid[4][12] = 1;
														336:
															grid[4][13] = 1;
														360:
															grid[4][14] = 1;
														384:
															grid[4][15] = 1;
														408:
															grid[4][16] = 1;
														432: 
															grid[4][17] = 1;
													endcase
											end
											
										144:
											begin
												case (square4_y)
													
														24:
															grid[5][0] = 1;
														48:
															grid[5][1] = 1;
														72:
															grid[5][2] = 1;
														96:
															grid[5][3] = 1;
														120:
															grid[5][4] = 1;
														144:
															grid[5][5] = 1;
														168:
															grid[5][6] = 1;
														192:
															grid[5][7] = 1; 
														216:
															grid[5][8] = 1;
														240:
															grid[5][9] = 1;
														264:
															grid[5][10] = 1;
														288:
															grid[5][11] = 1;
														312:
															grid[5][12] = 1;
														336:
															grid[5][13] = 1;
														360:
															grid[5][14] = 1;
														384:
															grid[5][15] = 1;
														408:
															grid[5][16] = 1;
														432: 
															grid[5][17] = 1;
													endcase
											end
											
										168:
											begin
												case (square4_y)
													
														24:
															grid[6][0] = 1;
														48:
															grid[6][1] = 1;
														72:
															grid[6][2] = 1;
														96:
															grid[6][3] = 1;
														120:
															grid[6][4] = 1;
														144:
															grid[6][5] = 1;
														168:
															grid[6][6] = 1;
														192:
															grid[6][7] = 1; 
														216:
															grid[6][8] = 1;
														240:
															grid[6][9] = 1;
														264:
															grid[6][10] = 1;
														288:
															grid[6][11] = 1;
														312:
															grid[6][12] = 1;
														336:
															grid[6][13] = 1;
														360:
															grid[6][14] = 1;
														384:
															grid[6][15] = 1;
														408:
															grid[6][16] = 1;
														432: 
															grid[6][17] = 1;
													endcase
											end
											
										192:
											begin
												case (square4_y)
													
														24:
															grid[7][0] = 1;
														48:
															grid[7][1] = 1;
														72:
															grid[7][2] = 1;
														96:
															grid[7][3] = 1;
														120:
															grid[7][4] = 1;
														144:
															grid[7][5] = 1;
														168:
															grid[7][6] = 1;
														192:
															grid[7][7] = 1; 
														216:
															grid[7][8] = 1;
														240:
															grid[7][9] = 1;
														264:
															grid[7][10] = 1;
														288:
															grid[7][11] = 1;
														312:
															grid[7][12] = 1;
														336:
															grid[7][13] = 1;
														360:
															grid[7][14] = 1;
														384:
															grid[7][15] = 1;
														408:
															grid[7][16] = 1;
														432: // Bottom Left Square
															grid[7][17] = 1;
													endcase
											end
											
										216:
											begin
												case (square4_y)
													
														24:
															grid[8][0] = 1;
														48:
															grid[8][1] = 1;
														72:
															grid[8][2] = 1;
														96:
															grid[8][3] = 1;
														120:
															grid[8][4] = 1;
														144:
															grid[8][5] = 1;
														168:
															grid[8][6] = 1;
														192:
															grid[8][7] = 1; 
														216:
															grid[8][8] = 1;
														240:
															grid[8][9] = 1;
														264:
															grid[8][10] = 1;
														288:
															grid[8][11] = 1;
														312:
															grid[8][12] = 1;
														336:
															grid[8][13] = 1;
														360:
															grid[8][14] = 1;
														384:
															grid[8][15] = 1;
														408:
															grid[8][16] = 1;
														432: 
															grid[8][17] = 1;
													endcase
											end
										240:
											begin
												case (square4_y)
													
														24:
															grid[9][0] = 1;
														48:
															grid[9][1] = 1;
														72:
															grid[9][2] = 1;
														96:
															grid[9][3] = 1;
														120:
															grid[9][4] = 1;
														144:
															grid[9][5] = 1;
														168:
															grid[9][6] = 1;
														192:
															grid[9][7] = 1; 
														216:
															grid[9][8] = 1;
														240:
															grid[9][9] = 1;
														264:
															grid[9][10] = 1;
														288:
															grid[9][11] = 1;
														312:
															grid[9][12] = 1;
														336:
															grid[9][13] = 1;
														360:
															grid[9][14] = 1;
														384:
															grid[9][15] = 1;
														408:
															grid[9][16] = 1;
														432: 
															grid[9][17] = 1;
													endcase
											end
											
									endcase
							
							current_row1 = {grid[0][0], grid[1][0], grid[2][0], grid[3][0], grid[4][0], grid[5][0], grid[6][0], grid[7][0], grid[8][0], grid[9][0]};
							current_row2 = {grid[0][1], grid[1][1], grid[2][1], grid[3][1], grid[4][1], grid[5][1], grid[6][1], grid[7][1], grid[8][1], grid[9][1]};
							current_row3 = {grid[0][2], grid[1][2], grid[2][2], grid[3][2], grid[4][2], grid[5][2], grid[6][2], grid[7][2], grid[8][2], grid[9][2]};
							current_row4 = {grid[0][3], grid[1][3], grid[2][3], grid[3][3], grid[4][3], grid[5][3], grid[6][3], grid[7][3], grid[8][3], grid[9][3]};
							current_row5 = {grid[0][4], grid[1][4], grid[2][4], grid[3][4], grid[4][4], grid[5][4], grid[6][4], grid[7][4], grid[8][4], grid[9][4]};
							current_row6 = {grid[0][5], grid[1][5], grid[2][5], grid[3][5], grid[4][5], grid[5][5], grid[6][5], grid[7][5], grid[8][5], grid[9][5]};
							current_row7 = {grid[0][6], grid[1][6], grid[2][6], grid[3][6], grid[4][6], grid[5][6], grid[6][6], grid[7][6], grid[8][6], grid[9][6]};
							current_row8 = {grid[0][7], grid[1][7], grid[2][7], grid[3][7], grid[4][7], grid[5][7], grid[6][7], grid[7][7], grid[8][7], grid[9][7]};
							current_row9 = {grid[0][8], grid[1][8], grid[2][8], grid[3][8], grid[4][8], grid[5][8], grid[6][8], grid[7][8], grid[8][8], grid[9][8]};
							current_row10 = {grid[0][9], grid[1][9], grid[2][9], grid[3][9], grid[4][9], grid[5][9], grid[6][9], grid[7][9], grid[8][9], grid[9][9]};
							current_row11 = {grid[0][10], grid[1][10], grid[2][10], grid[3][10], grid[4][10], grid[5][10], grid[6][10], grid[7][10], grid[8][10], grid[9][10]};
							current_row12 = {grid[0][11], grid[1][11], grid[2][11], grid[3][11], grid[4][11], grid[5][11], grid[6][11], grid[7][11], grid[8][11], grid[9][11]};
							current_row13 = {grid[0][12], grid[1][12], grid[2][12], grid[3][12], grid[4][12], grid[5][12], grid[6][12], grid[7][12], grid[8][12], grid[9][12]};
							current_row14 = {grid[0][13], grid[1][13], grid[2][13], grid[3][13], grid[4][13], grid[5][13], grid[6][13], grid[7][13], grid[8][13], grid[9][13]};
							current_row15 = {grid[0][14], grid[1][14], grid[2][14], grid[3][14], grid[4][14], grid[5][14], grid[6][14], grid[7][14], grid[8][14], grid[9][14]};
							current_row16 = {grid[0][15], grid[1][15], grid[2][15], grid[3][15], grid[4][15], grid[5][15], grid[6][15], grid[7][15], grid[8][15], grid[9][15]};
							current_row17 = {grid[0][16], grid[1][16], grid[2][16], grid[3][16], grid[4][16], grid[5][16], grid[6][16], grid[7][16], grid[8][16], grid[9][16]};
							current_row18 = {grid[0][17], grid[1][17], grid[2][17], grid[3][17], grid[4][17], grid[5][17], grid[6][17], grid[7][17], grid[8][17], grid[9][17]};
							
							//
							
				if (current_row18 == filled)
					begin
						row_temp18 = current_row17;
						row_temp17 = current_row16;
						row_temp16 = current_row15;
						row_temp15 = current_row14;
						row_temp14 = current_row13;
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row17 == filled)
					begin
						row_temp17 = current_row16;
						row_temp16 = current_row15;
						row_temp15 = current_row14;
						row_temp14 = current_row13;
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row16 == filled)
					begin
						row_temp16 = current_row15;
						row_temp15 = current_row14;
						row_temp14 = current_row13;
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row15 == filled)
					begin
						row_temp15 = current_row14;
						row_temp14 = current_row13;
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row14 == filled)
					begin
						row_temp14 = current_row13;
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row13 == filled)
					begin
						row_temp13 = current_row12;
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row12 == filled)
					begin
						row_temp12 = current_row11;
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row11 == filled)
					begin
						row_temp11 = current_row10;
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row10 == filled)
					begin
						row_temp10 = current_row9;
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row9 == filled)
					begin
						row_temp9 = current_row8;
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row8 == filled)
					begin
						row_temp8 = current_row7;
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row7 == filled)
					begin
						row_temp7 = current_row6;
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row6 == filled)
					begin
						row_temp6 = current_row5;
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row5 == filled)
					begin
						row_temp5 = current_row4;
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row4 == filled)
					begin
						row_temp4 = current_row3;
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row3 == filled)
					begin
						row_temp3 = current_row2;
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row2 == filled)
					begin
						row_temp2 = current_row1;
						row_temp1 = empty_row;
					end
				else if (current_row1 == filled)
					begin
						row_temp1 = empty_row;
					end

				else
					begin
					row_temp18 = current_row18;
					row_temp17 = current_row17;
					row_temp16 = current_row16;
					row_temp15 = current_row15;
					row_temp14 = current_row14;
					row_temp13 = current_row13;
					row_temp12 = current_row12;
					row_temp11 = current_row11;
					row_temp10 = current_row10;
					row_temp9 = current_row9;
					row_temp8 = current_row8;
					row_temp7 = current_row7;
					row_temp6 = current_row6;
					row_temp5 = current_row5;
					row_temp4 = current_row4;
					row_temp3 = current_row3;
					row_temp2 = current_row2;
					row_temp1 = current_row1;
					end
							
		grid[0][0] = row_temp1[9];
		grid[1][0] = row_temp1[8];
		grid[2][0] = row_temp1[7];
		grid[3][0] = row_temp1[6];
		grid[4][0] = row_temp1[5];
		grid[5][0] = row_temp1[4];
		grid[6][0] = row_temp1[3];
		grid[7][0] = row_temp1[2];
		grid[8][0] = row_temp1[1];
		grid[9][0] = row_temp1[0];
		
		grid[0][1] = row_temp2[9];
		grid[1][1] = row_temp2[8];
		grid[2][1] = row_temp2[7];
		grid[3][1] = row_temp2[6];
		grid[4][1] = row_temp2[5];
		grid[5][1] = row_temp2[4];
		grid[6][1] = row_temp2[3];
		grid[7][1] = row_temp2[2];
		grid[8][1] = row_temp2[1];
		grid[9][1] = row_temp2[0];
		
		grid[0][2] = row_temp3[9];
		grid[1][2] = row_temp3[8];
		grid[2][2] = row_temp3[7];
		grid[3][2] = row_temp3[6];
		grid[4][2] = row_temp3[5];
		grid[5][2] = row_temp3[4];
		grid[6][2] = row_temp3[3];
		grid[7][2] = row_temp3[2];
		grid[8][2] = row_temp3[1];
		grid[9][2] = row_temp3[0];
		
		grid[0][3] = row_temp4[9];
		grid[1][3] = row_temp4[8];
		grid[2][3] = row_temp4[7];
		grid[3][3] = row_temp4[6];
		grid[4][3] = row_temp4[5];
		grid[5][3] = row_temp4[4];
		grid[6][3] = row_temp4[3];
		grid[7][3] = row_temp4[2];
		grid[8][3] = row_temp4[1];
		grid[9][3] = row_temp4[0];
		
		grid[0][4] = row_temp5[9];
		grid[1][4] = row_temp5[8];
		grid[2][4] = row_temp5[7];
		grid[3][4] = row_temp5[6];
		grid[4][4] = row_temp5[5];
		grid[5][4] = row_temp5[4];
		grid[6][4] = row_temp5[3];
		grid[7][4] = row_temp5[2];
		grid[8][4] = row_temp5[1];
		grid[9][4] = row_temp5[0];
		
		grid[0][5] = row_temp6[9];
		grid[1][5] = row_temp6[8];
		grid[2][5] = row_temp6[7];
		grid[3][5] = row_temp6[6];
		grid[4][5] = row_temp6[5];
		grid[5][5] = row_temp6[4];
		grid[6][5] = row_temp6[3];
		grid[7][5] = row_temp6[2];
		grid[8][5] = row_temp6[1];
		grid[9][5] = row_temp6[0];
		
		grid[0][6] = row_temp7[9];
		grid[1][6] = row_temp7[8];
		grid[2][6] = row_temp7[7];
		grid[3][6] = row_temp7[6];
		grid[4][6] = row_temp7[5];
		grid[5][6] = row_temp7[4];
		grid[6][6] = row_temp7[3];
		grid[7][6] = row_temp7[2];
		grid[8][6] = row_temp7[1];
		grid[9][6] = row_temp7[0];
		
		grid[0][7] = row_temp8[9];
		grid[1][7] = row_temp8[8];
		grid[2][7] = row_temp8[7];
		grid[3][7] = row_temp8[6];
		grid[4][7] = row_temp8[5];
		grid[5][7] = row_temp8[4];
		grid[6][7] = row_temp8[3];
		grid[7][7] = row_temp8[2];
		grid[8][7] = row_temp8[1];
		grid[9][7] = row_temp8[0];
		
		grid[0][8] = row_temp9[9];
		grid[1][8] = row_temp9[8];
		grid[2][8] = row_temp9[7];
		grid[3][8] = row_temp9[6];
		grid[4][8] = row_temp9[5];
		grid[5][8] = row_temp9[4];
		grid[6][8] = row_temp9[3];
		grid[7][8] = row_temp9[2];
		grid[8][8] = row_temp9[1];
		grid[9][8] = row_temp9[0];
		
		grid[0][9] = row_temp10[9];
		grid[1][9] = row_temp10[8];
		grid[2][9] = row_temp10[7];
		grid[3][9] = row_temp10[6];
		grid[4][9] = row_temp10[5];
		grid[5][9] = row_temp10[4];
		grid[6][9] = row_temp10[3];
		grid[7][9] = row_temp10[2];
		grid[8][9] = row_temp10[1];
		grid[9][9] = row_temp10[0];
		
		grid[0][10] = row_temp11[9];
		grid[1][10] = row_temp11[8];
		grid[2][10] = row_temp11[7];
		grid[3][10] = row_temp11[6];
		grid[4][10] = row_temp11[5];
		grid[5][10] = row_temp11[4];
		grid[6][10] = row_temp11[3];
		grid[7][10] = row_temp11[2];
		grid[8][10] = row_temp11[1];
		grid[9][10] = row_temp11[0];
		
		grid[0][11] = row_temp12[9];
		grid[1][11] = row_temp12[8];
		grid[2][11] = row_temp12[7];
		grid[3][11] = row_temp12[6];
		grid[4][11] = row_temp12[5];
		grid[5][11] = row_temp12[4];
		grid[6][11] = row_temp12[3];
		grid[7][11] = row_temp12[2];
		grid[8][11] = row_temp12[1];
		grid[9][11] = row_temp12[0];
		
		grid[0][12] = row_temp13[9];
		grid[1][12] = row_temp13[8];
		grid[2][12] = row_temp13[7];
		grid[3][12] = row_temp13[6];
		grid[4][12] = row_temp13[5];
		grid[5][12] = row_temp13[4];
		grid[6][12] = row_temp13[3];
		grid[7][12] = row_temp13[2];
		grid[8][12] = row_temp13[1];
		grid[9][12] = row_temp13[0];
		
		grid[0][13] = row_temp14[9];
		grid[1][13] = row_temp14[8];
		grid[2][13] = row_temp14[7];
		grid[3][13] = row_temp14[6];
		grid[4][13] = row_temp14[5];
		grid[5][13] = row_temp14[4];
		grid[6][13] = row_temp14[3];
		grid[7][13] = row_temp14[2];
		grid[8][13] = row_temp14[1];
		grid[9][13] = row_temp14[0];
		
		grid[0][14] = row_temp15[9];
		grid[1][14] = row_temp15[8];
		grid[2][14] = row_temp15[7];
		grid[3][14] = row_temp15[6];
		grid[4][14] = row_temp15[5];
		grid[5][14] = row_temp15[4];
		grid[6][14] = row_temp15[3];
		grid[7][14] = row_temp15[2];
		grid[8][14] = row_temp15[1];
		grid[9][14] = row_temp15[0];
		
		grid[0][15] = row_temp16[9];
		grid[1][15] = row_temp16[8];
		grid[2][15] = row_temp16[7];
		grid[3][15] = row_temp16[6];
		grid[4][15] = row_temp16[5];
		grid[5][15] = row_temp16[4];
		grid[6][15] = row_temp16[3];
		grid[7][15] = row_temp16[2];
		grid[8][15] = row_temp16[1];
		grid[9][15] = row_temp16[0];
		
		grid[0][16] = row_temp17[9];
		grid[1][16] = row_temp17[8];
		grid[2][16] = row_temp17[7];
		grid[3][16] = row_temp17[6];
		grid[4][16] = row_temp17[5];
		grid[5][16] = row_temp17[4];
		grid[6][16] = row_temp17[3];
		grid[7][16] = row_temp17[2];
		grid[8][16] = row_temp17[1];
		grid[9][16] = row_temp17[0];
		
		grid[0][17] = row_temp18[9];
		grid[1][17] = row_temp18[8];
		grid[2][17] = row_temp18[7];
		grid[3][17] = row_temp18[6];
		grid[4][17] = row_temp18[5];
		grid[5][17] = row_temp18[4];
		grid[6][17] = row_temp18[3];
		grid[7][17] = row_temp18[2];
		grid[8][17] = row_temp18[1];
		grid[9][17] = row_temp18[0];		
		
		
						end // ends elseif spawn shape
					end // ends always ff
endmodule
