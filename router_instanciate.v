module router_instanciate #(parameter flit_width=16,MAX_Packet_NUM=8,Flit_size = 16, REQ_size = 3,NUM_OF_ROUTERS = 9)
(
input    wire   [NUM_OF_ROUTERS-1:0]                        clk,                                                                          
input    wire   [NUM_OF_ROUTERS-1:0]                        rst,
//PE ports
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_VALID_i,
input    wire   [NUM_OF_ROUTERS*flit_width-1:0]             PE_FLIT_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_VC_0_RESERVED_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_VC_1_RESERVED_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_VC_2_RESERVED_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_VC_3_RESERVED_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_ON_OFF_0_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_ON_OFF_1_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_ON_OFF_2_i,
input    wire   [NUM_OF_ROUTERS-1:0]                        PE_ON_OFF_3_i,
//north ports
input    wire   [(3*flit_width)-1:0]                        in_N_FLIT_i,
input    wire   [2:0]                                       in_N_VALID_i,        
input    wire   [2:0]                                       in_N_VC_0_RESERVED_i,
input    wire   [2:0]                                       in_N_VC_1_RESERVED_i,
input    wire   [2:0]                                       in_N_VC_2_RESERVED_i,
input    wire   [2:0]                                       in_N_VC_3_RESERVED_i,
input    wire   [2:0]                                       in_N_ON_OFF_0_i,
input    wire   [2:0]                                       in_N_ON_OFF_1_i,
input    wire   [2:0]                                       in_N_ON_OFF_2_i,
input    wire   [2:0]                                       in_N_ON_OFF_3_i,
//south ports													 
input    wire   [(3*flit_width)-1:0]                        in_S_FLIT_i,
input    wire   [2:0]                                       in_S_VALID_i,        
input    wire   [2:0]                                       in_S_VC_0_RESERVED_i,
input    wire   [2:0]                                       in_S_VC_1_RESERVED_i,
input    wire   [2:0]                                       in_S_VC_2_RESERVED_i,
input    wire   [2:0]                                       in_S_VC_3_RESERVED_i,
input    wire   [2:0]                                       in_S_ON_OFF_0_i,
input    wire   [2:0]                                       in_S_ON_OFF_1_i,
input    wire   [2:0]                                       in_S_ON_OFF_2_i,
input    wire   [2:0]                                       in_S_ON_OFF_3_i,
//weast ports													 
input    wire   [(3*flit_width)-1:0]                        in_W_FLIT_i,
input    wire   [2:0]                                       in_W_VALID_i,        
input    wire   [2:0]                                       in_W_VC_0_RESERVED_i,
input    wire   [2:0]                                       in_W_VC_1_RESERVED_i,
input    wire   [2:0]                                       in_W_VC_2_RESERVED_i,
input    wire   [2:0]                                       in_W_VC_3_RESERVED_i,
input    wire   [2:0]                                       in_W_ON_OFF_0_i,
input    wire   [2:0]                                       in_W_ON_OFF_1_i,
input    wire   [2:0]                                       in_W_ON_OFF_2_i,
input    wire   [2:0]                                       in_W_ON_OFF_3_i,
//east ports													 
input    wire   [(3*flit_width)-1:0]                        in_E_FLIT_i,
input    wire   [2:0]                                       in_E_VALID_i,        
input    wire   [2:0]                                       in_E_VC_0_RESERVED_i,
input    wire   [2:0]                                       in_E_VC_1_RESERVED_i,
input    wire   [2:0]                                       in_E_VC_2_RESERVED_i,
input    wire   [2:0]                                       in_E_VC_3_RESERVED_i,
input    wire   [2:0]                                       in_E_ON_OFF_0_i,
input    wire   [2:0]                                       in_E_ON_OFF_1_i,
input    wire   [2:0]                                       in_E_ON_OFF_2_i,
input    wire   [2:0]                                       in_E_ON_OFF_3_i,

//outputs 
//PE ports
output   wire   [NUM_OF_ROUTERS*flit_width-1:0]          PE_FLIT_o,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_VALID_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_VC_0_RESERVED_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_VC_1_RESERVED_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_VC_2_RESERVED_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_VC_3_RESERVED_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_ON_OFF_0_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_ON_OFF_1_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_ON_OFF_2_O,
output   wire   [NUM_OF_ROUTERS-1:0]                     PE_ON_OFF_3_O,
//north ports
output   wire   [(3*flit_width)-1:0]                     out_N_FLIT_o,
output   wire   [2:0]                                    out_N_VALID_O,
output   wire   [2:0]                                    out_N_VC_0_RESERVED_O,
output   wire   [2:0]                                    out_N_VC_1_RESERVED_O,
output   wire   [2:0]                                    out_N_VC_2_RESERVED_O,
output   wire   [2:0]                                    out_N_VC_3_RESERVED_O,
output   wire   [2:0]                                    out_N_ON_OFF_0_O,
output   wire   [2:0]                                    out_N_ON_OFF_1_O,
output   wire   [2:0]                                    out_N_ON_OFF_2_O,
output   wire   [2:0]                                    out_N_ON_OFF_3_O,
//south ports														 
output   wire   [(3*flit_width)-1:0]                     out_S_FLIT_o,
output   wire   [2:0]                                    out_S_VALID_O,
output   wire   [2:0]                                    out_S_VC_0_RESERVED_O,
output   wire   [2:0]                                    out_S_VC_1_RESERVED_O,
output   wire   [2:0]                                    out_S_VC_2_RESERVED_O,
output   wire   [2:0]                                    out_S_VC_3_RESERVED_O,
output   wire   [2:0]                                    out_S_ON_OFF_0_O,
output   wire   [2:0]                                    out_S_ON_OFF_1_O,
output   wire   [2:0]                                    out_S_ON_OFF_2_O,
output   wire   [2:0]                                    out_S_ON_OFF_3_O,
//weast ports														 
output   wire   [(3*flit_width)-1:0]                     out_W_FLIT_o,
output   wire   [2:0]                                    out_W_VALID_O,
output   wire   [2:0]                                    out_W_VC_0_RESERVED_O,
output   wire   [2:0]                                    out_W_VC_1_RESERVED_O,
output   wire   [2:0]                                    out_W_VC_2_RESERVED_O,
output   wire   [2:0]                                    out_W_VC_3_RESERVED_O,
output   wire   [2:0]                                    out_W_ON_OFF_0_O,
output   wire   [2:0]                                    out_W_ON_OFF_1_O,
output   wire   [2:0]                                    out_W_ON_OFF_2_O,
output   wire   [2:0]                                    out_W_ON_OFF_3_O,
//east ports														 
output   wire   [(3*flit_width)-1:0]                     out_E_FLIT_o,
output   wire   [2:0]                                    out_E_VALID_O,
output   wire   [2:0]                                    out_E_VC_0_RESERVED_O,
output   wire   [2:0]                                    out_E_VC_1_RESERVED_O,
output   wire   [2:0]                                    out_E_VC_2_RESERVED_O,
output   wire   [2:0]                                    out_E_VC_3_RESERVED_O,
output   wire   [2:0]                                    out_E_ON_OFF_0_O,
output   wire   [2:0]                                    out_E_ON_OFF_1_O,
output   wire   [2:0]                                    out_E_ON_OFF_2_O,
output   wire   [2:0]                                    out_E_ON_OFF_3_O

);

