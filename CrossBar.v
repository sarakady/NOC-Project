/* this module represent CrossBar module with active low reset which responsible for switch input flit to out ports 
with enable signal and switch address from switching unit and input data from input block 
we define addresses 

 */
module CrossBar #(parameter Flit_size = 16) (
input   wire                     CLK,               
input   wire                     RST,
input                            Cross_EN,
input          [4:0]             In_Out_Sel,
input          [Flit_size-1:0]     Cross_input_west,
input          [Flit_size-1:0]     Cross_input_east,
input          [Flit_size-1:0]     Cross_input_north,
input          [Flit_size-1:0]     Cross_input_south,
input          [Flit_size-1:0]     Cross_input_PE,
output  reg    [Flit_size-1:0]     West_out_data,
output  reg    [Flit_size-1:0]     East_out_data,
output  reg    [Flit_size-1:0]     North_out_data,
output  reg    [Flit_size-1:0]     South_out_data,
output  reg    [Flit_size-1:0]     PE_out_data,
output  reg                      West_valid,
output  reg                      East_valid,
output  reg                      North_valid,
output  reg                      South_valid,
output  reg                      PE_valid,
output  reg                      W_SW_DONE,
output  reg                      E_SW_DONE,
output  reg                      N_SW_DONE,
output  reg                      S_SW_DONE,
output  reg                      PE_SW_DONE


);


  ///////////////////////////////////
  always@(posedge CLK or negedge RST)
  begin
    if (!RST)
      begin
        West_out_data <= 'd0 ;
        East_out_data<= 'd0 ;
        North_out_data<= 'd0 ;
        South_out_data<= 'd0 ;
        PE_out_data <= 'd0 ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 0 ;
        E_SW_DONE <= 0 ;
        N_SW_DONE<= 0 ;
        S_SW_DONE <=0;
        PE_SW_DONE<= 0;

      end
    else
      begin 
        if (Cross_EN)
          begin
            W_SW_DONE <= 0 ;
        E_SW_DONE <= 0 ;
        N_SW_DONE<= 0 ;
        S_SW_DONE <=0;
        PE_SW_DONE<= 0;
        case (In_Out_Sel)
      5'b00000:  // Case 0
      begin
        West_out_data <= Cross_input_west ;
        West_valid<= 'd1 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 1 ;
        
      end
      5'b00001:  // Case 1
      begin
        East_out_data <= Cross_input_west ;
        West_valid<= 'd0 ;
        East_valid<= 'd1 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 1 ;
        
      end
      5'b00010:  // Case 2
      begin
        North_out_data <= Cross_input_west ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd1 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 1 ;
        
      end
      5'b00011:  // Case 3
      begin
        South_out_data <= Cross_input_west ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd1 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 1 ;
        
      end
      5'b00100:  // Case 4
      begin
        PE_out_data <= Cross_input_west ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd1 ;
        W_SW_DONE <= 1 ;
        
      end
      5'b00101:  // Case 5
      begin
        West_out_data <= Cross_input_east ;
        West_valid<= 'd1 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        E_SW_DONE <= 1 ;
        
      end
      5'b00110:  // Case 6
      begin
        East_out_data <= Cross_input_east ;
        West_valid<= 'd0 ;
        East_valid<= 'd1 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        E_SW_DONE <= 1 ;
        
      end
      5'b00111:  // Case 7
      begin
        North_out_data <= Cross_input_east ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd1 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        E_SW_DONE <= 1 ;
        
      end
      5'b01000:  // Case 8
      begin
        South_out_data <= Cross_input_east ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd1 ;
        PE_valid   <= 'd0 ;
        E_SW_DONE <= 1 ;
        
      end
      5'b01001:  // Case 9
      begin
        PE_out_data <= Cross_input_east ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd1 ;
        E_SW_DONE <= 1 ;
        
      end
      5'b01010:  // Case 10
      begin
        West_out_data <= Cross_input_north ;
        West_valid<= 'd1 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        N_SW_DONE <= 1 ;
        
      end
      5'b01011:  // Case 11
      begin
        East_out_data <= Cross_input_north ;
        West_valid<= 'd0 ;
        East_valid<= 'd1 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        N_SW_DONE <= 1 ;
        
      end
      5'b01100: // Case 12
      begin
        North_out_data <= Cross_input_north ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd1 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        N_SW_DONE <= 1 ;
        
      end
      5'b01101:  // Case 13
      begin
        South_out_data <= Cross_input_north ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd1 ;
        PE_valid   <= 'd0 ;
        N_SW_DONE <= 1 ;
      end
      5'b01110:  // Case 14
      begin
        PE_out_data <= Cross_input_north ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd1 ;
        N_SW_DONE <= 1 ;
        
      end
      5'b01111:  // Case 15
      begin
        West_out_data <= Cross_input_south ;
        West_valid<= 'd1 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        S_SW_DONE <= 1 ;
      end
      5'b10000:  // Case 16
      begin
        East_out_data <= Cross_input_south ;
        West_valid<= 'd0 ;
        East_valid<= 'd1 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        S_SW_DONE <= 1 ;
      end
      5'b10001: // Case 17
      begin
        North_out_data <= Cross_input_south ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd1 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        S_SW_DONE <= 1 ;
      end
      5'b10010:  // Case 18
      begin
        South_out_data <= Cross_input_south ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd1 ;
        PE_valid   <= 'd0 ;
        S_SW_DONE <= 1 ;
      end
      5'b10011:  // Case 19
      begin
        PE_out_data <= Cross_input_south ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd1 ;
        S_SW_DONE <= 1 ;
      end
      5'b10100: // Case 20
      begin
        West_out_data <= Cross_input_PE ;
        West_valid<= 'd1 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        PE_SW_DONE <= 1 ;
      end
      5'b10101: // Case 21
      begin
        East_out_data <= Cross_input_PE ;
        West_valid<= 'd0 ;
        East_valid<= 'd1 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        PE_SW_DONE <= 1 ;
      end
      5'b10110:  // Case 22
      begin
        North_out_data <= Cross_input_PE ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd1 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        PE_SW_DONE <= 1 ;
      end
      5'b10111:// Case 23
       begin
        South_out_data <= Cross_input_PE ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd1 ;
        PE_valid   <= 'd0 ;
        PE_SW_DONE <= 1 ;
      end 
      default:   // Default case
      begin
        West_out_data <= 'd0 ;
        East_out_data<= 'd0 ;
        North_out_data<= 'd0 ;
        South_out_data<= 'd0 ;
        PE_out_data <= 'd0 ;
        West_valid<= 'd0 ;
        East_valid<= 'd0 ;
        North_valid<= 'd0 ;
        South_valid<= 'd0 ;
        PE_valid   <= 'd0 ;
        W_SW_DONE <= 0 ;
        E_SW_DONE <= 0 ;
        N_SW_DONE<= 0 ;
        S_SW_DONE <=0;
        PE_SW_DONE<= 0;
              end
      
    endcase
    
  end
      end
      
  end

  
  
  
  
endmodule