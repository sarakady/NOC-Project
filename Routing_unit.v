/* adresses for downsttram routers 
we have 5 outs so we need 3 bits
000 =>> west
001 =>>east
010 =>>north
011 =>>south 
100 =>> pe

routers in mesh network 
    0000 >> 0001 >> 0010
    ^^^    ^^^    ^^^
    0011 >> 0100 >> 0101
    ^^^    ^^^    ^^^
    0110 >> 0111 >> 1000
*/
module Routing_unit#(parameter current_router = 4'b0100)(
  input [3:0]      W_destination_address, 
  input [3:0]      E_destination_address,
  input [3:0]      N_destination_address,
  input [3:0]      S_destination_address,
  input [3:0]      PE_destination_address,
  input            CLK,RST,
  input            W_start_routing,
  output reg       W_routing_done,
  output reg [2:0]       W_next_hop,
  input            E_start_routing,
  output reg       E_routing_done,
  output reg [2:0]       E_next_hop,
  input            N_start_routing,
  output reg       N_routing_done,
  output reg [2:0]       N_next_hop,
  input            S_start_routing,
  output reg       S_routing_done,
  output reg [2:0]       S_next_hop,
  input            PE_start_routing,
  output reg       PE_routing_done,
  output reg [2:0]       PE_next_hop
);
/*
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      _routing_done <= 0;
      _next_hop <= 3'b111;
    end
    else
      begin
        if(_start_routing)
          begin
            routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(destination_address)
                4'b0000:next_hop<= 3'b100 ;
                4'b0001:next_hop<= 3'b001 ;
                4'b0010:next_hop<= 3'b001 ;
                4'b0011:next_hop<= 3'b011 ;
                4'b0100:next_hop<= 3'b001 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b011 ;
                4'b0111:next_hop<= 3'b001 ;
                4'b1000:next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b100 ;
                4'b0010:next_hop<= 3'b001 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b011 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b011 ;
                4'b1000:next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b000 ;
                4'b0010:next_hop<= 3'b100 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b000 ;
                4'b0101:next_hop<= 3'b011 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b000 ;
                4'b1000:next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b010 ;
                4'b0001:next_hop<= 3'b001 ;
                4'b0010:next_hop<= 3'b001 ;
                4'b0011:next_hop<= 3'b100 ;
                4'b0100:next_hop<= 3'b001 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b011 ;
                4'b0111:next_hop<= 3'b001 ;
                4'b1000:next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b010 ;
                4'b0010:next_hop<= 3'b010 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b100 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b011 ;
                4'b1000:next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b000 ;
                4'b0010:next_hop<= 3'b010 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b000 ;
                4'b0101:next_hop<= 3'b100 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b000 ;
                4'b1000:next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b010 ;
                4'b0001:next_hop<= 3'b001 ;
                4'b0010:next_hop<= 3'b001 ;
                4'b0011:next_hop<= 3'b010 ;
                4'b0100:next_hop<= 3'b001 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b100 ;
                4'b0111:next_hop<= 3'b001 ;
                4'b1000:next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b010 ;
                4'b0010:next_hop<= 3'b001 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b010 ;
                4'b0101:next_hop<= 3'b001 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b100 ;
                4'b1000:next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(destination_address)
                4'b0000:next_hop<= 3'b000 ;
                4'b0001:next_hop<= 3'b000 ;
                4'b0010:next_hop<= 3'b010 ;
                4'b0011:next_hop<= 3'b000 ;
                4'b0100:next_hop<= 3'b000 ;
                4'b0101:next_hop<= 3'b010 ;
                4'b0110:next_hop<= 3'b000 ;
                4'b0111:next_hop<= 3'b000 ;
                4'b1000:next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        routing_done <= 0;
        
      end 
        
end
*/
/*******************************WEST ****************************/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      W_routing_done <= 0;
      W_next_hop <= 3'b111;
    end
    else
      begin
        if(W_start_routing)
          begin
            W_routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b100 ;
                4'b0001:W_next_hop<= 3'b001 ;
                4'b0010:W_next_hop<= 3'b001 ;
                4'b0011:W_next_hop<= 3'b011 ;
                4'b0100:W_next_hop<= 3'b001 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b011 ;
                4'b0111:W_next_hop<= 3'b001 ;
                4'b1000:W_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b100 ;
                4'b0010:W_next_hop<= 3'b001 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b011 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b011 ;
                4'b1000:W_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b000 ;
                4'b0010:W_next_hop<= 3'b100 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b000 ;
                4'b0101:W_next_hop<= 3'b011 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b000 ;
                4'b1000:W_next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b010 ;
                4'b0001:W_next_hop<= 3'b001 ;
                4'b0010:W_next_hop<= 3'b001 ;
                4'b0011:W_next_hop<= 3'b100 ;
                4'b0100:W_next_hop<= 3'b001 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b011 ;
                4'b0111:W_next_hop<= 3'b001 ;
                4'b1000:W_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b010 ;
                4'b0010:W_next_hop<= 3'b010 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b100 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b011 ;
                4'b1000:W_next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b000 ;
                4'b0010:W_next_hop<= 3'b010 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b000 ;
                4'b0101:W_next_hop<= 3'b100 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b000 ;
                4'b1000:W_next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b010 ;
                4'b0001:W_next_hop<= 3'b001 ;
                4'b0010:W_next_hop<= 3'b001 ;
                4'b0011:W_next_hop<= 3'b010 ;
                4'b0100:W_next_hop<= 3'b001 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b100 ;
                4'b0111:W_next_hop<= 3'b001 ;
                4'b1000:W_next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b010 ;
                4'b0010:W_next_hop<= 3'b001 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b010 ;
                4'b0101:W_next_hop<= 3'b001 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b100 ;
                4'b1000:W_next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(W_destination_address)
                4'b0000:W_next_hop<= 3'b000 ;
                4'b0001:W_next_hop<= 3'b000 ;
                4'b0010:W_next_hop<= 3'b010 ;
                4'b0011:W_next_hop<= 3'b000 ;
                4'b0100:W_next_hop<= 3'b000 ;
                4'b0101:W_next_hop<= 3'b010 ;
                4'b0110:W_next_hop<= 3'b000 ;
                4'b0111:W_next_hop<= 3'b000 ;
                4'b1000:W_next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        W_routing_done <= 0;
        
      end 
        
