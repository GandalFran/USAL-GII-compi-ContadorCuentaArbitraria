//modulo del biestable JK
module biestableJK (output reg Q, output wire NQ, input wire J, input wire K,   input wire C);
  //hacemos Q negado, que es la salida secundara del biestable JK
  not(NQ,Q);
  initial
  begin
    //inicializamos Q a 0 para evitar errores
    Q='b0;
  end    
  //codificamos los biestables (por flanco de bajada), y su modelo de comportamiento
  always @(posedge C)
    case ({J,K})
      2'b10: Q='b1; //set
      2'b01: Q='b0; //reset
      2'b11: Q=~Q;  //complemento
    endcase
endmodule
