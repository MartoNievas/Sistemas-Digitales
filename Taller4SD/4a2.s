.data
mi_arreglo: .word 10, -20, 30

.text
main:
    la a0, mi_arreglo
    li a1, 3

    jal ra, FUNCION

    lw t0, 0(a0)
    li t1, -10
    bne t0, t1, noFunciona_arreglo

    lw t0, 4(a0)
    li t1, 20
    bne t0, t1, noFunciona_arreglo

    lw t0, 8(a0)
    li t1, -30
    bne t0, t1, noFunciona_arreglo

    j funciona_arreglo

noFunciona_arreglo:
    li a1, 0
    j fin

funciona_arreglo:
    li a1, 1
    j fin

fin:
    j fin
    
FUNCION:
    #prologo
    addi sp, sp, -16
    sw s0, 0(sp)
    sw s1, 4(sp)
    mv s0, a0 
    mv s1, a1
    #
    #cuerpo
    li t0, 0
    ciclo:
        beq t0, s1, fin_ciclo
        lw t1, 0(s0)
        not t1, t1
        addi t1, t1, 1
        sw t1, 0(s0) 
        addi s0, s0, 4  
        addi t0, t0, 1
        j ciclo
    #
    #epilogo
    fin_ciclo:
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 16
    ret #epilogo, return