//////////////////////////// parameters ////////////////////////////////////

//parameter router_num =(NUM_OF_ROUTERS*$clog2(NUM_OF_ROUTERS))-1;
//
//parameter [router_num:0] current_router ='b1000_0111_0110_0101_0100_0011_0010_0001_0000 ;  // [9*4:0]

////////////////////////// internal signals ///////////////////////////////////
wire   [NUM_OF_ROUTERS-1:0]                     N_VALID_i;           
wire   [NUM_OF_ROUTERS*flit_width-1:0]          N_FLIT_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_0_RESERVED_i; 
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_1_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_2_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_3_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_VALID_i;         
wire   [NUM_OF_ROUTERS*flit_width-1:0]          S_FLIT_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_0_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_1_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_2_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_3_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_VALID_i;         
wire   [NUM_OF_ROUTERS*flit_width-1:0]          W_FLIT_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_0_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_1_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_2_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_3_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_VALID_i;        
wire   [NUM_OF_ROUTERS*flit_width-1:0]          E_FLIT_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_0_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_1_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_2_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_3_RESERVED_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_0_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_1_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_2_i;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_3_i;
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_0_i;											 
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_1_i;											 
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_2_i;											 
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_3_i;											 
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_0_i;											 
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_1_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_2_i;
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_3_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_0_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_1_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_2_i;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_3_i;
wire   [NUM_OF_ROUTERS*flit_width-1:0]          N_FLIT_o;
wire   [NUM_OF_ROUTERS*flit_width-1:0]          S_FLIT_o;
wire   [NUM_OF_ROUTERS*flit_width-1:0]          E_FLIT_o;
wire   [NUM_OF_ROUTERS*flit_width-1:0]          W_FLIT_o;
wire   [NUM_OF_ROUTERS-1:0]                     N_VALID_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_0_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_1_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_2_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_VC_3_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_VALID_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_0_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_1_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_2_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_VC_3_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_VALID_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_0_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_1_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_2_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_VC_3_RESERVED_O;                       
wire   [NUM_OF_ROUTERS-1:0]                     E_VALID_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_0_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_1_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_2_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_VC_3_RESERVED_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_0_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_1_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_2_O;
wire   [NUM_OF_ROUTERS-1:0]                     N_ON_OFF_3_O;
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_0_O;	
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_1_O;	
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_2_O;	
wire   [NUM_OF_ROUTERS-1:0]                     S_ON_OFF_3_O;	
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_0_O;	
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_1_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_2_O;
wire   [NUM_OF_ROUTERS-1:0]                     W_ON_OFF_3_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_0_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_1_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_2_O;
wire   [NUM_OF_ROUTERS-1:0]                     E_ON_OFF_3_O;

