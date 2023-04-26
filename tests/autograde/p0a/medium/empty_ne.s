.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:

END0:

 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
