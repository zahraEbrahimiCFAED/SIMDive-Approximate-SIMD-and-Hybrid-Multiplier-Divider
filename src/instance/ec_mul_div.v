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


module select_ec_16_8_mul_div      (mode,
                                 func,
                                 frac_a,
                                 frac_b,
                                 frac_a_lsb,
                                 frac_b_lsb,
                                 error_coeff
                                );


    localparam ZERO   = 3'b000;   //0     = 0.000
    localparam ONE    = 3'b001;   //0.125 = 0.001
    localparam TWO    = 3'b010;   //0.250 = 0.010
    localparam THREE  = 3'b011;   //0.375 = 0.011
    localparam FOUR   = 3'b100;   //0.5   = 0.100
    localparam FIVE   = 3'b101;   //0.625 = 0.101
    localparam SIX    = 3'b110;   //0.750 = 0.110
    localparam SEVEN  = 3'b111;   //0.875 = 0.111


    localparam c00_m=16'b0000000000111101; localparam c01_m=16'b0000000100101101; localparam c02_m=16'b0000000111101000; localparam c03_m=16'b0000001001000000; localparam c04_m=16'b0000001011011010;
    localparam c05_m=16'b0000010001100000; localparam c06_m=16'b0000010011010010; localparam c07_m=16'b0000001001100111;

    localparam c11_m=16'b0000001110111010; localparam c12_m=16'b0000011000000010; localparam c13_m=16'b0000100100000100; localparam c14_m=16'b0000110000111000; localparam c15_m=16'b0000100000001100;
    localparam c16_m=16'b0000101000100100; localparam c17_m=16'b0000001111000000;

    localparam c22_m=16'b0000101010110100; localparam c23_m=16'b0000111111010000; localparam c24_m=16'b0001010000000000; localparam c25_m=16'b0000111000000000; localparam c26_m=16'b0000100100000000;
    localparam c27_m=16'b0000001100110011;

    localparam c33_m=16'b0001010000000000; localparam c34_m=16'b0001000010001000; localparam c35_m=16'b0000110000000000; localparam c36_m=16'b0000011100011000; localparam c37_m=16'b0000001010000000;

    localparam c44_m=16'b0000110100001100; localparam c45_m=16'b0000100100101000; localparam c46_m=16'b0000010100111010; localparam c47_m=16'b0000000110110011;

    localparam c55_m=16'b0000011011000000; localparam c56_m=16'b0000010000000000; localparam c57_m=16'b0000000110000000;

    localparam c66_m=16'b0000001010000010; localparam c67_m=16'b0000000011100000;

    localparam c77_m=16'b0000000000110001;




    localparam c00_d=16'b0000000000100001; localparam c01_d=16'b0000100111100011; localparam c02_d=16'b0001000001111110; localparam c03_d=16'b0001000101000111; localparam c04_d=16'b0001001000010010;
    localparam c05_d=16'b0001000000000000; localparam c06_d=16'b0000100111011000; localparam c07_d=16'b0000000100000000;



    localparam c10_d=16'b0000000010111011; localparam c11_d=16'b0000000100000001; localparam c12_d=16'b0000100011111001; localparam c13_d=16'b0000110001100111; localparam c14_d=16'b0000110101110101;
    localparam c15_d=16'b0000101111000101; localparam c16_d=16'b0000100000110101; localparam c17_d=16'b0000001100110110;




    localparam c20_d=16'b0000000111100001; localparam c21_d=16'b0000001010101010; localparam c22_d=16'b0000000101011011; localparam c23_d=16'b0000011001011111; localparam c24_d=16'b0000100011001100;
    localparam c25_d=16'b0000100001111100; localparam c26_d=16'b0000010110101000; localparam c27_d=16'b0000001011101000;




    localparam c30_d=16'b0000001100000011; localparam c31_d=16'b0000010011011110; localparam c32_d=16'b0000001111100000; localparam c33_d=16'b0000000110011001; localparam c34_d=16'b0000010001101110;
    localparam c35_d=16'b0000010111111001; localparam c36_d=16'b0000010010001010; localparam c37_d=16'b0000001000000011;


    localparam c40_d=16'b0000001001001111; localparam c41_d=16'b0000011111110101; localparam c42_d=16'b0000011111111011; localparam c43_d=16'b0000010000110010; localparam c44_d=16'b0000000110011110;
    localparam c45_d=16'b0000001010111111; localparam c46_d=16'b0000001101000100; localparam c47_d=16'b0000000101101011;




    localparam c50_d=16'b0000010000110001; localparam c51_d=16'b0000100111101001; localparam c52_d=16'b0000101111000001; localparam c53_d=16'b0000100111100011; localparam c54_d=16'b0000011000000101;
    localparam c55_d=16'b0000000110000111; localparam c56_d=16'b0000000110101100; localparam c57_d=16'b0000000100100101;



    localparam c60_d=16'b0000010100000110; localparam c61_d=16'b0000111000000000; localparam c62_d=16'b0000111000100001; localparam c63_d=16'b0000111100000000; localparam c64_d=16'b0000101111100110;
    localparam c65_d=16'b0000011000011001; localparam c66_d=16'b0000000101110011; localparam c67_d=16'b0000000001111010;



    localparam c70_d=16'b0000011001010000; localparam c71_d=16'b0000111100001101; localparam c72_d=16'b0001010010111010; localparam c73_d=16'b0001010001010101; localparam c74_d=16'b0001000100000000;
    localparam c75_d=16'b0000101101011010; localparam c76_d=16'b0000011011000100; localparam c77_d=16'b0000000101100011;



    input            mode;
    input      [2:0]  func;
    input      [2:0]  frac_a;
    input      [2:0]  frac_b;
    input      [2:0]  frac_a_lsb;
    input      [2:0]  frac_b_lsb;
    output reg [15:0] error_coeff;


    always@(*)
        begin
               if (mode == 0 && func[2] == 1'b0) begin
                    case({frac_a, frac_b})

                            {ZERO,ZERO}          :   error_coeff = c00_m;
                            {ZERO,ONE}           :   error_coeff = c01_m;
                            {ONE,ZERO}           :   error_coeff = c01_m;
                            {ZERO,TWO}           :   error_coeff = c02_m;
                            {TWO,ZERO}           :   error_coeff = c02_m;
                            {ZERO,THREE}         :   error_coeff = c03_m;
                            {THREE,ZERO}         :   error_coeff = c03_m;
                            {ZERO,FOUR}          :   error_coeff = c04_m;
                            {FOUR,ZERO}          :   error_coeff = c04_m;
                            {ZERO,FIVE}          :   error_coeff = c05_m;
                            {FIVE,ZERO}          :   error_coeff = c05_m;
                            {ZERO,SIX}           :   error_coeff = c06_m;
                            {SIX,ZERO}           :   error_coeff = c06_m;
                            {ZERO,SEVEN}         :   error_coeff = c07_m;
                            {SEVEN,ZERO}         :   error_coeff = c07_m;

                            {ONE,ONE}            :   error_coeff = c11_m;
                            {ONE,TWO}            :   error_coeff = c12_m;
                            {TWO,ONE}            :   error_coeff = c12_m;
                            {ONE,THREE}          :   error_coeff = c13_m;
                            {THREE,ONE}          :   error_coeff = c13_m;
                            {ONE,FOUR}           :   error_coeff = c14_m;
                            {FOUR,ONE}           :   error_coeff = c14_m;
                            {ONE,FIVE}           :   error_coeff = c15_m;
                            {FIVE,ONE}           :   error_coeff = c15_m;
                            {ONE,SIX}            :   error_coeff = c16_m;
                            {SIX,ONE}            :   error_coeff = c16_m;
                            {ONE,SEVEN}          :   error_coeff = c17_m;
                            {SEVEN,ONE}          :    error_coeff = c17_m;



                            {TWO,TWO}           :   error_coeff = c22_m;

                            {TWO,THREE}         :   error_coeff = c23_m;
                            {THREE,TWO}         : error_coeff = c23_m;
                            {TWO,FOUR}          :   error_coeff = c24_m;
                            {FOUR,TWO}          :   error_coeff = c24_m;
                            {TWO,FIVE}          :   error_coeff = c25_m;
                            {FIVE,TWO}          :   error_coeff = c25_m;
                            {TWO,SIX}           :   error_coeff = c26_m;
                            {SIX,TWO}           :   error_coeff = c26_m;
                            {TWO,SEVEN}         :   error_coeff = c27_m;
                            {SEVEN,TWO}         :   error_coeff = c27_m;


                            {THREE,THREE}      :   error_coeff = c33_m;

                            {THREE,FOUR}       :   error_coeff = c34_m;
                            {FOUR,THREE}       :   error_coeff = c34_m;
                            {THREE,FIVE}       :   error_coeff = c35_m;
                            {FIVE,THREE}       :   error_coeff = c35_m;
                            {THREE,SIX}        :   error_coeff = c36_m;
                            {SIX,THREE}        :   error_coeff = c36_m;
                            {THREE,SEVEN}      :   error_coeff = c37_m;
                            {SEVEN,THREE}      :   error_coeff = c37_m;


                            {FOUR,FOUR}        :   error_coeff = c44_m;
                            {FOUR,FIVE}        :   error_coeff = c45_m;
                            {FIVE,FOUR}        :   error_coeff = c45_m;
                            {FOUR,SIX}         :   error_coeff = c46_m;
                            {SIX,FOUR}         :   error_coeff = c46_m;
                            {FOUR,SEVEN}       :   error_coeff = c47_m;
                            {SEVEN,FOUR}       :   error_coeff = c47_m;

                            {FIVE,FIVE}        :   error_coeff = c55_m;
                            {FIVE,SIX}         :   error_coeff = c56_m;
                            {SIX,FIVE}         :   error_coeff = c56_m;
                            {FIVE,SEVEN}       :   error_coeff = c57_m;
                            {SEVEN,FIVE}       :   error_coeff = c57_m;


                            {SIX,SIX}          :   error_coeff = c66_m;
                            {SIX,SEVEN}        :   error_coeff = c67_m;
                            {SEVEN,SIX}        :   error_coeff = c67_m;

                            {SEVEN,SEVEN}      :   error_coeff = c77_m;

                default            :   error_coeff = {13{1'b0}};
                endcase
               end

               else if (mode == 0 && func[2] ==  1'b1) begin
                          case({frac_a,frac_b})
                                                     {ZERO,ZERO}       :   error_coeff = c00_d;
                         {ZERO,ONE}      :   error_coeff = c01_d;
                         {ZERO,TWO}     :   error_coeff = c02_d;
                         {ZERO,THREE}      :   error_coeff = c03_d;
                         {ZERO,FOUR}     :   error_coeff = c04_d;
                         {ZERO,FIVE}      :   error_coeff = c05_d;
                         {ZERO,SIX}      :   error_coeff = c06_d;
                         {ZERO,SEVEN}    :   error_coeff = c07_d;

                         {ONE,ZERO}      :   error_coeff = c10_d;
                         {ONE,ONE}     :   error_coeff = c11_d;
                         {ONE,TWO}    :   error_coeff = c12_d;
                         {ONE,THREE}     :   error_coeff = c13_d;
                         {ONE,FOUR}    :   error_coeff = c14_d;
                         {ONE,FIVE}     :   error_coeff = c15_d;
                         {ONE,SIX}     :   error_coeff = c16_d;
                         {ONE,SEVEN}   :   error_coeff = c17_d;

                         {TWO,ZERO}     :   error_coeff = c20_d;
                         {TWO,ONE}    :   error_coeff = c21_d;
                         {TWO,TWO}   :   error_coeff = c22_d;
                         {TWO,THREE}    :   error_coeff = c23_d;
                         {TWO,FOUR}   :   error_coeff = c24_d;
                         {TWO,FIVE}    :   error_coeff = c25_d;
                         {TWO,SIX}    :   error_coeff = c26_d;
                         {TWO,SEVEN}  :   error_coeff = c27_d;

                         {THREE,ZERO}      :   error_coeff = c30_d;
                         {THREE,ONE}     :   error_coeff = c31_d;
                         {THREE,TWO}    :   error_coeff = c32_d;
                         {THREE,THREE}     :   error_coeff = c33_d;
                         {THREE,FOUR}    :   error_coeff = c34_d;
                         {THREE,FIVE}     :   error_coeff = c35_d;
                         {THREE,SIX}     :   error_coeff = c36_d;
                         {THREE,SEVEN}   :   error_coeff = c37_d;

                         {FOUR,ZERO}     :   error_coeff = c40_d;
                         {FOUR,ONE}    :   error_coeff = c41_d;
                         {FOUR,TWO}   :   error_coeff = c42_d;
                         {FOUR,THREE}    :   error_coeff = c43_d;
                         {FOUR,FOUR}   :   error_coeff = c44_d;
                         {FOUR,FIVE}    :   error_coeff = c45_d;
                         {FOUR,SIX}    :   error_coeff = c46_d;
                         {FOUR,SEVEN}  :   error_coeff = c47_d;

                         {FIVE,ZERO}      :   error_coeff = c50_d;
                         {FIVE,ONE}     :   error_coeff = c51_d;
                         {FIVE,TWO}    :   error_coeff = c52_d;
                         {FIVE,THREE}     :   error_coeff = c53_d;
                         {FIVE,FOUR}    :   error_coeff = c54_d;
                         {FIVE,FIVE}     :   error_coeff = c55_d;
                         {FIVE,SIX}     :   error_coeff = c56_d;
                         {FIVE,SEVEN}   :   error_coeff = c57_d;

                         {SIX,ZERO}      :   error_coeff = c60_d;
                         {SIX,ONE}     :   error_coeff = c61_d;
                         {SIX,TWO}    :   error_coeff = c62_d;
                         {SIX,THREE}     :   error_coeff = c63_d;
                         {SIX,FOUR}    :   error_coeff = c64_d;
                         {SIX,FIVE}     :   error_coeff = c65_d;
                         {SIX,SIX}     :   error_coeff = c66_d;
                         {SIX,SEVEN}   :   error_coeff = c67_d;

                         {SEVEN,ZERO}    :   error_coeff = c70_d;
                         {SEVEN,ONE}   :   error_coeff = c71_d;
                         {SEVEN,TWO}  :   error_coeff = c72_d;
                         {SEVEN,THREE}   :   error_coeff = c73_d;
                         {SEVEN,FOUR}  :   error_coeff = c74_d;
                         {SEVEN,FIVE}   :   error_coeff = c75_d;
                         {SEVEN,SIX}   :   error_coeff = c76_d;
                         {SEVEN,SEVEN} :   error_coeff = c77_d;
                                 endcase
               end



               else if (mode == 1 && func[1:0] == 2'b00) begin
                   case({frac_a, frac_b})

        {ZERO,ZERO}          :   error_coeff[15:8] = c00_m[15:8];
        {ZERO,ONE}           :   error_coeff[15:8] = c01_m[15:8];
        {ONE,ZERO}           :   error_coeff[15:8] = c01_m[15:8];
        {ZERO,TWO}           :   error_coeff[15:8] = c02_m[15:8];
        {TWO,ZERO}           :   error_coeff[15:8] = c02_m[15:8];
        {ZERO,THREE}         :   error_coeff[15:8] = c03_m[15:8];
        {THREE,ZERO}         :   error_coeff[15:8] = c03_m[15:8];
        {ZERO,FOUR}          :   error_coeff[15:8] = c04_m[15:8];
        {FOUR,ZERO}          :   error_coeff[15:8] = c04_m[15:8];
        {ZERO,FIVE}          :   error_coeff[15:8] = c05_m[15:8];
        {FIVE,ZERO}          :   error_coeff[15:8] = c05_m[15:8];
        {ZERO,SIX}           :   error_coeff[15:8] = c06_m[15:8];
        {SIX,ZERO}           :   error_coeff[15:8] = c06_m[15:8];
        {ZERO,SEVEN}         :   error_coeff[15:8] = c07_m[15:8];
        {SEVEN,ZERO}         :   error_coeff[15:8] = c07_m[15:8];

        {ONE,ONE}            :   error_coeff[15:8] = c11_m[15:8];
        {ONE,TWO}            :   error_coeff[15:8] = c12_m[15:8];
        {TWO,ONE}            :   error_coeff[15:8] = c12_m[15:8];
        {ONE,THREE}          :   error_coeff[15:8] = c13_m[15:8];
        {THREE,ONE}          :   error_coeff[15:8] = c13_m[15:8];
        {ONE,FOUR}           :   error_coeff[15:8] = c14_m[15:8];
        {FOUR,ONE}           :   error_coeff[15:8] = c14_m[15:8];
        {ONE,FIVE}           :   error_coeff[15:8] = c15_m[15:8];
        {FIVE,ONE}           :   error_coeff[15:8] = c15_m[15:8];
        {ONE,SIX}            :   error_coeff[15:8] = c16_m[15:8];
        {SIX,ONE}            :   error_coeff[15:8] = c16_m[15:8];
        {ONE,SEVEN}          :   error_coeff[15:8] = c17_m[15:8];
        {SEVEN,ONE}          :    error_coeff[15:8] = c17_m[15:8];



        {TWO,TWO}           :   error_coeff[15:8] = c22_m[15:8];

        {TWO,THREE}         :   error_coeff[15:8] = c23_m[15:8];
        {THREE,TWO}         : error_coeff[15:8] = c23_m[15:8];
        {TWO,FOUR}          :   error_coeff[15:8] = c24_m[15:8];
        {FOUR,TWO}          :   error_coeff[15:8] = c24_m[15:8];
        {TWO,FIVE}          :   error_coeff[15:8] = c25_m[15:8];
        {FIVE,TWO}          :   error_coeff[15:8] = c25_m[15:8];
        {TWO,SIX}           :   error_coeff[15:8] = c26_m[15:8];
        {SIX,TWO}           :   error_coeff[15:8] = c26_m[15:8];
        {TWO,SEVEN}         :   error_coeff[15:8] = c27_m[15:8];
        {SEVEN,TWO}         :   error_coeff[15:8] = c27_m[15:8];


        {THREE,THREE}      :   error_coeff[15:8] = c33_m[15:8];

        {THREE,FOUR}       :   error_coeff[15:8] = c34_m[15:8];
        {FOUR,THREE}       :   error_coeff[15:8] = c34_m[15:8];
        {THREE,FIVE}       :   error_coeff[15:8] = c35_m[15:8];
        {FIVE,THREE}       :   error_coeff[15:8] = c35_m[15:8];
        {THREE,SIX}        :   error_coeff[15:8] = c36_m[15:8];
        {SIX,THREE}        :   error_coeff[15:8] = c36_m[15:8];
        {THREE,SEVEN}      :   error_coeff[15:8] = c37_m[15:8];
        {SEVEN,THREE}      :   error_coeff[15:8] = c37_m[15:8];


        {FOUR,FOUR}        :   error_coeff[15:8] = c44_m[15:8];
        {FOUR,FIVE}        :   error_coeff[15:8] = c45_m[15:8];
        {FIVE,FOUR}        :   error_coeff[15:8] = c45_m[15:8];
        {FOUR,SIX}         :   error_coeff[15:8] = c46_m[15:8];
        {SIX,FOUR}         :   error_coeff[15:8] = c46_m[15:8];
        {FOUR,SEVEN}       :   error_coeff[15:8] = c47_m[15:8];
        {SEVEN,FOUR}       :   error_coeff[15:8] = c47_m[15:8];

        {FIVE,FIVE}        :   error_coeff[15:8] = c55_m[15:8];
        {FIVE,SIX}         :   error_coeff[15:8] = c56_m[15:8];
        {SIX,FIVE}         :   error_coeff[15:8] = c56_m[15:8];
        {FIVE,SEVEN}       :   error_coeff[15:8] = c57_m[15:8];
        {SEVEN,FIVE}       :   error_coeff[15:8] = c57_m[15:8];


        {SIX,SIX}         :   error_coeff[15:8] = c66_m[15:8];
        {SIX,SEVEN}       :   error_coeff[15:8] = c67_m[15:8];
        {SEVEN,SIX}       :   error_coeff[15:8] = c67_m[15:8];

        {SEVEN,SEVEN}               :   error_coeff[15:8] = c77_m[15:8];





                 default  :   error_coeff[12:8] = {5{1'b0}};
                 endcase
                   case({frac_a_lsb, frac_b_lsb})
                              {ZERO,ZERO}        :   error_coeff[7:0] = c00_m[15:8];
       {ZERO,ONE}           :   error_coeff[7:0] = c01_m[15:8];
       {ONE,ZERO}           :   error_coeff[7:0] = c01_m[15:8];
       {ZERO,TWO}           :   error_coeff[7:0] = c02_m[15:8];
       {TWO,ZERO}           :   error_coeff[7:0] = c02_m[15:8];
       {ZERO,THREE}         :   error_coeff[7:0] = c03_m[15:8];
       {THREE,ZERO}         :   error_coeff[7:0] = c03_m[15:8];
       {ZERO,FOUR}          :   error_coeff[7:0] = c04_m[15:8];
       {FOUR,ZERO}          :   error_coeff[7:0] = c04_m[15:8];
       {ZERO,FIVE}          :   error_coeff[7:0] = c05_m[15:8];
       {FIVE,ZERO}          :   error_coeff[7:0] = c05_m[15:8];
       {ZERO,SIX}           :   error_coeff[7:0] = c06_m[15:8];
       {SIX,ZERO}           :   error_coeff[7:0] = c06_m[15:8];
       {ZERO,SEVEN}         :   error_coeff[7:0] = c07_m[15:8];
       {SEVEN,ZERO}         :   error_coeff[7:0] = c07_m[15:8];

        {ONE,ONE}           :   error_coeff[7:0] = c11_m[15:8];
       {ONE,TWO}            :   error_coeff[7:0] = c12_m[15:8];
       {TWO,ONE}            :   error_coeff[7:0] = c12_m[15:8];
       {ONE,THREE}          :   error_coeff[7:0] = c13_m[15:8];
       {THREE,ONE}          :   error_coeff[7:0] = c13_m[15:8];
       {ONE,FOUR}           :   error_coeff[7:0] = c14_m[15:8];
       {FOUR,ONE}           :   error_coeff[7:0] = c14_m[15:8];
       {ONE,FIVE}           :   error_coeff[7:0] = c15_m[15:8];
        {FIVE,ONE}          :   error_coeff[7:0] = c15_m[15:8];
       {ONE,SIX}            :   error_coeff[7:0] = c16_m[15:8];
         {SIX,ONE}          :   error_coeff[7:0] = c16_m[15:8];
       {ONE,SEVEN}          :   error_coeff[7:0] = c17_m[15:8];
        {SEVEN,ONE}         :    error_coeff[7:0] = c17_m[15:8];



       {TWO,TWO}           :   error_coeff[7:0] = c22_m[15:8];

        {TWO,THREE}        :   error_coeff[7:0] = c23_m[15:8];
        {THREE,TWO}        : error_coeff[7:0] = c23_m[15:8];
       {TWO,FOUR}          :   error_coeff[7:0] = c24_m[15:8];
       {FOUR,TWO}          :   error_coeff[7:0] = c24_m[15:8];
       {TWO,FIVE}          :   error_coeff[7:0] = c25_m[15:8];
        {FIVE,TWO}         :   error_coeff[7:0] = c25_m[15:8];
       {TWO,SIX}           :   error_coeff[7:0] = c26_m[15:8];
       {SIX,TWO}           :   error_coeff[7:0] = c26_m[15:8];
       {TWO,SEVEN}         :   error_coeff[7:0] = c27_m[15:8];
       {SEVEN,TWO}         :   error_coeff[7:0] = c27_m[15:8];


       {THREE,THREE}     :   error_coeff[7:0] = c33_m[15:8];

       {THREE,FOUR}      :   error_coeff[7:0] = c34_m[15:8];
        {FOUR,THREE}     :   error_coeff[7:0] = c34_m[15:8];
       {THREE,FIVE}      :   error_coeff[7:0] = c35_m[15:8];
       {FIVE,THREE}      :   error_coeff[7:0] = c35_m[15:8];
       {THREE,SIX}       :   error_coeff[7:0] = c36_m[15:8];
       {SIX,THREE}       :   error_coeff[7:0] = c36_m[15:8];
       {THREE,SEVEN}     :   error_coeff[7:0] = c37_m[15:8];
       {SEVEN,THREE}     :   error_coeff[7:0] = c37_m[15:8];


       {FOUR,FOUR}       :   error_coeff[7:0] = c44_m[15:8];
       {FOUR,FIVE}       :   error_coeff[7:0] = c45_m[15:8];
       {FIVE,FOUR}       :   error_coeff[7:0] = c45_m[15:8];
       {FOUR,SIX}        :   error_coeff[7:0] = c46_m[15:8];
       {SIX,FOUR}        :   error_coeff[7:0] = c46_m[15:8];
       {FOUR,SEVEN}      :   error_coeff[7:0] = c47_m[15:8];
       {SEVEN,FOUR}      :   error_coeff[7:0] = c47_m[15:8];

       {FIVE,FIVE}       :   error_coeff[7:0] = c55_m[15:8];
       {FIVE,SIX}        :   error_coeff[7:0] = c56_m[15:8];
       {SIX,FIVE}        :   error_coeff[7:0] = c56_m[15:8];
       {FIVE,SEVEN}      :   error_coeff[7:0] = c57_m[15:8];
       {SEVEN,FIVE}      :   error_coeff[7:0] = c57_m[15:8];


       {SIX,SIX}       :   error_coeff[7:0] = c66_m[15:8];
       {SIX,SEVEN}     :   error_coeff[7:0] = c67_m[15:8];
       {SEVEN,SIX}     :   error_coeff[7:0] = c67_m[15:8];

       {SEVEN,SEVEN}                       :   error_coeff[7:0] = c77_m[15:8];


                  default                             :   error_coeff[7:0] = {8{1'b0}};
                  endcase
               end


                  else if (mode == 1 && (func[1:0] == 2'b01 || func[1:0] == 2'b10) ) begin
                             case({frac_a, frac_b})
                                                   {ZERO,ZERO}          :   error_coeff[15:8] = c00_m[15:8];
                                                                    {ZERO,ONE}           :   error_coeff[15:8] = c01_m[15:8];
                                                                    {ONE,ZERO}           :   error_coeff[15:8] = c01_m[15:8];
                                                                    {ZERO,TWO}           :   error_coeff[15:8] = c02_m[15:8];
                                                                    {TWO,ZERO}           :   error_coeff[15:8] = c02_m[15:8];
                                                                    {ZERO,THREE}         :   error_coeff[15:8] = c03_m[15:8];
                                                                    {THREE,ZERO}         :   error_coeff[15:8] = c03_m[15:8];
                                                                    {ZERO,FOUR}          :   error_coeff[15:8] = c04_m[15:8];
                                                                    {FOUR,ZERO}          :   error_coeff[15:8] = c04_m[15:8];
                                                                    {ZERO,FIVE}          :   error_coeff[15:8] = c05_m[15:8];
                                                                    {FIVE,ZERO}          :   error_coeff[15:8] = c05_m[15:8];
                                                                    {ZERO,SIX}           :   error_coeff[15:8] = c06_m[15:8];
                                                                    {SIX,ZERO}           :   error_coeff[15:8] = c06_m[15:8];
                                                                    {ZERO,SEVEN}         :   error_coeff[15:8] = c07_m[15:8];
                                                                    {SEVEN,ZERO}         :   error_coeff[15:8] = c07_m[15:8];

                                                                    {ONE,ONE}           :   error_coeff[15:8] = c11_m[15:8];
                                                                    {ONE,TWO}            :   error_coeff[15:8] = c12_m[15:8];
                                                                    {TWO,ONE}            :   error_coeff[15:8] = c12_m[15:8];
                                                                    {ONE,THREE}          :   error_coeff[15:8] = c13_m[15:8];
                                                                    {THREE,ONE}          :   error_coeff[15:8] = c13_m[15:8];
                                                                    {ONE,FOUR}           :   error_coeff[15:8] = c14_m[15:8];
                                                                    {FOUR,ONE}           :   error_coeff[15:8] = c14_m[15:8];
                                                                    {ONE,FIVE}           :   error_coeff[15:8] = c15_m[15:8];
                                                                    {FIVE,ONE}          :   error_coeff[15:8] = c15_m[15:8];
                                                                    {ONE,SIX}            :   error_coeff[15:8] = c16_m[15:8];
                                                                    {SIX,ONE}          :   error_coeff[15:8] = c16_m[15:8];
                                                                    {ONE,SEVEN}          :   error_coeff[15:8] = c17_m[15:8];
                                                                    {SEVEN,ONE}         :    error_coeff[15:8] = c17_m[15:8];



                                                                    {TWO,TWO}           :   error_coeff[15:8] = c22_m[15:8];

                                                                    {TWO,THREE}        :   error_coeff[15:8] = c23_m[15:8];
                                                                    {THREE,TWO}        : error_coeff[15:8] = c23_m[15:8];
                                                                    {TWO,FOUR}          :   error_coeff[15:8] = c24_m[15:8];
                                                                    {FOUR,TWO}          :   error_coeff[15:8] = c24_m[15:8];
                                                                    {TWO,FIVE}          :   error_coeff[15:8] = c25_m[15:8];
                                                                    {FIVE,TWO}         :   error_coeff[15:8] = c25_m[15:8];
                                                                    {TWO,SIX}           :   error_coeff[15:8] = c26_m[15:8];
                                                                    {SIX,TWO}           :   error_coeff[15:8] = c26_m[15:8];
                                                                    {TWO,SEVEN}         :   error_coeff[15:8] = c27_m[15:8];
                                                                    {SEVEN,TWO}         :   error_coeff[15:8] = c27_m[15:8];


                                                                    {THREE,THREE}      :   error_coeff[15:8] = c33_m[15:8];

                                                                    {THREE,FOUR}      :   error_coeff[15:8] = c34_m[15:8];
                                                                    {FOUR,THREE}    :   error_coeff[15:8] = c34_m[15:8];
                                                                    {THREE,FIVE}       :   error_coeff[15:8] = c35_m[15:8];
                                                                    {FIVE,THREE}    :   error_coeff[15:8] = c35_m[15:8];
                                                                    {THREE,SIX}          :   error_coeff[15:8] = c36_m[15:8];
                                                                    {SIX,THREE}       :   error_coeff[15:8] = c36_m[15:8];
                                                                    {THREE,SEVEN}      :   error_coeff[15:8] = c37_m[15:8];
                                                                    {SEVEN,THREE}    :   error_coeff[15:8] = c37_m[15:8];


                                                                    {FOUR,FOUR}                         :   error_coeff[15:8] = c44_m[15:8];
                                                                    {FOUR,FIVE}        :   error_coeff[15:8] = c45_m[15:8];
                                                                    {FIVE,FOUR}      :   error_coeff[15:8] = c45_m[15:8];
                                                                    {FOUR,SIX}           :   error_coeff[15:8] = c46_m[15:8];
                                                                    {SIX,FOUR}        :   error_coeff[15:8] = c46_m[15:8];
                                                                    {FOUR,SEVEN}    :   error_coeff[15:8] = c47_m[15:8];
                                                                    {SEVEN,FOUR}   :   error_coeff[15:8] = c47_m[15:8];

                                                                    {FIVE,FIVE}                         :   error_coeff[15:8] = c55_m[15:8];
                                                                    {FIVE,SIX}           :   error_coeff[15:8] = c56_m[15:8];
                                                                    {SIX,FIVE}        :   error_coeff[15:8] = c56_m[15:8];
                                                                    {FIVE,SEVEN}     :   error_coeff[15:8] = c57_m[15:8];
                                                                    {SEVEN,FIVE}   :   error_coeff[15:8] = c57_m[15:8];


                                                                    {SIX,SIX}                           :   error_coeff[15:8] = c66_m[15:8];
                                                                    {SIX,SEVEN}         :   error_coeff[15:8] = c67_m[15:8];
                                                                    {SEVEN,SIX}     :   error_coeff[15:8] = c67_m[15:8];

                                                                    {SEVEN,SEVEN}                       :   error_coeff[15:8] = c77_m[15:8];






                           default                             :   error_coeff[12:8] = {5{1'b0}};
                           endcase
                             case({frac_a_lsb, frac_b_lsb})
                                             {ZERO,ZERO}       :   error_coeff[7:0] = c00_d[15:8];
                                                                         {ZERO,ONE}      :   error_coeff[7:0] = c01_d[15:8];
                                                                         {ZERO,TWO}     :   error_coeff[7:0] = c02_d[15:8];
                                                                         {ZERO,THREE}      :   error_coeff[7:0] = c03_d[15:8];
                                                                         {ZERO,FOUR}     :   error_coeff[7:0] = c04_d[15:8];
                                                                         {ZERO,FIVE}      :   error_coeff[7:0] = c05_d[15:8];
                                                                         {ZERO,SIX}      :   error_coeff[7:0] = c06_d[15:8];
                                                                         {ZERO,SEVEN}    :   error_coeff[7:0] = c07_d[15:8];

                                                                         {ONE,ZERO}      :   error_coeff[7:0] = c10_d[15:8];
                                                                         {ONE,ONE}     :   error_coeff[7:0] = c11_d[15:8];
                                                                         {ONE,TWO}    :   error_coeff[7:0] = c12_d[15:8];
                                                                         {ONE,THREE}     :   error_coeff[7:0] = c13_d[15:8];
                                                                         {ONE,FOUR}    :   error_coeff[7:0] = c14_d[15:8];
                                                                         {ONE,FIVE}     :   error_coeff[7:0] = c15_d[15:8];
                                                                         {ONE,SIX}     :   error_coeff[7:0] = c16_d[15:8];
                                                                         {ONE,SEVEN}   :   error_coeff[7:0] = c17_d[15:8];

                                                                         {TWO,ZERO}     :   error_coeff[7:0] = c20_d[15:8];
                                                                         {TWO,ONE}    :   error_coeff[7:0] = c21_d[15:8];
                                                                         {TWO,TWO}   :   error_coeff[7:0] = c22_d[15:8];
                                                                         {TWO,THREE}    :   error_coeff[7:0] = c23_d[15:8];
                                                                         {TWO,FOUR}   :   error_coeff[7:0] = c24_d[15:8];
                                                                         {TWO,FIVE}    :   error_coeff[7:0] = c25_d[15:8];
                                                                         {TWO,SIX}    :   error_coeff[7:0] = c26_d[15:8];
                                                                         {TWO,SEVEN}  :   error_coeff[7:0] = c27_d[15:8];

                                                                         {THREE,ZERO}      :   error_coeff[7:0] = c30_d[15:8];
                                                                         {THREE,ONE}     :   error_coeff[7:0] = c31_d[15:8];
                                                                         {THREE,TWO}    :   error_coeff[7:0] = c32_d[15:8];
                                                                         {THREE,THREE}     :   error_coeff[7:0] = c33_d[15:8];
                                                                         {THREE,FOUR}    :   error_coeff[7:0] = c34_d[15:8];
                                                                         {THREE,FIVE}     :   error_coeff[7:0] = c35_d[15:8];
                                                                         {THREE,SIX}     :   error_coeff[7:0] = c36_d[15:8];
                                                                         {THREE,SEVEN}   :   error_coeff[7:0] = c37_d[15:8];

                                                                         {FOUR,ZERO}     :   error_coeff[7:0] = c40_d[15:8];
                                                                         {FOUR,ONE}    :   error_coeff[7:0] = c41_d[15:8];
                                                                         {FOUR,TWO}   :   error_coeff[7:0] = c42_d[15:8];
                                                                         {FOUR,THREE}    :   error_coeff[7:0] = c43_d[15:8];
                                                                         {FOUR,FOUR}   :   error_coeff[7:0] = c44_d[15:8];
                                                                         {FOUR,FIVE}    :   error_coeff[7:0] = c45_d[15:8];
                                                                         {FOUR,SIX}    :   error_coeff[7:0] = c46_d[15:8];
                                                                         {FOUR,SEVEN}  :   error_coeff[7:0] = c47_d[15:8];

                                                                         {FIVE,ZERO}      :   error_coeff[7:0] = c50_d[15:8];
                                                                         {FIVE,ONE}     :   error_coeff[7:0] = c51_d[15:8];
                                                                         {FIVE,TWO}    :   error_coeff[7:0] = c52_d[15:8];
                                                                         {FIVE,THREE}     :   error_coeff[7:0] = c53_d[15:8];
                                                                         {FIVE,FOUR}    :   error_coeff[7:0] = c54_d[15:8];
                                                                         {FIVE,FIVE}     :   error_coeff[7:0] = c55_d[15:8];
                                                                         {FIVE,SIX}     :   error_coeff[7:0] = c56_d[15:8];
                                                                         {FIVE,SEVEN}   :   error_coeff[7:0] = c57_d[15:8];

                                                                         {SIX,ZERO}      :   error_coeff[7:0] = c60_d[15:8];
                                                                         {SIX,ONE}     :   error_coeff[7:0] = c61_d[15:8];
                                                                         {SIX,TWO}    :   error_coeff[7:0] = c62_d[15:8];
                                                                         {SIX,THREE}     :   error_coeff[7:0] = c63_d[15:8];
                                                                         {SIX,FOUR}    :   error_coeff[7:0] = c64_d[15:8];
                                                                         {SIX,FIVE}     :   error_coeff[7:0] = c65_d[15:8];
                                                                         {SIX,SIX}     :   error_coeff[7:0] = c66_d[15:8];
                                                                         {SIX,SEVEN}   :   error_coeff[7:0] = c67_d[15:8];

                                                                         {SEVEN,ZERO}    :   error_coeff[7:0] = c70_d[15:8];
                                                                         {SEVEN,ONE}   :   error_coeff[7:0] = c71_d[15:8];
                                                                         {SEVEN,TWO}  :   error_coeff[7:0] = c72_d[15:8];
                                                                         {SEVEN,THREE}   :   error_coeff[7:0] = c73_d[15:8];
                                                                         {SEVEN,FOUR}  :   error_coeff[7:0] = c74_d[15:8];
                                                                         {SEVEN,FIVE}   :   error_coeff[7:0] = c75_d[15:8];
                                                                         {SEVEN,SIX}   :   error_coeff[7:0] = c76_d[15:8];
                                                                         {SEVEN,SEVEN} :   error_coeff[7:0] = c77_d[15:8];

                            default                             :   error_coeff[7:0] = {8{1'b0}};
                            endcase
                   end




                else if (mode == 1 && func[1:0] == 2'b11) begin
                        case({frac_a,frac_b})
                                               {ZERO,ZERO}       :   error_coeff[15:8] = c00_d[15:8];
                 {ZERO,ONE}      :   error_coeff[15:8] = c01_d[15:8];
                 {ZERO,TWO}     :   error_coeff[15:8] = c02_d[15:8];
                 {ZERO,THREE}      :   error_coeff[15:8] = c03_d[15:8];
                 {ZERO,FOUR}     :   error_coeff[15:8] = c04_d[15:8];
                 {ZERO,FIVE}      :   error_coeff[15:8] = c05_d[15:8];
                 {ZERO,SIX}      :   error_coeff[15:8] = c06_d[15:8];
                 {ZERO,SEVEN}    :   error_coeff[15:8] = c07_d[15:8];

                 {ONE,ZERO}      :   error_coeff[15:8] = c10_d[15:8];
                 {ONE,ONE}     :   error_coeff[15:8] = c11_d[15:8];
                 {ONE,TWO}    :   error_coeff[15:8] = c12_d[15:8];
                 {ONE,THREE}     :   error_coeff[15:8] = c13_d[15:8];
                 {ONE,FOUR}    :   error_coeff[15:8] = c14_d[15:8];
                 {ONE,FIVE}     :   error_coeff[15:8] = c15_d[15:8];
                 {ONE,SIX}     :   error_coeff[15:8] = c16_d[15:8];
                 {ONE,SEVEN}   :   error_coeff[15:8] = c17_d[15:8];

                 {TWO,ZERO}     :   error_coeff[15:8] = c20_d[15:8];
                 {TWO,ONE}    :   error_coeff[15:8] = c21_d[15:8];
                 {TWO,TWO}   :   error_coeff[15:8] = c22_d[15:8];
                 {TWO,THREE}    :   error_coeff[15:8] = c23_d[15:8];
                 {TWO,FOUR}   :   error_coeff[15:8] = c24_d[15:8];
                 {TWO,FIVE}    :   error_coeff[15:8] = c25_d[15:8];
                 {TWO,SIX}    :   error_coeff[15:8] = c26_d[15:8];
                 {TWO,SEVEN}  :   error_coeff[15:8] = c27_d[15:8];

                 {THREE,ZERO}      :   error_coeff[15:8] = c30_d[15:8];
                 {THREE,ONE}     :   error_coeff[15:8] = c31_d[15:8];
                 {THREE,TWO}    :   error_coeff[15:8] = c32_d[15:8];
                 {THREE,THREE}     :   error_coeff[15:8] = c33_d[15:8];
                 {THREE,FOUR}    :   error_coeff[15:8] = c34_d[15:8];
                 {THREE,FIVE}     :   error_coeff[15:8] = c35_d[15:8];
                 {THREE,SIX}     :   error_coeff[15:8] = c36_d[15:8];
                 {THREE,SEVEN}   :   error_coeff[15:8] = c37_d[15:8];

                 {FOUR,ZERO}     :   error_coeff[15:8] = c40_d[15:8];
                 {FOUR,ONE}    :   error_coeff[15:8] = c41_d[15:8];
                 {FOUR,TWO}   :   error_coeff[15:8] = c42_d[15:8];
                 {FOUR,THREE}    :   error_coeff[15:8] = c43_d[15:8];
                 {FOUR,FOUR}   :   error_coeff[15:8] = c44_d[15:8];
                 {FOUR,FIVE}    :   error_coeff[15:8] = c45_d[15:8];
                 {FOUR,SIX}    :   error_coeff[15:8] = c46_d[15:8];
                 {FOUR,SEVEN}  :   error_coeff[15:8] = c47_d[15:8];

                 {FIVE,ZERO}      :   error_coeff[15:8] = c50_d[15:8];
                 {FIVE,ONE}     :   error_coeff[15:8] = c51_d[15:8];
                 {FIVE,TWO}    :   error_coeff[15:8] = c52_d[15:8];
                 {FIVE,THREE}     :   error_coeff[15:8] = c53_d[15:8];
                 {FIVE,FOUR}    :   error_coeff[15:8] = c54_d[15:8];
                 {FIVE,FIVE}     :   error_coeff[15:8] = c55_d[15:8];
                 {FIVE,SIX}     :   error_coeff[15:8] = c56_d[15:8];
                 {FIVE,SEVEN}   :   error_coeff[15:8] = c57_d[15:8];

                 {SIX,ZERO}      :   error_coeff[15:8] = c60_d[15:8];
                 {SIX,ONE}     :   error_coeff[15:8] = c61_d[15:8];
                 {SIX,TWO}    :   error_coeff[15:8] = c62_d[15:8];
                 {SIX,THREE}     :   error_coeff[15:8] = c63_d[15:8];
                 {SIX,FOUR}    :   error_coeff[15:8] = c64_d[15:8];
                 {SIX,FIVE}     :   error_coeff[15:8] = c65_d[15:8];
                 {SIX,SIX}     :   error_coeff[15:8] = c66_d[15:8];
                 {SIX,SEVEN}   :   error_coeff[15:8] = c67_d[15:8];

                 {SEVEN,ZERO}    :   error_coeff[15:8] = c70_d[15:8];
                 {SEVEN,ONE}   :   error_coeff[15:8] = c71_d[15:8];
                 {SEVEN,TWO}  :   error_coeff[15:8] = c72_d[15:8];
                 {SEVEN,THREE}   :   error_coeff[15:8] = c73_d[15:8];
                 {SEVEN,FOUR}  :   error_coeff[15:8] = c74_d[15:8];
                 {SEVEN,FIVE}   :   error_coeff[15:8] = c75_d[15:8];
                 {SEVEN,SIX}   :   error_coeff[15:8] = c76_d[15:8];
                 {SEVEN,SEVEN} :   error_coeff[15:8] = c77_d[15:8];
                         endcase
                        case({frac_a_lsb,frac_b_lsb})
                                             {ZERO,ZERO}       :   error_coeff[7:0] = c00_d[15:8];
                                              {ZERO,ONE}      :   error_coeff[7:0] = c01_d[15:8];
                                               {ZERO,TWO}     :   error_coeff[7:0] = c02_d[15:8];
                                                {ZERO,THREE}      :   error_coeff[7:0] = c03_d[15:8];
                                                 {ZERO,FOUR}     :   error_coeff[7:0] = c04_d[15:8];
                                                        {ZERO,FIVE}      :   error_coeff[7:0] = c05_d[15:8];
                                                        {ZERO,SIX}      :   error_coeff[7:0] = c06_d[15:8];
                                                        {ZERO,SEVEN}    :   error_coeff[7:0] = c07_d[15:8];

                                                        {ONE,ZERO}      :   error_coeff[7:0] = c10_d[15:8];
                                                        {ONE,ONE}     :   error_coeff[7:0] = c11_d[15:8];
                                                        {ONE,TWO}    :   error_coeff[7:0] = c12_d[15:8];
                                                        {ONE,THREE}     :   error_coeff[7:0] = c13_d[15:8];
                                                        {ONE,FOUR}    :   error_coeff[7:0] = c14_d[15:8];
                                                        {ONE,FIVE}     :   error_coeff[7:0] = c15_d[15:8];
                                                        {ONE,SIX}     :   error_coeff[7:0] = c16_d[15:8];
                                                        {ONE,SEVEN}   :   error_coeff[7:0] = c17_d[15:8];

                                                        {TWO,ZERO}     :   error_coeff[7:0] = c20_d[15:8];
                                                        {TWO,ONE}    :   error_coeff[7:0] = c21_d[15:8];
                                                        {TWO,TWO}   :   error_coeff[7:0] = c22_d[15:8];
                                                        {TWO,THREE}    :   error_coeff[7:0] = c23_d[15:8];
                                                        {TWO,FOUR}   :   error_coeff[7:0] = c24_d[15:8];
                                                        {TWO,FIVE}    :   error_coeff[7:0] = c25_d[15:8];
                                                        {TWO,SIX}    :   error_coeff[7:0] = c26_d[15:8];
                                                        {TWO,SEVEN}  :   error_coeff[7:0] = c27_d[15:8];

                                                        {THREE,ZERO}      :   error_coeff[7:0] = c30_d[15:8];
                                                        {THREE,ONE}     :   error_coeff[7:0] = c31_d[15:8];
                                                        {THREE,TWO}    :   error_coeff[7:0] = c32_d[15:8];
                                                        {THREE,THREE}     :   error_coeff[7:0] = c33_d[15:8];
                                                        {THREE,FOUR}    :   error_coeff[7:0] = c34_d[15:8];
                                                        {THREE,FIVE}     :   error_coeff[7:0] = c35_d[15:8];
                                                        {THREE,SIX}     :   error_coeff[7:0] = c36_d[15:8];
                                                        {THREE,SEVEN}   :   error_coeff[7:0] = c37_d[15:8];

                                                        {FOUR,ZERO}     :   error_coeff[7:0] = c40_d[15:8];
                                                        {FOUR,ONE}    :   error_coeff[7:0] = c41_d[15:8];
                                                        {FOUR,TWO}   :   error_coeff[7:0] = c42_d[15:8];
                                                        {FOUR,THREE}    :   error_coeff[7:0] = c43_d[15:8];
                                                        {FOUR,FOUR}   :   error_coeff[7:0] = c44_d[15:8];
                                                        {FOUR,FIVE}    :   error_coeff[7:0] = c45_d[15:8];
                                                        {FOUR,SIX}    :   error_coeff[7:0] = c46_d[15:8];
                                                        {FOUR,SEVEN}  :   error_coeff[7:0] = c47_d[15:8];

                                                        {FIVE,ZERO}      :   error_coeff[7:0] = c50_d[15:8];
                                                        {FIVE,ONE}     :   error_coeff[7:0] = c51_d[15:8];
                                                        {FIVE,TWO}    :   error_coeff[7:0] = c52_d[15:8];
                                                        {FIVE,THREE}     :   error_coeff[7:0] = c53_d[15:8];
                                                        {FIVE,FOUR}    :   error_coeff[7:0] = c54_d[15:8];
                                                        {FIVE,FIVE}     :   error_coeff[7:0] = c55_d[15:8];
                                                        {FIVE,SIX}     :   error_coeff[7:0] = c56_d[15:8];
                                                        {FIVE,SEVEN}   :   error_coeff[7:0] = c57_d[15:8];

                                                        {SIX,ZERO}      :   error_coeff[7:0] = c60_d[15:8];
                                                        {SIX,ONE}     :   error_coeff[7:0] = c61_d[15:8];
                                                        {SIX,TWO}    :   error_coeff[7:0] = c62_d[15:8];
                                                        {SIX,THREE}     :   error_coeff[7:0] = c63_d[15:8];
                                                        {SIX,FOUR}    :   error_coeff[7:0] = c64_d[15:8];
                                                        {SIX,FIVE}     :   error_coeff[7:0] = c65_d[15:8];
                                                        {SIX,SIX}     :   error_coeff[7:0] = c66_d[15:8];
                                                        {SIX,SEVEN}   :   error_coeff[7:0] = c67_d[15:8];

                                                        {SEVEN,ZERO}    :   error_coeff[7:0] = c70_d[15:8];
                                                        {SEVEN,ONE}   :   error_coeff[7:0] = c71_d[15:8];
                                                        {SEVEN,TWO}  :   error_coeff[7:0] = c72_d[15:8];
                                                        {SEVEN,THREE}   :   error_coeff[7:0] = c73_d[15:8];
                                                        {SEVEN,FOUR}  :   error_coeff[7:0] = c74_d[15:8];
                                                        {SEVEN,FIVE}   :   error_coeff[7:0] = c75_d[15:8];
                                                        {SEVEN,SIX}   :   error_coeff[7:0] = c76_d[15:8];
                                                        {SEVEN,SEVEN} :   error_coeff[7:0] = c77_d[15:8];
                    endcase
                    end

        end

endmodule
