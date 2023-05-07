.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call create_dict
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(3)
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
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl %esi
 call set_subscript
 addl $(12), %esp
 movl %esi, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl %ebx
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
