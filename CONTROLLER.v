module CONTROLLER #(parameter flit_width=16, MAX_Packet_NUM=8)
(
input    wire                        clk,
input    wire                        rst,
input    wire                        Arb_valid,
input    wire    [1:0]               SEL_VC,
input    wire                        VC_selected,
input    wire    [flit_width-1:0]    read_O,
input    wire                        VC_ANSWER,
input    wire                        SW_ANSWER,
input    wire                        ROUTE_DONE,
input    wire   [2:0]                DIRECTION,
output   reg                         ready,
output   reg    [3:0]                Route_info,
output   reg                         Start_route,
output   reg    [4:0]                Vc_request,
output   reg                         valid_vc_req,
output   reg    [2:0]                Sw_request,
output   reg                         Valid_sw_req,
output   reg                         clear
);



localparam IDLE           =3'b000,
           FLIT_STORE     =3'b001,
			  TYPE_SELECTION =3'b010,
			  ROUTING        =3'b011,
			  ASK_VC         =3'b100,
			  ASK_SW         =3'b101,
			  DONE           =3'b110;




wire  [2:0] 	           sequance_num;
reg   [flit_width-1:0]    Flit_mem;
reg   [2:0]               mem_comb;
reg   [2:0]               current_state,
                          next_state;
								  
reg   [2:0]               route_mem [MAX_Packet_NUM-1:0] ;




assign sequance_num = Flit_mem[6:4];			  

			  
  
 always @ (posedge clk or negedge rst)
   begin
	   if(!rst)
		  begin
		    route_mem[0]<=3'b0;
			 route_mem[1]<=3'b0;
			 route_mem[2]<=3'b0;
			 route_mem[3]<=3'b0;
			 route_mem[4]<=3'b0;
			 route_mem[5]<=3'b0;
			 route_mem[6]<=3'b0;
			 route_mem[7]<=3'b0;
		  end
		else
		   route_mem[sequance_num] <= mem_comb;
	end

	  

//FSM

//state transiton
always@(posedge clk or negedge rst)
  begin
     if(!rst)
	    current_state<= IDLE;
		else
		 current_state <= next_state;
  end

  
//next state logic
always@(*)
  begin
    case(current_state)
	   IDLE           :begin
		                   if(Arb_valid)
								    next_state = FLIT_STORE;
								 else
								    next_state = IDLE;
		                end
		FLIT_STORE     :begin
		                   if(VC_selected)
								   next_state = TYPE_SELECTION; 
								 else
								   next_state = FLIT_STORE;
		                end
		TYPE_SELECTION :begin
		                   if(Flit_mem[3:2]==2'b00)
								   next_state = ROUTING;
								 else
		                     next_state = ASK_VC;
		                end
		ROUTING        :begin
		                   if(ROUTE_DONE)
								   next_state = ASK_VC;
								 else
		                     next_state = ROUTING;
		                end
		ASK_VC         :begin
		                   if(VC_ANSWER)
								   next_state = ASK_SW;
								 else
		                     next_state = ASK_VC;
		                end 
		ASK_SW         :begin
		                   if(SW_ANSWER)
								   next_state = DONE;
								 else
		                     next_state = ASK_SW;
		                end
		DONE           :begin
		                   if(Arb_valid)
								    next_state = FLIT_STORE;
								 else
								    next_state = IDLE;
		                end
		default        :begin
		                      next_state = IDLE;
		                end
		
	 endcase
  end


//output logic
always@(*)
  begin
    ready                    = 1'b0;
	 Start_route              = 1'b0;
	 valid_vc_req             = 1'b0;
	 Valid_sw_req             = 1'b0;
	 clear                    = 1'b0;
	 Flit_mem                 = read_O;
	 Route_info               = Flit_mem[10:7];
	 mem_comb                 = route_mem[sequance_num];
	 Vc_request               = {route_mem[sequance_num],SEL_VC};
	 Sw_request               = route_mem[sequance_num];
	 
    case(current_state)
	   IDLE           :begin
		                  ready= 1'b1;
		                end
		FLIT_STORE     :begin
		                   if(VC_selected) 
								   Flit_mem = read_O;
								 else
								   Flit_mem = read_O;
		                end
		TYPE_SELECTION :begin
		                   if(Flit_mem[3:2]==2'b00)              //header
								   begin
									  Route_info = Flit_mem[10:7];
									  Start_route = 1'b1;
									end
								 else if(Flit_mem[3:2]==2'b01)         //body
		                      begin
									   Vc_request = {route_mem[sequance_num],SEL_VC};  //{DIRECTION,VC number}
										valid_vc_req = 1'b1;
										Start_route = 1'b0;
									 end
								 else                                //Tail
								    begin
									   Vc_request = {route_mem[sequance_num],SEL_VC}; 
										valid_vc_req = 1'b1;
										Start_route = 1'b0;
									   	
									 end
		                end
		ROUTING        :begin
		                   if(ROUTE_DONE)
								   begin
									  Start_route = 1'b0;
									  Vc_request = {DIRECTION,SEL_VC};
									  valid_vc_req = 1'b1;
									  mem_comb = DIRECTION;  //route_mem[sequance_number]
									end
								 else
								   begin
									  Start_route = 1'b1;
									  Route_info = Flit_mem[10:7];
									  valid_vc_req = 1'b0;
									end
		                end
		ASK_VC         :begin
		                   if(VC_ANSWER)
								   begin
								      Sw_request = route_mem[sequance_num];
										Valid_sw_req = 1'b1;
									   valid_vc_req = 1'b0;
										
									end
							    else	
								   begin
									   Vc_request = {route_mem[sequance_num],SEL_VC};
									   valid_vc_req = 1'b1;
								   end	
		                   
		                end 
		ASK_SW         :begin
		                   if(SW_ANSWER)
								   begin
									   Valid_sw_req = 1'b0;
									end
								 else
								   begin
									   Sw_request = route_mem[sequance_num];
										Valid_sw_req = 1'b1;
									end
		                end
		DONE           :begin
		                     clear = 1'b1;
								   ready = 1'b1;	
		                   if(Flit_mem[3:2]==2'b10)              //tail
								   mem_comb = 3'b0;
								 else
								   mem_comb = route_mem[sequance_num];	
		                end
		default        :begin
                         ready                    = 1'b0;
	                      Start_route              = 1'b0;
	                      valid_vc_req             = 1'b0;
	                      Valid_sw_req             = 1'b0;
	                      clear                    = 1'b0;
	                      Flit_mem                 = read_O;
	                      Route_info               = Flit_mem[10:7];
	                      mem_comb                 = route_mem[sequance_num];
	                      Vc_request               = {route_mem[sequance_num],SEL_VC};
	                      Sw_request               = route_mem[sequance_num];
	                      Valid_sw_req             = 1'b0;		
		                end
		
	 endcase
  end



endmodule