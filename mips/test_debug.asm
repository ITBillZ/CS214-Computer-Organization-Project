.data

.text

main: 
	lui $1,0xFFFF			
	ori $28,$1,0xF000

loop:
    beq $0, $0, fuck
    j loop
fuck:
    sw $1,0xC60($28)
    j loop