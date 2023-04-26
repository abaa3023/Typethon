.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 movl $(2), %eax
 cmpl $(0), %eax
 je E1
IF1:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB1
E1:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB1:
 movl %eax, %ebx
 pushl %ebx
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB2
IF2:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB2:
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
