module INPUT_BUFFERS #(parameter flit_width=16)
(
input    wire                        clk,
input    wire                        rst,
input    wire                        CLEAR,                       //from controller
input    wire                        valid,                      //from upstream
input    wire   [1:0]                VC_NUM,                     //FROM Arbiter
input    wire   [flit_width-1:0]     FLIT_i,         
output   reg    [flit_width-1:0]     FLIT_O,                    //to crossbar
output   reg    [flit_width-1:0]     read_O,                   //to controller
//signals for VC0
input    wire                        VC_0_Reserved,            //Control signal from VC ALLOCATOR OF UPSTREAM
output   reg                         ON_OFF_0,                  //CONTROL SIGNAL FOR upstream router
output   reg                         EPT_FL_0,                 //CONTROL SIGNAL FOR Arbiter
//signals for VC1
input    wire                        VC_1_Reserved,
output   reg                         ON_OFF_1,
output   reg                         EPT_FL_1,
//signals for VC2
input    wire                        VC_2_Reserved,
output   reg                         ON_OFF_2,
output   reg                         EPT_FL_2,
//signals for VC3
input    wire                        VC_3_Reserved,
output   reg                         ON_OFF_3,
output   reg                         EPT_FL_3
);



//VCs buffers
reg [flit_width-1:0]  mem_0;
reg [flit_width-1:0]  mem_1;
reg [flit_width-1:0]  mem_2;
reg [flit_width-1:0]  mem_3;




//input selective and buffering
wire [1:0] selector;
assign selector=(valid)? FLIT_i[1:0] : 2'b0;

always@(posedge clk or negedge rst)
  begin
     if(!rst)
	    begin
		   mem_0   <= 'b0;
		   mem_1   <= 'b0;
		   mem_2   <= 'b0;
		   mem_3   <= 'b0;
		 end
	  else if(valid)
	    begin
		    case(selector)
					   2'b00:begin 
						          mem_0<=FLIT_i;
								end
						2'b01:begin 
						          mem_1<=FLIT_i;
								end
						2'b10:begin 
						          mem_2<=FLIT_i;
								end
						2'b11:begin 
						          mem_3<=FLIT_i;
								end
			 endcase
		 end
	  
  end

  
  
 //output flit to controller
 always@(*)
   begin
	   case(VC_NUM)
		  2'b00: read_O = mem_0;

		  2'b01: read_O = mem_1;
		  		  
		  2'b10: read_O = mem_2;
    	  
		  2'b11: read_O = mem_3;

		endcase
	end
 
  

  

//on_off signals controller for upstream vc allocator

 always @ (posedge clk or negedge rst)
  begin
      if(!rst)
		  begin
		    ON_OFF_0<=1'b1;
			 ON_OFF_1<=1'b1;
			 ON_OFF_2<=1'b1;
			 ON_OFF_3<=1'b1;
		  end
      else if(CLEAR)
		  begin
		      case(VC_NUM)
				  2'b00:begin 
							    ON_OFF_0<=1'b1;       //vc available
				  		  end
				  2'b01:begin
							    ON_OFF_1<=1'b1;
				  		  end
				  2'b10:begin
							    ON_OFF_2<=1'b1;
		   		  	  end
				  2'b11:begin
							    ON_OFF_3<=1'b1;
				        end
				endcase
		  end
		else if({VC_0_Reserved,VC_1_Reserved,VC_2_Reserved,VC_3_Reserved})
		  begin
          case({VC_0_Reserved,VC_1_Reserved,VC_2_Reserved,VC_3_Reserved})
            'b1000:ON_OFF_0<=1'b0;
            'b0100:ON_OFF_1<=1'b0;
            'b0010:ON_OFF_2<=1'b0;
            'b0001:ON_OFF_3<=1'b0;
           default:ON_OFF_0<=1'b0;
          endcase
		  end
		  
		else
	      begin	
		      ON_OFF_0<= !EPT_FL_0;
            ON_OFF_1<= !EPT_FL_1;
            ON_OFF_2<= !EPT_FL_2;
            ON_OFF_3<= !EPT_FL_3;
         end

    end 
	 

 
	 
//empty_full signals for Arbiter
always@(posedge clk or negedge rst)
  begin
     if(!rst)
	   begin
		end
	  else if(CLEAR)
	    begin
		    case(VC_NUM)
				 2'b00:begin 
                      EPT_FL_0<=1'b0;       //this vc is empty
						end
				2'b01:begin 
							 EPT_FL_1<=1'b0;
						end
				2'b10:begin 
							 EPT_FL_2<=1'b0;
						end
				2'b11:begin 
							 EPT_FL_3<=1'b0;
						end
			 endcase
		 end
		else if(valid)
	    begin
		    case(selector)
				 2'b00:begin 
                      EPT_FL_0<=1'b1;       //this vc is full
						end
				2'b01:begin 
							 EPT_FL_1<=1'b1;
						end
				2'b10:begin 
							 EPT_FL_2<=1'b1;
						end
				2'b11:begin 
							 EPT_FL_3<=1'b1;
						end
			 endcase
		 end
		 
		 
	  
  end
  
  
  
//output selective
 always@(*)
   begin
	   case(VC_NUM)
		  2'b00: FLIT_O = mem_0;

		  2'b01: FLIT_O = mem_1;
		  		  
		  2'b10: FLIT_O = mem_2;
    	  
		  2'b11: FLIT_O = mem_3;
		endcase
	end 
  
  
  
  
endmodule