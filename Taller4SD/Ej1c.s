.text
.global <main>
.global FUNCION

main: 
    #TEST1
    addi sp,sp,-16 # Correcion
    li a0, 1 #Parametro de la funcion
    li a1, 2 #Parametro de la funcion
    sw a1, 0(sp) # Correcion 
    jal ra, FUNCION #Se guarda el PC actual en ra y salta a la FUNCION
    li a3, 3 #Valor esperado de retorno de la funcion
    bne a0, a3, noFunciona # (4*1 - 2/2) != 3 #Si a0 != a3 no funcion y termina
    #TEST2 
    lw a1, 0(sp) #Correcion 
    li a0, 3 #Parametro de entrada de la funcion
    sw a0, 0(sp) #Correcion 
    jal ra, FUNCION #Se guarda el PC actual en ra y salta a la FUNCION
    li a3, 11 #Valor de retorno esperado
    bne a0, a3, noFunciona # (4*3 - 2/2) != 11 si a0 != a3 termina 
    #TEST3 
    lw a0, 0(sp) #Correcion 
    li a1, 12 #Parametro de entrada de la funcion
    jal ra, FUNCION #Se guarda el PC actual en ra y salta a la FUNCION
    li a3, 6 #Valor esperado de retorno
    bne a0, a3, noFunciona # (4*3 - 12/2) != 6 a0 != a3 termina 
funciona: 
    addi sp,sp,16
    li a1, 1 # is funciona a1 = 1 
    j fin # termina test 
noFunciona: 
    addi sp,sp,16
    li a1, 0 # si no funciona a1 = 0
    fin: 
    j fin # termina (loop infinito)
FUNCION: #Nombre declarativo: tranformacionDeIndice 
    addi sp, sp, -4 #Prologo, se reserva espacio en el stack 
    sw ra, (0)sp  #Prologo, se guarda la direccion de retorno en el stack 
    slli a2, a0, 2 # a2 = a0 * 4 
    srai a1, a1, 1 # a1 = a1 / 2 (extiende signo)
    sub a0, a2, a1 # a0 = a2 - a1 
    lw ra, (0)sp #Epilogo, Restaura la direccion de retorno en ra 
    addi sp, sp, 4 #Epilogo, Borra el espacio almacenado en la pila 
    ret #Salta a el PC guardo en ra

#Error en los tests 2 y 3, el error viene de esperar que los resgistros a0,a1 no sean 
#modificados en la funcion, es culpa del programador B 
#Solucion podemos cargar de nuevo los parametros esparados con un load inmediate o 
#guardarlos en la pila respetando la convencion 