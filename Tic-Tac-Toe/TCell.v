module TCell(input clk, input set,input reset,input set_symbol, output reg valid,output reg symbol);
    initial begin
        valid=0;
    end
    always @(clk,set,reset)begin
        if(clk)begin
            if(reset)begin
                valid=0;
            end else if(set && valid==0)begin
                symbol=set_symbol;
                valid=1;
            end
        end
    end

endmodule