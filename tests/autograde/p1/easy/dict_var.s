.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 call create_dict
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %ebx
 pushl %esi
 pushl %edi
 call set_subscript
 addl $(12), %esp
 movl %edi, %eax
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
