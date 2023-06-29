add $s0, $zero, $zero    # $s0 (quantidade_de_par) = 0
add $s2, $zero, $zero    # $s2 (i) = 0
addi $s3, $zero, 7       # $s3 = 7 para comparação do for
addi $s4, $zero, 2       # $s4 = 2 para verificação se o número é par
addi $t0, $zero, 1       # $t0 = 1 
sw $t0, 0($s1)           # coloca $t0 = 1 na primeira posição do vetor $s1
addi $t0, $t0, 1         # $t0 = 2 
sw $t0, 4($s1)           # coloca $t0 = 2 na segunda posição do vetor $s1
addi $t0, $t0, 1         # $t0 = 3
sw $t0, 8($s1)           # coloca $t0 = 3 na terceira posição do vetor $s1
addi $t0, $t0, 1         # $t0 = 4
sw $t0, 12($s1)          # coloca $t0 = 4 na quarta posição do vetor $s1
addi $t0, $t0, 1         # $t0 = 5
sw $t0, 16($s1)          # coloca $t0 = 5 na quinta posição do vetor $s1
addi $t0, $t0, 1         # $t0 = 6
sw $t0, 20($s1)          # coloca $t0 = 6 na sexta posição do vetor $s1 
addi $t0, $t0, 1         # $t0 = 7
sw $t0, 24($s1)          # coloca $t0 = 7 na sétima posição do vetor $s1

LOOP:
    beq $s2, $s3, FIM     # se i = 7, pula para o FIM
    add $t1, $s2, $s2     # 2 * i
    add $t2, $t1, $t1     # 4 * i
    add $t1, $t2, $s1     # $t1 recebe o endereço do vetor A[i]
    lw $t2, 0($t1)        # $t2 recebe o valor do endereço A[i]
    remu $t3, $t2, $s4    # $t3 recebe o resto da divisão entre A[i] e $s4
    bne $t3, $zero, ADD   # se o resto for diferente de 0, pula para ADD
    addi $s0, $s0, 1      # quantidade_par = quantidade_par + 1

ADD:
    addi $s2, $s2, 1      # i = i + 1
    j LOOP

FIM: