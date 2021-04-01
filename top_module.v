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


module top_module #(parameter N = 16,
                    parameter lgN =4
                    )(input1_i,
                      input2_i,
                      mode,
                      func,
                      result_o_hybrid
                     );

   input  [N-1:0]   	 input1_i;
   input  [N-1:0] 	     input2_i;
   input 		         mode;
   input  [2:0]		     func;
   output  [2*N-1:0] 	 result_o_hybrid;
   wire [2*N-1:0] 	     result_o;

   wire [lgN-2:0] 	    ka_msb;
   wire [lgN-2:0] 	    kb_msb;

   wire [lgN-1:0] 	    ka;
   wire [lgN-1:0] 	    kb;
   wire [lgN-2:0] 	    ka_lsb;
   wire [lgN-2:0] 	    kb_lsb;

   wire [N-1:0]         fraction_a;
   wire [N-1:0]         fraction_b;

   wire [N-1:0]     	fraction_b_add_io;
   wire [N-1:0]     	cofficient_add_io;



   wire [N-1:0]     	fraction_a_inverted;
   wire [N-1:0]         fraction_b_inverted;


   wire [N-1:0]     	fraction_a1;
   wire [N-1:0]         fraction_b1;

   wire [N-1:0]     	fraction_a_temp;
   wire [N-1:0]         fraction_b_temp;

   wire [N/2-1:0]     	fraction_a_lsb;
   wire [N/2-1:0]       fraction_b_lsb;

   wire [lgN:0]     	log_int;
   wire [lgN+1:0]       log_int_div;


   wire [lgN:0]     	log_int_m;
   wire [N-1:0] 	    correction_mul_div;
   wire                 gtFF;


   wire [N/2 -1:0]       	adder1_i1;
   wire [N/2 -1:0]       	adder2_i1;
   wire [N/2 -1 :0]       adder3_i1;
   wire [N/2 -1 :0]        adder4_i1;


   wire [N/2 -1:0]       	adder1_i2;
   wire [N/2 -1:0]       	adder2_i2;
   wire [N/2 -1 :0]       	adder3_i2;
   wire [N/2 -1 :0]         adder4_i2;


   wire [8:0] 	      adder_result1;
   wire [8:0] 	      adder_result2;
   wire [8:0] 	      adder_result3;
   wire [8:0] 	      adder_result4;
   wire [lgN+1:0]     log_int_8_bit_msb;
   wire [lgN+1:0]     log_int_8_bit_lsb;



   wire      cout_adder3_last_bit;
   wire      c_o_add_msb;
   wire      c_o_add_lsb;
   wire      adder1_cin;

   wire  	 adder1_cout;
   wire      adder2_cout;
   wire      adder3_cout;

   wire [N-1:0] temp_result;




    lod #(.N(N), .lgN(lgN)) inst_loda_upper_half(.mode(mode), .a(input1_i), .pos(ka), .pos_lower(ka_lsb));
    lod #(.N(N), .lgN(lgN)) inst_loda_lower_half(.mode(mode), .a(input2_i), .pos(kb), .pos_lower(kb_lsb));



    set_frac_16_8 #(.N(N), .lgN(lgN)) inst_shift_frac_a (.mode(mode), .a(input1_i), .lod_pos_upper_half(ka), .lod_pos_lower_half(ka_lsb),  .out(fraction_a));
    set_frac_16_8 #(.N(N), .lgN(lgN)) inst_shift_frac_b (.mode(mode), .a(input2_i), .lod_pos_upper_half(kb), .lod_pos_lower_half(kb_lsb),  .out(fraction_b));

    select_ec_16_8_mul_div inst_cofficient(.func(func), .mode(mode),  .frac_a(fraction_a[N-2:N-4]), .frac_b(fraction_b[N-2:N-4]), .frac_a_lsb(fraction_a[N/2-2 : N/2 -4]), .frac_b_lsb(fraction_b[N/2-2 : N/2 -4]),
                                                                                                       .error_coeff(correction_mul_div));



    cin_bit_select      inst_cin_bit_adder2(.mode(mode), .cin_i1(adder_result1[8]), .cin_i2(1'b0),  .cin_o(adder1_cout));             // adder2_cin
    cin_bit_select      inst_cin_bit_adder3(.mode(mode), .cin_i1(adder_result2[8]), .cin_i2(adder_result1[8]),  .cin_o(adder2_cout)); // adder3_cin
    cin_bit_select      inst_cin_bit_adder4(.mode(mode), .cin_i1(adder_result3[8]), .cin_i2(adder_result2[8]),  .cin_o(adder3_cout)); // adder4_cin


    add_8_bit add_8_inst_1 (.a(fraction_b[N/2 -1: 0]),    .b(correction_mul_div [N/2 -1: 0]), .cin(1'b0) ,                .result(adder_result1));
    add_8_bit add_8_inst_2 (.a(fraction_b[N -1: N/2]),    .b({correction_mul_div [N-1:N/2]}), .cin(adder1_cout) ,         .result(adder_result2));

    twos_complement_16#(.N(N)) inst_adder_result1_lower_half   (.mode(mode), .mode_func(func[2]), .func(func[1:0]),  .in({adder_result2[N/2 -1: 0], adder_result1[N/2 -1: 0]}),     .out(temp_result));

    add_8_bit add_8_inst_3 (.a(fraction_a[N/2 -1: 0]),    .b(temp_result[N/2 -1: 0]),              .cin(adder2_cout) ,         .result(adder_result3));
    add_8_bit add_8_inst_4 (.a(fraction_a[N -1: N/2]),    .b(temp_result[N -1: N/2]),              .cin(adder3_cout) ,         .result(adder_result4));


    //add the integer part
    add_4_bit #(.N(lgN)) add_4_inst_msb  (.mode(mode),   .mode_func(func[2]),  .func(func[1]),     .a(ka),      .b(kb),     .c(adder_result4[7]) , .result(log_int_8_bit_msb));
    add_4_bit #(.N(lgN-1)) add_4_inst_lsb (.mode(mode), .mode_func(func[2]),  .func(func[0]),   .a(ka_lsb),  .b(kb_lsb), .c(adder_result3[7]), .result(log_int_8_bit_lsb));


    shifter_out_16_mul_div#(.N(N), .lgN(lgN)) div_mul
                                    (
                                    .mode(mode),
							                      .mode_func(func[2]),
				                            .func(func[1:0]),
                     			          .a({adder_result4[7:0], adder_result3[7:0]}),
                                    .shifter_upper_half(log_int_8_bit_msb),
							                      .shifter_lower_half(log_int_8_bit_lsb),
                                    .out(result_o_hybrid)
                                    );


endmodule
