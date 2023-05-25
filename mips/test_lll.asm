.data

.text
main:
    lui $1, 0xffff
    ori $28, $1, 0xf000

loop:
    lb $1, 0xC70($28)
    sb $1, 0xC60($28)
    j loop