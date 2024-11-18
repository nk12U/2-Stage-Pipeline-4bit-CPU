module rom(
	address,
	q
);

  parameter FILENAME = "NULL";

  input [11:0] address;
  output [7:0] q;

  reg [7:0] rom_r[0:4096-1];

  initial begin
    $readmemh(FILENAME, rom_r);
  end
  
  assign q = rom_r[address];
endmodule
