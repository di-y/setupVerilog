module chipInterface
  (input  logic SW[17:0],
	output logic LEDR[17:0]);

       multiplexer muxUnit (LEDR[17], SW[0],
			    SW[1], SW[17]);
endmodule: chipInterface
