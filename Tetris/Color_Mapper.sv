//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] square1_x, square1_y, 
							  input        [9:0] square2_x, square2_y, 
							  input        [9:0] square3_x, square3_y, 
							  input        [9:0] square4_x, square4_y, 
							  input        [9:0]	DrawX, DrawY, Ball_size,
							  input			[6:0] color,
							  input 					grid[0:9][0:17],
                       output logic [7:0] Red, Green, Blue );
    
    //logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    //int DistX, DistY, Size;
	 //assign DistX = DrawX - BallX;
    // assign DistY = DrawY - BallY;
    // assign Size = Ball_size;
	 
	
	logic square1;
	logic square2;
	logic square3;
	logic square4;
	
	logic block;
	logic block_on;
	
	assign block = grid[(DrawX / 24) - 1][(DrawY / 24) - 1];
	
	
	/*
	logic square5;
	logic square6;
	logic square7;
	logic square8;
	logic square9;
	logic square10;
	*/
	
	logic[10:0] square1_size_x = 24;
	logic[10:0] square1_size_y = 24;
	
	
	logic[10:0] square2_size_x = 24;
	logic[10:0] square2_size_y = 24;
	
	
	logic[10:0] square3_size_x = 24;
	logic[10:0] square3_size_y = 24;
	
	logic[10:0] square4_size_x = 24;
	logic[10:0] square4_size_y = 24;
	
	/*
	logic[10:0] square5_x = 120;
	logic[10:0] square5_y = 24;
	logic[10:0] square5_size_x = 24;
	logic[10:0] square5_size_y = 24;
	
	logic[10:0] square6_x = 144;
	logic[10:0] square6_y = 24;
	logic[10:0] square6_size_x = 24;
	logic[10:0] square6_size_y = 24;
	
	logic[10:0] square7_x = 168;
	logic[10:0] square7_y = 24;
	logic[10:0] square7_size_x = 24;
	logic[10:0] square7_size_y = 24;
	
	logic[10:0] square8_x = 192;
	logic[10:0] square8_y = 24;
	logic[10:0] square8_size_x = 24;
	logic[10:0] square8_size_y = 24;
	
	logic[10:0] square9_x = 216;
	logic[10:0] square9_y = 24;
	logic[10:0] square9_size_x = 24;
	logic[10:0] square9_size_y = 24;
	
	logic[10:0] square10_x = 240;
	logic[10:0] square10_y = 24;
	logic[10:0] square10_size_x = 24;
	logic[10:0] square10_size_y = 24;
	
	*/
	
	logic left_on;
	logic right_on;
	logic top_on;
	logic bottom_on;
	
	logic[10:0] top_x = 24;
	logic[10:0] top_y = 0;
	logic[10:0] top_size_x = 240;
	logic[10:0] top_size_y = 24;
	
	logic[10:0] bottom_x = 24;
	logic[10:0] bottom_y = 455;
	logic[10:0] bottom_size_x = 240;
	logic[10:0] bottom_size_y = 25;
	
	logic[10:0] right_x = 264;
	logic[10:0] right_y = 0;
	logic[10:0] right_size_x = 24;
	logic[10:0] right_size_y = 480;
	
	logic[10:0] left_x = 0;
	logic[10:0] left_y = 0;
	logic[10:0] left_size_x = 24;
	logic[10:0] left_size_y = 480;
		
	/*
	 logic square_on;
	 logic[10:0] square_x; // not accurate
	 logic[10:0] square_y; // also not accurate
	 
	 assign square_x = BallX;
	 assign square_y = BallY;
	 
	 logic[10:0] square_size_x = 24; // accurate
	 logic[10:0] square_size_y = 24; // also accurate
	  */
	  
    always_comb
    begin:Ball_on_proc
	 
