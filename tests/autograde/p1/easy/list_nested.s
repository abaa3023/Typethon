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
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl %esi
 call set_subscript
 addl $(12), %esp
 movl %esi, %eax
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
