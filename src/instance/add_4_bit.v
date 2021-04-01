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


module add_4_bit#(parameter N = 4
              ) (mode,
	         mode_func,
		 func,
		 a,
                 b,
		 c,
                 result
                );
   input	      mode;
   input 	      mode_func;
   input              func;
   input      [N-1:0] a;
   input      [N-1:0] b;
   input              c;
   output reg [N+1:0] result;

   always@(*) begin
    if (mode == 0)
    	result = (mode_func ==0) ?  (a + b + c) : (a - b -c);
    else
        result = (func ==0) ?  (a + b + c) : (a - b -c);
    end
endmodule
