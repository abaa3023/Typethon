.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(4), %esp
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
 movl %eax, -4(%ebp)
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %esi
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -4(%ebp)
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
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
