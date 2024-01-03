/* adresses for downsttram routers 
we have 5 outs so we need 3 bits
000 =>> west
001 =>>east
010 =>>north
011 =>>south 
100 =>> pe
*/
module switch_allocator #(parameter REQ_size = 3)(
input              CLK,RST,      
input              E_REQ_Valid,
input              W_REQ_Valid,
input              S_REQ_Valid,
input              N_REQ_Valid,
input              PE_REQ_Valid,
input [REQ_size-1:0] E_REQ_SW,
input [REQ_size-1:0] W_REQ_SW,
input [REQ_size-1:0] S_REQ_SW,
input [REQ_size-1:0] N_REQ_SW,
input [REQ_size-1:0] PE_REQ_SW,
input              W_CROSS_DONE,
input              E_CROSS_DONE,
input              N_CROSS_DONE,
input              S_CROSS_DONE,
input              PE_CROSS_DONE,
output reg         ANSW_E_SW,
output reg         ANSW_W_SW,
output reg         ANSW_N_SW,
output reg         ANSW_S_SW,
output reg         ANSW_PE_SW,
output reg [4:0]   IN_OUT_SEL_SW,
output reg         CROSS_EN



);
// STATE ENCODING
  localparam idle = 4'b0000;
  localparam STATE_1 = 4'b0001;
  localparam STATE_2 = 4'b0010;
  localparam STATE_3 = 4'b0011;
  localparam STATE_4 = 4'b0100;
  localparam STATE_5 = 4'b0101;
  localparam STATE_6 = 4'b0110;
  localparam STATE_7 = 4'b0111;
  localparam STATE_8 = 4'b1000;
  localparam STATE_9 = 4'b1001;
  localparam STATE_10 = 4'b1010;
  
  reg [3:0] next_state,current_state;

/////////////////////////////////////////////
// STATE TRANSITION
always @(posedge CLK or negedge RST)
begin
  if (!RST)
    begin
      current_state<= idle;
    end
  else
    current_state<= next_state;
