`timescale 1ns/1ps
module input_port_tb();

////////////tb parameters////////////////
parameter flit_width=16;
parameter MAX_Packet_NUM=8;

      ////clk_parameter//////
parameter  clock_period=10;

////////////signals/////////////////////

reg                        clk_tb;
reg                        rst_tb;
reg                        VALID_tb;
reg   [flit_width-1:0]     FLIT_i_tb;
reg                        VC_0_RESERVED_tb;
reg                        VC_1_RESERVED_tb;
reg                        VC_2_RESERVED_tb;
reg                        VC_3_RESERVED_tb;
reg                        VC_ANSWER_tb;
reg                        SW_ANSWER_tb;
reg                        ROUTE_DONE_tb;
reg   [3:0]                ROUTE_RESULT_tb;
wire                        ON_OFF_0_tb;
wire                        ON_OFF_1_tb;
wire                        ON_OFF_2_tb;
wire                        ON_OFF_3_tb;
wire   [flit_width-1:0]     FLIT_O_tb; 
wire    [3:0]               Route_info_tb;
wire                        Start_route_tb;
wire    [5:0]               Vc_request_tb;
wire                        valid_vc_req_tb;
wire    [3:0]               Sw_request_tb;
wire                        Valid_sw_req_tb;

/////////////////////clock generation//////////////////

always #(clock_period/2)   clk_tb = ~clk_tb;

////////////////////////initail////////////////////////
initial
  begin 
   $dumpfile("input_port_tb.vcd");
   $dumpvars;
    
    
// initialization
   initialize();
   
      
 // Reset
   reset();
	
#clock_period	
   VC_0_RESERVED_tb = 1'b1;
	
#clock_period
   VALID_tb  = 1'b1;
   FLIT_i_tb =  'b1100_1010_0001_0000;	
	
#clock_period
   VALID_tb  = 1'b0;
//...............................
 
 wait (Start_route_tb==1'b1)
 
 #clock_period
#clock_period
   
   ROUTE_DONE_tb    = 1'b1;
   ROUTE_RESULT_tb  = 4'b0110;
   	
   VC_1_RESERVED_tb = 1'b1;

#clock_period
   VALID_tb  = 1'b1;	
   FLIT_i_tb =  'b1100_1010_0010_1001;	
   
#clock_period
      VALID_tb  = 1'b0;
 VC_ANSWER_tb     = 1'b1;     
//.....................................

#clock_period	
   VC_2_RESERVED_tb = 1'b1;
	
	
#clock_period
   VALID_tb  = 1'b1;
   FLIT_i_tb =  'b1100_1010_0011_1010;	
	
#clock_period
   VALID_tb  = 1'b0;
   
   SW_ANSWER_tb     = 1'b1;
//.....................................
   
   #clock_period    
      VC_2_RESERVED_tb = 1'b1;	
#clock_period
   VALID_tb  = 1'b1;
   FLIT_i_tb =  'b1100_1010_0100_1011;	

#clock_period
   VALID_tb  = 1'b0;
	
	


    
	
	
	
	
	
	
#1000	
	
	$finish;
	
  end



//////////////Tasks////////////////////////////
/***************** Signals Initialization *******************/     
     
task initialize;
 begin
   clk_tb           = 1'b0;
   VALID_tb         = 1'b0;
   FLIT_i_tb        =  'b0;
   VC_0_RESERVED_tb = 1'b0;
   VC_1_RESERVED_tb = 1'b0;
   VC_2_RESERVED_tb = 1'b0;
   VC_3_RESERVED_tb = 1'b0;
   VC_ANSWER_tb     = 1'b0;
   SW_ANSWER_tb     = 1'b0;
   ROUTE_DONE_tb    = 1'b0;
   ROUTE_RESULT_tb  = 4'b0;
 end
endtask     
     
/************************   RESET   **************************/    
          
task reset;
   begin
	
    rst_tb = 0;
	 
#clock_period

    rst_tb = 1;
	 
   end
endtask 






/////////////////DUT Instantation/////////////////////////////

input_port #(.flit_width(flit_width),.MAX_Packet_NUM(MAX_Packet_NUM))DUT_0(
.clk(clk_tb),
.rst(rst_tb),
.VALID(VALID_tb),
.FLIT_i(FLIT_i_tb),
.VC_0_RESERVED(VC_0_RESERVED_tb),
.VC_1_RESERVED(VC_1_RESERVED_tb),
.VC_2_RESERVED(VC_2_RESERVED_tb),
.VC_3_RESERVED(VC_3_RESERVED_tb),
.VC_ANSWER(VC_ANSWER_tb),
.SW_ANSWER(SW_ANSWER_tb),
.ROUTE_DONE(ROUTE_DONE_tb),
.ROUTE_RESULT(ROUTE_RESULT_tb),
.ON_OFF_0(ON_OFF_0_tb),
.ON_OFF_1(ON_OFF_1_tb),
.ON_OFF_2(ON_OFF_2_tb),
.ON_OFF_3(ON_OFF_3_tb),
.FLIT_O(FLIT_O_tb), 
.Route_info(Route_info_tb),
.Start_route(Start_route_tb),
.Vc_request(Vc_request_tb),
.valid_vc_req(valid_vc_req_tb),
.Sw_request(Sw_request_tb),
.Valid_sw_req(Valid_sw_req_tb)
);


endmodule
