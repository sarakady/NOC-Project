//W_REQ_VC[4:3]> for VC   
//W_REQ_VC[2:0]>>> for outport
module VC_allocator(
input      CLK,RST,
input      ON_OFF_W_1,ON_OFF_W_2,ON_OFF_W_3,ON_OFF_W_4,
input      ON_OFF_E_1,ON_OFF_E_2,ON_OFF_E_3,ON_OFF_E_4,
input      ON_OFF_N_1,ON_OFF_N_2,ON_OFF_N_3,ON_OFF_N_4,
input      ON_OFF_S_1,ON_OFF_S_2,ON_OFF_S_3,ON_OFF_S_4,
input      ON_OFF_PE_1,ON_OFF_PE_2,ON_OFF_PE_3,ON_OFF_PE_4,
input [4:0] W_REQ_VC,E_REQ_VC,N_REQ_VC,S_REQ_VC,PE_REQ_VC,
input      W_valid, E_valid,N_valid, S_valid, PE_valid,
output reg ANS_W_VC,ANS_E_VC,ANS_N_VC,ANS_S_VC,ANS_PE_VC,
output reg VC_W_0_RESERVED,VC_W_1_RESERVED,VC_W_2_RESERVED,VC_W_3_RESERVED,
output reg VC_E_0_RESERVED,VC_E_1_RESERVED,VC_E_2_RESERVED,VC_E_3_RESERVED,
output reg VC_N_0_RESERVED,VC_N_1_RESERVED,VC_N_2_RESERVED,VC_N_3_RESERVED,
output reg VC_S_0_RESERVED,VC_S_1_RESERVED,VC_S_2_RESERVED,VC_S_3_RESERVED,
output reg VC_PE_0_RESERVED,VC_PE_1_RESERVED,VC_PE_2_RESERVED,VC_PE_3_RESERVED


);

reg  VC_MATRIX [3:0][4:0];
reg [2:0] current_state,next_state;
localparam idle = 3'b000,
           W = 3'd1,
           E = 3'd2,
           N = 3'd3,
           S = 3'd4,
           PE = 3'd5;

always@(*)
begin
  VC_MATRIX[0][2] = ON_OFF_N_1 ;
  VC_MATRIX[1][2] = ON_OFF_N_2 ;
  VC_MATRIX[2][2] = ON_OFF_N_3 ;
  VC_MATRIX[3][2] = ON_OFF_N_4 ;
  VC_MATRIX[0][3] = ON_OFF_S_1 ;
  VC_MATRIX[1][3] = ON_OFF_S_2 ;
  VC_MATRIX[2][3] = ON_OFF_S_3 ;
  VC_MATRIX[3][3] = ON_OFF_S_4 ;
  VC_MATRIX[0][1] = ON_OFF_E_1 ;
  VC_MATRIX[1][1] = ON_OFF_E_2 ;
  VC_MATRIX[2][1] = ON_OFF_E_3 ;
  VC_MATRIX[3][1] = ON_OFF_E_4 ;
  VC_MATRIX[0][0] = ON_OFF_W_1 ;
  VC_MATRIX[1][0] = ON_OFF_W_2 ;
  VC_MATRIX[2][0] = ON_OFF_W_3 ;
  VC_MATRIX[3][0] = ON_OFF_W_4 ;
  VC_MATRIX[0][4] = ON_OFF_PE_1 ;
  VC_MATRIX[1][4] = ON_OFF_PE_2 ;
  VC_MATRIX[2][4] = ON_OFF_PE_3 ;
  VC_MATRIX[3][4] = ON_OFF_PE_4 ;
  
end
/*************************************/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      current_state <= idle;
    end
    else
      current_state <= next_state;
end
/**********************************************/
always@(*)
begin

VC_W_0_RESERVED = 0;
VC_W_1_RESERVED = 0;
VC_W_2_RESERVED = 0;
VC_W_3_RESERVED = 0;

VC_E_0_RESERVED = 0;
VC_E_1_RESERVED = 0;
VC_E_2_RESERVED = 0;
VC_E_3_RESERVED = 0;

VC_N_0_RESERVED = 0;
VC_N_1_RESERVED = 0;
VC_N_2_RESERVED = 0;
VC_N_3_RESERVED = 0;

VC_S_0_RESERVED = 0;
VC_S_1_RESERVED = 0;
VC_S_2_RESERVED = 0;
VC_S_3_RESERVED = 0;

