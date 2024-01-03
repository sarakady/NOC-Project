module Router #(parameter flit_width=16,MAX_Packet_NUM=8,Flit_size = 16,current_router = 4'b0100, REQ_size = 3)
(
input    wire                        clk,                                                      
input    wire                        rst,
input    wire                        N_VALID_i,
input    wire   [flit_width-1:0]     N_FLIT_i,
input    wire                        N_VC_0_RESERVED_i, 
input    wire                        N_VC_1_RESERVED_i,
input    wire                        N_VC_2_RESERVED_i,
input    wire                        N_VC_3_RESERVED_i,
input    wire                        S_VALID_i,         
input    wire   [flit_width-1:0]     S_FLIT_i,
input    wire                        S_VC_0_RESERVED_i,
input    wire                        S_VC_1_RESERVED_i,
input    wire                        S_VC_2_RESERVED_i,
input    wire                        S_VC_3_RESERVED_i,
input    wire                        W_VALID_i,         
input    wire   [flit_width-1:0]     W_FLIT_i,
input    wire                        W_VC_0_RESERVED_i,
input    wire                        W_VC_1_RESERVED_i,
input    wire                        W_VC_2_RESERVED_i,
input    wire                        W_VC_3_RESERVED_i,
input    wire                        E_VALID_i,        
input    wire   [flit_width-1:0]     E_FLIT_i,
input    wire                        E_VC_0_RESERVED_i,
input    wire                        E_VC_1_RESERVED_i,
input    wire                        E_VC_2_RESERVED_i,
input    wire                        E_VC_3_RESERVED_i,
input    wire                        PE_VALID_i,
input    wire   [flit_width-1:0]     PE_FLIT_i,
input    wire                        PE_VC_0_RESERVED_i,
input    wire                        PE_VC_1_RESERVED_i,
input    wire                        PE_VC_2_RESERVED_i,
input    wire                        PE_VC_3_RESERVED_i,
input    wire                        N_ON_OFF_0_i,
input    wire                        N_ON_OFF_1_i,
input    wire                        N_ON_OFF_2_i,
input    wire                        N_ON_OFF_3_i,
input    wire                        S_ON_OFF_0_i,											 
input    wire                        S_ON_OFF_1_i,											 
input    wire                        S_ON_OFF_2_i,											 
input    wire                        S_ON_OFF_3_i,											 
input    wire                        W_ON_OFF_0_i,											 
input    wire                        W_ON_OFF_1_i,
input    wire                        W_ON_OFF_2_i,
input    wire                        W_ON_OFF_3_i,
input    wire                        E_ON_OFF_0_i,
input    wire                        E_ON_OFF_1_i,
input    wire                        E_ON_OFF_2_i,
input    wire                        E_ON_OFF_3_i,
input    wire                        PE_ON_OFF_0_i,
input    wire                        PE_ON_OFF_1_i,
input    wire                        PE_ON_OFF_2_i,
input    wire                        PE_ON_OFF_3_i,
output   wire   [flit_width-1:0]     N_FLIT_o,
output   wire   [flit_width-1:0]     S_FLIT_o,
output   wire   [flit_width-1:0]     E_FLIT_o,
output   wire   [flit_width-1:0]     W_FLIT_o,
output   wire   [flit_width-1:0]     PE_FLIT_o,
output   wire                        N_VALID_O,
output   wire                        N_VC_0_RESERVED_O,
output   wire                        N_VC_1_RESERVED_O,
output   wire                        N_VC_2_RESERVED_O,
output   wire                        N_VC_3_RESERVED_O,
output   wire                        S_VALID_O,
output   wire                        S_VC_0_RESERVED_O,
output   wire                        S_VC_1_RESERVED_O,
output   wire                        S_VC_2_RESERVED_O,
output   wire                        S_VC_3_RESERVED_O,
output   wire                        W_VALID_O,
output   wire                        W_VC_0_RESERVED_O,
output   wire                        W_VC_1_RESERVED_O,
output   wire                        W_VC_2_RESERVED_O,
output   wire                        W_VC_3_RESERVED_O,                       
output   wire                        E_VALID_O,
output   wire                        E_VC_0_RESERVED_O,
output   wire                        E_VC_1_RESERVED_O,
output   wire                        E_VC_2_RESERVED_O,
output   wire                        E_VC_3_RESERVED_O,
output   wire                        PE_VALID_O,
output   wire                        PE_VC_0_RESERVED_O,
output   wire                        PE_VC_1_RESERVED_O,
output   wire                        PE_VC_2_RESERVED_O,
output   wire                        PE_VC_3_RESERVED_O,
output   wire                        N_ON_OFF_0_O,
output   wire                        N_ON_OFF_1_O,
output   wire                        N_ON_OFF_2_O,
output   wire                        N_ON_OFF_3_O,
output   wire                        S_ON_OFF_0_O,	
output   wire                        S_ON_OFF_1_O,	
output   wire                        S_ON_OFF_2_O,	
output   wire                        S_ON_OFF_3_O,	
output   wire                        W_ON_OFF_0_O,	
output   wire                        W_ON_OFF_1_O,
output   wire                        W_ON_OFF_2_O,
output   wire                        W_ON_OFF_3_O,
output   wire                        E_ON_OFF_0_O,
output   wire                        E_ON_OFF_1_O,
output   wire                        E_ON_OFF_2_O,
output   wire                        E_ON_OFF_3_O,
output   wire                        PE_ON_OFF_0_O,
output   wire                        PE_ON_OFF_1_O,
output   wire                        PE_ON_OFF_2_O,
output   wire                        PE_ON_OFF_3_O
);