end
////////////////////////////////////////////
//NEST STATE LOGIC AND OUTPUT CALCULATION 
always@(*)
begin
  ANSW_E_SW = 0;
 ANSW_W_SW = 0;
 ANSW_N_SW = 0;
 ANSW_S_SW = 0;
 ANSW_PE_SW = 0;
 IN_OUT_SEL_SW = 5'b11111;
 CROSS_EN = 0 ;
  case (current_state)
    idle:
    begin
    next_state = STATE_1;
    end
    STATE_1:// chk west
    begin
      if (W_REQ_Valid)
        begin
           ANSW_W_SW = 1;
           next_state = STATE_2;
           
        end
      else
        begin
          next_state = STATE_3;
        end
      
    end
    STATE_2:
    begin
      if (!W_CROSS_DONE)
        begin
          ANSW_W_SW = 1;
          CROSS_EN=1 ;
          next_state = STATE_2;
          case (W_REQ_SW)
            'b000:
            IN_OUT_SEL_SW = 5'd0;
            'b001:
            IN_OUT_SEL_SW = 5'd1;
            'b010:
            IN_OUT_SEL_SW = 5'd2;
            'b011:
            IN_OUT_SEL_SW = 5'd3;
            'b100:
            IN_OUT_SEL_SW = 5'd4;
				default:
				IN_OUT_SEL_SW = 5'd0;
          endcase
      end
    else
      begin
        next_state = STATE_3;
        ANSW_W_SW = 0;
        CROSS_EN=0 ;
      end
      
    end
    STATE_3://chk east
    begin
      CROSS_EN=0 ;
      if (E_REQ_Valid)
        begin
           ANSW_E_SW = 1;
           next_state = STATE_4;
        end
      else
        begin
          next_state = STATE_5;
        end
    end 
    STATE_4:
    begin
      if (!E_CROSS_DONE)
        begin
          ANSW_E_SW = 1;
          next_state = STATE_4;
          CROSS_EN=1 ;
          case (E_REQ_SW)
            'b000:
            IN_OUT_SEL_SW = 5'd5;
            'b001:
            IN_OUT_SEL_SW = 5'd6;
            'b010:
            IN_OUT_SEL_SW = 5'd7;
            'b011:
            IN_OUT_SEL_SW = 5'd8;
            'b100:
            IN_OUT_SEL_SW = 5'd9;
				default:
				IN_OUT_SEL_SW = 5'd0;
          endcase
      end
    else
      begin
        next_state = STATE_5;
        ANSW_E_SW = 0;
        CROSS_EN=0 ;
      end
      
    end 
    STATE_5://chk north
    begin
      CROSS_EN=0 ;
      if (N_REQ_Valid)
        begin
           ANSW_N_SW = 1;
           next_state = STATE_6;
        end
      else
        begin
          next_state = STATE_7;
        end
      
    end 
    STATE_6:
    begin
      if (!N_CROSS_DONE)
        begin
          CROSS_EN=1 ;
          ANSW_N_SW = 1;
          next_state = STATE_6;
          case (N_REQ_SW)
            'b000:
            IN_OUT_SEL_SW = 5'd10;
            'b001:
            IN_OUT_SEL_SW = 5'd11;
            'b010:
            IN_OUT_SEL_SW = 5'd12;
            'b011:
            IN_OUT_SEL_SW = 5'd13;
            'b100:
            IN_OUT_SEL_SW = 5'd14;
				default:
				IN_OUT_SEL_SW = 5'd0;
          endcase
      end
    else
      begin
        next_state = STATE_7;
        ANSW_N_SW = 0;
        CROSS_EN=0 ;
      end
      
    end 
    STATE_7:// chk south
    begin
      CROSS_EN=0 ;
      if (S_REQ_Valid)
        begin
           ANSW_S_SW = 1;
           next_state = STATE_8;
        end
      else
        begin
          next_state = STATE_9;
        end
    end 
    STATE_8:
    begin
      if (!S_CROSS_DONE)
        begin
          ANSW_S_SW = 1;
          next_state = STATE_8;
          CROSS_EN=1 ;
          case (W_REQ_SW)
            'b000:
            IN_OUT_SEL_SW = 5'd15;
            'b001:
            IN_OUT_SEL_SW = 5'd16;
            'b010:
            IN_OUT_SEL_SW = 5'd17;
            'b011:
            IN_OUT_SEL_SW = 5'd18;
            'b100:
            IN_OUT_SEL_SW = 5'd19;
				default:
				IN_OUT_SEL_SW = 5'd0;
          endcase
      end
    else
      begin
        next_state = STATE_9;
        ANSW_S_SW = 0;
        CROSS_EN=0 ;
      end
      
    end 
    STATE_9://chk pe
    begin
      CROSS_EN=0 ;
      if (PE_REQ_Valid)
        begin
           ANSW_PE_SW = 1;
           next_state = STATE_10;
        end
      else
        begin
          next_state = STATE_1;
        end
    end 
    STATE_10:
    begin
      if (!PE_CROSS_DONE)
        begin
          CROSS_EN=1 ;
          ANSW_PE_SW = 1;
          next_state = STATE_10;
          case (W_REQ_SW)
            'b000:
            IN_OUT_SEL_SW = 5'd20;
            'b001:
            IN_OUT_SEL_SW = 5'd21;
            'b010:
            IN_OUT_SEL_SW = 5'd22;
            'b011:
            IN_OUT_SEL_SW = 5'd23;
				default:
				IN_OUT_SEL_SW = 5'd0;
            
          endcase
      end
    else
      begin
        next_state = idle;
        ANSW_PE_SW = 0;
        CROSS_EN=0 ;
      end
      end
      default:
    begin
    ANSW_E_SW = 0;
    ANSW_W_SW = 0;
    ANSW_N_SW = 0;
    ANSW_S_SW = 0;
    ANSW_PE_SW = 0;
    IN_OUT_SEL_SW=5'b11111;
    end

  endcase
end

endmodule