/////////////////////////////routing between routers//////////////////////////////////////

/////////////////////north with south////////////////////////////////
assign N_VC_0_RESERVED_i[8:3]  = S_VC_0_RESERVED_O[5:0];
assign N_VC_1_RESERVED_i[8:3]  = S_VC_1_RESERVED_O[5:0];
assign N_VC_2_RESERVED_i[8:3]  = S_VC_2_RESERVED_O[5:0];
assign N_VC_3_RESERVED_i[8:3]  = S_VC_3_RESERVED_O[5:0];         
assign N_VC_0_RESERVED_O[8:3]  = S_VC_0_RESERVED_i[5:0]; 
assign N_VC_1_RESERVED_O[8:3]  = S_VC_1_RESERVED_i[5:0];
assign N_VC_2_RESERVED_O[8:3]  = S_VC_2_RESERVED_i[5:0];
assign N_VC_3_RESERVED_O[8:3]  = S_VC_3_RESERVED_i[5:0];
assign N_ON_OFF_0_O[8:3]       = S_ON_OFF_0_i[5:0];
assign N_ON_OFF_1_O[8:3]       = S_ON_OFF_1_i[5:0];
assign N_ON_OFF_2_O[8:3]       = S_ON_OFF_2_i[5:0];
assign N_ON_OFF_3_O[8:3]       = S_ON_OFF_3_i[5:0];
assign N_ON_OFF_0_i[8:3]       = S_ON_OFF_0_O[5:0];
assign N_ON_OFF_1_i[8:3]       = S_ON_OFF_1_O[5:0];
assign N_ON_OFF_2_i[8:3]       = S_ON_OFF_2_O[5:0];
assign N_ON_OFF_3_i[8:3]       = S_ON_OFF_3_O[5:0];
assign N_VALID_i[8:3]          = S_VALID_O[5:0];
assign N_VALID_O[8:3]          = S_VALID_i[5:0];

assign N_FLIT_i[(9*flit_width)-1:3*flit_width]           = S_FLIT_o[(6*flit_width)-1:0];
assign N_FLIT_o[(9*flit_width)-1:3*flit_width]           = S_FLIT_i[(6*flit_width)-1:0];


