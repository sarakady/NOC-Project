module RR_ARBITER 
(
input    wire                        clk,
input    wire                        rst,
input    wire                        EMBTY_FULL_0,
input    wire                        EMBTY_FULL_1,
input    wire                        EMBTY_FULL_2,
input    wire                        EMBTY_FULL_3,
input    wire                        Control_READY,
output   reg      [1:0]              VC_O_BUF,
output   reg      [1:0]              VC_O,
output   reg                         selected,
output   wire                        VALID
);


localparam  IDLE=3'b0,
            VC_0=3'b001,
				VC_1=3'b010,
				VC_2=3'b011,
				VC_3=3'b100;



reg [2:0] current_state,
          next_state;

wire [3:0]  flag;

assign flag = {EMBTY_FULL_0,EMBTY_FULL_1,EMBTY_FULL_2,EMBTY_FULL_3};
assign VALID = (flag)? 1'b1 : 1'b0;



//FSM

//state transiton
always@(posedge clk or negedge rst)
  begin
     if(!rst)
	    current_state<= IDLE;
		else
		 current_state<= next_state;
  end

//next state logic
always @(*)
  begin
    case(current_state)
	   IDLE   :begin
		           if(Control_READY && flag)
					     next_state = VC_0;
					  else
					     next_state = IDLE;
		        end
	   VC_0   :begin
		           if(EMBTY_FULL_0)
					     next_state = VC_0;
					  else
					     next_state = VC_1;
		        end
	   VC_1   :begin
		           if(EMBTY_FULL_1)
					     next_state = VC_1;
					  else
					     next_state = VC_2;
		        end
	   VC_2   :begin
		           if(EMBTY_FULL_2)
					     next_state = VC_2;
					  else
					     next_state = VC_3;
		        end
	   VC_3   :begin
		           if(EMBTY_FULL_3)
					     next_state = VC_3;
					  else if(flag)
					     next_state = VC_0;
					  else
					     next_state = IDLE;
		        end
		default:begin
		              next_state = IDLE;
		        end
	 endcase
  end

//output logic
always @(*)
  begin
    case(current_state)
	   IDLE   :begin
		               VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
		        end
	   VC_0   :begin
		           if(EMBTY_FULL_0)
					    begin
					      VC_O     =2'b00;					 
					      VC_O_BUF =2'b00;
							selected =1'b1;
					    end
					  else
					    begin
						   VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
						 end
		        end
	   VC_1   :begin
		           if(EMBTY_FULL_1)
					    begin
					      VC_O     =2'b01;					 
					      VC_O_BUF =2'b01;
							selected =1'b1;
					    end
					  else
					    begin
						   VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
						 end
		        end
	   VC_2   :begin
		           if(EMBTY_FULL_2)
					    begin
					      VC_O     =2'b10;					 
					      VC_O_BUF =2'b10;
							selected =1'b1;
					    end
					  else
					    begin
						   VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
						 end 
		        end
	   VC_3   :begin
		           if(EMBTY_FULL_3)
					    begin
					      VC_O     =2'b11;					 
					      VC_O_BUF =2'b11;
							selected =1'b1;
					    end
					  else
					    begin
						   VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
						 end
		        end
		default:begin
		               VC_O     =2'b0;
					      VC_O_BUF =2'b0;
							selected =1'b0;
		        end
	 endcase
  end



endmodule