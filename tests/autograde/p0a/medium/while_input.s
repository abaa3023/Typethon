.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:
 call eval_input_pyobj
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call print_any
 addl $(4), %esp
END0:

 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