end
/*******************************EAST*************************/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      E_routing_done <= 0;
      E_next_hop <= 3'b111;
    end
    else
      begin
        if(E_start_routing)
          begin
            E_routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b100 ;
                4'b0001:E_next_hop<= 3'b001 ;
                4'b0010:E_next_hop<= 3'b001 ;
                4'b0011:E_next_hop<= 3'b011 ;
                4'b0100:E_next_hop<= 3'b001 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b011 ;
                4'b0111:E_next_hop<= 3'b001 ;
                4'b1000:E_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b100 ;
                4'b0010:E_next_hop<= 3'b001 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b011 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b011 ;
                4'b1000:E_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b000 ;
                4'b0010:E_next_hop<= 3'b100 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b000 ;
                4'b0101:E_next_hop<= 3'b011 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b000 ;
                4'b1000:E_next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b010 ;
                4'b0001:E_next_hop<= 3'b001 ;           
                4'b0010:E_next_hop<= 3'b001 ;
                4'b0011:E_next_hop<= 3'b100 ;
                4'b0100:E_next_hop<= 3'b001 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b011 ;
                4'b0111:E_next_hop<= 3'b001 ;
                4'b1000:E_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b010 ;
                4'b0010:E_next_hop<= 3'b010 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b100 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b011 ;
                4'b1000:E_next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b000 ;
                4'b0010:E_next_hop<= 3'b010 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b000 ;
                4'b0101:E_next_hop<= 3'b100 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b000 ;
                4'b1000:E_next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b010 ;
                4'b0001:E_next_hop<= 3'b001 ;
                4'b0010:E_next_hop<= 3'b001 ;
                4'b0011:E_next_hop<= 3'b010 ;
                4'b0100:E_next_hop<= 3'b001 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b100 ;
                4'b0111:E_next_hop<= 3'b001 ;
                4'b1000:E_next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b010 ;
                4'b0010:E_next_hop<= 3'b001 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b010 ;
                4'b0101:E_next_hop<= 3'b001 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b100 ;
                4'b1000:E_next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(E_destination_address)
                4'b0000:E_next_hop<= 3'b000 ;
                4'b0001:E_next_hop<= 3'b000 ;
                4'b0010:E_next_hop<= 3'b010 ;
                4'b0011:E_next_hop<= 3'b000 ;
                4'b0100:E_next_hop<= 3'b000 ;
                4'b0101:E_next_hop<= 3'b010 ;
                4'b0110:E_next_hop<= 3'b000 ;
                4'b0111:E_next_hop<= 3'b000 ;
                4'b1000:E_next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        E_routing_done <= 0;
        
      end 
        
