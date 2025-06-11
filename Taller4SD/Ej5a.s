.text
.global main
.global Factorial
.global mult
main:
    #Test 1
    li a0, 4              # calcular factorial 4
    jal ra, Factorial     # guardo ra y llamo la funcion factorial

    li t0, 24             # 4! = 24
    bne a0, t0, noFunciona
    
    #Test 2
    li a0, 0             # calcular factorial de caso base
    jal ra, Factorial     # guardo ra y llamo la funcion factorial

    li t0, 1            # 0! = 1
    bne a0, t0, noFunciona

funciona:
    li a1, 1              # ok funcionan
    j fin

noFunciona:
    li a1, 0              # no funcionan 
    j fin

fin:
    j fin                # Bucle infinito para terminar
mult:  # funcion para multiplicar
    addi sp, sp, -16 
    sw ra, 0(sp)

    mv t2, a0         # multiplicando
    mv t3, a1         # multiplicador
    li a0, 0          # resultado acumulado

mult_loop: 
    beq t3, zero, mult_end  # si multiplicador == 0, terminar
    add a0, a0, t2          # a0 += multiplicando
    addi t3, t3, -1         # multiplicador--
    j mult_loop

mult_end:
    lw ra, 0(sp)
    addi sp, sp, 16
    ret
Factorial:
    addi sp, sp, -16      # Prólogo: reservar 16 bytes de stack
    sw a0, 4(sp)          # guardar parametro n en a0
    sw ra, 0(sp)          # Guardamos dirección de retorno

    li t0, 1              # t0 = 1
    bgt a0, t0, else_case # Si n > 1, ir al caso recursivo

   # Caso base: factorial(0) o factorial(1) = 1
    li a0, 1
    addi sp, sp, 16       # Liberamos stack
    ret                 # Volvemos al llamador

else_case:
    addi a0, a0, -1       # a0 = a0 - 1
    jal ra, Factorial     # Llamada recursiva: factorial(n - 1)

      # Liberar stack
    lw t1, 4(sp)          # Recuperar n original desde stack
    mv a1,t1
    jal ra, mult       # res =  n * factorial(n - 1)

    lw ra, 0(sp)          # Recuperar ra
    addi sp, sp, 16  
    ret                 # Volver al llamador