//		 if (DrawX >= square_x && DrawX < square_x + square_size_x &&
//		     DrawY >= square_y && DrawY < square_y + square_size_y)
//			  begin
//				square_on = 1'b1;		// draw object
//				right_on = 1'b0;
//				bottom_on = 1'b0;	
//				top_on = 1'b0;
//				left_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
//			  end
			  
	   if (DrawX >= top_x && DrawX < top_x + top_size_x &&
		     DrawY >= top_y && DrawY < top_y + top_size_y)
			  begin
				top_on = 1'b1;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				left_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;

			  end
		else if (DrawX >= bottom_x && DrawX < bottom_x + bottom_size_x &&
		     DrawY >= bottom_y && DrawY < bottom_y + bottom_size_y)
			  begin
				bottom_on = 1'b1;		// draw object
				right_on = 1'b0;
				top_on = 1'b0;
				left_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;

			  end
			  
	   else if (DrawX >= right_x && DrawX < right_x + right_size_x &&
		     DrawY >= right_y && DrawY < right_y + right_size_y)
			  begin
				right_on = 1'b1;		// draw object
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				left_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;
				
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
		else if (DrawX >= left_x && DrawX < left_x + left_size_x &&
		     DrawY >= left_y && DrawY < left_y + left_size_y)
			  begin
				left_on = 1'b1;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;
				
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  


			else if (DrawX >= square1_x && DrawX < square1_x + square1_size_x &&
		     DrawY >= square1_y && DrawY < square1_y + square1_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b1;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square2_x && DrawX < square2_x + square2_size_x &&
		     DrawY >= square2_y && DrawY < square2_y + square2_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b1;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square3_x && DrawX < square3_x + square3_size_x &&
		     DrawY >= square3_y && DrawY < square3_y + square3_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b1;
				square4= 1'b0;
				block_on = 0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square4_x && DrawX < square4_x + square4_size_x &&
		     DrawY >= square4_y && DrawY < square4_y + square4_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b1;
				block_on = 0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= 24 && DrawX < 264 &&
		     DrawY >= 24 && DrawY < 455 && (block == 1))
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				//square_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 1;
			  end
			/*  
			  else if (DrawX >= square5_x && DrawX < square5_x + square5_size_x &&
		     DrawY >= square5_y && DrawY < square5_y + square5_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b1;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square6_x && DrawX < square6_x + square6_size_x &&
		     DrawY >= square6_y && DrawY < square6_y + square6_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b1;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square7_x && DrawX < square7_x + square7_size_x &&
		     DrawY >= square7_y && DrawY < square7_y + square7_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b1;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square8_x && DrawX < square8_x + square8_size_x &&
		     DrawY >= square8_y && DrawY < square8_y + square8_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b1;
//				square9 = 1'b0;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square9_x && DrawX < square9_x + square9_size_x &&
		     DrawY >= square9_y && DrawY < square9_y + square9_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b1;
//				square10 = 1'b0;
			  end
			  
			  else if (DrawX >= square10_x && DrawX < square10_x + square10_size_x &&
		     DrawY >= square10_y && DrawY < square10_y + square10_size_y)
			  begin
				left_on = 1'b0;		// draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				square_on = 1'b0;
//				square1 = 1'b0;
//				square2 = 1'b0;
//				square3 = 1'b0;
//				square4= 1'b0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b1;
			  end
			  
			  
*/
		 else
			begin
				//square_on = 1'b0;		// do not draw object
				right_on = 1'b0;
				bottom_on = 1'b0;	
				top_on = 1'b0;
				left_on = 1'b0;
				square1 = 1'b0;
				square2 = 1'b0;
				square3 = 1'b0;
				square4= 1'b0;
				block_on = 0;
