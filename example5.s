#example5.s
#Drake Wheeler
#Reverses the order of the elements in the array without using any additional storage

.file "example1.s"
.text
.globl f

f:
    xor %rsi, %rsi #set counter for total ints in array to zero


#get length of array
get_length:
    cmpl $0, (%rdi) #Check if current int is 0 
    je set_up_reversal #Jumps to set_up_reversal if the end of the array was reached

    inc %rsi #increments counter 
    add $4, %rdi #goes to next element in array
    
    jmp get_length #go to start of function again


#sets up variables 
set_up_reversal:
    sub $4, %rdi #resets to last element in array

    mov %rsi, %rdx #Sets total number of arrays up to be divided
    shr $1, %rdx #Divides total number of arrays by two to be used as number of loops for reverse_array

    mov $0, %rbx #sets counter to zero which will keep track of what iteration of the loop reverse_array is currently on

    imul $4, %rsi #multiply the number of ints in the array by four to use for access the element in the array
    sub $4, %rsi #set element access variable to value to access last element in array


#reverses ints in array
#%r8d holds right temp int, %ecx holds left temp int
reverse_array:
    mov (%rdi), %r8d #put right element of array into temporary variable to start

    sub %rsi, %rdi #Set pointer to left int
    mov (%rdi), %ecx #put left int in temporary variable

    mov %r8d, (%rdi) #Set left element with right element's value
    
    add %rsi, %rdi #Set pointer to right element
    mov %ecx, (%rdi) #set right element with left element's value

    inc %rbx #increments loop counter

    cmp %rbx, %rdx #checks if loop has hit it's last loop
    je end #goes to end once loop has completed the reversal

    sub $8, %rsi #subtract 8 from element access variable because we are access elements that are two less apart than previously
    sub $4, %rdi #Set pointer to next right most element that needs to be swapped
    
    jmp reverse_array #goes to start of function again
    

end:
    mov $1, %eax #put 1 in return for success
    ret 
    