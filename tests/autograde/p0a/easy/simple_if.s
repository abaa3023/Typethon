.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:
 pushl $(42)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call print_any
 addl $(4), %esp
 pushl $(0)
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
