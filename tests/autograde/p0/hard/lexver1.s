.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(36), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(23)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 movl $(6), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 movl -4(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 jmp BB3
E1:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB3
E3:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB1
E4:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB1:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB2:
 movl -8(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
BB3:
 movl -36(%ebp), %eax
 movl %eax, -12(%ebp)
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -32(%ebp)
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -32(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB6
E6:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB6
E8:
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 jmp BB4
E9:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB4:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB5:
 movl -28(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB6:
 pushl -20(%ebp)
 call print_any
 addl $(4), %esp
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 jmp BB9
E11:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB9
E13:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB7
E14:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB7:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB9:
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
