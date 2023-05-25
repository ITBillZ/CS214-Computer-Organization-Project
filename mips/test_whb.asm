.data

.text
main:
	lw $1, 0($2)
	lh $1, 0($2)
	lb $1, 0($2)

	sw $1, 0($2)
	sh $1, 0($2)
	sb $1, 0($2)