.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %ebx
 call print_any
 addl $(4), %esp
 pushl %edi
 call print_any
 addl $(4), %esp
 movl %ebx, %eax
 movl %edi, %ebx
 movl %eax, %edi
 pushl %ebx
 call print_any
 addl $(4), %esp
 pushl %edi
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
