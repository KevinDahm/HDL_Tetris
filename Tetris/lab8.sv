//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  lab8 		( input         CLOCK_50,
                       input[3:0]    KEY, //bit 0 is set up as Reset
							  output logic [6:0]  HEX0, HEX1,// HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  //output [8:0]  LEDG,
							  //output [17:0] LEDR,
							  // VGA Interface 
                       output logic [7:0]  VGA_R,					//VGA Red
							                VGA_G,					//VGA Green
												 VGA_B,					//VGA Blue
							  output       logic  VGA_CLK,				//VGA Clock
							                VGA_SYNC_N,			//VGA Sync signal
												 VGA_BLANK_N,			//VGA Blank signal
												 VGA_VS,					//VGA virtical sync signal	
												 VGA_HS,					//VGA horizontal sync signal
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output logic [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output  logic       OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output logic [12:0] DRAM_ADDR,				// SDRAM Address 13 Bits
							  inout [31:0]  DRAM_DQ,				// SDRAM Data 32 Bits
							  output logic [1:0]  DRAM_BA,				// SDRAM Bank Address 2 Bits
							  output logic [3:0]  DRAM_DQM,				// SDRAM Data Mast 4 Bits
							  output	logic 		 DRAM_RAS_N,			// SDRAM Row Address Strobe
							  output	logic 		 DRAM_CAS_N,			// SDRAM Column Address Strobe
							  output	logic 		 DRAM_CKE,				// SDRAM Clock Enable
							  output	logic 		 DRAM_WE_N,				// SDRAM Write Enable
							  output	logic 		 DRAM_CS_N,				// SDRAM Chip Select
							  output	logic 		 DRAM_CLK				// SDRAM Clock
											);
    
    logic Reset_h, vssig, Clk, brst;
    logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	 logic [15:0] keycode;
    
	 assign Clk = CLOCK_50;
    assign {Reset_h}= ~(KEY[0]);  // The push buttons are active low
	 assign {brst} = ~(KEY[1]);
	 
	 wire [1:0] hpi_addr;
	 wire [15:0] hpi_data_in, hpi_data_out;
	 wire hpi_r, hpi_w,hpi_cs;
	 
	 hpi_io_intf hpi_io_inst(   .from_sw_address(hpi_addr),
										 .from_sw_data_in(hpi_data_in),
										 .from_sw_data_out(hpi_data_out),
										 .from_sw_r(hpi_r),
										 .from_sw_w(hpi_w),
										 .from_sw_cs(hpi_cs),
		 								 .OTG_DATA(OTG_DATA),    
										 .OTG_ADDR(OTG_ADDR),    
										 .OTG_RD_N(OTG_RD_N),    
										 .OTG_WR_N(OTG_WR_N),    
										 .OTG_CS_N(OTG_CS_N),    
										 .OTG_RST_N(OTG_RST_N),   
										 .OTG_INT(OTG_INT),
										 .Clk(Clk),
										 .Reset(Reset_h)
	 );
	 
	 //The connections for nios_system might be named different depending on how you set up Qsys
	 nios_system nios_system(
										 .clk_clk(Clk),         
										 .reset_reset_n(KEY[0]),   
										 .sdram_wire_addr(DRAM_ADDR), 
										 .sdram_wire_ba(DRAM_BA),   
										 .sdram_wire_cas_n(DRAM_CAS_N),
										 .sdram_wire_cke(DRAM_CKE),  
										 .sdram_wire_cs_n(DRAM_CS_N), 
										 .sdram_wire_dq(DRAM_DQ),   
										 .sdram_wire_dqm(DRAM_DQM),  
										 .sdram_wire_ras_n(DRAM_RAS_N),
										 .sdram_wire_we_n(DRAM_WE_N), 
										 .sdram_clk_clk(DRAM_CLK), // was .sdram_out_clk(DRAM_CLK);
										 .keycode_export(keycode),  
										 .otg_hpi_address_export(hpi_addr),
										 .otg_hpi_data_in_port(hpi_data_in),
										 .otg_hpi_data_out_port(hpi_data_out),
										 .otg_hpi_cs_export(hpi_cs),
										 .otg_hpi_r_export(hpi_r),
										 .otg_hpi_w_export(hpi_w));
	
	// Logical Wires created for Tetris
	logic a_enable, s_enable, d_enable, r_enable, drop_enable, n_enable;
	logic [9:0] square1_x, square1_y;
	logic [9:0] square2_x, square2_y;
	logic [9:0] square3_x, square3_y;
	logic [9:0] square4_x, square4_y;
	logic [9:0] ball1xsig, ball1ysig;
	logic [9:0] ball2xsig, ball2ysig;
	logic [9:0] ball3xsig, ball3ysig;
	logic [9:0] ball4xsig, ball4ysig;
	logic newShape;
	logic [6:0] colorWire;
	logic leftEdge1, leftEdge2, leftEdge3, leftEdge4;
	logic rightEdge1, rightEdge2, rightEdge3, rightEdge4;
	logic bottomEdge1, bottomEdge2, bottomEdge3, bottomEdge4;
	logic disableMoveLeft, disableMoveRight, disableMoveDown;
	logic spawnShape;
	logic gridWire[0:9][0:17];
	//logic new_gridWire[0:9][0:17];
	
	assign disableMoveLeft = leftEdge1 | leftEdge2 | leftEdge3 | leftEdge4;
	assign disableMoveRight = rightEdge1 | rightEdge2 | rightEdge3 | rightEdge4;
	assign disableMoveDown = bottomEdge1 | bottomEdge2 | bottomEdge3 | bottomEdge4;
	assign spawnShape = newShape | disableMoveDown;

	
	//Fill in the connections for the rest of the modules 
	
   vga_controller vgasync_instance(.Reset(reset_h), .Clk(Clk), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_CLK), .blank(VGA_BLANK_N), .sync(VGA_SYNC_N), .DrawX(drawxsig), .DrawY(drawysig));
   
   ball square1(.Reset(brst | reset_h), .frame_clk(VGA_VS), .BallX(ball1xsig), .BallY(ball1ysig), .BallS(ballsizesig), .a_enable(a_enable), .s_enable(s_enable | drop_enable), .d_enable(d_enable), .r_enable(r_enable), .x(square1_x), .y(square1_y), .newShape(spawnShape), .disableMoveLeft(disableMoveLeft), .disableMoveRight(disableMoveRight), .disableMoveDown(disableMoveDown), .leftEdge(leftEdge1), .rightEdge(rightEdge1), .bottomEdge(bottomEdge1), .grid(gridWire));
   ball square2(.Reset(brst | reset_h), .frame_clk(VGA_VS), .BallX(ball2xsig), .BallY(ball2ysig), .BallS(ballsizesig), .a_enable(a_enable), .s_enable(s_enable | drop_enable), .d_enable(d_enable), .r_enable(r_enable), .x(square2_x), .y(square2_y), .newShape(spawnShape), .disableMoveLeft(disableMoveLeft), .disableMoveRight(disableMoveRight), .disableMoveDown(disableMoveDown), .leftEdge(leftEdge2), .rightEdge(rightEdge2), .bottomEdge(bottomEdge2), .grid(gridWire));
	ball square3(.Reset(brst | reset_h), .frame_clk(VGA_VS), .BallX(ball3xsig), .BallY(ball3ysig), .BallS(ballsizesig), .a_enable(a_enable), .s_enable(s_enable | drop_enable), .d_enable(d_enable), .r_enable(r_enable), .x(square3_x), .y(square3_y), .newShape(spawnShape), .disableMoveLeft(disableMoveLeft), .disableMoveRight(disableMoveRight), .disableMoveDown(disableMoveDown), .leftEdge(leftEdge3), .rightEdge(rightEdge3), .bottomEdge(bottomEdge3), .grid(gridWire));
	ball square4(.Reset(brst | reset_h), .frame_clk(VGA_VS), .BallX(ball4xsig), .BallY(ball4ysig), .BallS(ballsizesig), .a_enable(a_enable), .s_enable(s_enable | drop_enable), .d_enable(d_enable), .r_enable(r_enable), .x(square4_x), .y(square4_y), .newShape(spawnShape), .disableMoveLeft(disableMoveLeft), .disableMoveRight(disableMoveRight), .disableMoveDown(disableMoveDown), .leftEdge(leftEdge4), .rightEdge(rightEdge4), .bottomEdge(bottomEdge4), .grid(gridWire));
	
   color_mapper color_instance(.DrawX(drawxsig), .DrawY(drawysig), .square1_x(ball1xsig), .square1_y(ball1ysig), .square2_x(ball2xsig), .square2_y(ball2ysig), .square3_x(ball3xsig), .square3_y(ball3ysig), .square4_x(ball4xsig), .square4_y(ball4ysig), .Ball_size(ballsizesig), .Red(VGA_R), .Green(VGA_G), .Blue(VGA_B), .color(colorWire), .grid(gridWire));
	
	blockCreator createBlock(.Clk(VGA_VS), .Reset(brst), .square1_x(square1_x), .square1_y(square1_y), .square2_x(square2_x), .square2_y(square2_y), .square3_x(square3_x), .square3_y(square3_y), .square4_x(square4_x), .square4_y(square4_y), .currentShape(colorWire), .newShape(spawnShape));								
	
	move moveSquare(.Reset(brst), .Clk(VGA_VS), .keycode(keycode[7:0]), .a_enable(a_enable), .s_enable(s_enable), .d_enable(d_enable), .r_enable(r_enable), .drop_enable(drop_enable), .n_enable(newShape));	
	
	row yourboat(.Reset(brst), .Clk(VGA_VS), .square1_x(ball1xsig), .square1_y(ball1ysig), .square2_x(ball2xsig), .square2_y(ball2ysig), .square3_x(ball3xsig), .square3_y(ball3ysig), .square4_x(ball4xsig), .square4_y(ball4ysig), .grid(gridWire), .spawnShape(spawnShape));//, .new_grid(new_gridWire));
	
	//deleteRow clearRows(.Clk(VGA_VS), .grid(gridWire), .new_grid(new_gridWire));

	HexDriver hex_inst_0 (keycode[3:0], HEX0);
	 HexDriver hex_inst_1 (keycode[7:4], HEX1);
    

	 /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #1/2:
          What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
			 connect to the keyboard? List any two.  Give an answer in your Post-Lab.
     **************************************************************************************/
endmodule