///////////internal signals////////////////////////////

wire                        N_VC_ANSWER;    
wire                        N_SW_ANSWER;
wire                        N_ROUTE_DONE;
wire    [2:0]               N_ROUTE_RESULT;
wire    [3:0]               N_Route_info;
wire                        N_Start_route;
wire    [4:0]               N_Vc_request;
wire                        N_valid_vc_req;
wire    [2:0]               N_Sw_request;
wire                        N_Valid_sw_req;
                            
wire                        S_VC_ANSWER;
wire                        S_SW_ANSWER;
wire                        S_ROUTE_DONE;
wire    [2:0]               S_ROUTE_RESULT;
wire    [3:0]               S_Route_info;
wire                        S_Start_route;
wire    [4:0]               S_Vc_request;
wire                        S_valid_vc_req;
wire    [2:0]               S_Sw_request;
wire                        S_Valid_sw_req;
                            
wire                        W_VC_ANSWER;
wire                        W_SW_ANSWER;
wire                        W_ROUTE_DONE;
wire    [2:0]               W_ROUTE_RESULT;
wire    [3:0]               W_Route_info;
wire                        W_Start_route;
wire    [4:0]               W_Vc_request;
wire                        W_valid_vc_req;
wire    [2:0]               W_Sw_request;
wire                        W_Valid_sw_req;
                            
wire                        E_VC_ANSWER;
wire                        E_SW_ANSWER;
wire                        E_ROUTE_DONE;
wire    [2:0]               E_ROUTE_RESULT;
wire    [3:0]               E_Route_info;
wire                        E_Start_route;
wire    [4:0]               E_Vc_request;
wire                        E_valid_vc_req;
wire    [2:0]               E_Sw_request;
wire                        E_Valid_sw_req;
                            
wire                        PE_VC_ANSWER;
wire                        PE_SW_ANSWER;
wire                        PE_ROUTE_DONE;
wire    [2:0]               PE_ROUTE_RESULT;
wire    [3:0]               PE_Route_info;
wire                        PE_Start_route;
wire    [4:0]               PE_Vc_request;
wire                        PE_valid_vc_req;
wire    [2:0]               PE_Sw_request;
wire                        PE_Valid_sw_req;
wire                        W_CROSS_DONE;    
wire                        E_CROSS_DONE;
wire                        N_CROSS_DONE;
wire                        S_CROSS_DONE;
wire                        PE_CROSS_DONE;
wire    [4:0]               IN_OUT_SEL_SW;
wire    [flit_width-1:0]    E_FLIT_O;
wire    [flit_width-1:0]    W_FLIT_O;
wire    [flit_width-1:0]    S_FLIT_O;
wire    [flit_width-1:0]    N_FLIT_O;
wire    [flit_width-1:0]    PE_FLIT_O;
wire                        Cross_EN_S;


////////////////instantiating///////////////////

