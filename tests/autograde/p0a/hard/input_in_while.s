.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:
 call eval_input_pyobj
END0:

 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
