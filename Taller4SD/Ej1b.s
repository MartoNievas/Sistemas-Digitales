.text
.global <main>
.global FUNCION

main: 
    li a0, 4 # Parametros de la funcion  
    li a1, 6 # Parametros de la funcion
    jal ra, FUNCION # Me gurado la direccion de retorno en ra y salto a FUNCION
    li a2, 10 # Valor esperado de la funcion 
    bne a0, a2, noFunciona # si a0 != a2 no funciona 
funciona: 
    li a1, 1 # caso contrario funcion a1 = 1 
    j fin
noFunciona: 
    li a1, 0 # si no funciona a1 = 0 
    fin: 
    j fin # termina el test (loop infinito)
FUNCION:  #sumaDe2Numeros
    addi sp, sp, -16 #Prologo, se reservan una palabra en el stack 
    sw ra, (0)sp    #Prologo, se guarda en el stack la direccion de retorno  
    add a0, a0, a1  #Cuerpo, se guarda la suma de los parametro en a3 = a0 + a1
    lw ra, (0)sp #Epilogo, restaura la direccion de retorno
    addi sp, sp, 16 # Epilogo, borra el espacio reservado en el stack
    ret # Salta a la direccion de retorno

#Errores: En la funcion el valor de retorno se esta guardando en a3 lo cual no cumple la convencion 
#luego el espacio del stack no cumple con la convencion congruente a 0 mod 16 
#La culpa es del porgramador A 
#Solucion: reservar 16 bytes en el stack y cambiar el valor de retorno a a0  