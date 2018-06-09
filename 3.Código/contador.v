

//modulo del contador
module contador (inout wire [3:0] Q, input wire C);
    //Declaramos arrays de tipo wire para poder almacenar la informacion que sale del llamamiento a los modulos de 	biestable
    wire [3:0] QNEG; //salidas negadas
    wire [3:0] J; // entradas J
    wire [3:0] K; //entradas K
    //declaramos todos los cables que van a ser necesarios para unir las puetas con el siguiente esquema: wire 			wire_tipoDePuerta_Numero_InputAlQueConecta
   	 //nota: en el esquema del circuito se especifica cual es la funcion de cada cable
        //J3
            wire wireAND1J3, wireAND2J3;
        //K3
            wire wireAND1K3, wireAND2K3;
        //J2
            wire wireAND1J2,wireAND2J2,wireAND3J2;
        //K2
            wire wireANDK2;
	//aqui no hizo falta implementar una parte de la funcion, ya que estaba implementada en wireAND3J2
        //J0
            wire wireAND1J0, wireAND2J0, wireAND3J0;
    //implementamos las puetas para generar J y K con el siguiente esquema: puerta_numero_InputAlQueConecta 
	//nota:si es de tipo OR no lleva numero ya que solo hay una por funcion logica
	//nota: las conexiones van en orden numerico de 0 a 3
        //J3
            and and1J3 (wireAND1J3,QNEG[0],QNEG[1],Q[2]);
            and and2J3 (wireAND2J3,Q[0],Q[1],QNEG[2]);
            or orJ3 (J[3],wireAND1J3,wireAND2J3);
        //K3
            and and1K3 (wireAND1K3,Q[0],QNEG[1],Q[2]);
            and and2K3 (wireAND2K3,QNEG[0],Q[1],Q[2]);
            or orK3 (K[3],wireAND1K3,wireAND2K3);
        //J2
            and and1J2 (wireAND1J2,Q[0],Q[1]);
            and and2J2 (wireAND2J2,QNEG[0],QNEG[1]);
            and and3J2 (wireAND3J2,QNEG[1],Q[3]);
            or orJ2 (J[2],wireAND1J2,wireAND2J2,wireAND3J2);
        //K2
            and and1K2 (wireAND1K2,QNEG[0],Q[1],QNEG[3]);
            or orK2 (K[2],wireAND3J2,wireAND1K2);
        //J1
            and andJ1 (J[1],QNEG[0],Q[2]);
        //K1
            and andK1 (K[1],Q[0],QNEG[2]);
        //J0
            and and1J0 (wireAND1J0,QNEG[1],Q[2],Q[3]);
            and and2J0 (wireAND2J0,Q[1],QNEG[2]);
            and and3J0 (wireAND3J0,Q[1],QNEG[3]);
            or orJ0 (J[0],wireAND1J0, wireAND2J0, wireAND3J0);
        //K0
            or orK0 (K[0],Q[2],QNEG[3]);
    //Hacemos la llamada al biestable JK, y le damos las inputs J,K y C, y sacamos los ouputs Q
    //(llamada al modulo) (nombre) (Salida Q, Salida Q negada, entrada J, entrada K, reloj)
    biestableJK JK3 (Q[3],QNEG[3],J[3],K[3],C);
    biestableJK JK2 (Q[2],QNEG[2],J[2],K[2],C);
    biestableJK JK1 (Q[1],QNEG[1],J[1],K[1],C);
    biestableJK JK0 (Q[0],QNEG[0],J[0],K[0],C);
	initial
	   begin
	   end
endmodule
