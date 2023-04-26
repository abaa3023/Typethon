.globl main
main:
 pushl %ebp
 movl %esp , %ebp
START0:
 movl $(2), %eax
 cmpl $(0), %eax
 je E1
IF1:
 pushl $(3)
 call inject_int
 addl $(4), %esp
 jmp BB1
E1:
 pushl $(2)
 call inject_int
 addl $(4), %esp
BB1:
 pushl %eax
 call print_any
 addl $(4), %esp
END0:

 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
