module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1
timeprecision 1ns;

// These signals are internal because the processor will be
// instantiated as a submodule in testbench.
logic Clk = 0;
//logic        [9:0] square1_x, square1_y; 
//							  logic        [9:0] square2_x, square2_y;
//							  logic        [9:0] square3_x, square3_y;
//							  logic        [9:0] square4_x, square4_y;
//							  logic        [9:0]	DrawX, DrawY, Ball_size;
//							  logic			[6:0] color;
//                       logic [7:0]  Red, Green, Blue;

logic grid [0:9][0:17];
logic new_grid [0:9][0:17];

//logic [0:9][0:17] grid;
//logic [0:9][0:17] new_grid;

deleteRow boi(.*);
// To store expected results

// A counter to count the instances where simulation results
// do no match with expected results

// Instantiating the DUT
// Make sure the module and signal names match with those in your design


// Toggle the clock
// #1 means wait for a delay of 1 timeunit



always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
//#0 Reset = 0;
//#2 Reset = 1;
//#2 Reset = 0;

#0 grid [0][17] = 1;
#0 grid [1][17] = 1;
#0 grid [2][17] = 1;
#0 grid [3][17] = 1;
#0 grid [4][17] = 1;
#0 grid [5][17] = 1;
#0 grid [6][17] = 1;
#0 grid [7][17] = 1;
#0 grid [8][17] = 1;
#0 grid [9][17] = 0;



#60 grid [9][17] = 1;



end
endmodule