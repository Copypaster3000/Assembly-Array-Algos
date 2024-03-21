#example2.s
#Drake Wheeler
#Returns the largest number from the array in eax

.file "example1.s"
.text
.globl f

#sets largest number variable with int of first element in array
f:
    movl (%rdi), %eax #Sets largest num in array as current element


#loops through the array and checks if current element is larger than recorded largest int, updates if so
find_largest:
    cmpl $0, (%rdi) #Check if current element in array is zero, which indicates the end of the array
    je end #Jumps to end if current array element is zero

    cmpl (%rdi), %eax #Checks if current element is larger than largest recorded element
    jl f #Goes to f to update largest int if current element is larger than largest recorded element
    
    add $4, %rdi #Moves to next element in the array

    jmp find_largest #Calls find largest function again, with next element
    

end:
    ret #returns largest int in array