///////////////////////////////east with weast//////////////////////////////////
assign {E_VC_0_RESERVED_i[8:7],E_VC_0_RESERVED_i[5:4],E_VC_0_RESERVED_i[2:1]}  = {W_VC_0_RESERVED_O[7:6],W_VC_0_RESERVED_O[4:3],W_VC_0_RESERVED_O[1:0]};
assign {E_VC_1_RESERVED_i[8:7],E_VC_1_RESERVED_i[5:4],E_VC_1_RESERVED_i[2:1]}  = {W_VC_1_RESERVED_O[7:6],W_VC_1_RESERVED_O[4:3],W_VC_1_RESERVED_O[1:0]};
assign {E_VC_2_RESERVED_i[8:7],E_VC_2_RESERVED_i[5:4],E_VC_2_RESERVED_i[2:1]}  = {W_VC_2_RESERVED_O[7:6],W_VC_2_RESERVED_O[4:3],W_VC_2_RESERVED_O[1:0]};
assign {E_VC_3_RESERVED_i[8:7],E_VC_3_RESERVED_i[5:4],E_VC_3_RESERVED_i[2:1]}  = {W_VC_3_RESERVED_O[7:6],W_VC_3_RESERVED_O[4:3],W_VC_3_RESERVED_O[1:0]};         
assign {E_VC_0_RESERVED_O[8:7],E_VC_0_RESERVED_O[5:4],E_VC_0_RESERVED_O[2:1]}  = {W_VC_0_RESERVED_i[7:6],W_VC_0_RESERVED_i[4:3],W_VC_0_RESERVED_i[1:0]}; 
assign {E_VC_1_RESERVED_O[8:7],E_VC_1_RESERVED_O[5:4],E_VC_1_RESERVED_O[2:1]}  = {W_VC_1_RESERVED_i[7:6],W_VC_1_RESERVED_i[4:3],W_VC_1_RESERVED_i[1:0]};
assign {E_VC_2_RESERVED_O[8:7],E_VC_2_RESERVED_O[5:4],E_VC_2_RESERVED_O[2:1]}  = {W_VC_2_RESERVED_i[7:6],W_VC_2_RESERVED_i[4:3],W_VC_2_RESERVED_i[1:0]};
assign {E_VC_3_RESERVED_O[8:7],E_VC_3_RESERVED_O[5:4],E_VC_3_RESERVED_O[2:1]}  = {W_VC_3_RESERVED_i[7:6],W_VC_3_RESERVED_i[4:3],W_VC_3_RESERVED_i[1:0]};
assign {E_ON_OFF_0_O[8:7],E_ON_OFF_0_O[5:4],E_ON_OFF_0_O[2:1]}                 = {W_ON_OFF_0_i[7:6],W_ON_OFF_0_i[4:3],W_ON_OFF_0_i[1:0]};
assign {E_ON_OFF_1_O[8:7],E_ON_OFF_1_O[5:4],E_ON_OFF_1_O[2:1]}                 = {W_ON_OFF_1_i[7:6],W_ON_OFF_1_i[4:3],W_ON_OFF_1_i[1:0]};
assign {E_ON_OFF_2_O[8:7],E_ON_OFF_2_O[5:4],E_ON_OFF_2_O[2:1]}                 = {W_ON_OFF_2_i[7:6],W_ON_OFF_2_i[4:3],W_ON_OFF_2_i[1:0]};
assign {E_ON_OFF_3_O[8:7],E_ON_OFF_3_O[5:4],E_ON_OFF_3_O[2:1]}                 = {W_ON_OFF_3_i[7:6],W_ON_OFF_3_i[4:3],W_ON_OFF_3_i[1:0]};
assign {E_ON_OFF_0_i[8:7],E_ON_OFF_0_i[5:4],E_ON_OFF_0_i[2:1]}                 = {W_ON_OFF_0_O[7:6],W_ON_OFF_0_O[4:3],W_ON_OFF_0_O[1:0]};
assign {E_ON_OFF_1_i[8:7],E_ON_OFF_1_i[5:4],E_ON_OFF_1_i[2:1]}                 = {W_ON_OFF_1_O[7:6],W_ON_OFF_1_O[4:3],W_ON_OFF_1_O[1:0]};
assign {E_ON_OFF_2_i[8:7],E_ON_OFF_2_i[5:4],E_ON_OFF_2_i[2:1]}                 = {W_ON_OFF_2_O[7:6],W_ON_OFF_2_O[4:3],W_ON_OFF_2_O[1:0]};
assign {E_ON_OFF_3_i[8:7],E_ON_OFF_3_i[5:4],E_ON_OFF_3_i[2:1]}                 = {W_ON_OFF_3_O[7:6],W_ON_OFF_3_O[4:3],W_ON_OFF_3_O[1:0]};
assign {E_VALID_i[8:7],E_VALID_i[5:4],E_VALID_i[2:1]}                          = {W_VALID_O[7:6],W_VALID_O[4:3],W_VALID_O[1:0]};
assign {E_VALID_O[8:7],E_VALID_O[5:4],E_VALID_O[2:1]}                          = {W_VALID_i[7:6],W_VALID_i[4:3],W_VALID_i[1:0]};

assign {E_FLIT_i[(9*flit_width)-1:7*flit_width],E_FLIT_i[(6*flit_width)-1:4*flit_width],E_FLIT_i[(3*flit_width)-1:flit_width]}          = {W_FLIT_o[(8*flit_width)-1:6*flit_width],W_FLIT_o[(5*flit_width)-1:3*flit_width],W_FLIT_o[(2*flit_width)-1:0]};    
assign {E_FLIT_o[(9*flit_width)-1:7*flit_width],E_FLIT_o[(6*flit_width)-1:4*flit_width],E_FLIT_o[(3*flit_width)-1:flit_width]}          = {W_FLIT_i[(8*flit_width)-1:6*flit_width],W_FLIT_i[(5*flit_width)-1:3*flit_width],W_FLIT_i[(2*flit_width)-1:0]};


////////////////////////////////routing between routers and in/out ports //////////////////////////////////////////////

////////////////////////////north routing////////////////////////////////////////////////////////

//input
assign  N_VC_0_RESERVED_i[2:0]         = in_N_VC_0_RESERVED_i;
assign  N_VC_1_RESERVED_i[2:0]         = in_N_VC_1_RESERVED_i;
assign  N_VC_2_RESERVED_i[2:0]         = in_N_VC_2_RESERVED_i;
assign  N_VC_3_RESERVED_i[2:0]         = in_N_VC_3_RESERVED_i;
assign  N_ON_OFF_0_i[2:0]              = in_N_ON_OFF_0_i;
assign  N_ON_OFF_1_i[2:0]              = in_N_ON_OFF_1_i;
assign  N_ON_OFF_2_i[2:0]              = in_N_ON_OFF_2_i;
assign  N_ON_OFF_3_i[2:0]              = in_N_ON_OFF_3_i;
assign  N_VALID_i[2:0]                 = in_N_VALID_i;
assign  N_FLIT_i[(3*flit_width)-1:0]   = in_N_FLIT_i;

