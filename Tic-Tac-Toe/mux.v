module mux_2x1(output out, input [1:0] in, input sel);
    not(n,sel);
    and(r1,n,in[0]);
    and(r2,sel,in[1]);
    or(out,r1,r2);
endmodule