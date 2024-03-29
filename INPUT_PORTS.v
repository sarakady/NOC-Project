module INPUT_PORTS #(parameter flit_width=16, MAX_Packet_NUM=8)
(
input    wire                        clk,              
input    wire                        rst,
//north port
//input    wire                        N_clk,              
//input    wire                        N_rst,
input    wire                        N_VALID,
input    wire   [flit_width-1:0]     N_FLIT_i,
input    wire                        N_VC_0_RESERVED,
input    wire                        N_VC_1_RESERVED,
input    wire                        N_VC_2_RESERVED,
input    wire                        N_VC_3_RESERVED,
input    wire                        N_VC_ANSWER,
input    wire                        N_SW_ANSWER,
input    wire                        N_ROUTE_DONE,
input    wire   [2:0]                N_ROUTE_RESULT,
output   wire                        N_ON_OFF_0,
output   wire                        N_ON_OFF_1,
output   wire                        N_ON_OFF_2,
output   wire                        N_ON_OFF_3,
output   wire   [flit_width-1:0]     N_FLIT_O, 
output   wire    [3:0]               N_Route_info,
output   wire                        N_Start_route,
output   wire    [4:0]               N_Vc_request,
output   wire                        N_valid_vc_req,
output   wire    [2:0]               N_Sw_request,
output   wire                        N_Valid_sw_req,
//south port
//input    wire                        S_clk,
//input    wire                        S_rst,
input    wire                        S_VALID,
input    wire   [flit_width-1:0]     S_FLIT_i,
input    wire                        S_VC_0_RESERVED,
input    wire                        S_VC_1_RESERVED,
input    wire                        S_VC_2_RESERVED,
input    wire                        S_VC_3_RESERVED,
input    wire                        S_VC_ANSWER,
input    wire                        S_SW_ANSWER,
input    wire                        S_ROUTE_DONE,
input    wire   [2:0]                S_ROUTE_RESULT,
output   wire                        S_ON_OFF_0,
output   wire                        S_ON_OFF_1,
output   wire                        S_ON_OFF_2,
output   wire                        S_ON_OFF_3,
output   wire   [flit_width-1:0]     S_FLIT_O, 
output   wire    [3:0]               S_Route_info,
output   wire                        S_Start_route,
output   wire    [4:0]               S_Vc_request,
output   wire                        S_valid_vc_req,
output   wire    [2:0]               S_Sw_request,
output   wire                        S_Valid_sw_req,
//WEAST PORT
//input    wire                        W_clk,
//input    wire                        W_rst,
input    wire                        W_VALID,
input    wire   [flit_width-1:0]     W_FLIT_i,
input    wire                        W_VC_0_RESERVED,
input    wire                        W_VC_1_RESERVED,
input    wire                        W_VC_2_RESERVED,
input    wire                        W_VC_3_RESERVED,
input    wire                        W_VC_ANSWER,
input    wire                        W_SW_ANSWER,
input    wire                        W_ROUTE_DONE,
input    wire   [2:0]                W_ROUTE_RESULT,
output   wire                        W_ON_OFF_0,
output   wire                        W_ON_OFF_1,
output   wire                        W_ON_OFF_2,
output   wire                        W_ON_OFF_3,
output   wire   [flit_width-1:0]     W_FLIT_O, 
output   wire    [3:0]               W_Route_info,
output   wire                        W_Start_route,
output   wire    [4:0]               W_Vc_request,
output   wire                        W_valid_vc_req,
output   wire    [2:0]               W_Sw_request,
output   wire                        W_Valid_sw_req,
//EAST PORT
//input    wire                        E_clk,
//input    wire                        E_rst,
input    wire                        E_VALID,
input    wire   [flit_width-1:0]     E_FLIT_i,
input    wire                        E_VC_0_RESERVED,
input    wire                        E_VC_1_RESERVED,
input    wire                        E_VC_2_RESERVED,
input    wire                        E_VC_3_RESERVED,
input    wire                        E_VC_ANSWER,
input    wire                        E_SW_ANSWER,
input    wire                        E_ROUTE_DONE,
input    wire   [2:0]                E_ROUTE_RESULT,
output   wire                        E_ON_OFF_0,
output   wire                        E_ON_OFF_1,
output   wire                        E_ON_OFF_2,
output   wire                        E_ON_OFF_3,
output   wire   [flit_width-1:0]     E_FLIT_O, 
output   wire    [3:0]               E_Route_info,
output   wire                        E_Start_route,
output   wire    [4:0]               E_Vc_request,
output   wire                        E_valid_vc_req,
output   wire    [2:0]               E_Sw_request,
output   wire                        E_Valid_sw_req,
//PE PORT
//input    wire                        PE_clk,
//input    wire                        PE_rst,
input    wire                        PE_VALID,
input    wire   [flit_width-1:0]     PE_FLIT_i,
input    wire                        PE_VC_0_RESERVED,
input    wire                        PE_VC_1_RESERVED,
input    wire                        PE_VC_2_RESERVED,
input    wire                        PE_VC_3_RESERVED,
input    wire                        PE_VC_ANSWER,
input    wire                        PE_SW_ANSWER,
input    wire                        PE_ROUTE_DONE,
input    wire   [2:0]                PE_ROUTE_RESULT,
output   wire                        PE_ON_OFF_0,
output   wire                        PE_ON_OFF_1,
output   wire                        PE_ON_OFF_2,
output   wire                        PE_ON_OFF_3,
output   wire   [flit_width-1:0]     PE_FLIT_O, 
output   wire    [3:0]               PE_Route_info,
output   wire                        PE_Start_route,
output   wire    [4:0]               PE_Vc_request,
output   wire                        PE_valid_vc_req,
output   wire    [2:0]               PE_Sw_request,
output   wire                        PE_Valid_sw_req
);



