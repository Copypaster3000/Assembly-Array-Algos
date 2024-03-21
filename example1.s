#example1.s
#Drake Wheeler
#Returns the length of the input array in eax

.file "example1.s"
.text
.globl f

f:
    xor %eax, %eax #Set counter to zero


#loops through array and increments for each element before terminator 
find_length:
    cmpl $0, (%rdi) #Check if current element in array is zero
    je end #Jumps to end if current array element is zero

    inc %eax #Increments one for element in array count
    add $4, %rdi #Moves to next element in the array

    jmp find_length #Calls find_length again, now at next element in array


end:
    ret #returns the number of elements in the array (not counting the terminating zero)
    