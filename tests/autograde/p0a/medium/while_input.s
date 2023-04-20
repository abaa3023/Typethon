.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:
 call eval_input_pyobj
 pushl %eax
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je END0
WB1:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call print_any
 addl $(4), %esp
 call eval_input_pyobj
 pushl %eax
 call is_true
 addl $(4), %esp
 jmp WC1
END0:

 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
