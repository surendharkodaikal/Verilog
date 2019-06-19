module SRAM_6T(WL,BL,BLB);
input WL,BL,BLB;
nmos#(10)nmos(BLB,w2,WL);
nmos#(31)nmos(w4,vss.w2);
pmos#(31)pmos(w2,WL,w4);
pmos#(31)nmos(w2,vss,w4);
pmos#(31)pmos(w4,WL,w2);
pmos#(31)nmos(w4,BL,WL);
endmodule
