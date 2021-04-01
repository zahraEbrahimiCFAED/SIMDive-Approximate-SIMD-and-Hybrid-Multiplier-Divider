-------------------------------------------------------------------------------------
--
-- Create Date: October 2020
-- Design Name: SIMDive Approximate SIMD and Hybrid Multiplier-Divider
-- Description: This general template of SIMDive Approximate SIMD and Hybrid Multiplier-Divider that can be reused for different bit-width
-- Revision: 1
-- Additional Comments:
--    For collaboration and queries regarding furthur optimizations please email the corresponding author: Zahra Ebrahimi (zahra.ebrahimi_mamaghani@tu-dresden.de)
--    In case of usage please cite:
--    Zahra Ebrahimi, Salim Ullah, and Akash Kumar. "SIMDive: Approximate SIMD Soft Multiplier-Divider for FPGAs with Tunable Accuracy." 2020 30th Great Lakes Symposium on VLSI (GLSVLSI) Conference.
--
-------------------------------------------------------------------------------------

module lod #(parameter N = 16,
             parameter lgN = 4
            )(mode,
              a,
              pos,
              pos_lower
              );


   `include "LOD_function.v"
   input                    mode;
   input      [N-1:0]       a;
   output reg [lgN-1:0]     pos;
   output reg [lgN-2:0]     pos_lower;
   genvar 	  i;


   generate

      if(lgN==4)
       begin : lgN4

            reg  [7: 0] or_op;
            reg  [1:0]  seg_location;
            reg         seg_location_or_op_lower_temp;
            reg         seg_location_or_op_upper_temp;
            reg  [1:0]  seg_location_lower;
            reg  [1:0]  seg_location_upper;
            reg  seg_lower_temp;

            reg  [2:0]  seg_location_lower_case;
            reg  [2:0]  seg_location_upper_case;


//            always @* begin
//                pos_lower = lod_pos_8_bit(a[7:0]);
//                if (mode == 1'b0) begin
//                   pos =   lod_pos_8_bit(a[15:8]) << 3;
//                end
//                else  begin
//                   pos =   lod_pos_8_bit(a[15:8]);
//                end
//            end
//            for(i=0;i<4;i=i+1)
//                begin :segments
//                    always @* begin
//                          or_op[i] = a[(4*i)+ 3] | a[(4*i)+2] | a[(4*i)+1] | a[(4*i)+0];
//                    end
//            end

            reg [1:0] seg_location_lower_lower_4_bit;
            reg [1:0] seg_location_lower_upper_4_bit;
            reg [1:0] seg_location_upper_lower_4_bit;
            reg [1:0] seg_location_upper_upper_4_bit;


            always @* begin

           seg_location_lower_lower_4_bit = lod_pos_4_bit(a[3:0]);
           seg_location_lower_upper_4_bit = lod_pos_4_bit(a[7:4]);

           seg_location_upper_lower_4_bit = lod_pos_4_bit(a[11:8]);
           seg_location_upper_upper_4_bit = lod_pos_4_bit(a[15:12]);
           pos_lower = (seg_location_lower_upper_4_bit != 2'b00)? { 1'b1, seg_location_lower_upper_4_bit} : seg_location_lower_lower_4_bit;

//            seg_location = lod_pos(or_op);
//            seg_location_or_op_lower_temp = or_op[3] | or_op[2];
//            seg_location_lower = (seg_location_or_op_lower_temp) ? {1'b1, or_op[3]} : {1'b0, or_op[1]};
//            pos_lower =  {seg_location_lower, a[(seg_location_lower << 1) + 1]};
//            seg_location_or_op_upper_temp = or_op[7] | or_op[6];
//            seg_location_upper = (seg_location_or_op_upper_temp) ? {1'b1, or_op[7]} : {1'b0, or_op[5]};
//            if (mode == 1'b0) begin
//               pos =  {seg_location_upper, a[(seg_location_upper << 1) + 8]} << 3;
//            end
//            else  begin
//               pos =  {seg_location_upper, a[(seg_location_upper << 1) + 1]};
//            end

            if (mode == 1'b0) begin
                pos = (seg_location_upper_upper_4_bit != 2'b00) ? ({ 1'b1, seg_location_upper_upper_4_bit} << 3) : (seg_location_upper_lower_4_bit << 3);
            end
            else  begin
               pos = (seg_location_upper_upper_4_bit != 2'b00)? { 1'b1, seg_location_upper_upper_4_bit} : seg_location_upper_lower_4_bit;
            end
        end

	   end


else if(lgN==3)
	begin : lgN3



            reg [1:0]   or_op;
            reg         seg_location;
            reg         operand_LO_segment_or_op_result;
            reg [3:0]   temp_var;




            for(i=0;i<lgN-1;i=i+1)
                begin :segments
                    always @* begin
                        or_op[i] = a[(4*i)+ 3] | a[(4*i)+2] | a[(4*i)+1] | a[(4*i)+0];
                end
            end


            always @* begin
                    seg_location =  or_op[1];
                    temp_var = a[(seg_location)*4+:4];
                    operand_LO_segment_or_op_result   = temp_var[3] | temp_var[2];
                    pos = {seg_location,  (operand_LO_segment_or_op_result) ?{1'b1, temp_var[3] } : {1'b0 , temp_var[1]} };
             end



	end


   endgenerate
endmodule
