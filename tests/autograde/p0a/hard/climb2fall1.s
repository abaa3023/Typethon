.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(36), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl $(40)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 movl -8(%ebp), %edi
 movl -28(%ebp), %eax
 movl %eax, -24(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -24(%ebp)
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
 pushl -24(%ebp)
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
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -24(%ebp)
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
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF6:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB4:
 pushl %ebx
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je END0
WB1:
 movl -8(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF8:
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 jmp BB7
E7:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB7
E9:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB5
E10:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB5:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB6:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB7:
 movl %esi, %edi
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %edi, -32(%ebp)
 movl %eax, %edi
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB10
IF13:
 pushl -32(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -4(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 jmp BB10
E12:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB10
E14:
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB8
E15:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB8:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB9
E16:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB9:
 movl -12(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
BB10:
 movl -36(%ebp), %eax
 movl %eax, -8(%ebp)
 movl -8(%ebp), %edi
 movl -28(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -20(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB13
E18:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB13
E17:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB13
E19:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB11
E20:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB11:
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB12
E21:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
BB12:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB13:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB14
IF22:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB14:
 pushl %ebx
 call is_true
 addl $(4), %esp
 jmp WC1
END0:

 popl %esi
 popl %ebx
 popl %edi
 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
