.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(44), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 call eval_input_pyobj
 movl %eax, -36(%ebp)
 movl $(2), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -24(%ebp), %edi
 movl %eax, -4(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -4(%ebp)
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
 jmp BB3
E1:
 pushl -4(%ebp)
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB3:
 movl -36(%ebp), %edi
 movl -16(%ebp), %eax
 movl %eax, -28(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB6
E6:
 pushl -28(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB4
E9:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB4:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB6:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 jmp BB7
E11:
 pushl -24(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF12:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB7:
 movl -12(%ebp), %edi
 movl -40(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB10
IF14:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -8(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB10
E13:
 pushl -8(%ebp)
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB9
E17:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
BB9:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB10:
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB11
E18:
 pushl -20(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB11
IF19:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB11:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
 movl -44(%ebp), %edi
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB14
IF21:
 pushl -32(%ebp)
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
 jmp BB14
E20:
 pushl %edi
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
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB12
E23:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB12:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB13
E24:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB13:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB14:
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB17
IF26:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB17
E25:
 pushl %esi
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB15
E28:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB15:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB16
E29:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB16:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB17:
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
