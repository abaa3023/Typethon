.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 pushl %eax
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl $(42)
 call inject_int
 addl $(4), %esp
 jmp BB1
E1:
 pushl $(3)
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
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(1)
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
 movl %eax, %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 movl %ebx, %eax
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
