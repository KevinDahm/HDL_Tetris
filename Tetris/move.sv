module move ( input Reset, Clk, 
					input [7:0] keycode,
               output logic a_enable, s_enable, d_enable, n_enable,
					output logic r_enable,
					output logic drop_enable);

					
					enum logic [3:0] {WAIT, a_keypress, send_a, d_keypress, send_d, s_keypress, send_s, r_keypress, send_r, n_keypress, send_n} state, next_state;
					
					logic [5:0] count;
					always_ff @ (posedge Clk or posedge Reset)
					begin
						if (Reset)
							begin
								state <= WAIT;
								count = 0;
							end
						else
							begin
								state <= next_state;
								count = count + 1;
							end
					end
					always_comb begin
						
						if (count == 63) 
							drop_enable = 1;
						else
							drop_enable = 0;
							
						a_enable = 1'b0;
						s_enable = 1'b0;
						d_enable = 1'b0;
						r_enable = 1'b0;
						n_enable = 1'b0;
						
						
					unique case (state)
					
						WAIT : begin
									if (8'h04 == keycode)		// left
										next_state <= a_keypress;
									else if (8'h16 == keycode) // down
										next_state <= s_keypress;
									else if (8'h07 == keycode) // right
										next_state <= d_keypress;
									else if (8'h15 == keycode) // reset
										next_state <= r_keypress;
									else if (8'h11 == keycode)
										next_state <= n_keypress;
									else
										next_state <= WAIT;
								 end
								 
						a_keypress : begin
											if (8'h04 == keycode)
												next_state <= a_keypress;
											else
												next_state <= send_a;
										 end
										 
						s_keypress : begin
											if (8'h16 == keycode)
												next_state <= s_keypress;
											else
												next_state <= send_s;
										 end
										 
						d_keypress : begin
											if (8'h07 == keycode)
												next_state <= d_keypress;
											else
												next_state <= send_d;
									    end
												 
						r_keypress : begin
											if (8'h15 == keycode)
												next_state <= r_keypress;
											else
												next_state <= send_r;
									    end
								
						send_a : begin
										a_enable = 1;
										next_state <= WAIT;
								   end
									
						send_s : begin
										s_enable = 1;
										next_state <= WAIT;
								   end
									
						send_d : begin
										d_enable = 1;
										next_state <= WAIT;
									end
									
						send_r : begin
										r_enable = 1;
										next_state <= WAIT;
									end
									
						n_keypress : begin
											if (8'h11 == keycode)
												next_state <= n_keypress;
											else
												next_state <= send_n;
										 end
										 
						send_n : begin
										n_enable = 1;
										next_state <= WAIT;
									end
						default : begin
									 end
					endcase
				end
endmodule