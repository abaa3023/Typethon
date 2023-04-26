.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(56), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 movl -48(%ebp), %eax
 movl %eax, -24(%ebp)
 movl %ecx, %edi
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -24(%ebp)
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
 movl %eax, -16(%ebp)
 jmp BB3
E1:
 pushl %edi
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
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB1
E4:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB1:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB2:
 movl -44(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB3:
 movl -16(%ebp), %eax
 movl %eax, -48(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -52(%ebp), %edi
 movl %eax, -56(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -56(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -56(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB6
E6:
 pushl -56(%ebp)
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
 pushl -56(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -56(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -56(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB6:
 movl -8(%ebp), %eax
 movl %eax, -52(%ebp)
 movl %esi, -28(%ebp)
 movl -48(%ebp), %edi
 pushl -28(%ebp)
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
 pushl -28(%ebp)
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
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB7
E14:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB9:
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -20(%ebp), %edi
 movl %eax, -36(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -36(%ebp)
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
 jmp BB12
E16:
 pushl -36(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB10
E19:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB10:
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB12:
 movl -12(%ebp), %eax
 movl %eax, -20(%ebp)
 movl %ebx, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -40(%ebp)
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
 jmp BB15
E21:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB15
E23:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB13
E24:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB13:
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB15:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 movl %esi, %edi
 movl %esi, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
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
 movl %eax, -32(%ebp)
 jmp BB18
E26:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB18
E28:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB16
E29:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB16:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
BB18:
 movl -32(%ebp), %esi
 pushl %esi
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
