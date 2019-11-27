`include "defines.v"

module inst_rom(
    input wire ce,
    input wire[`InstAddrBus] addr,
    output reg[`InstBus] inst
);

    reg[`InstBus] rom[0:`InstMemNum - 1];

    initial $readmemh ("C:/Users/yy/����/RISC/inst_rom.data", rom);

    always @ (*) begin
        if (ce == `ChipDisable) begin
            inst <= 32'h0;
        end else begin
            inst <= rom[addr[`InstMemNumLog2 + 1 : 2]]; // 除以4寻址
        end
    end

endmodule