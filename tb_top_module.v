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


`timescale 1 ns/1 ps

module tb_top_module();

`timescale 1ns / 1ps // time-unit = 1 ns, precision = 10 ps

parameter N = 16;
parameter lgN = 4;
  integer i,j, data_file, accurate , func_var, mode_var;
  real error, err_mitchel, counter  ;

  reg [N-1:0] accurate_upper, accurate_lower;
  real error_lower, error_upper;

reg    [N-1:0]      x;
reg    [N-1:0]      y;
reg 		        mode;
reg    [2:0]        func;

wire   [2*N-1:0]    result_o_hybrid;
wire   [2*N-1:0]    result_o;


   top_module #(.N(N), .lgN(lgN) )
              inst(.input1_i(x),
			       .input2_i(y),
			        .mode(mode),
			        .func(func),
			        .result_o_hybrid(result_o_hybrid)
			        );

   initial
    begin


          #5  x=11;y=51; 	         mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
          #5  x=51;y= 11;            mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
          #5  x=43;y=10; 	         mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
          #5  x=43;y=10;             mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
	      #5  x=91;y=87; 	         mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
          #5  x=91;y=87;             mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
          #5  x=0;y=0; 	             mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;

//          #5  x=0;y=0;               mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
//	      #5  x=255;y=255; 	         mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
//          #5  x=255;y=255;           mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;

//          #5  x=300;y=300;           mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
//	      #5  x=285;y=6000; 	     mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
//          #5  x=2515;y=500;          mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;

//          #5  x=255;y=255; 	         mode = 0;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y;
//          #5  x=16'HABAB ;y=16'H0101;   mode = 0;  func[2] = 0; func[1:0] = 2'b00;       accurate = x*y;
//          #5  x=16'HFFFF ;y=16'HDDDD;   mode = 0;  func[2] = 0; func[1:0] = 2'b00;       accurate = x*y;


//          #5  x=33318 ;y=1674;   mode = 0;  func[2] = 1; func[1:0] = 2'b00;       accurate = x/y;   accurate_upper = x[15:8] / y[15:8]; accurate_lower = x[7:0]  / y[7:0];
//          #5  x=16'HFFFF ;y=16'HDDDD;   mode = 0;  func[2] = 1; func[1:0] = 2'b00;       accurate = x/y; accurate_upper = x[15:8] / y[15:8]; accurate_lower = x[7:0]  / y[7:0];
//          #5  x=33318 ;y=1674;   mode = 0;  func[2] = 1; func[1:0] = 2'b00;       accurate = x/y;        accurate_upper = x[15:8] / y[15:8]; accurate_lower = x[7:0]  / y[7:0];



//         #5  x=0;y=0;                  mode = 1;  func[2] = 0;  func[1:0] = 2'b00;      accurate = x*y; accurate_upper = x[15:8] * y[15:8];  accurate_lower = x[7:0] * y[7:0];
//         #5  x=16'H3333 ;y=16'H0B0B;   mode = 1;  func[2] = 0;  func[1:0] = 2'b00;       accurate = x*y;   accurate_upper = x[15:8] * y[15:8];  accurate_lower = x[7:0] * y[7:0];
//         #5  x=16'H2B2B ;y=16'H0a0a;   mode = 1;  func[2] = 0;  func[1:0] = 2'b00;       accurate = x*y;    accurate_upper = x[15:8] * y[15:8];  accurate_lower = x[7:0] * y[7:0];
//         #5  x=16'H5B5B ;y=16'H5757;   mode = 1;  func[2] = 0;  func[1:0] = 2'b00;       accurate = x*y;    accurate_upper = x[15:8] * y[15:8];  accurate_lower = x[7:0] * y[7:0];
//         #5  x=16'HFFFF ;y=16'HFFFF;   mode = 1;  func[2] = 0;  func[1:0] = 2'b00;       accurate = x*y;     accurate_upper = x[15:8] * y[15:8];  accurate_lower = x[7:0] * y[7:0];


//           #5  x=0;y=0;                      mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
//           #5  x=16'H3333 ;y=16'H0B0B;   mode = 1;  func[2] = 1;  func[1:0] = 2'b11;       accurate = x*y;
//           #5  x=16'H2B2B ;y=16'H0a0a;   mode = 1;  func[2] = 1;  func[1:0] = 2'b11;       accurate = x*y;
//           #5  x=16'H5B5B ;y=16'H5757;   mode = 1;  func[2] = 1;  func[1:0] = 2'b11;       accurate = x*y;
//           #5  x=16'HFFFF ;y=16'HFFFF;   mode = 1;  func[2] = 1;  func[1:0] = 2'b11;       accurate = x*y;


           #5  x=0;y=0;                  mode = 1;  func[2] = 0;  func[1:0] = 2'b01;       accurate = x*y;
           #5  x=16'H3333 ;y=16'H0B0B;   mode = 1;  func[2] = 0;  func[1:0] = 2'b01;       accurate = x*y;
           #5  x=16'H2B2B ;y=16'H0a0a;   mode = 1;  func[2] = 0;  func[1:0] = 2'b01;       accurate = x*y;
           #5  x=16'H5B5B ;y=16'H5757;   mode = 1;  func[2] = 0;  func[1:0] = 2'b01;       accurate = x*y;
           #5  x=16'HFFFF ;y=16'HFFFF;   mode = 1;  func[2] = 0;  func[1:0] = 2'b01;       accurate = x*y;


          #5  x=0;y=0;                  mode = 1;  func[2] = 0;  func[1:0] = 2'b10;      accurate = x*y;
           #5  x=16'H3535 ;y=16'H0B0B;   mode = 1;  func[2] = 0;  func[1:0] = 2'b10;       accurate = x*y;
           #5  x=16'H2B2B ;y=16'H1010;   mode = 1;  func[2] = 0;  func[1:0] = 2'b10;       accurate = x*y;
           #5  x=16'H5B5B ;y=16'H5757;   mode = 1;  func[2] = 0;  func[1:0] = 2'b10;       accurate = x*y;
           #5  x=16'HFFFF ;y=16'HFFFF;   mode = 1;  func[2] = 0;  func[1:0] = 2'b10;       accurate = x*y;




