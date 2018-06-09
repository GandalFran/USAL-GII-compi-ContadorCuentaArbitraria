

//modulo de test
module test;
    wire [3:0] Q; //salidas de los biestables
    reg C; //reloj
    //llamada al modulo del contador (llamada al modulo) (nombre) (salidas Q, reloj)
    contador CONT (Q,C);
    //generamos elreloj: negamos C continuamente
    always #10 C=~C;
  //instrucciones para la ejecucion del modulo test	
  initial
  begin
    //declaramos la monitorizacion del cronograma y creamos 
    $dumpfile("cronograma.dmp"); 
    $dumpvars(1,CONT);
    $dumpon;
    C='b0;
    //sacamos por pantalla los resultados
    $monitor($time, " C=%b | Q=%d| Q=%b%b%b%b \n",C,Q,Q[3],Q[2],Q[1],Q[0]);
  //finalizamos la ejecucion a los 160 tics (hay 8 numeros y vamos a 10 tics por numero, asique hacemos dos ciclos)
  #160 $finish; 
  //se finaliza el cronograma
  $dumpoff; 
  end
endmodule
