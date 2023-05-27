.data
switch:.half 0x00ff
.text
main:
    lui $1, 0xffff
    ori $28, $1, 0xf000

addition:
    # load right-16 switch in $2
	lw $2,switch	

	# obtain the first number a, get the first 8 bits and shift right 8 bits
	add $3 ,$0 ,$2 
	andi $2, $2, 0xFF00
	srl $2, $2, 8		# a
	# obtain the second number a
	andi $3, $3, 0x00FF	# b

    add $2, $2, $3  # add

     # save right-16 swicth into right-16 led
    sw $2, 0xC60($28) 
	
	j addition
