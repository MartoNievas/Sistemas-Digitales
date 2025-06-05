.text
.global <main>
.global FUNCION


main: 
    li s1, 2024 # Se carga un inmediato a s1 
    mv a0, s1 # se copia el valor de s1 a a0 como argumento de la funcion 
    jal ra, FUNCION # guardo PC actual y llamo a la funcion  
    add a0, s1, a0 # el valor retornado por FUNCION lo suma le suma s1 
    bnez a0, noFunciona # compara a0 == 0 
funciona: 
    li a1, 1 # Si funciona a1 = 1 
    j fin # termina 
noFunciona: 
    li a1, 0 # si no funciona a1 = 0 
    fin: j fin # termina (loop infinito)
FUNCION: # nombre de la funcion inverso_aditivo
    addi sp, sp, -16 #Prologo, reservo 4 bytes en el stack   
    sw ra, (0)sp # Guarda la direccion de retorno en el stack primera posicion 
    not t0, a0 # Negacion bit a bit s1 = not(a0)
    addi a0, t0, 1 # a0 = a0 + 1 
    lw ra, (0)sp #Epilogo, restaurar la direccion de retorno que esta almacenado en la pila 
    addi sp, sp, 16 #Epilogo, limpia el espacio reservarso en la pila 
    ret # salta a la direccion de retorno 
    
# Errores: No se preserva el valor de s1 en la funcion, tampoco cumple la convencion 
# de guardar en el stack un espacio congruente a mod 16. 
# La culpa es del programador A 
# solucion: usar un registro temporal t0-t6 para almacenar not(a0) y en la pila reservar 
# 16 bytes 