//output
assign  out_N_VC_0_RESERVED_O          = N_VC_0_RESERVED_O[2:0];
assign  out_N_VC_1_RESERVED_O          = N_VC_1_RESERVED_O[2:0];
assign  out_N_VC_2_RESERVED_O          = N_VC_2_RESERVED_O[2:0];
assign  out_N_VC_3_RESERVED_O          = N_VC_3_RESERVED_O[2:0];
assign  out_N_ON_OFF_0_O               = N_ON_OFF_0_O[2:0];
assign  out_N_ON_OFF_1_O               = N_ON_OFF_1_O[2:0];
assign  out_N_ON_OFF_2_O               = N_ON_OFF_2_O[2:0];
assign  out_N_ON_OFF_3_O               = N_ON_OFF_3_O[2:0];
assign  out_N_VALID_O                  = N_VALID_O[2:0];
assign  out_N_FLIT_o                   = N_FLIT_o[(3*flit_width)-1:0];



////////////////////////////south routing////////////////////////////////////////////////////////

assign  S_VC_0_RESERVED_i[8:6]                    = in_S_VC_0_RESERVED_i;
assign  S_VC_1_RESERVED_i[8:6]                    = in_S_VC_1_RESERVED_i;
assign  S_VC_2_RESERVED_i[8:6]                    = in_S_VC_2_RESERVED_i;
assign  S_VC_3_RESERVED_i[8:6]                    = in_S_VC_3_RESERVED_i;
assign  S_ON_OFF_0_i[8:6]                         = in_S_ON_OFF_0_i;
assign  S_ON_OFF_1_i[8:6]                         = in_S_ON_OFF_1_i;
assign  S_ON_OFF_2_i[8:6]                         = in_S_ON_OFF_2_i;
assign  S_ON_OFF_3_i[8:6]                         = in_S_ON_OFF_3_i;
assign  S_VALID_i[8:6]                            = in_S_VALID_i;
assign  S_FLIT_i[(9*flit_width)-1:6*flit_width]   = in_S_FLIT_i;

//output
assign  out_S_VC_0_RESERVED_O = S_VC_0_RESERVED_O[8:6];
assign  out_S_VC_1_RESERVED_O = S_VC_1_RESERVED_O[8:6];
assign  out_S_VC_2_RESERVED_O = S_VC_2_RESERVED_O[8:6];
assign  out_S_VC_3_RESERVED_O = S_VC_3_RESERVED_O[8:6];
assign  out_S_ON_OFF_0_O      = S_ON_OFF_0_O[8:6];
assign  out_S_ON_OFF_1_O      = S_ON_OFF_1_O[8:6];
assign  out_S_ON_OFF_2_O      = S_ON_OFF_2_O[8:6];
assign  out_S_ON_OFF_3_O      = S_ON_OFF_3_O[8:6];
assign  out_S_VALID_O         = S_VALID_O[8:6];
assign  out_S_FLIT_o          = S_FLIT_o[(9*flit_width)-1:6*flit_width];


////////////////////////////weast routing////////////////////////////////////////////////////////

//input
assign  {W_VC_0_RESERVED_i[8],W_VC_0_RESERVED_i[5],W_VC_0_RESERVED_i[2]} = in_W_VC_0_RESERVED_i;
assign  {W_VC_1_RESERVED_i[8],W_VC_1_RESERVED_i[5],W_VC_1_RESERVED_i[2]} = in_W_VC_1_RESERVED_i;
assign  {W_VC_2_RESERVED_i[8],W_VC_2_RESERVED_i[5],W_VC_2_RESERVED_i[2]} = in_W_VC_2_RESERVED_i;
assign  {W_VC_3_RESERVED_i[8],W_VC_3_RESERVED_i[5],W_VC_3_RESERVED_i[2]} = in_W_VC_3_RESERVED_i;
assign  {W_ON_OFF_0_i[8],W_ON_OFF_0_i[5],W_ON_OFF_0_i[2]}                = in_W_ON_OFF_0_i;
assign  {W_ON_OFF_1_i[8],W_ON_OFF_1_i[5],W_ON_OFF_1_i[2]}                = in_W_ON_OFF_1_i;
assign  {W_ON_OFF_2_i[8],W_ON_OFF_2_i[5],W_ON_OFF_2_i[2]}                = in_W_ON_OFF_2_i;
assign  {W_ON_OFF_3_i[8],W_ON_OFF_3_i[5],W_ON_OFF_3_i[2]}                = in_W_ON_OFF_3_i;
assign  {W_VALID_i[8],W_VALID_i[5],W_VALID_i[2]}                         = in_W_VALID_i;

