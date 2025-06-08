main:       #test1
    li a0, 5
    jal ra, FUNCION
    li a2, -5
    bne a0, a2, noFunciona
    #test 2
        li a0, 0
    jal ra, FUNCION
    li a2, 0
    bne a0, a2, noFunciona
funciona:   li a1, 1
            j fin
noFunciona: li a1, 0
fin:        j fin

FUNCION:    
    addi sp, sp, -16
    sw ra, (0)sp
    not a0, a0
    addi a0, a0, 1
    lw ra, 0(sp)
    addi sp, sp, 16
    ret #epilogo, return