INPUT_PORTS I_0 (
.clk(clk),                  
.rst(rst),
.N_VALID(N_VALID_i),
.N_FLIT_i(N_FLIT_i),
.N_VC_0_RESERVED(N_VC_0_RESERVED_i), 
.N_VC_1_RESERVED(N_VC_1_RESERVED_i),
.N_VC_2_RESERVED(N_VC_2_RESERVED_i),
.N_VC_3_RESERVED(N_VC_3_RESERVED_i),
.N_VC_ANSWER(N_VC_ANSWER),
.N_SW_ANSWER(N_SW_ANSWER),
.N_ROUTE_DONE(N_ROUTE_DONE),
.N_ROUTE_RESULT(N_ROUTE_RESULT),
.N_ON_OFF_0(N_ON_OFF_0_O),
.N_ON_OFF_1(N_ON_OFF_1_O),
.N_ON_OFF_2(N_ON_OFF_2_O),
.N_ON_OFF_3(N_ON_OFF_3_O),
.N_FLIT_O(N_FLIT_O), 
.N_Route_info(N_Route_info),
.N_Start_route(N_Start_route),
.N_Vc_request(N_Vc_request),
.N_valid_vc_req(N_valid_vc_req),
.N_Sw_request(N_Sw_request),
.N_Valid_sw_req(N_Valid_sw_req),
.S_VALID(S_VALID_i),         
.S_FLIT_i(S_FLIT_i),
.S_VC_0_RESERVED(S_VC_0_RESERVED_i),
.S_VC_1_RESERVED(S_VC_1_RESERVED_i),
.S_VC_2_RESERVED(S_VC_2_RESERVED_i),
.S_VC_3_RESERVED(S_VC_3_RESERVED_i),
.S_VC_ANSWER(S_VC_ANSWER),
.S_SW_ANSWER(S_SW_ANSWER),
.S_ROUTE_DONE(S_ROUTE_DONE),
.S_ROUTE_RESULT(S_ROUTE_RESULT),
.S_ON_OFF_0(S_ON_OFF_0_O),
.S_ON_OFF_1(S_ON_OFF_1_O),
.S_ON_OFF_2(S_ON_OFF_2_O),
.S_ON_OFF_3(S_ON_OFF_3_O),
.S_FLIT_O(S_FLIT_O),
.S_Route_info(S_Route_info),
.S_Start_route(S_Start_route),
.S_Vc_request(S_Vc_request),
.S_valid_vc_req(S_valid_vc_req),
.S_Sw_request(S_Sw_request),
.S_Valid_sw_req(S_Valid_sw_req),
.W_VALID(W_VALID_i),         
.W_FLIT_i(W_FLIT_i),
.W_VC_0_RESERVED(W_VC_0_RESERVED_i),
.W_VC_1_RESERVED(W_VC_1_RESERVED_i),
.W_VC_2_RESERVED(W_VC_2_RESERVED_i),
.W_VC_3_RESERVED(W_VC_3_RESERVED_i),
.W_VC_ANSWER(W_VC_ANSWER),
.W_SW_ANSWER(W_SW_ANSWER),
.W_ROUTE_DONE(W_ROUTE_DONE),
.W_ROUTE_RESULT(W_ROUTE_RESULT),
.W_ON_OFF_0(W_ON_OFF_0_O),
.W_ON_OFF_1(W_ON_OFF_1_O),
.W_ON_OFF_2(W_ON_OFF_2_O),
.W_ON_OFF_3(W_ON_OFF_3_O),
.W_FLIT_O(W_FLIT_O), 
.W_Route_info(W_Route_info),
.W_Start_route(W_Start_route),
.W_Vc_request(W_Vc_request),
.W_valid_vc_req(W_valid_vc_req),
.W_Sw_request(W_Sw_request),
.W_Valid_sw_req(W_Valid_sw_req),
.E_VALID(E_VALID_i),        
.E_FLIT_i(E_FLIT_i),
.E_VC_0_RESERVED(E_VC_0_RESERVED_i),
.E_VC_1_RESERVED(E_VC_1_RESERVED_i),
.E_VC_2_RESERVED(E_VC_2_RESERVED_i),
.E_VC_3_RESERVED(E_VC_3_RESERVED_i),
.E_VC_ANSWER(E_VC_ANSWER),
.E_SW_ANSWER(E_SW_ANSWER),
.E_ROUTE_DONE(E_ROUTE_DONE),
.E_ROUTE_RESULT(E_ROUTE_RESULT),
.E_ON_OFF_0(E_ON_OFF_0_O),
.E_ON_OFF_1(E_ON_OFF_1_O),
.E_ON_OFF_2(E_ON_OFF_2_O),
.E_ON_OFF_3(E_ON_OFF_3_O),
.E_FLIT_O(E_FLIT_O), 
.E_Route_info(E_Route_info),
.E_Start_route(E_Start_route),
.E_Vc_request(E_Vc_request),
.E_valid_vc_req(E_valid_vc_req),
.E_Sw_request(E_Sw_request),
.E_Valid_sw_req(E_Valid_sw_req),
.PE_VALID(PE_VALID_i),
.PE_FLIT_i(PE_FLIT_i),
.PE_VC_0_RESERVED(PE_VC_0_RESERVED_i),
.PE_VC_1_RESERVED(PE_VC_1_RESERVED_i),
.PE_VC_2_RESERVED(PE_VC_2_RESERVED_i),
.PE_VC_3_RESERVED(PE_VC_3_RESERVED_i),
.PE_VC_ANSWER(PE_VC_ANSWER),
.PE_SW_ANSWER(PE_SW_ANSWER),
.PE_ROUTE_DONE(PE_ROUTE_DONE),
.PE_ROUTE_RESULT(PE_ROUTE_RESULT),
.PE_ON_OFF_0(PE_ON_OFF_0_O),
.PE_ON_OFF_1(PE_ON_OFF_1_O),
.PE_ON_OFF_2(PE_ON_OFF_2_O),
.PE_ON_OFF_3(PE_ON_OFF_3_O),
.PE_FLIT_O(PE_FLIT_O),
.PE_Route_info(PE_Route_info),
.PE_Start_route(PE_Start_route),
.PE_Vc_request(PE_Vc_request),
.PE_valid_vc_req(PE_valid_vc_req),
.PE_Sw_request(PE_Sw_request),
.PE_Valid_sw_req(PE_Valid_sw_req)
);




