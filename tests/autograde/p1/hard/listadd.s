.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(40), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(15)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
 movl -8(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -40(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB3
E2:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E1:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E3:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB1
E4:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB1:
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
 movl -4(%ebp), %eax
 movl %eax, -16(%ebp)
 movl -36(%ebp), %edi
 pushl -16(%ebp)
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
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
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
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 jmp BB4
E9:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -28(%ebp)
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
 movl -28(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB6:
 movl -20(%ebp), %eax
 movl %eax, -4(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -8(%ebp), %edi
 movl %eax, -12(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 jmp BB9
E11:
 pushl -12(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB7
E14:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB7:
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB9:
 movl %esi, -8(%ebp)
 movl -32(%ebp), %esi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
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
 jmp BB12
E16:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB12
E18:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB10
E19:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB10:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB11:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB12:
 movl %ebx, -32(%ebp)
 pushl -4(%ebp)
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