assign  {W_FLIT_i[(9*flit_width)-1:8*flit_width],W_FLIT_i[(6*flit_width)-1:5*flit_width],W_FLIT_i[(3*flit_width)-1:2*flit_width]} = in_W_FLIT_i;

//output
assign  out_W_VC_0_RESERVED_O     = {W_VC_0_RESERVED_O[8],W_VC_0_RESERVED_O[5],W_VC_0_RESERVED_O[2]};
assign  out_W_VC_1_RESERVED_O     = {W_VC_1_RESERVED_O[8],W_VC_1_RESERVED_O[5],W_VC_1_RESERVED_O[2]};
assign  out_W_VC_2_RESERVED_O     = {W_VC_2_RESERVED_O[8],W_VC_2_RESERVED_O[5],W_VC_2_RESERVED_O[2]};
assign  out_W_VC_3_RESERVED_O     = {W_VC_3_RESERVED_O[8],W_VC_3_RESERVED_O[5],W_VC_3_RESERVED_O[2]};
assign  out_W_ON_OFF_0_O          = {W_ON_OFF_0_O[8],W_ON_OFF_0_O[5],W_ON_OFF_0_O[2]};
assign  out_W_ON_OFF_1_O          = {W_ON_OFF_1_O[8],W_ON_OFF_1_O[5],W_ON_OFF_1_O[2]};
assign  out_W_ON_OFF_2_O          = {W_ON_OFF_2_O[8],W_ON_OFF_2_O[5],W_ON_OFF_2_O[2]};
assign  out_W_ON_OFF_3_O          = {W_ON_OFF_3_O[8],W_ON_OFF_3_O[5],W_ON_OFF_3_O[2]};
assign  out_W_VALID_O             = {W_VALID_O[8],W_VALID_O[5],W_VALID_O[2]};
    
assign  out_W_FLIT_o              = {W_FLIT_o[(9*flit_width)-1:8*flit_width],W_FLIT_o[(6*flit_width)-1:5*flit_width],W_FLIT_o[(3*flit_width)-1:2*flit_width]};

////////////////////////////east routing////////////////////////////////////////////////////////

//input
assign  {E_VC_0_RESERVED_i[6],E_VC_0_RESERVED_i[3],E_VC_0_RESERVED_i[0]} = in_E_VC_0_RESERVED_i;
assign  {E_VC_1_RESERVED_i[6],E_VC_1_RESERVED_i[3],E_VC_1_RESERVED_i[0]} = in_E_VC_1_RESERVED_i;
assign  {E_VC_2_RESERVED_i[6],E_VC_2_RESERVED_i[3],E_VC_2_RESERVED_i[0]} = in_E_VC_2_RESERVED_i;
assign  {E_VC_3_RESERVED_i[6],E_VC_3_RESERVED_i[3],E_VC_3_RESERVED_i[0]} = in_E_VC_3_RESERVED_i;
assign  {E_ON_OFF_0_i[6], E_ON_OFF_0_i[3], E_ON_OFF_0_i[0]}              = in_E_ON_OFF_0_i; 
assign  {E_ON_OFF_1_i[6], E_ON_OFF_1_i[3], E_ON_OFF_1_i[0]}              = in_E_ON_OFF_1_i; 
assign  {E_ON_OFF_2_i[6], E_ON_OFF_2_i[3], E_ON_OFF_2_i[0]}              = in_E_ON_OFF_2_i; 
assign  {E_ON_OFF_3_i[6], E_ON_OFF_3_i[3], E_ON_OFF_3_i[0]}              = in_E_ON_OFF_3_i; 
assign  {E_VALID_i[6], E_VALID_i[3], E_VALID_i[0]}                       = in_E_VALID_i;

assign  {E_FLIT_i[(7*flit_width)-1:6*flit_width], E_FLIT_i[(4*flit_width)-1:3*flit_width], E_FLIT_i[flit_width-1:0]} = in_E_FLIT_i;

//output
assign  out_E_VC_0_RESERVED_O    = {E_VC_0_RESERVED_O[6],E_VC_0_RESERVED_O[3],E_VC_0_RESERVED_O[0]};
assign  out_E_VC_1_RESERVED_O    = {E_VC_1_RESERVED_O[6],E_VC_1_RESERVED_O[3],E_VC_1_RESERVED_O[0]};
assign  out_E_VC_2_RESERVED_O    = {E_VC_2_RESERVED_O[6],E_VC_2_RESERVED_O[3],E_VC_2_RESERVED_O[0]};
assign  out_E_VC_3_RESERVED_O    = {E_VC_3_RESERVED_O[6],E_VC_3_RESERVED_O[3],E_VC_3_RESERVED_O[0]};
assign  out_E_ON_OFF_0_O         = {E_ON_OFF_0_O[6], E_ON_OFF_0_O[3], E_ON_OFF_0_O[0]}; 
assign  out_E_ON_OFF_1_O         = {E_ON_OFF_1_O[6], E_ON_OFF_1_O[3], E_ON_OFF_1_O[0]}; 
assign  out_E_ON_OFF_2_O         = {E_ON_OFF_2_O[6], E_ON_OFF_2_O[3], E_ON_OFF_2_O[0]}; 
assign  out_E_ON_OFF_3_O         = {E_ON_OFF_3_O[6], E_ON_OFF_3_O[3], E_ON_OFF_3_O[0]}; 
assign  out_E_VALID_O            = {E_VALID_O[6], E_VALID_O[3], E_VALID_O[0]};
     