end
/**********************************NORTH***********************************/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      N_routing_done <= 0;
      N_next_hop <= 3'b111;
    end
    else
      begin
        if(N_start_routing)
          begin
            N_routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b100 ;
                4'b0001:N_next_hop<= 3'b001 ;
                4'b0010:N_next_hop<= 3'b001 ;
                4'b0011:N_next_hop<= 3'b011 ;
                4'b0100:N_next_hop<= 3'b001 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b011 ;
                4'b0111:N_next_hop<= 3'b001 ;
                4'b1000:N_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b100 ;
                4'b0010:N_next_hop<= 3'b001 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b011 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b011 ;
                4'b1000:N_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b000 ;
                4'b0010:N_next_hop<= 3'b100 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b000 ;
                4'b0101:N_next_hop<= 3'b011 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b000 ;
                4'b1000:N_next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b010 ;
                4'b0001:N_next_hop<= 3'b001 ;
                4'b0010:N_next_hop<= 3'b001 ;
                4'b0011:N_next_hop<= 3'b100 ;
                4'b0100:N_next_hop<= 3'b001 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b011 ;
                4'b0111:N_next_hop<= 3'b001 ;
                4'b1000:N_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b010 ;
                4'b0010:N_next_hop<= 3'b010 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b100 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b011 ;
                4'b1000:N_next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b000 ;
                4'b0010:N_next_hop<= 3'b010 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b000 ;
                4'b0101:N_next_hop<= 3'b100 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b000 ;
                4'b1000:N_next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b010 ;
                4'b0001:N_next_hop<= 3'b001 ;
                4'b0010:N_next_hop<= 3'b001 ;
                4'b0011:N_next_hop<= 3'b010 ;
                4'b0100:N_next_hop<= 3'b001 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b100 ;
                4'b0111:N_next_hop<= 3'b001 ;
                4'b1000:N_next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b010 ;
                4'b0010:N_next_hop<= 3'b001 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b010 ;
                4'b0101:N_next_hop<= 3'b001 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b100 ;
                4'b1000:N_next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(N_destination_address)
                4'b0000:N_next_hop<= 3'b000 ;
                4'b0001:N_next_hop<= 3'b000 ;
                4'b0010:N_next_hop<= 3'b010 ;
                4'b0011:N_next_hop<= 3'b000 ;
                4'b0100:N_next_hop<= 3'b000 ;
                4'b0101:N_next_hop<= 3'b010 ;
                4'b0110:N_next_hop<= 3'b000 ;
                4'b0111:N_next_hop<= 3'b000 ;
                4'b1000:N_next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        N_routing_done <= 0;
        
      end 
        
end
/************************************SOUTH*******/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      S_routing_done <= 0;
      S_next_hop <= 3'b111;
    end
    else
      begin
        if(S_start_routing)
          begin
            S_routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b100 ;
                4'b0001:S_next_hop<= 3'b001 ;
                4'b0010:S_next_hop<= 3'b001 ;
                4'b0011:S_next_hop<= 3'b011 ;
                4'b0100:S_next_hop<= 3'b001 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b011 ;
                4'b0111:S_next_hop<= 3'b001 ;
                4'b1000:S_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b100 ;
                4'b0010:S_next_hop<= 3'b001 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b011 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b011 ;
                4'b1000:S_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b000 ;
                4'b0010:S_next_hop<= 3'b100 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b000 ;
                4'b0101:S_next_hop<= 3'b011 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b000 ;
                4'b1000:S_next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b010 ;
                4'b0001:S_next_hop<= 3'b001 ;
                4'b0010:S_next_hop<= 3'b001 ;
                4'b0011:S_next_hop<= 3'b100 ;
                4'b0100:S_next_hop<= 3'b001 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b011 ;
                4'b0111:S_next_hop<= 3'b001 ;
                4'b1000:S_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b010 ;
                4'b0010:S_next_hop<= 3'b010 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b100 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b011 ;
                4'b1000:S_next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b000 ;
                4'b0010:S_next_hop<= 3'b010 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b000 ;
                4'b0101:S_next_hop<= 3'b100 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b000 ;
                4'b1000:S_next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b010 ;
                4'b0001:S_next_hop<= 3'b001 ;
                4'b0010:S_next_hop<= 3'b001 ;
                4'b0011:S_next_hop<= 3'b010 ;
                4'b0100:S_next_hop<= 3'b001 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b100 ;
                4'b0111:S_next_hop<= 3'b001 ;
                4'b1000:S_next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b010 ;
                4'b0010:S_next_hop<= 3'b001 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b010 ;
                4'b0101:S_next_hop<= 3'b001 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b100 ;
                4'b1000:S_next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(S_destination_address)
                4'b0000:S_next_hop<= 3'b000 ;
                4'b0001:S_next_hop<= 3'b000 ;
                4'b0010:S_next_hop<= 3'b010 ;
                4'b0011:S_next_hop<= 3'b000 ;
                4'b0100:S_next_hop<= 3'b000 ;
                4'b0101:S_next_hop<= 3'b010 ;
                4'b0110:S_next_hop<= 3'b000 ;
                4'b0111:S_next_hop<= 3'b000 ;
                4'b1000:S_next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        S_routing_done <= 0;
        
      end 
        
