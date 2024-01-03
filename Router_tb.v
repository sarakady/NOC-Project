`timescale 1ns/1ps
module Router_tb();

////////////tb parameters////////////////

parameter flit_width=16;
parameter MAX_Packet_NUM=8; 
parameter Flit_size = 16;
parameter current_router = 4'b0100;
parameter REQ_size = 3;


      ////clk_parameter//////
		
parameter  clock_period=10;

////////////signals/////////////////////
reg                        clk_tb;                                                
reg                        rst_tb;
reg                        N_VALID_i_tb;
reg  [flit_width-1:0]      N_FLIT_i_tb;
reg                        N_VC_0_RESERVED_i_tb; 
reg                        N_VC_1_RESERVED_i_tb;
reg                        N_VC_2_RESERVED_i_tb;
reg                        N_VC_3_RESERVED_i_tb;
reg                        S_VALID_i_tb;         
reg  [flit_width-1:0]      S_FLIT_i_tb;
reg                        S_VC_0_RESERVED_i_tb;
reg                        S_VC_1_RESERVED_i_tb;
reg                        S_VC_2_RESERVED_i_tb;
reg                        S_VC_3_RESERVED_i_tb;
reg                        W_VALID_i_tb;         
reg  [flit_width-1:0]      W_FLIT_i_tb;
reg                        W_VC_0_RESERVED_i_tb;
reg                        W_VC_1_RESERVED_i_tb;
reg                        W_VC_2_RESERVED_i_tb;
reg                        W_VC_3_RESERVED_i_tb;
reg                        E_VALID_i_tb;        
reg  [flit_width-1:0]      E_FLIT_i_tb;
reg                        E_VC_0_RESERVED_i_tb;
reg                        E_VC_1_RESERVED_i_tb;
reg                        E_VC_2_RESERVED_i_tb;
reg                        E_VC_3_RESERVED_i_tb;
reg                        PE_VALID_i_tb;
reg  [flit_width-1:0]      PE_FLIT_i_tb;
reg                        PE_VC_0_RESERVED_i_tb;
reg                        PE_VC_1_RESERVED_i_tb;
reg                        PE_VC_2_RESERVED_i_tb;
reg                        PE_VC_3_RESERVED_i_tb;
reg                        N_ON_OFF_0_i_tb;
reg                        N_ON_OFF_1_i_tb;
reg                        N_ON_OFF_2_i_tb;
reg                        N_ON_OFF_3_i_tb;
reg                        S_ON_OFF_0_i_tb;											 
reg                        S_ON_OFF_1_i_tb;											 
reg                        S_ON_OFF_2_i_tb;											 
reg                        S_ON_OFF_3_i_tb;											 
reg                        W_ON_OFF_0_i_tb;											 
reg                        W_ON_OFF_1_i_tb;
reg                        W_ON_OFF_2_i_tb;
reg                        W_ON_OFF_3_i_tb;
reg                        E_ON_OFF_0_i_tb;
reg                        E_ON_OFF_1_i_tb;
reg                        E_ON_OFF_2_i_tb;
reg                        E_ON_OFF_3_i_tb;
reg                        PE_ON_OFF_0_i_tb;
reg                        PE_ON_OFF_1_i_tb;
reg                        PE_ON_OFF_2_i_tb;
reg                        PE_ON_OFF_3_i_tb;
wire  [flit_width-1:0]     N_FLIT_o_tb;
wire  [flit_width-1:0]     S_FLIT_o_tb;
wire  [flit_width-1:0]     E_FLIT_o_tb;
wire  [flit_width-1:0]     W_FLIT_o_tb;
wire  [flit_width-1:0]     PE_FLIT_o_tb;
wire                       N_VALID_O_tb;
wire                       N_VC_0_RESERVED_O_tb;
wire                       N_VC_1_RESERVED_O_tb;
wire                       N_VC_2_RESERVED_O_tb;
wire                       N_VC_3_RESERVED_O_tb;
wire                       S_VALID_O_tb;
wire                       S_VC_0_RESERVED_O_tb;
wire                       S_VC_1_RESERVED_O_tb;
wire                       S_VC_2_RESERVED_O_tb;
wire                       S_VC_3_RESERVED_O_tb;
wire                       W_VALID_O_tb;
wire                       W_VC_0_RESERVED_O_tb;
wire                       W_VC_1_RESERVED_O_tb;
wire                       W_VC_2_RESERVED_O_tb;
wire                       W_VC_3_RESERVED_O_tb;                       
wire                       E_VALID_O_tb;
wire                       E_VC_0_RESERVED_O_tb;
wire                       E_VC_1_RESERVED_O_tb;
wire                       E_VC_2_RESERVED_O_tb;
wire                       E_VC_3_RESERVED_O_tb;
wire                       PE_VALID_O_tb;
wire                       PE_VC_0_RESERVED_O_tb;
wire                       PE_VC_1_RESERVED_O_tb;
wire                       PE_VC_2_RESERVED_O_tb;
wire                       PE_VC_3_RESERVED_O_tb;
wire                       N_ON_OFF_0_O_tb;
wire                       N_ON_OFF_1_O_tb;
wire                       N_ON_OFF_2_O_tb;
wire                       N_ON_OFF_3_O_tb;
wire                       S_ON_OFF_0_O_tb;	
wire                       S_ON_OFF_1_O_tb;	
wire                       S_ON_OFF_2_O_tb;	
wire                       S_ON_OFF_3_O_tb;	
wire                       W_ON_OFF_0_O_tb;	
wire                       W_ON_OFF_1_O_tb;
wire                       W_ON_OFF_2_O_tb;
wire                       W_ON_OFF_3_O_tb;
wire                       E_ON_OFF_0_O_tb;
wire                       E_ON_OFF_1_O_tb;
wire                       E_ON_OFF_2_O_tb;
wire                       E_ON_OFF_3_O_tb;
wire                       PE_ON_OFF_0_O_tb;
wire                       PE_ON_OFF_1_O_tb;
wire                       PE_ON_OFF_2_O_tb;
wire                       PE_ON_OFF_3_O_tb;

/////////////////////clock generation//////////////////

always #(clock_period/2)   clk_tb = ~clk_tb;

////////////////////////initail////////////////////////
initial
  begin 
   $dumpfile("Router_tb.vcd");
   $dumpvars;

	
// initialization
   initialize();
   
      
// Reset
   reset();
	
	
#clock_period

	N_VALID_i_tb          = 'b1;
   N_FLIT_i_tb           = 'b0011_1100_0001_0000;
	N_ON_OFF_0_i_tb       = 'b1;
	
	
	
	
	
	#100000
	$stop;
  end



//////////////Tasks////////////////////////////

/***************** Signals Initialization *******************/     
     
task initialize;
 begin
   clk_tb                = 'b0;                  
   N_VALID_i_tb          = 'b0;
   N_FLIT_i_tb           = 'b0;
   N_VC_0_RESERVED_i_tb  = 'b0; 
   N_VC_1_RESERVED_i_tb  = 'b0;
   N_VC_2_RESERVED_i_tb  = 'b0;
   N_VC_3_RESERVED_i_tb  = 'b0;
   S_VALID_i_tb          = 'b0;         
   S_FLIT_i_tb           = 'b0;
   S_VC_0_RESERVED_i_tb  = 'b0;
   S_VC_1_RESERVED_i_tb  = 'b0;
   S_VC_2_RESERVED_i_tb  = 'b0;
   S_VC_3_RESERVED_i_tb  = 'b0;
   W_VALID_i_tb          = 'b0;         
   W_FLIT_i_tb           = 'b0;
   W_VC_0_RESERVED_i_tb  = 'b0;
   W_VC_1_RESERVED_i_tb  = 'b0;
   W_VC_2_RESERVED_i_tb  = 'b0;
   W_VC_3_RESERVED_i_tb  = 'b0;
   E_VALID_i_tb          = 'b0;        
   E_FLIT_i_tb           = 'b0;
   E_VC_0_RESERVED_i_tb  = 'b0;
   E_VC_1_RESERVED_i_tb  = 'b0;
   E_VC_2_RESERVED_i_tb  = 'b0;
   E_VC_3_RESERVED_i_tb  = 'b0;
   PE_VALID_i_tb         = 'b0;
   PE_FLIT_i_tb          = 'b0;
   PE_VC_0_RESERVED_i_tb = 'b0;
   PE_VC_1_RESERVED_i_tb = 'b0;
   PE_VC_2_RESERVED_i_tb = 'b0;
   PE_VC_3_RESERVED_i_tb = 'b0;
   N_ON_OFF_0_i_tb       = 'b0;
   N_ON_OFF_1_i_tb       = 'b0;
   N_ON_OFF_2_i_tb       = 'b0;
   N_ON_OFF_3_i_tb       = 'b0;
   S_ON_OFF_0_i_tb       = 'b0;			
   S_ON_OFF_1_i_tb       = 'b0;			
   S_ON_OFF_2_i_tb       = 'b0;			
   S_ON_OFF_3_i_tb       = 'b0;			
   W_ON_OFF_0_i_tb       = 'b0;			
   W_ON_OFF_1_i_tb       = 'b0;
   W_ON_OFF_2_i_tb       = 'b0;
   W_ON_OFF_3_i_tb       = 'b0;
   E_ON_OFF_0_i_tb       = 'b0;
   E_ON_OFF_1_i_tb       = 'b0;
   E_ON_OFF_2_i_tb       = 'b0;
   E_ON_OFF_3_i_tb       = 'b0;
   PE_ON_OFF_0_i_tb      = 'b0;
   PE_ON_OFF_1_i_tb      = 'b0;
   PE_ON_OFF_2_i_tb      = 'b0;
   PE_ON_OFF_3_i_tb      = 'b0;

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

Router DUT
(
.clk(clk_tb),                   
.rst(rst_tb),
.N_VALID_i(N_VALID_i_tb),
.N_FLIT_i(N_FLIT_i_tb),
.N_VC_0_RESERVED_i(N_VC_0_RESERVED_i_tb),  
.N_VC_1_RESERVED_i(N_VC_1_RESERVED_i_tb),
.N_VC_2_RESERVED_i(N_VC_2_RESERVED_i_tb),
.N_VC_3_RESERVED_i(N_VC_3_RESERVED_i_tb),
.S_VALID_i(S_VALID_i_tb),          
.S_FLIT_i(S_FLIT_i_tb),
.S_VC_0_RESERVED_i(S_VC_0_RESERVED_i_tb),
.S_VC_1_RESERVED_i(S_VC_1_RESERVED_i_tb),
.S_VC_2_RESERVED_i(S_VC_2_RESERVED_i_tb),
.S_VC_3_RESERVED_i(S_VC_3_RESERVED_i_tb),
.W_VALID_i(W_VALID_i_tb),          
.W_FLIT_i(W_FLIT_i_tb),
.W_VC_0_RESERVED_i(W_VC_0_RESERVED_i_tb),
.W_VC_1_RESERVED_i(W_VC_1_RESERVED_i_tb),
.W_VC_2_RESERVED_i(W_VC_2_RESERVED_i_tb),
.W_VC_3_RESERVED_i(W_VC_3_RESERVED_i_tb),
.E_VALID_i(E_VALID_i_tb),        
.E_FLIT_i(E_FLIT_i_tb),
.E_VC_0_RESERVED_i(E_VC_0_RESERVED_i_tb),
.E_VC_1_RESERVED_i(E_VC_1_RESERVED_i_tb),
.E_VC_2_RESERVED_i(E_VC_2_RESERVED_i_tb),
.E_VC_3_RESERVED_i(E_VC_3_RESERVED_i_tb),
.PE_VALID_i(PE_VALID_i_tb),
.PE_FLIT_i(PE_FLIT_i_tb),
.PE_VC_0_RESERVED_i(PE_VC_0_RESERVED_i_tb),
.PE_VC_1_RESERVED_i(PE_VC_1_RESERVED_i_tb),
.PE_VC_2_RESERVED_i(PE_VC_2_RESERVED_i_tb),
.PE_VC_3_RESERVED_i(PE_VC_3_RESERVED_i_tb),
.N_ON_OFF_0_i(N_ON_OFF_0_i_tb),
.N_ON_OFF_1_i(N_ON_OFF_1_i_tb),
.N_ON_OFF_2_i(N_ON_OFF_2_i_tb),
.N_ON_OFF_3_i(N_ON_OFF_3_i_tb),
.S_ON_OFF_0_i(S_ON_OFF_0_i_tb),				
.S_ON_OFF_1_i(S_ON_OFF_1_i_tb),				
.S_ON_OFF_2_i(S_ON_OFF_2_i_tb),				
.S_ON_OFF_3_i(S_ON_OFF_3_i_tb),				
.W_ON_OFF_0_i(W_ON_OFF_0_i_tb),				
.W_ON_OFF_1_i(W_ON_OFF_1_i_tb),
.W_ON_OFF_2_i(W_ON_OFF_2_i_tb),
.W_ON_OFF_3_i(W_ON_OFF_3_i_tb),
.E_ON_OFF_0_i(E_ON_OFF_0_i_tb),
.E_ON_OFF_1_i(E_ON_OFF_1_i_tb),
.E_ON_OFF_2_i(E_ON_OFF_2_i_tb),
.E_ON_OFF_3_i(E_ON_OFF_3_i_tb),
.PE_ON_OFF_0_i(PE_ON_OFF_0_i_tb),
.PE_ON_OFF_1_i(PE_ON_OFF_1_i_tb),
.PE_ON_OFF_2_i(PE_ON_OFF_2_i_tb),
.PE_ON_OFF_3_i(PE_ON_OFF_3_i_tb),
.N_FLIT_o(N_FLIT_o_tb),
.S_FLIT_o(S_FLIT_o_tb),
.E_FLIT_o(E_FLIT_o_tb),
.W_FLIT_o(W_FLIT_o_tb),
.PE_FLIT_o(PE_FLIT_o_tb),
.N_VALID_O(N_VALID_O_tb),
.N_VC_0_RESERVED_O(N_VC_0_RESERVED_O_tb),
.N_VC_1_RESERVED_O(N_VC_1_RESERVED_O_tb),
.N_VC_2_RESERVED_O(N_VC_2_RESERVED_O_tb),
.N_VC_3_RESERVED_O(N_VC_3_RESERVED_O_tb),
.S_VALID_O(S_VALID_O_tb),
.S_VC_0_RESERVED_O(S_VC_0_RESERVED_O_tb),
.S_VC_1_RESERVED_O(S_VC_1_RESERVED_O_tb),
.S_VC_2_RESERVED_O(S_VC_2_RESERVED_O_tb),
.S_VC_3_RESERVED_O(S_VC_3_RESERVED_O_tb),
.W_VALID_O(W_VALID_O_tb),
.W_VC_0_RESERVED_O(W_VC_0_RESERVED_O_tb),
.W_VC_1_RESERVED_O(W_VC_1_RESERVED_O_tb),
.W_VC_2_RESERVED_O(W_VC_2_RESERVED_O_tb),
.W_VC_3_RESERVED_O(W_VC_3_RESERVED_O_tb),     
.E_VALID_O(E_VALID_O_tb),
.E_VC_0_RESERVED_O(E_VC_0_RESERVED_O_tb),
.E_VC_1_RESERVED_O(E_VC_1_RESERVED_O_tb),
.E_VC_2_RESERVED_O(E_VC_2_RESERVED_O_tb),
.E_VC_3_RESERVED_O(E_VC_3_RESERVED_O_tb),
.PE_VALID_O(PE_VALID_O_tb),
.PE_VC_0_RESERVED_O(PE_VC_0_RESERVED_O_tb),
.PE_VC_1_RESERVED_O(PE_VC_1_RESERVED_O_tb),
.PE_VC_2_RESERVED_O(PE_VC_2_RESERVED_O_tb),
.PE_VC_3_RESERVED_O(PE_VC_3_RESERVED_O_tb),
.N_ON_OFF_0_O(N_ON_OFF_0_O_tb),
.N_ON_OFF_1_O(N_ON_OFF_1_O_tb),
.N_ON_OFF_2_O(N_ON_OFF_2_O_tb),
.N_ON_OFF_3_O(N_ON_OFF_3_O_tb),
.S_ON_OFF_0_O(S_ON_OFF_0_O_tb),	
.S_ON_OFF_1_O(S_ON_OFF_1_O_tb),	
.S_ON_OFF_2_O(S_ON_OFF_2_O_tb),	
.S_ON_OFF_3_O(S_ON_OFF_3_O_tb),	
.W_ON_OFF_0_O(W_ON_OFF_0_O_tb),	
.W_ON_OFF_1_O(W_ON_OFF_1_O_tb),
.W_ON_OFF_2_O(W_ON_OFF_2_O_tb),
.W_ON_OFF_3_O(W_ON_OFF_3_O_tb),
.E_ON_OFF_0_O(E_ON_OFF_0_O_tb),
.E_ON_OFF_1_O(E_ON_OFF_1_O_tb),
.E_ON_OFF_2_O(E_ON_OFF_2_O_tb),
.E_ON_OFF_3_O(E_ON_OFF_3_O_tb),
.PE_ON_OFF_0_O(PE_ON_OFF_0_O_tb),
.PE_ON_OFF_1_O(PE_ON_OFF_1_O_tb),
.PE_ON_OFF_2_O(PE_ON_OFF_2_O_tb),
.PE_ON_OFF_3_O(PE_ON_OFF_3_O_tb)
);
























endmodule