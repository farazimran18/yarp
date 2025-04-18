import yarp_pkg::*;

module yarp_instr_mem (
    input logic clk,
    input logic reset_n,

    input logic [XLEN-1:0] instr_mem_pc_i,

    output logic            instr_mem_req_o,
    output logic [XLEN-1:0] instr_mem_addr_o,
    input  logic [XLEN-1:0] mem_rd_data_i,

    output logic [XLEN-1:0] instr_mem_instr_o
  );

  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      instr_mem_req_o <= '0;
    end else begin
      instr_mem_req_o <= '1;
    end
  end

  assign instr_mem_addr_o  = instr_mem_pc_i;
  assign instr_mem_instr_o = mem_rd_data_i;

endmodule
