.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(44), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(51474836)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 movl -12(%ebp), %eax
 movl %eax, -16(%ebp)
 movl -12(%ebp), %edi
 pushl -16(%ebp)
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
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -28(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
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
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 jmp BB1
E4:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -4(%ebp)
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
 movl %eax, %ecx
 jmp BB2
E5:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB2:
 movl -4(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB3:
 movl -44(%ebp), %edi
 movl -12(%ebp), %eax
 movl %eax, -36(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
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
 movl %eax, -40(%ebp)
 jmp BB6
E6:
 pushl -36(%ebp)
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
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB6:
 movl -40(%ebp), %edi
 movl -12(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -20(%ebp)
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
 jmp BB9
E11:
 pushl -20(%ebp)
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB9:
 movl %ebx, %edi
 movl -12(%ebp), %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
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
 jmp BB12
E16:
 pushl %ebx
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB11:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
BB12:
 movl -32(%ebp), %ebx
 movl -12(%ebp), %edi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
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
 movl %eax, -8(%ebp)
 jmp BB15
E21:
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB13
E24:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB13:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB14:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB15:
 movl -8(%ebp), %edi
 movl -12(%ebp), %ebx
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
 movl %eax, %esi
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
 movl %eax, %esi
BB18:
 movl %esi, %ebx
 movl -12(%ebp), %edi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
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
 movl %eax, -24(%ebp)
 jmp BB21
E31:
 pushl %edi
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
 movl %eax, %ebx
 jmp BB19
E34:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB19:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB20:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB21:
 pushl -24(%ebp)
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
