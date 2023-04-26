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
 movl %eax, -12(%ebp)
 movl $(6), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 movl -12(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl -20(%ebp)
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
 pushl -20(%ebp)
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB1
E4:
 pushl -20(%ebp)
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
 movl %eax, %ecx
 jmp BB2
E5:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB2:
 movl -8(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
BB3:
 movl -36(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -32(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -32(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -28(%ebp)
 jmp BB6
E6:
 pushl %edi
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB4
E9:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB4:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB5
E10:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB5:
 movl -16(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB6:
 pushl -28(%ebp)
 call print_any
 addl $(4), %esp
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB9
E11:
 pushl %edi
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
 movl %eax, %ebx
 jmp BB7
E14:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB7:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB8:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB9:
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