end
/*********************************************************/
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      PE_routing_done <= 0;
      PE_next_hop <= 3'b111;
    end
    else
      begin
        if(PE_start_routing)
          begin
            PE_routing_done <= 1;
            case (current_router)
              4'b0000:
              begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b100 ;
                4'b0001:PE_next_hop<= 3'b001 ;
                4'b0010:PE_next_hop<= 3'b001 ;
                4'b0011:PE_next_hop<= 3'b011 ;
                4'b0100:PE_next_hop<= 3'b001 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b011 ;
                4'b0111:PE_next_hop<= 3'b001 ;
                4'b1000:PE_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0001:
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b100 ;
                4'b0010:PE_next_hop<= 3'b001 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b011 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b011 ;
                4'b1000:PE_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0010://22
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b000 ;
                4'b0010:PE_next_hop<= 3'b100 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b000 ;
                4'b0101:PE_next_hop<= 3'b011 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b000 ;
                4'b1000:PE_next_hop<= 3'b011 ;
              endcase 
                 end
                4'b0011:
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b010 ;
                4'b0001:PE_next_hop<= 3'b001 ;
                4'b0010:PE_next_hop<= 3'b001 ;
                4'b0011:PE_next_hop<= 3'b100 ;
                4'b0100:PE_next_hop<= 3'b001 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b011 ;
                4'b0111:PE_next_hop<= 3'b001 ;
                4'b1000:PE_next_hop<= 3'b001 ;
              endcase 
                end
                4'b0100://11
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b010 ;
                4'b0010:PE_next_hop<= 3'b010 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b100 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b011 ;
                4'b1000:PE_next_hop<= 3'b011 ;
              endcase 
                    end
                4'b0101://21
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b000 ;
                4'b0010:PE_next_hop<= 3'b010 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b000 ;
                4'b0101:PE_next_hop<= 3'b100 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b000 ;
                4'b1000:PE_next_hop<= 3'b011 ;
              endcase 
                  end
                4'b0110://00
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b010 ;
                4'b0001:PE_next_hop<= 3'b001 ;
                4'b0010:PE_next_hop<= 3'b001 ;
                4'b0011:PE_next_hop<= 3'b010 ;
                4'b0100:PE_next_hop<= 3'b001 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b100 ;
                4'b0111:PE_next_hop<= 3'b001 ;
                4'b1000:PE_next_hop<= 3'b001 ;
              endcase 
                  end
                4'b0111://10
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b010 ;
                4'b0010:PE_next_hop<= 3'b001 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b010 ;
                4'b0101:PE_next_hop<= 3'b001 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b100 ;
                4'b1000:PE_next_hop<= 3'b001 ;
              endcase 
 end
                4'b1000://20
                begin
              case(PE_destination_address)
                4'b0000:PE_next_hop<= 3'b000 ;
                4'b0001:PE_next_hop<= 3'b000 ;
                4'b0010:PE_next_hop<= 3'b010 ;
                4'b0011:PE_next_hop<= 3'b000 ;
                4'b0100:PE_next_hop<= 3'b000 ;
                4'b0101:PE_next_hop<= 3'b010 ;
                4'b0110:PE_next_hop<= 3'b000 ;
                4'b0111:PE_next_hop<= 3'b000 ;
                4'b1000:PE_next_hop<= 3'b100 ;
              endcase 
 end
              endcase
            end
            else
        PE_routing_done <= 0;
        
      end 
        
end




endmodule