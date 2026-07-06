//`include "defines.svh"

class ram_generator;

  ram_transaction         blueprint;   
  ram_transaction_write   wr_trans;
  ram_transaction_read    rd_trans;
  ram_transaction         rw_trans;

  mailbox #(ram_transaction) mbx_gd;

  function new(mailbox #(ram_transaction) mbx_gd);
    this.mbx_gd = mbx_gd;
    blueprint = new();   
  endfunction

task start();

  wr_trans = new();
  assert(wr_trans.randomize());
  mbx_gd.put(wr_trans.copy());
  $display(
    "GENERATOR Randomized transaction data_in=%0h, write_enb=%0d, read_enb=%0d, address=%0h @%0t",
    wr_trans.data_in, wr_trans.write_enb, wr_trans.read_enb, wr_trans.address, $time
  );

  rd_trans = new();
  assert(rd_trans.randomize() with { address == wr_trans.address; });
  mbx_gd.put(rd_trans.copy());
  $display(
    "GENERATOR Randomized transaction data_in=%0h, write_enb=%0d, read_enb=%0d, address=%0h @%0t",
    rd_trans.data_in, rd_trans.write_enb, rd_trans.read_enb, rd_trans.address, $time
  );

rw_trans = new();
  assert(rw_trans.randomize() with {
    write_enb == 1;
    read_enb  == 1;
  });
  mbx_gd.put(rw_trans.copy());
  $display(
    "GENERATOR DIRECTED transaction data_in=%0h, write_enb=%0d, read_enb=%0d, address=%0h @%0t",
    rw_trans.data_in, rw_trans.write_enb, rw_trans.read_enb, rw_trans.address, $time
  );

  // Remaining pairs to fill out num_transactions.
  for (int i = 0; i < (`num_transactions - 3) / 2; i++) begin

    wr_trans = new();
    assert(wr_trans.randomize());
    mbx_gd.put(wr_trans.copy());
    $display(
      "GENERATOR Randomized transaction data_in=%0h, write_enb=%0d, read_enb=%0d, address=%0h @%0t",
      wr_trans.data_in, wr_trans.write_enb, wr_trans.read_enb, wr_trans.address, $time
    );

    rd_trans = new();
    assert(rd_trans.randomize() with { address == wr_trans.address; });
    mbx_gd.put(rd_trans.copy());
    $display(
      "GENERATOR Randomized transaction data_in=%0h, write_enb=%0d, read_enb=%0d, address=%0h @%0t",
      rd_trans.data_in, rd_trans.write_enb, rd_trans.read_enb, rd_trans.address, $time
    );

  end

endtask

endclass
             