VC_PE_0_RESERVED = 0;
VC_PE_1_RESERVED = 0;
VC_PE_2_RESERVED = 0;
VC_PE_3_RESERVED = 0;


  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
  case(current_state)
  idle:
  begin
    next_state = W;
    ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
  end
  W:
  begin
    next_state = E;
    if(W_valid)
      begin
        ANS_W_VC = VC_MATRIX[W_REQ_VC[1:0]][W_REQ_VC[4:2]];
        if(VC_MATRIX[W_REQ_VC[1:0]][W_REQ_VC[4:2]])
          begin
            VC_W_0_RESERVED = 0;
            VC_W_1_RESERVED = 0;
            VC_W_2_RESERVED = 0;
            VC_W_3_RESERVED = 0;

        case (W_REQ_VC[1:0])
          2'b00:VC_W_0_RESERVED = 1;
          2'b01:VC_W_1_RESERVED = 1;
          2'b10:VC_W_2_RESERVED = 1;
          2'b11:VC_W_3_RESERVED = 1; 
          
        endcase
      end
      else
        begin
            VC_W_0_RESERVED = 0;
            VC_W_1_RESERVED = 0;
            VC_W_2_RESERVED = 0;
            VC_W_3_RESERVED = 0;
        end
      end
    else
      begin
  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
      end
  end
  E:
  begin
    next_state = N;
    if(E_valid)
      begin
        ANS_E_VC = VC_MATRIX[E_REQ_VC[1:0]][E_REQ_VC[4:2]];
        if(VC_MATRIX[E_REQ_VC[1:0]][E_REQ_VC[4:2]])
          begin
            VC_E_0_RESERVED = 0;
            VC_E_1_RESERVED = 0;
            VC_E_2_RESERVED = 0;
            VC_E_3_RESERVED = 0;

        case (E_REQ_VC[1:0])
          2'b00:VC_E_0_RESERVED = 1;
          2'b01:VC_E_1_RESERVED = 1;
          2'b10:VC_E_2_RESERVED = 1;
          2'b11:VC_E_3_RESERVED = 1; 
          
        endcase
      end
      else
        begin
            VC_E_0_RESERVED = 0;
            VC_E_1_RESERVED = 0;
            VC_E_2_RESERVED = 0;
            VC_E_3_RESERVED = 0;
        end
      end
    else
      begin
  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
      end
  end
  N:
  begin
    next_state = S;
    if(N_valid)
      begin
        ANS_N_VC = VC_MATRIX[N_REQ_VC[1:0]][N_REQ_VC[4:2]];
        if(VC_MATRIX[N_REQ_VC[1:0]][N_REQ_VC[4:2]])
          begin
            VC_N_0_RESERVED = 0;
            VC_N_1_RESERVED = 0;
            VC_N_2_RESERVED = 0;
            VC_N_3_RESERVED = 0;

        case (N_REQ_VC[1:0])
          2'b00:VC_N_0_RESERVED = 1;
          2'b01:VC_N_1_RESERVED = 1;
          2'b10:VC_N_2_RESERVED = 1;
          2'b11:VC_N_3_RESERVED = 1; 
          
        endcase
      end
      else
        begin
            VC_N_0_RESERVED = 0;
            VC_N_1_RESERVED = 0;
            VC_N_2_RESERVED = 0;
            VC_N_3_RESERVED = 0;
        end
      end
    else
      begin
  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
      end
  end
  S:
  begin
    next_state = PE;
    if(S_valid)
      begin
        ANS_S_VC = VC_MATRIX[S_REQ_VC[1:0]][S_REQ_VC[4:2]];
        if(VC_MATRIX[S_REQ_VC[1:0]][S_REQ_VC[4:2]])
          begin
            VC_S_0_RESERVED = 0;
            VC_S_1_RESERVED = 0;
            VC_S_2_RESERVED = 0;
            VC_S_3_RESERVED = 0;

        case (S_REQ_VC[1:0])
          2'b00:VC_S_0_RESERVED = 1;
          2'b01:VC_S_1_RESERVED = 1;
          2'b10:VC_S_2_RESERVED = 1;
          2'b11:VC_S_3_RESERVED = 1; 
          
        endcase
      end
      else
        begin
            VC_S_0_RESERVED = 0;
            VC_S_1_RESERVED = 0;
            VC_S_2_RESERVED = 0;
            VC_S_3_RESERVED = 0;
        end
      end
    else
      begin
  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
      end
  end
  PE:
  begin
    next_state = W;
    if(PE_valid)
      begin
        ANS_PE_VC = VC_MATRIX[PE_REQ_VC[1:0]][PE_REQ_VC[4:2]];
        if(VC_MATRIX[PE_REQ_VC[1:0]][PE_REQ_VC[4:2]])
          begin
            VC_PE_0_RESERVED = 0;
            VC_PE_1_RESERVED = 0;
            VC_PE_2_RESERVED = 0;
            VC_PE_3_RESERVED = 0;

        case (PE_REQ_VC[1:0])
          2'b00:VC_PE_0_RESERVED = 1;
          2'b01:VC_PE_1_RESERVED = 1;
          2'b10:VC_PE_2_RESERVED = 1;
          2'b11:VC_PE_3_RESERVED = 1; 
          
        endcase
      end
      else
        begin
            VC_PE_0_RESERVED = 0;
            VC_PE_1_RESERVED = 0;
            VC_PE_2_RESERVED = 0;
            VC_PE_3_RESERVED = 0;
        end
      end
    else
      begin
  ANS_W_VC = 0;
  ANS_E_VC = 0;
  ANS_N_VC = 0;
  ANS_S_VC = 0;
  ANS_PE_VC = 0;
      end
  end
    
  endcase
  
end



endmodule
