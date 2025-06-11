`include "TCell.v"
`include "mux.v"
`include "row_col_decoder.v"
`include "current_symbol_calculator.v"
`include "check_win.v"

module TBox(
    input clk, 
    input set, 
    input reset, 
    input [1:0] row, 
    input [1:0] col,
    output [8:0] valid, 
    output [8:0] symbol, 
    output [1:0] game_state
    );
    wire [8:0] choose;
    row_col_decoder dec(row,col,choose);
    wire set_symbol;  
    wire [1:0] win;
    current_symbol_calculator c(valid,set_symbol);
    TCell T1(clk,set&choose[0]&~game_state[0]&~game_state[1],reset,set_symbol,valid[0],symbol[0]);
    TCell T2(clk,set&choose[1]&~game_state[0]&~game_state[1],reset,set_symbol,valid[1],symbol[1]);
    TCell T3(clk,set&choose[2]&~game_state[0]&~game_state[1],reset,set_symbol,valid[2],symbol[2]);
    TCell T4(clk,set&choose[3]&~game_state[0]&~game_state[1],reset,set_symbol,valid[3],symbol[3]);
    TCell T5(clk,set&choose[4]&~game_state[0]&~game_state[1],reset,set_symbol,valid[4],symbol[4]);
    TCell T6(clk,set&choose[5]&~game_state[0]&~game_state[1],reset,set_symbol,valid[5],symbol[5]);
    TCell T7(clk,set&choose[6]&~game_state[0]&~game_state[1],reset,set_symbol,valid[6],symbol[6]);
    TCell T8(clk,set&choose[7]&~game_state[0]&~game_state[1],reset,set_symbol,valid[7],symbol[7]);
    TCell T9(clk,set&choose[8]&~game_state[0]&~game_state[1],reset,set_symbol,valid[8],symbol[8]);
    check c1(symbol,valid,win);
    and(v,valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],valid[8]);
    and(t1,~win[0],~win[1],v);
    mux_2x1 m1(game_state[0],{1'b1,win[0]},t1);
    mux_2x1 m2(game_state[1],{1'b1,win[1]},t1);
endmodule