module testBench();

  logic w1,w2,w3,w4,w5,w6,w7;

  comb_nands   mydesign(w1,w2,w3,w4,w5,w6,w7);
  test_module tester(w1,w2,w3,w4,w5,w6,w7);

endmodule: testBench

module comb_nands(
  input  logic A,B,C,D,E,F,
  output logic G);  //We're implementing: AB + EF' + D'F'

  logic D_not, F_not;
  logic f1, f2, f3;

  not  d_inv(D_not,D), 
       f_int(F_not,F);
  nand g1(f1,A,B), 
       g2(f2,C,F_not), 
       g3(f3,D_not,F_not), 
       g4(G,f1,f2,f3);

endmodule: comb_nands

module test_module(
  output logic test_a, test_b, test_c, test_d, test_e, test_f,
  input  logic test_g);

  logic [6:0] tb;
  logic       G;

  assign {test_a, test_b, test_c, test_d, test_e, test_f} = tb;
  assign G = test_g;

  initial begin
    $monitor($time,,,"ABCDEF=%d, G=%b", tb, G);

    for(tb=0; tb < 10; tb = tb + 1)
      #10;

    #10 $finish;

  end

endmodule: test_module