//	  #5  x=51;y=11;     mode = 0;  func = 1;      accurate = x*y;
//          #5  x=43;y=10;     mode = 0;  func = 1;      accurate = x*y;
//          #5  x=91;y=87;     mode = 0;  func = 1;      accurate = x*y;
//          #5  x=0;y=0;       mode = 0;  func = 1;      accurate = x*y;
//          #5  x=255;y=255;   mode = 0;  func = 1;      accurate = x*y;
////

//	      #5  x=51;y=11;     mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
//          #5  x=43;y=10;     mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
//          #5  x=91;y=87;     mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
//          #5  x=0;y=0;       mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
//          #5  x=255;y=255;   mode = 1;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x*y;
////

//          #5  x=300;y=300;           mode = 0;  func[2] = 1;  func[1:0] = 2'b11;      accurate = x/y;
//	      #5  x=285;y=6000; 	     mode = 0;  func[2] = 1;   func[1:0] = 2'b11;     accurate = x/y;
//          #5  x=2515;y=500;          mode = 0;  func[2] = 1;   func[1:0] = 2'b11;     accurate = x/y;
//  	      #5  x=6000;y=50;           mode = 0;  func[2] = 1;   func[1:0] = 2'b11;     accurate = x/y;





//       data_file = $fopen("/afs/pd.inf.tu-dresden.de/users/muza153a/Desktop/data.csv");
//       $fdisplay(data_file, "X_Upper, Y_Upper, Result_Upper,  Accurate_Upper, X_Lower, Y_Lower, Result_lower, Accurate_Lower");

//      mode = 0;
//      for (func_var = 0; func_var <1; func_var= func_var + 1) begin
//                  func[2] = func_var;
//                  func[1:0] = 2'b00;
//        for (i=0; i<65536; i=i+1)begin
//           for(j=0; j<65536; j=j+1) begin
//            x = $unsigned(i); y=$unsigned(j);

//            if (func_var == 0) begin
//                accurate = x*y;
//              end
//            else if (func_var ==1) begin
//                accurate = x/y;
//	           end
//                $fmonitor(data_file, "%d,%d,%d, %d", x, y, result_o_hybrid, accurate);
//                counter = counter + 1;
//            #5;
//          end
//        end
//       end




//        #5;
//       mode = 1'b1;
//       func[2] = 1'b0;
//       for (func_var = 0; func_var <3; func_var= func_var + 1) begin
//       func[1:0] = func_var;
//         for (i=0; i<256; i=i+1)begin
//            for(j=0; j<256; j=j+1) begin
//               x[15:8] = $unsigned(i);  x[7:0] = $unsigned(i);  y [15:8]=$unsigned(j);   y [7:0]=$unsigned(j);
//             if (func_var == 0) begin
//                    accurate_upper = x[15:8] * y[15:8];
//                    accurate_lower = x[7:0] * y[7:0];
//                    accurate = { accurate_upper,accurate_lower};
//                 end
//             else if (func_var ==1) begin

//                    accurate_upper = x[15:8] * y[15:8];
//                    accurate_lower = x[7:0] / y[7:0];
//                    accurate = { accurate_upper,accurate_lower};
//                 end
//              else if (func_var ==2) begin

//                    accurate_upper = x[15:8] / y[15:8];
//                    accurate_lower = x[7:0] * y[7:0];
//                    accurate = { accurate_upper,accurate_lower};
//                 end

//            else  begin
//                    accurate_upper = x[15:8] / y[15:8];
//                    accurate_lower = x[7:0]  / y[7:0];
//                    accurate = { accurate_upper,accurate_lower};
//                  end


//             error_lower =  (accurate_lower > result_o_hybrid[15:0])   ?   (accurate_lower - result_o_hybrid[15:0])/accurate_lower :  (result_o_hybrid[15:0] -accurate_lower)/accurate_lower;
//             error_upper =  (accurate_upper > result_o_hybrid[31:16])   ?   (accurate_upper - result_o_hybrid[31:16])/accurate_upper :  (result_o_hybrid[31:16] -accurate_upper)/accurate_upper;

//                 $fmonitor(data_file, "%d,%d,%d,%d,%d, %d,%d, %d, %f, %f", x[15:8], y[15:8], result_o_hybrid[31:16], accurate_upper, x[7:0], y[7:0], result_o_hybrid[15:0], accurate_lower, error_lower, error_upper);
//             #5;
//           end
//         end
//        end

//    	$fclose(data_file);







	  #5;

    end
endmodule