input_port N_INPUT_PORT(
.clk(clk),        
.rst(rst),
.VALID(N_VALID),
.FLIT_i(N_FLIT_i),
.VC_0_RESERVED(N_VC_0_RESERVED),
.VC_1_RESERVED(N_VC_1_RESERVED),
.VC_2_RESERVED(N_VC_2_RESERVED),
.VC_3_RESERVED(N_VC_3_RESERVED),
.VC_ANSWER(N_VC_ANSWER),
.SW_ANSWER(N_SW_ANSWER),
.ROUTE_DONE(N_ROUTE_DONE),
.ROUTE_RESULT(N_ROUTE_RESULT),
.ON_OFF_0(N_ON_OFF_0),
.ON_OFF_1(N_ON_OFF_1),
.ON_OFF_2(N_ON_OFF_2),
.ON_OFF_3(N_ON_OFF_3),
.FLIT_O(N_FLIT_O), 
.Route_info(N_Route_info),
.Start_route(N_Start_route),
.Vc_request(N_Vc_request),
.valid_vc_req(N_valid_vc_req),
.Sw_request(N_Sw_request),
.Valid_sw_req(N_Valid_sw_req)
);


input_port S_INPUT_PORT(
.clk(clk),        
.rst(rst),
.VALID(S_VALID),
.FLIT_i(S_FLIT_i),
.VC_0_RESERVED(S_VC_0_RESERVED),
.VC_1_RESERVED(S_VC_1_RESERVED),
.VC_2_RESERVED(S_VC_2_RESERVED),
.VC_3_RESERVED(S_VC_3_RESERVED),
.VC_ANSWER(S_VC_ANSWER),
.SW_ANSWER(S_SW_ANSWER),
.ROUTE_DONE(S_ROUTE_DONE),
.ROUTE_RESULT(S_ROUTE_RESULT),
.ON_OFF_0(S_ON_OFF_0),
.ON_OFF_1(S_ON_OFF_1),
.ON_OFF_2(S_ON_OFF_2),
.ON_OFF_3(S_ON_OFF_3),
.FLIT_O(S_FLIT_O), 
.Route_info(S_Route_info),
.Start_route(S_Start_route),
.Vc_request(S_Vc_request),
.valid_vc_req(S_valid_vc_req),
.Sw_request(S_Sw_request),
.Valid_sw_req(S_Valid_sw_req)
);

