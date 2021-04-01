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



module shifter_out_16_mul_div #(parameter N =16,
                             parameter lgN =4
                    )(mode,
		              mode_func,
                      func,
                      a,
                      shifter_upper_half,
		              shifter_lower_half,
                      out
                     );

    input		              mode;
    input                     mode_func;
    input       [1:0]         func;
    input       [N-1:0]       a;
    input       [lgN+1:0]     shifter_upper_half;
    input       [lgN:0]     shifter_lower_half;
    output reg  [2*N-1:0]     out;

    reg         [(2*N -1)+ N:0] shift_reg;
    reg         [(2*N -1)+ N:0] shift_reg_temp;
    wire        [lgN+1:0]     shift_num_upper;
    wire        [lgN+1:0]     shift_num_lower;
    wire                     append_upper;
    wire                     append_lower;

    assign append_upper       =  1'b1 ;
    assign append_lower       =  1'b1 ;

   always@(*)
        begin
        if (mode == 0) begin
              shift_reg_temp  = {{(2*N -1){1'b0}}, append_upper, a[N-2:0] };
              shift_reg       = shift_reg_temp << shifter_upper_half;
              out            = shift_reg[46 -:N*2];

	end

	else if (mode == 1) begin
               shift_reg_temp[47:24]  = {{(N-1){1'b0}}, append_upper, a[N -2 :N/2]};
               shift_reg_temp[23:0]  = {{(N-1){1'b0}},  append_lower, a[N/2 -2  :0]};
               shift_reg[47:24]      = shift_reg_temp[47:24] << shifter_upper_half;
               shift_reg[23:0]       = shift_reg_temp[23:0] << shifter_lower_half;
               out[2*N-1: N]        = shift_reg[46 -:N];
               out[N-1: 0]          = shift_reg[22 -:N];

	       end
        end
endmodule
