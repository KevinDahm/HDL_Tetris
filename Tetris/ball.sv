//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk, 
					//input [7:0] keycode,
					input a_enable, s_enable, d_enable, r_enable, newShape,
					input disableMoveLeft, disableMoveRight, disableMoveDown,
					input [9:0]x, y,
					input grid[0:9][0:17],
               output logic [9:0]  BallX, BallY, BallS,
					output logic leftEdge, rightEdge, bottomEdge );
    
	 logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 
	 assign Ball_Size = 24;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 
	 always_ff @(posedge Reset or posedge frame_clk)
	 begin
		if (Reset)  // Asynchronous Reset
			begin
				Ball_Y_Pos <= y;
				Ball_X_Pos <= x;
        end

		  else if (newShape)  // Asynchronous Reset
			begin
				Ball_Y_Pos <= y;
				Ball_X_Pos <= x;
        end
		else if (a_enable && (Ball_X_Pos - 24 >= 24) && !disableMoveLeft) // left
			begin
				Ball_X_Pos <= Ball_X_Pos - 24;
			end
		else if ((s_enable) && (Ball_Y_Pos + 24 <= 454) && !disableMoveDown) // down
																 
			Ball_Y_Pos <= Ball_Y_Pos + 24;
						
		else if (d_enable && (Ball_X_Pos + 24 <= 240) && !disableMoveRight) // right
			begin
			 Ball_X_Pos <= Ball_X_Pos + 24;
			end			
		else 
			begin
				Ball_X_Pos <= Ball_X_Pos;
				Ball_Y_Pos <= Ball_Y_Pos;
			end
	 end
	 
	 always_comb
		begin
			if (1 == grid[(Ball_X_Pos / 24) - 2][(Ball_Y_Pos / 24) - 1])
				leftEdge = 1;
			else if (Ball_X_Pos == 24)
				leftEdge = 1;
			else
				leftEdge = 0;
			
			if (1 == grid[(Ball_X_Pos / 24)][(Ball_Y_Pos / 24) - 1])
				rightEdge = 1;
			else if (Ball_X_Pos == 240)
				rightEdge = 1;
			else
				rightEdge = 0;
			
			if (1 == grid[(Ball_X_Pos / 24) - 1][Ball_Y_Pos / 24])
				bottomEdge = 1;
			else if (Ball_Y_Pos == 432)
					 bottomEdge = 1;
			else
				bottomEdge = 0;
		end
//	 
//	 ////////////////////////////////////////////////////////////////////////////
//    
//	 
//    parameter [9:0] Ball_X_Min=24;       // Leftmost point on the X axis
//    parameter [9:0] Ball_X_Max=240;     // Rightmost point on the X axis
//    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
//    parameter [9:0] Ball_Y_Max=454;     // Bottommost point on the Y axis
//    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
//    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
//
//    assign Ball_Size = 24;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
//   
//	
//    always_ff @ (posedge Reset or posedge frame_clk )
//    begin: Move_Ball
//			 
//        if (Reset)  // Asynchronous Reset
//        begin 
//            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball_X_Motion <= 10'd0; //Ball_X_Step;
//				Ball_Y_Pos <= 24;
//				Ball_X_Pos <= 144;
//        end
//				
//        else 
//        begin 
//		  
//				case(keycode)
//					8'h1a:
//						begin
//							Ball_X_Motion <= 10'd0;
//							Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);
//						end
//					8'h16:
//						begin
//							Ball_X_Motion <= 10'd0;
//							Ball_Y_Motion <= Ball_Y_Step;
//						end
//					8'h04: // left
//						begin
//							Ball_Y_Motion <= 10'd0;
//							if (Ball_X_Pos <= Ball_X_Min)
//								begin
//									Ball_X_Pos = 24;
//									Ball_X_Motion <= 0;
//								end
//							else
//								Ball_X_Pos = Ball_X_Pos - 24;
//						end
//					8'h07: // right
//						begin
//							Ball_Y_Motion <= 10'd0;
//							if (Ball_X_Pos >= Ball_X_Max)
//								begin
//									Ball_X_Pos = 240;
//									Ball_X_Motion <= 0;
//								end
//							else
//								Ball_X_Pos = Ball_X_Pos + 24;
//						end
//				endcase
//				
//				// Boundary Conditions
//				 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
//						begin
//							Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);  // 2's complement.
//							Ball_X_Motion <= 10'd0;
//						end
//				 else if ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
//					begin
//					  Ball_Y_Motion <= Ball_Y_Step;
//					  Ball_X_Motion <= 10'd0;
//					end
//				 /*
//				 // Not working
//				 else if ( Ball_X_Pos >= Ball_X_Max ) // Ball is at the right most edge
//						begin
//							if (Ball_X_Motion == 1)
//								Ball_X_Motion <= 10'd0;
//								
//							Ball_Y_Motion <= Ball_Y_Step;
//						end
//				 else if ( Ball_X_Pos <= Ball_X_Min ) // ball is at left edge
//					begin
//						if (Ball_X_Motion == -1)
//							Ball_X_Motion <= 10'd0;
//							
//					   Ball_Y_Motion <= Ball_Y_Step;
//					end
//					*/
//				// else 
//				//	begin
//				//	  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
//				//	  Ball_X_Motion <= Ball_X_Motion;  // You need to remove this and make both X and Y respond to keyboard input
//				//	end
//				 
//				 
//				 
//				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
//				 Ball_X_Pos <= (Ball_X_Pos);
//			
//			
//	  /**************************************************************************************
//	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
//		 Hidden Question #2/2:
//          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
//          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
//          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
//          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
//      **************************************************************************************/
//      
//			
//		end  
//   end
//	 
//	 
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