VC_allocator I_1
(
.CLK(clk),
.RST(rst),
.ON_OFF_W_1(W_ON_OFF_0_i),
.ON_OFF_W_2(W_ON_OFF_1_i),
.ON_OFF_W_3(W_ON_OFF_2_i),
.ON_OFF_W_4(W_ON_OFF_3_i),
.ON_OFF_E_1(E_ON_OFF_0_i),
.ON_OFF_E_2(E_ON_OFF_1_i),
.ON_OFF_E_3(E_ON_OFF_2_i),
.ON_OFF_E_4(E_ON_OFF_3_i),
.ON_OFF_N_1(N_ON_OFF_0_i),
.ON_OFF_N_2(N_ON_OFF_1_i),
.ON_OFF_N_3(N_ON_OFF_2_i),
.ON_OFF_N_4(N_ON_OFF_3_i),
.ON_OFF_S_1(S_ON_OFF_0_i),
.ON_OFF_S_2(S_ON_OFF_1_i),
.ON_OFF_S_3(S_ON_OFF_2_i),
.ON_OFF_S_4(S_ON_OFF_3_i),
.ON_OFF_PE_1(PE_ON_OFF_0_i),
.ON_OFF_PE_2(PE_ON_OFF_1_i),
.ON_OFF_PE_3(PE_ON_OFF_2_i),
.ON_OFF_PE_4(PE_ON_OFF_3_i),
.W_REQ_VC(W_Vc_request),
.E_REQ_VC(E_Vc_request),
.N_REQ_VC(N_Vc_request),
.S_REQ_VC(S_Vc_request),
.PE_REQ_VC(PE_Vc_request),
.W_valid(W_valid_vc_req),
.E_valid(E_valid_vc_req),
.N_valid(N_valid_vc_req),
.S_valid(S_valid_vc_req),
.PE_valid(PE_valid_vc_req),
.ANS_W_VC(W_VC_ANSWER),
.ANS_E_VC(E_VC_ANSWER),
.ANS_N_VC(N_VC_ANSWER),
.ANS_S_VC(S_VC_ANSWER),
.ANS_PE_VC(PE_VC_ANSWER),
.VC_W_0_RESERVED(W_VC_0_RESERVED_O),
.VC_W_1_RESERVED(W_VC_1_RESERVED_O),
.VC_W_2_RESERVED(W_VC_2_RESERVED_O),
.VC_W_3_RESERVED(W_VC_3_RESERVED_O),
.VC_E_0_RESERVED(E_VC_0_RESERVED_O),
.VC_E_1_RESERVED(E_VC_1_RESERVED_O),
.VC_E_2_RESERVED(E_VC_2_RESERVED_O),
.VC_E_3_RESERVED(E_VC_3_RESERVED_O),
.VC_N_0_RESERVED(N_VC_0_RESERVED_O),
.VC_N_1_RESERVED(N_VC_1_RESERVED_O),
.VC_N_2_RESERVED(N_VC_2_RESERVED_O),
.VC_N_3_RESERVED(N_VC_3_RESERVED_O),
.VC_S_0_RESERVED(S_VC_0_RESERVED_O),
.VC_S_1_RESERVED(S_VC_1_RESERVED_O),
.VC_S_2_RESERVED(S_VC_2_RESERVED_O),
.VC_S_3_RESERVED(S_VC_3_RESERVED_O),
.VC_PE_0_RESERVED(PE_VC_0_RESERVED_O),
.VC_PE_1_RESERVED(PE_VC_1_RESERVED_O),
.VC_PE_2_RESERVED(PE_VC_2_RESERVED_O),
.VC_PE_3_RESERVED(PE_VC_3_RESERVED_O)
);