input_port E_INPUT_PORT(
.clk(clk),        
.rst(rst),
.VALID(E_VALID),
.FLIT_i(E_FLIT_i),
.VC_0_RESERVED(E_VC_0_RESERVED),
.VC_1_RESERVED(E_VC_1_RESERVED),
.VC_2_RESERVED(E_VC_2_RESERVED),
.VC_3_RESERVED(E_VC_3_RESERVED),
.VC_ANSWER(E_VC_ANSWER),
.SW_ANSWER(E_SW_ANSWER),
.ROUTE_DONE(E_ROUTE_DONE),
.ROUTE_RESULT(E_ROUTE_RESULT),
.ON_OFF_0(E_ON_OFF_0),
.ON_OFF_1(E_ON_OFF_1),
.ON_OFF_2(E_ON_OFF_2),
.ON_OFF_3(E_ON_OFF_3),
.FLIT_O(E_FLIT_O), 
.Route_info(E_Route_info),
.Start_route(E_Start_route),
.Vc_request(E_Vc_request),
.valid_vc_req(E_valid_vc_req),
.Sw_request(E_Sw_request),
.Valid_sw_req(E_Valid_sw_req)
);


input_port W_INPUT_PORT(
.clk(clk),        
.rst(rst),
.VALID(W_VALID),
.FLIT_i(W_FLIT_i),
.VC_0_RESERVED(W_VC_0_RESERVED),
.VC_1_RESERVED(W_VC_1_RESERVED),
.VC_2_RESERVED(W_VC_2_RESERVED),
.VC_3_RESERVED(W_VC_3_RESERVED),
.VC_ANSWER(W_VC_ANSWER),
.SW_ANSWER(W_SW_ANSWER),
.ROUTE_DONE(W_ROUTE_DONE),
.ROUTE_RESULT(W_ROUTE_RESULT),
.ON_OFF_0(W_ON_OFF_0),
.ON_OFF_1(W_ON_OFF_1),
.ON_OFF_2(W_ON_OFF_2),
.ON_OFF_3(W_ON_OFF_3),
.FLIT_O(W_FLIT_O), 
.Route_info(W_Route_info),
.Start_route(W_Start_route),
.Vc_request(W_Vc_request),
.valid_vc_req(W_valid_vc_req),
.Sw_request(W_Sw_request),
.Valid_sw_req(W_Valid_sw_req)
);





input_port PE_INPUT_PORT(
.clk(clk),        
.rst(rst),
.VALID(PE_VALID),
.FLIT_i(PE_FLIT_i),
.VC_0_RESERVED(PE_VC_0_RESERVED),
.VC_1_RESERVED(PE_VC_1_RESERVED),
.VC_2_RESERVED(PE_VC_2_RESERVED),
.VC_3_RESERVED(PE_VC_3_RESERVED),
.VC_ANSWER(PE_VC_ANSWER),
.SW_ANSWER(PE_SW_ANSWER),
.ROUTE_DONE(PE_ROUTE_DONE),
.ROUTE_RESULT(PE_ROUTE_RESULT),
.ON_OFF_0(PE_ON_OFF_0),
.ON_OFF_1(PE_ON_OFF_1),
.ON_OFF_2(PE_ON_OFF_2),
.ON_OFF_3(PE_ON_OFF_3),
.FLIT_O(PE_FLIT_O), 
.Route_info(PE_Route_info),
.Start_route(PE_Start_route),
.Vc_request(PE_Vc_request),
.valid_vc_req(PE_valid_vc_req),
.Sw_request(PE_Sw_request),
.Valid_sw_req(PE_Valid_sw_req)
);

endmodule