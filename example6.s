#example6.s
#Drake Wheeler
#Sorts the elements in the array into increasing numerical order

.file "example1.s"
.text
.globl f

#initializes some values for the coming functions
f:
    xor %rsi, %rsi #Zero counter which will count array size
    mov %rdi, %rdx #Save head of array pointer


#finds length of array
get_length:
    cmpl $0, (%rdi) #Check if current int is 0 
    je adjust_array_pointer #Jumps to adjust_array_pointer if the end of the array was reached

    inc %rsi #increments counter 
    add $4, %rdi #goes to next element in array

    jmp get_length #jumps to get_length to count next element


#adjust array pointer and sets up variables with correct values for upcoming functions
adjust_array_pointer:
    mov %rdx, %rdi #reset head of array pointer
    sub $4, %rdi #Set array pointer to one element before head because compare function automatically adds 4 bytes
    mov $1, %rbx #sets counter to one which will indicate current left element being compared in find_swap
    mov $2, %rax #sets counter to two which will indicate current right most element being compared in find_swap


#loops through array comparing elements side by side and goes to swap if right element is less than left element
#goes to end if makes it through array with no swaps needed
#%r8d will hold the left temp int being compared, %r9d will hold the right temp int being compared
find_swap:
    cmp %rbx, %rsi #Checks if function has looped for the number of elements in array 
    je end #goes to end 
    
    movl (%rdi, %rbx, 4), %r8d #Move left int into temp variable
    movl (%rdi, %rax, 4), %r9d #move the right into into temp variable

    cmpl %r8d, %r9d #Checks if right int is less than left int
    jl swap #jumps to swap if left int is greater than right int

    inc %rbx #increments left int indicator
    inc %rax #increments right int indicator

    jmp find_swap #Jumps to find_swap to compare next two elements in array
    

#swaps two ints in the array, resets variables to run find_swap from beginning of array
swap:
    movl %r9d, (%rdi, %rbx, 4) #put right int into left ints place in array
    movl %r8d, (%rdi, %rax, 4) #put left int into right ints place in array

    mov $1, %rbx #resets left int indicator
    mov $2, %rax #resets right int indicator

    jmp find_swap #jump back to find_swap

end:
    mov %rdx, %rdi #reset array pointer to head
    movl $1, %eax #put 1 in return for success
    ret




