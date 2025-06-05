.text
.global <main>
.global mayor 

main: 
    #TEST PRIMERA RAMA 
    li a0, 2 # x1
    li a1, 4 # y1
    li a2, 1 # x2
    li a3, 1 # y2
    jal ra, mayor # salto
    li a4, 1 # valor esperado 
    bne a0,a4, noFunciona # a0 != a4 no funciona 
    
    # TEST SEGUNDA RAMA
    li a0, 1 # x1
    li a1, 1 # y1
    li a2, 4 # x2
    li a3, 2 # y2
    jal ra, mayor # salto
    li a4, -1 # valor esperado 
    bne a0,a4, noFunciona # a0 != a4 no funciona 
    
    #TEST TERCERA RAMA
    li a0, 1
    li a1, 2
    li a2, 1
    li a3, 100
    jal ra, mayor 
    li a4, 0 
    bne a0,a4, noFunciona
    funciona:
        li a1, 1 # funciona 
        j fin
    noFunciona:
        li a1, 0 # no funciona 
        j fin
        
    fin: j fin #termina test 
mayor:
    addi sp,sp,-16
    sw ra, 0(sp)
    bgt a0,a2,case1
    
    
    bgt a2,a0,case2
    j caso0 
    
    case2: 
        bgt a3,a1, casoMenosUno
        j caso0
    case1: 
        bgt a1,a3, caseUno
        j caso0 
    caseUno:
        li a0,1
        lw ra, 0(sp) 
        addi sp,sp,16
        ret
        
    casoMenosUno:
        li a0,-1
        lw ra, 0(sp)
        addi sp,sp,16
        ret
    caso0: 
        li a0,0
        lw ra, 0(sp) 
        addi sp,sp,16
        ret