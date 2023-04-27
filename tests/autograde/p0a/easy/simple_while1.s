.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 movl %edi, %eax
 jmp BB1
E1:
 movl %edi, %eax
BB1:
 pushl %eax
 call print_any
 addl $(4), %esp
END0:

 popl %esi
 popl %ebx
 popl %edi
 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
