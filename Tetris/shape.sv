


module  shape ( input Reset, frame_clk, 
					input [7:0] keycode,
               output [9:0]  BallX, BallY, BallS );
	
	
//logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;

	logic spawn;
	
	logic counter_24[7:0] = 8'b00000000;

	logic [9:0] SQ1_X_Pos, SQ1_X_Motion_shift, SQ1_Y_Pos, SQ1_Y_Motion_drop;
	logic [9:0] SQ2_X_Pos, SQ2_X_Motion_shift, SQ2_Y_Pos, SQ2_Y_Motion_drop;
	logic [9:0] SQ3_X_Pos, SQ3_X_Motion_shift, SQ3_Y_Pos, SQ3_Y_Motion_drop;
	logic [9:0] SQ4_X_Pos, SQ4_X_Motion_shift, SQ4_Y_Pos, SQ4_Y_Motion_drop;


	always_ff @ (posedge Reset or posedge frame_clk )
	begin: Move_Shape_Down
	
	if (Reset)  // Asynchronous Reset
        begin 
        end
		  
		  else
		  begin
		  
			case(keycode) // up=82   left = 80  down = 81  right = 79   space = 44   z(rot left)) = 29   x(rotright) = 27
					//8'h52:   // up
					//	begin
					//		Ball_X_Motion <= 10'd0;
					//		Ball_Y_Motion <= (~(Ball_Y_Step) + 1'b1);
					//	end
					//8'h51: //down
					//	begin
					//		Ball_X_Motion <= 10'd0;
					//		Ball_Y_Motion <= Ball_Y_Step;
					//	end
					8'h50: // left
						begin
							//Ball_Y_Motion <= 10'd0;
							SQ1_X_Motion_shift <= ~(8'b00011000) + 1'b1 ;
						end
					8'h4f: // right
						begin
							//Ball_Y_Motion <= 10'd0;
							SQ1_X_Motion_shift <= (8'b00011000);
						end
				endcase
				counter_24 <= counter_24 + 1'b1;
				
				if ( (counter_24 = 8'b00010111 ))  // go down 24 every 24 cycles DROP
						begin
							SQ1_Y_Motion_drop <= (8'b00011000);  
							//SQ1_X_Motion <= 10'd0;
							SQ2_Y_Motion_drop <= (8'b00011000);  
							//SQ2_X_Motion <= 10'd0;
							SQ3_Y_Motion_drop <= (8'b00011000);  
							//SQ3_X_Motion <= 10'd0;
							SQ4_Y_Motion_drop <= (8'b00011000);  
							//SQ4_X_Motion <= 10'd0;
							counter_24 <= 8'b00000000;
						end
			
			 SQ1_Y_Pos <= (SQ1_Y_Pos + SQ1_Y_Motion_drop);
			 SQ2_Y_Pos <= (SQ2_Y_Pos + SQ2_Y_Motion_drop);
			 SQ3_Y_Pos <= (SQ3_Y_Pos + SQ3_Y_Motion_drop);
			 SQ4_Y_Pos <= (SQ4_Y_Pos + SQ4_Y_Motion_drop);
			 
			 SQ1_X_Pos <= (SQ1_X_Pos + SQ1_X_Motion_shift);
			 SQ2_X_Pos <= (SQ1_X_Pos + SQ1_X_Motion_shift);
			 SQ3_X_Pos <= (SQ1_X_Pos + SQ1_X_Motion_shift);
			 SQ4_X_Pos <= (SQ1_X_Pos + SQ1_X_Motion_shift);
			 
			 //SQ1_Y_Pos <= (SQ1_Y_Pos + SQ1_Y_Motion_drop SQ1_Y_motion_rotate);
		end
	end
endmodule