Routing_unit I_2 (
.CLK(clk),
.RST(rst),
.W_destination_address(W_Route_info),
.E_destination_address(E_Route_info),
.N_destination_address(N_Route_info),
.S_destination_address(S_Route_info),
.PE_destination_address(PE_Route_info),
.W_start_routing(W_Start_route),
.W_routing_done(W_ROUTE_DONE),
.W_next_hop(W_ROUTE_RESULT),
.E_start_routing(E_Start_route),
.E_routing_done(E_ROUTE_DONE),
.E_next_hop(E_ROUTE_RESULT),
.N_start_routing(N_Start_route),
.N_routing_done(N_ROUTE_DONE),
.N_next_hop(N_ROUTE_RESULT),
.S_start_routing(S_Start_route),
.S_routing_done(S_ROUTE_DONE),
.S_next_hop(S_ROUTE_RESULT),
.PE_start_routing(PE_Start_route),
.PE_routing_done(PE_ROUTE_DONE),
.PE_next_hop(PE_ROUTE_RESULT)
);


switch_allocator I_3
(
.CLK(clk),
.RST(rst),      
.E_REQ_Valid(E_Valid_sw_req),
.W_REQ_Valid(W_Valid_sw_req),
.S_REQ_Valid(S_Valid_sw_req),
.N_REQ_Valid(N_Valid_sw_req),
.PE_REQ_Valid(PE_Valid_sw_req),
.E_REQ_SW(E_Sw_request),
.W_REQ_SW(W_Sw_request),
.S_REQ_SW(S_Sw_request),
.N_REQ_SW(N_Sw_request),
.PE_REQ_SW(PE_Sw_request),
.W_CROSS_DONE(W_ROUTE_DONE),
.E_CROSS_DONE(E_ROUTE_DONE),
.N_CROSS_DONE(N_ROUTE_DONE),
.S_CROSS_DONE(S_ROUTE_DONE),
.PE_CROSS_DONE(PE_ROUTE_DONE),
.ANSW_E_SW(E_SW_ANSWER),
.ANSW_W_SW(W_SW_ANSWER),
.ANSW_N_SW(N_SW_ANSWER),
.ANSW_S_SW(S_SW_ANSWER),
.ANSW_PE_SW(PE_SW_ANSWER),
.IN_OUT_SEL_SW(IN_OUT_SEL_SW),
.CROSS_EN(Cross_EN_S)
); 


 
CrossBar I_4
(
.CLK(clk),              
.RST(rst),
.Cross_EN(Cross_EN_S),
.In_Out_Sel(IN_OUT_SEL_SW),
.Cross_input_west(W_FLIT_O),
.Cross_input_east(E_FLIT_O),
.Cross_input_north(N_FLIT_O),
.Cross_input_south(S_FLIT_O),
.Cross_input_PE(PE_FLIT_O),
.West_out_data(W_FLIT_o),
.East_out_data(E_FLIT_o),
.North_out_data(N_FLIT_o),
.South_out_data(S_FLIT_o),
.PE_out_data(PE_FLIT_o),
.West_valid(W_VALID_O),
.East_valid(E_VALID_O),
.North_valid(N_VALID_O),
.South_valid(S_VALID_O),
.PE_valid(PE_VALID_O),
.W_SW_DONE(W_CROSS_DONE), 
.E_SW_DONE(E_CROSS_DONE),
.N_SW_DONE(N_CROSS_DONE),
.S_SW_DONE(S_CROSS_DONE),
.PE_SW_DONE(PE_CROSS_DONE)
);





	 

endmodule















                                     