//				square5 = 1'b0;
//				square6 = 1'b0;
//				square7 = 1'b0;
//				square8 = 1'b0;
//				square9 = 1'b0;
//				square10 = 1'b0;
			end
       // if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
       //     ball_on = 1'b1;
       // else 
       //     ball_on = 1'b0;
     end 
       
    always_comb
    begin:RGB_Display
	 /*
		 if ((square_on == 1'b1))
		 // draw Orange Square
		 begin
			Red = 8'hFF;
			Green = 8'h80;
			Blue = 8'h00;
	    end
		 */
		 
		 // blue
		Red = 0;
		Blue = 255;
		Green = 0;
		 
		 if ((left_on == 1'b1))
		   begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'hFF;
	    end
		 else if ((square1 == 1'b1))
		 // draw Square
		 begin
            case (color)
					7'b0000001:
						begin
							// blue
							Red = 0;
							Blue = 255;
							Green = 0;
						end
					7'b0000010:
						begin
							Red = 8'hFF;
							Green = 8'h80;
							Blue = 8'h00;
						end
					7'b0000100:
						begin
							// purple
							Red = 128;
							Blue = 255;
							Green = 0;
						end
					7'b0001000:
						begin
							// green
							Red = 0;
							Blue = 0;
							Green = 255;
						end
					7'b0010000:
						begin
							// red
							Red = 255;
							Blue = 0;
							Green = 0;
						end
					7'b0100000:
						begin
							// light blue
							Red = 0;
							Blue = 255;
							Green = 255;
						end
					7'b1000000:
						begin
							// yellow
							Red = 255;
							Blue = 0;
							Green = 255;
						end
					default:
						begin
						end
				endcase
	    end
        else if ((square2 == 1'b1))
           begin
            case (color)
					7'b0000001:
						begin
							// blue
							Red = 0;
							Blue = 255;
							Green = 0;
						end
					7'b0000010:
						begin
							Red = 8'hFF;
							Green = 8'h80;
							Blue = 8'h00;
						end
					7'b0000100:
						begin
							// purple
							Red = 128;
							Blue = 255;
							Green = 0;
						end
					7'b0001000:
						begin
							// green
							Red = 0;
							Blue = 0;
							Green = 255;
						end
					7'b0010000:
						begin
							// red
							Red = 255;
							Blue = 0;
							Green = 0;
						end
					7'b0100000:
						begin
							// light blue
							Red = 0;
							Blue = 255;
							Green = 255;
						end
					7'b1000000:
						begin
							// yellow
							Red = 255;
							Blue = 0;
							Green = 255;
						end
					default:
						begin
							
						end
				endcase
        end
        else if ((square3 == 1'b1))
           begin
            case (color)
					7'b0000001:
						begin
							// blue
							Red = 0;
							Blue = 255;
							Green = 0;
						end
					7'b0000010:
						begin
							Red = 8'hFF;
							Green = 8'h80;
							Blue = 8'h00;
						end
					7'b0000100:
						begin
							// purple
							Red = 128;
							Blue = 255;
							Green = 0;
						end
					7'b0001000:
						begin
							// green
							Red = 0;
							Blue = 0;
							Green = 255;
						end
					7'b0010000:
						begin
							// red
							Red = 255;
							Blue = 0;
							Green = 0;
						end
					7'b0100000:
						begin
							// light blue
							Red = 0;
							Blue = 255;
							Green = 255;
						end
					7'b1000000:
						begin
							// yellow
							Red = 255;
							Blue = 0;
							Green = 255;
						end
					default:
						begin
							
						end
				endcase
        end
        else if ((square4 == 1'b1))
           begin
            case (color)
					7'b0000001:
						begin
							// blue
							Red = 0;
							Blue = 255;
							Green = 0;
						end
					7'b0000010:
						begin
							// orange
							Red = 8'hFF;
							Green = 8'h80;
							Blue = 8'h00;
						end
					7'b0000100:
						begin
							// purple
							Red = 128;
							Blue = 255;
							Green = 0;
						end
					7'b0001000:
						begin
							// green
							Red = 0;
							Blue = 0;
							Green = 255;
						end
					7'b0010000:
						begin
							// red
							Red = 255;
							Blue = 0;
							Green = 0;
						end
					7'b0100000:
						begin
							// light blue
							Red = 0;
							Blue = 255;
							Green = 255;
						end
					7'b1000000:
						begin
							// yellow
							Red = 255;
							Blue = 0;
							Green = 255;
						end
					default:
						begin
					
						end
				endcase
        end
		  
		  
//        else if ((square5 == 1'b1))
//           begin
//            Red = 8'd150;
//            Green = 8'd150;
//            Blue = 8'd150;
//        end
//        else if ((square6 == 1'b1))
//           begin
//            Red = 8'd250;
//            Green = 8'd250;
//            Blue = 8'd0;
//        end
//        else if ((square7 == 1'b1))
//           begin
//            Red = 8'd35;
//            Green = 8'd250;
//            Blue = 8'd35;
//        end
//        else if ((square8 == 1'b1))
//           begin
//            Red = 8'd250;
//            Green = 8'd20;
//            Blue = 8'd20;
//        end
//        else if ((square9 == 1'b1))
//           begin
//            Red = 8'd100;
//            Green = 8'd150;
//            Blue = 8'd100;
//        end
//        else if ((square10 == 1'b1))
//           begin
//            Red = 8'd250;
//            Green = 8'd10;
//            Blue = 8'd250;
//        end
//		 
//		 ////////////////////////
		  else if((top_on == 1'b1))
		   begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'hFF;
	    end
		  else if((bottom_on == 1'b1))
		 begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'hFF;
	    end
		  else if ((right_on == 1'b1))
		 begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'hFF;
		 end
			else if ((block_on == 1))
				begin
					Red = 214;
					Green = 192;
					Blue = 233;
				end
		 
       // if ((ball_on == 1'b1)) 
       // begin 
       //     Red = 8'hff;
        //    Green = 8'hff;
        //    Blue = 8'hff;
      //  end       
        else 
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end      
    end 
    
endmodule
