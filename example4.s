#example4.s
#Drake Wheeler
#Returns the average value of the numbers in the array using integer division and ignores and remainder

.file "example1.s"
.text
.globl f

#sets counters at zero
f:
    xor %edx, %edx #Sets tracker for total value of ints in array to zero
    xor %ecx, %ecx #Sets counter for ints in array to zero


#gets some of all ints in array
get_sum:
    cmpl $0, (%rdi) #Checks if current element holds zero which indicates end of array
    je divide #Jumps to divide function since reached the end of array

    addl (%rdi), %edx #Adds current element to total sum

    incl %ecx #Increments counter 
    add $4, %rdi #Goes to next element in array for next loop
    
    jmp get_sum #Jumps to top of get_sum to track info of next element in array


#divides sum of ints in array by number of ints
divide:
    mov %edx, %eax #Put dividend in right place to be divided
    cdq #Prepare %edx:%eax for signed division 
    idiv %ecx #Divide dividend by count
    ret #Return quotient 
    