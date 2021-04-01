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


module twos_complement_16#(parameter N = 8
              ) (
                mode,
                mode_func,
                func,
                in,
                out
                );

   input              mode;
   input              mode_func;
   input      [1:0]   func;
   input      [N-1:0] in;
   output reg [N-1:0] out;

   always@(*) begin
    if( mode == 0)
      out  = (mode_func) ? ~(in)  + 1'b1 : in;
    else
      out[N -1:N/2]  = (func[1]) ? ~(in[N -1:N/2])  + 1'b1 : in[N -1:N/2];
      out[N/2 -1:0]  = (func[0]) ? ~(in[N/2 -1:0])  + 1'b1 : in[N/2 -1:0];
  end
endmodule
