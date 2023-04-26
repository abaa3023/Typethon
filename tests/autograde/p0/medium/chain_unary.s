.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(12), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 movl $(2), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E1:
 pushl -4(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB1
IF2:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB1:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %ebx
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB2
E3:
 pushl %ebx
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB2
IF4:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB2:
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB3
E5:
 pushl -12(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF6:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB3:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %edi
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB4
E7:
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF8:
 pushl %edi
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB4:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %esi
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB5
E9:
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB5
IF10:
 pushl %esi
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB5:
 pushl -8(%ebp)
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
