`include "ram_if.sv"
`include "ram.v"
module top();

  import ram_package::*;

  logic clk;
  logic reset;

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

 initial begin
    reset=1;

    @(posedge clk);
    reset = 0;
    repeat (1) @(posedge clk);
    reset = 1;

  end

  ram_if intrf(clk, reset);

  ram DUV (
    .data_in   (intrf.data_in),
    .write_enb (intrf.write_enb),
    .read_enb  (intrf.read_enb),
    .data_out  (intrf.data_out),
    .address   (intrf.address),
    .clk       (clk),
    .reset     (reset)
  );

    ram_test test = new(intrf.DRV, intrf.MON, intrf.REF_SB);
 // test_read test = new(intrf.DRV, intrf.MON, intrf.REF_SB);
 // test_write test = new(intrf.DRV, intrf.MON, intrf.REF_SB);

initial begin
    test.run();
    $finish();
  end

endmodule
