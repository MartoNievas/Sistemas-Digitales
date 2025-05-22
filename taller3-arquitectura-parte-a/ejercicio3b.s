.text
.global <main>

<main>: 

addi x11 x0 4 # x11 = 4 
lw x12 0 x11  #la direccion 4 es x12 = 0005a603 
addi x13 x0 4 # x13 = 4 
lw x13 0 x13 # x13 = 0005a603 
lw x13 0 x13 # x13 = MEMO[0005a603] = 0 
beq x12 x13 -20 #<main> 
jal x0 8 #<guardar>

jal x0 0 #<fin_programa>

lui x14 0xfffa6
addi x14 x14 -1539
add x12 x14 x12
sw x11 40 x12
jal x0 -20 #<fin_programa>