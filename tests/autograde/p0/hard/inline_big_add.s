.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(64), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(51474836)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 movl -28(%ebp), %eax
 movl %eax, -4(%ebp)
 movl -28(%ebp), %eax
 movl %eax, -36(%ebp)
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -4(%ebp)
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
 movl %eax, %edi
 jmp BB3
E1:
 pushl -36(%ebp)
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB1
E4:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB1:
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB3:
 movl %edi, -20(%ebp)
 movl -28(%ebp), %edi
 pushl -20(%ebp)
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
 pushl -20(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -52(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -52(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -56(%ebp)
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
 jmp BB4
E9:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -32(%ebp)
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
 movl -32(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
BB6:
 movl -56(%ebp), %eax
 movl %eax, -40(%ebp)
 movl -28(%ebp), %edi
 pushl -40(%ebp)
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
 pushl -40(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -64(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -64(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -48(%ebp)
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
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB7
E14:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -8(%ebp)
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
 movl -8(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB9:
 movl -48(%ebp), %edi
 movl -28(%ebp), %eax
 movl %eax, -60(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -60(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -60(%ebp)
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
 pushl -60(%ebp)
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
 pushl -60(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -60(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -60(%ebp)
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
 movl -12(%ebp), %edi
 movl -28(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl %edi
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
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
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
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB15:
 movl -24(%ebp), %edi
 movl -28(%ebp), %eax
 movl %eax, -44(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -44(%ebp)
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
 jmp BB18
E26:
 pushl -44(%ebp)
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
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB18:
 movl %ebx, %edi
 movl -28(%ebp), %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
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
 jmp BB21
E31:
 pushl %ebx
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB19
E34:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB19:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB21:
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
