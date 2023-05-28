.data 

.text

main:
    lui $1,0xFFFF
    ori $28,$1,0xC000

    addi $3,$0,0

    #do
    addi $2,$0,8
    add $3,$3,$2

    #do
    addi $2,$0,8
    sll $2,$2,8
    add $3,$3,$2

    #so
    addi $2,$0,12
    sll $2,$2,16
    add $3,$3,$2

    #so
    addi $2,$0,12
    sll $2,$2,24
    add $3,$3,$2
    sw $3,0($28)

    addi $3,$0,0

    #la
    addi $2,$0,13
    add $3,$3,$2

    #la
    addi $2,$0,13
    sll $2,$2,8
    add $3,$3,$2

    #so
    addi $2,$0,12
    sll $2,$2,16
    add $3,$3,$2
    sw $3,4($28)
