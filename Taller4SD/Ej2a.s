.text
.global <main>
.global FibonacciIterativo 

main: 
    #Test1
    li a0, 3 
    jal ra, FibonacciIterativo
    li a1, 2
    bne a0, a1, noFunciona
    #Test2 
    li a0, 0 
    jal ra, FibonacciIterativo
    li a1,0 
    bne a0,a1,noFunciona
    funciona:
        li a1,1 
        j fin
    noFunciona:
        li a1,0
        j fin
    fin: j fin
    
FibonacciIterativo:
    addi sp,sp,-16 #Prologo
    sw ra, 0(sp)  #Prologo
    
    li t0, 0 #Anterior1 = 0 
    li t1, 1 #Anterior2 = 1 
    li t2,0  # i = 0 
    mv t3, a0 # paso el valor n a t3 
    for:
    beq t3, t2, termina # i == n termina 
    add a0, t0,t1 
    mv t0,t1 #Anterior1 = Anterior2
    mv t1,a0 # Anterior2 = res
    addi t2,t2,1 # i++
    j for
    termina: 
        mv a0,t0 # return anterior1 
        lw ra, 0(sp) #epilogo
        addi sp,sp,16 #epilogo
        ret
    