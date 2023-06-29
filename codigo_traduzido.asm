addi $s0, 0        # $s0 (quantidade_de_par) = 0
addi $s2, 0        # $s2 (i) = 0
addi $s5, 0        # $s5 = 0 para a posição inicial do vetor
addi $t0, 1        # $t0 = 1 
sw $t0, $s5        # coloca $t0 = 1 na primeira posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 2 
sw $t0, $s5        # coloca $t0 = 2 na segunda posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 3 
sw $t0, $s5        # coloca $t0 = 3 na terceira posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 4
sw $t0, $s5        # coloca $t0 = 4 na quarta posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 5 
sw $t0, $s5        # coloca $t0 = 5 na quinta posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 6 
sw $t0, $s5        # coloca $t0 = 6 na sexta posição do vetor $s5
addi $s5, 3        # $s5 = $s5 + 3 
addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor
addi $t0, 1        # $t0 = 7 
sw $t0, $s5        # coloca $t0 = 7 na sétima posição do vetor $s5
subi $s5, 3        # $s5 = $s5 - 3
subi $s5, 3        # $s5 = $s5 - 6
subi $s5, 3        # $s5 = $s5 - 9
subi $s5, 3        # $s5 = $s5 - 12
subi $s5, 3        # $s5 = $s5 - 15
subi $s5, 3        # $s5 = $s5 - 18
subi $s5, 3        # $s5 = $s5 - 21
subi $s5, 3        # $s5 = $s5 - 24 para chegarmos no início do vetor

LOOP:
    addi $s4, 3        # $s4 = $s4 + 3 
    addi $s4, 3        # $s4 = $s4 + 6 
    addi $s4, 1        # $s4 = 7 para comparação do for
    beq $t0, FIM       # se i = 7, pula para o FIM. Valor 7 está em $s4
    lw $s1, $s5        # $t2 recebe o valor do endereço A[i]
    sip $s1, $zero     # $s1 = 1, se A[i] tiver o último bit = 0
    subi $s4, 3        # $s4 = $s4 - 3 
    subi $s4, 3        # $s4 = $s4 - 6 
    subi $s4, 1        # $s4 = $s4 - 7 = 0
    addi $t0, 1        # i = i + 1
    addi $s5, 3        # $s5 = $s5 + 3 
    addi $s5, 1        # $s5 = $s5 + 4 para a próxima posição do vetor  
    beq $s1, LOOP      # se o número não for par, realiza o jump
    addi $s0, 1        # quantidade_par = quantidade_par + 1
    j LOOP

FIM:
    hlt               # finaliza o programa