module current_symbol_calculator(input [8:0] valid,output set_symbol);
    wire x;
    xor(x,valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],valid[8]);
    buf(set_symbol,~x);
endmodule