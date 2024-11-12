.data               # start of data section
# put any global or static variables here

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!
myPrintString: .string "The answer is %d\n"

.text               # start of text /code
# everything inside .text is read-only, which includes your code!
.global main        # required, tells gcc where to begin execution

# === functions here ===

main:               # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === main() code here ===
#setup a=1
movq $1, %rax   #a=1 in %rax
#setup b=2
movq $2, %rbx   #b=2 in %rbx
#c=a+b
addq %rbx, %rax     #c=a+b in %rax

#(printf("the answer is %d\n", c);
#1. save any caller saved resgisters 
#a. place in %r12-r15 callee saved registers
#b. place on stack
movq %rax, %r12         #c in %r12
pushq %rax              
#2. set up registers, args in: %rdi, %rsi
#3. 0 in %rax, no floating point regs
#4. call function



movq $myPrintString, %rdi
movq %rax, %rsi

movq $0, %rax # xorq %rax, %rax is the same thing

call printf


#restore c in %rax
popq %rax       #c in rax

# clean up and return
movq $0, %rax       # place return value in rax
leave               # undo preamble, clean up the stack
ret                 # return