assign  out_E_FLIT_o             = {E_FLIT_o[(7*flit_width)-1:6*flit_width], E_FLIT_o[(4*flit_width)-1:3*flit_width], E_FLIT_o[flit_width-1:0]}; 


////////////////instantiating/////////////////////////////


genvar i;
generate
    for (i=0; i<NUM_OF_ROUTERS; i=i+1)  begin : router_instance
	 
    Router #(.current_router(i)) Router_inst (
	 
.clk( clk[i]),                     
.rst(rst[i]),
.PE_VALID_i(PE_VALID_i[i]),
.PE_FLIT_i(PE_FLIT_i[(i*flit_width) +: flit_width]),    //[msb_base_expr +: width_expr]== [(i*16)+:16]== if i=0 --> [15:0] if i=1-->[32:16]
.PE_VC_0_RESERVED_i(PE_VC_0_RESERVED_i[i]),
.PE_VC_1_RESERVED_i(PE_VC_1_RESERVED_i[i]),
.PE_VC_2_RESERVED_i(PE_VC_2_RESERVED_i[i]),
.PE_VC_3_RESERVED_i(PE_VC_3_RESERVED_i[i]),
.PE_ON_OFF_0_i(PE_ON_OFF_0_i[i]),
.PE_ON_OFF_1_i(PE_ON_OFF_1_i[i]),
.PE_ON_OFF_2_i(PE_ON_OFF_2_i[i]),
.PE_ON_OFF_3_i(PE_ON_OFF_3_i[i]),
.PE_FLIT_o(PE_FLIT_o[(i*flit_width)+:flit_width]),
.PE_VALID_O(PE_VALID_O[i]),
.PE_VC_0_RESERVED_O(PE_VC_0_RESERVED_O[i]),
.PE_VC_1_RESERVED_O(PE_VC_1_RESERVED_O[i]),
.PE_VC_2_RESERVED_O(PE_VC_2_RESERVED_O[i]),
.PE_VC_3_RESERVED_O(PE_VC_3_RESERVED_O[i]),
.PE_ON_OFF_0_O(PE_ON_OFF_0_O[i]),
.PE_ON_OFF_1_O(PE_ON_OFF_1_O[i]),
.PE_ON_OFF_2_O(PE_ON_OFF_2_O[i]),
.PE_ON_OFF_3_O(PE_ON_OFF_3_O[i]),
.N_VC_0_RESERVED_O(N_VC_0_RESERVED_O[i]),
.N_VC_1_RESERVED_O(N_VC_1_RESERVED_O[i]),
.N_VC_2_RESERVED_O(N_VC_2_RESERVED_O[i]),
.N_VC_3_RESERVED_O(N_VC_3_RESERVED_O[i]),         
.N_VC_0_RESERVED_i(N_VC_0_RESERVED_i[i]), 
.N_VC_1_RESERVED_i(N_VC_1_RESERVED_i[i]),
.N_VC_2_RESERVED_i(N_VC_2_RESERVED_i[i]),
.N_VC_3_RESERVED_i(N_VC_3_RESERVED_i[i]),
.N_ON_OFF_0_i(N_ON_OFF_0_i[i]),
.N_ON_OFF_1_i(N_ON_OFF_1_i[i]),
.N_ON_OFF_2_i(N_ON_OFF_2_i[i]),
.N_ON_OFF_3_i(N_ON_OFF_3_i[i]),
.N_ON_OFF_0_O(N_ON_OFF_0_O[i]),
.N_ON_OFF_1_O(N_ON_OFF_1_O[i]),
.N_ON_OFF_2_O(N_ON_OFF_2_O[i]),
.N_ON_OFF_3_O(N_ON_OFF_3_O[i]),
.N_FLIT_o(N_FLIT_o[(i*flit_width)+:flit_width]),
.N_FLIT_i(N_FLIT_i[(i*flit_width)+:flit_width]),
.N_VALID_O(N_VALID_O[i]),
.N_VALID_i(N_VALID_i[i]),
.S_VC_0_RESERVED_O(S_VC_0_RESERVED_O[i]),
.S_VC_1_RESERVED_O(S_VC_1_RESERVED_O[i]),
.S_VC_2_RESERVED_O(S_VC_2_RESERVED_O[i]),
.S_VC_3_RESERVED_O(S_VC_3_RESERVED_O[i]),         
.S_VC_0_RESERVED_i(S_VC_0_RESERVED_i[i]), 
.S_VC_1_RESERVED_i(S_VC_1_RESERVED_i[i]),
.S_VC_2_RESERVED_i(S_VC_2_RESERVED_i[i]),
.S_VC_3_RESERVED_i(S_VC_3_RESERVED_i[i]),
.S_ON_OFF_0_i(S_ON_OFF_0_i[i]),
.S_ON_OFF_1_i(S_ON_OFF_1_i[i]),
.S_ON_OFF_2_i(S_ON_OFF_2_i[i]),
.S_ON_OFF_3_i(S_ON_OFF_3_i[i]),
.S_ON_OFF_0_O(S_ON_OFF_0_O[i]),
.S_ON_OFF_1_O(S_ON_OFF_1_O[i]),
.S_ON_OFF_2_O(S_ON_OFF_2_O[i]),
.S_ON_OFF_3_O(S_ON_OFF_3_O[i]),
.S_FLIT_o(S_FLIT_o[(i*flit_width)+:flit_width]),
.S_FLIT_i(S_FLIT_i[(i*flit_width)+:flit_width]),
.S_VALID_O(S_VALID_O[i]),
.S_VALID_i(S_VALID_i[i]),
.E_VC_0_RESERVED_O(E_VC_0_RESERVED_O[i]),
.E_VC_1_RESERVED_O(E_VC_1_RESERVED_O[i]),
.E_VC_2_RESERVED_O(E_VC_2_RESERVED_O[i]),
.E_VC_3_RESERVED_O(E_VC_3_RESERVED_O[i]),         
.E_VC_0_RESERVED_i(E_VC_0_RESERVED_i[i]), 
.E_VC_1_RESERVED_i(E_VC_1_RESERVED_i[i]),
.E_VC_2_RESERVED_i(E_VC_2_RESERVED_i[i]),
.E_VC_3_RESERVED_i(E_VC_3_RESERVED_i[i]),
.E_ON_OFF_0_i(E_ON_OFF_0_i[i]),
.E_ON_OFF_1_i(E_ON_OFF_1_i[i]),
.E_ON_OFF_2_i(E_ON_OFF_2_i[i]),
.E_ON_OFF_3_i(E_ON_OFF_3_i[i]),
.E_ON_OFF_0_O(E_ON_OFF_0_O[i]),
.E_ON_OFF_1_O(E_ON_OFF_1_O[i]),
.E_ON_OFF_2_O(E_ON_OFF_2_O[i]),
.E_ON_OFF_3_O(E_ON_OFF_3_O[i]),
.E_FLIT_o(E_FLIT_o[(i*flit_width)+:flit_width]),
.E_FLIT_i(E_FLIT_i[(i*flit_width)+:flit_width]),
.E_VALID_O(E_VALID_O[i]),
.E_VALID_i(E_VALID_i[i]),
.W_VC_0_RESERVED_O(W_VC_0_RESERVED_O[i]),
.W_VC_1_RESERVED_O(W_VC_1_RESERVED_O[i]),
.W_VC_2_RESERVED_O(W_VC_2_RESERVED_O[i]),
.W_VC_3_RESERVED_O(W_VC_3_RESERVED_O[i]),         
.W_VC_0_RESERVED_i(W_VC_0_RESERVED_i[i]), 
.W_VC_1_RESERVED_i(W_VC_1_RESERVED_i[i]),
.W_VC_2_RESERVED_i(W_VC_2_RESERVED_i[i]),
.W_VC_3_RESERVED_i(W_VC_3_RESERVED_i[i]),
.W_ON_OFF_0_i(W_ON_OFF_0_i[i]),
.W_ON_OFF_1_i(W_ON_OFF_1_i[i]),
.W_ON_OFF_2_i(W_ON_OFF_2_i[i]),
.W_ON_OFF_3_i(W_ON_OFF_3_i[i]),
.W_ON_OFF_0_O(W_ON_OFF_0_O[i]),
.W_ON_OFF_1_O(W_ON_OFF_1_O[i]),
.W_ON_OFF_2_O(W_ON_OFF_2_O[i]),
.W_ON_OFF_3_O(W_ON_OFF_3_O[i]),
.W_FLIT_o(W_FLIT_o[(i*flit_width)+:flit_width]),
.W_FLIT_i(W_FLIT_i[(i*flit_width)+:flit_width]),
.W_VALID_O(W_VALID_O[i]),
.W_VALID_i(W_VALID_i[i])     
    );
end 
endgenerate









endmodule