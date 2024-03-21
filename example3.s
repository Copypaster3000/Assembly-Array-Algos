#example3.s
#Drake Wheeler
#Returns the position of the largest number in the array in eax

.file "example1.s"
.text
.globl f

#sets some variables
f:
    movl $0, %eax #Sets largest element position zero as zero to start
    movl (%rdi), %edx #Set first int as largest int so far in array
    xor %ecx, %ecx #Sets loop counter to zero


#Checks if current element is larger than recorded highest element
#loops through array
find_largest:
    cmpl $0, (%rdi) #Check if current element in array is zero, which indicates the end of the array
    je end #Jumps to end if current array element is zero

    cmpl (%rdi), %edx #Checks if current element is larger than largest recorded element
    jl update_largest #Jumps to update_largest function 

    add $4, %rdi #Moves to next element in the array
    inc %ecx #Increment loop counter

    jmp find_largest #Calls find largest function again, with next element
    

#updates variable with new largest int
update_largest:
   movl (%rdi), %edx #Updates largest int in array 
   movl %ecx, %eax #Set largest element position with current element position

   incl %ecx #Increments loop counter
   add $4, %rdi #Moves to next element in array

   jmp find_largest #Calls find largest again with next element


end:
    ret #return element of largest int in array
