.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(52), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
 call eval_input_pyobj
 movl %eax, %edi
 movl $(2), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ecx
 movl -32(%ebp), %eax
 movl %eax, -20(%ebp)
 movl %ecx, -28(%ebp)
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -20(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -44(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB3
E1:
 pushl -28(%ebp)
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
 movl %eax, -52(%ebp)
 jmp BB1
E4:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -52(%ebp)
BB1:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl -52(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB3:
 movl %edi, -36(%ebp)
 movl -8(%ebp), %edi
 pushl -36(%ebp)
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
 pushl -36(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -40(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
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
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 jmp BB4
E9:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -4(%ebp)
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
 jmp BB5
E10:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB5:
 movl -4(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB6:
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB7
E11:
 pushl -32(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF12:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB7:
 movl -24(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB10
IF14:
 pushl %edi
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
 movl %eax, -48(%ebp)
 jmp BB10
E13:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB10
E15:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB8
E16:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB8:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB9
E17:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB9:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB10:
 pushl -48(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl -48(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB11
E18:
 pushl -48(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB11
IF19:
 pushl -48(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB11:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 movl %esi, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB14
IF21:
 pushl %edi
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
 movl %eax, -16(%ebp)
 jmp BB14
E20:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E22
IF22:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB14
E22:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB12
E23:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB12:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB13
E24:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB13:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB14:
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 movl -16(%ebp), %edi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB17
IF26:
 pushl %ebx
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
 movl %eax, -12(%ebp)
 jmp BB17
E25:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E27
IF27:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB17
E27:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB15
E28:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB15:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB16
E29:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB16:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB17:
 pushl -12(%ebp)
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
