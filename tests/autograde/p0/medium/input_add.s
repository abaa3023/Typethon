.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(56), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, %esi
 call eval_input_pyobj
 movl %eax, -8(%ebp)
 pushl -8(%ebp)
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
 pushl -8(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl %esi
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
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
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 movl %ebx, -28(%ebp)
 call eval_input_pyobj
 movl %eax, -48(%ebp)
 movl -28(%ebp), %ebx
 pushl -48(%ebp)
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
 pushl -48(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -36(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
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
 pushl -48(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -48(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 jmp BB4
E9:
 pushl -48(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -40(%ebp)
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
 movl -40(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB6:
 movl -24(%ebp), %eax
 movl %eax, -32(%ebp)
 call eval_input_pyobj
 movl %eax, %ebx
 movl -32(%ebp), %eax
 movl %eax, -44(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -44(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -4(%ebp)
 jmp BB9
E11:
 pushl -44(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB7
E14:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB7:
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB9:
 movl -4(%ebp), %ebx
 movl -28(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -52(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB12
E16:
 pushl -52(%ebp)
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
 movl %eax, %esi
 jmp BB10
E19:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB10:
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB12:
 movl -20(%ebp), %esi
 movl -32(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -56(%ebp)
 jmp BB15
E21:
 pushl -16(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB13
E24:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB13:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
BB15:
 movl -56(%ebp), %esi
 pushl %esi
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
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -12(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB16
E29:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB18:
 call eval_input_pyobj
 movl -12(%ebp), %ebx
 movl %eax, %esi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
 pushl %ebx
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
 movl %eax, %edi
 jmp BB21
E31:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB21
E33:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB19
E34:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB19:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB21:
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
