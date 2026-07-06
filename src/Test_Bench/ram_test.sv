class ram_test;

  virtual ram_if drv_vif;
  virtual ram_if mon_vif;
  virtual ram_if ref_vif;
  ram_environment env;

  function new(virtual ram_if drv_vif,
                          virtual ram_if mon_vif,
                          virtual ram_if ref_vif);
    this.drv_vif=drv_vif;
    this.mon_vif=mon_vif;
    this.ref_vif=ref_vif;
  endfunction

  task run();
    env=new(drv_vif,mon_vif,ref_vif);
    env.build;
    env.start;
  endtask
endclass

class test_write extends ram_test;
  ram_transaction_write  trans_write;
  function new(virtual ram_if drv_vif,virtual ram_if mon_vif,
                           virtual ram_if ref_vif);
     super.new(drv_vif,mon_vif,ref_vif);
  endfunction
  task run();
    env=new(drv_vif,mon_vif,ref_vif);
    env.build;
    begin
      trans_write = new();
      env.gen.blueprint= trans_write;
    end
    env.start;
  endtask
endclass

class test_read extends ram_test;
  ram_transaction_read  trans_read;
  function new(virtual ram_if drv_vif,virtual ram_if mon_vif,
                           virtual ram_if ref_vif);
     super.new(drv_vif,mon_vif,ref_vif);
  endfunction
  task run();
    env=new(drv_vif,mon_vif,ref_vif);
    env.build;
    begin
      trans_read = new();
      env.gen.blueprint= trans_read;
    end
    env.start;
  endtask
endclass


