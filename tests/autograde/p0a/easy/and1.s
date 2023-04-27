.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(40), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 movl -24(%ebp), %eax
 movl %eax, -32(%ebp)
 pushl -32(%ebp)
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
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB1
E4:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB3:
 movl -28(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB6
E6:
 pushl -4(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB4
E9:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB4:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB6:
 movl -16(%ebp), %esi
 movl -36(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -8(%ebp)
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
 jmp BB9
E11:
 pushl -8(%ebp)
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
 movl %eax, %esi
 jmp BB7
E14:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB7:
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB9:
 movl -20(%ebp), %esi
 pushl -24(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 movl %edi, %eax
 jmp BB10
E16:
 movl -24(%ebp), %eax
BB10:
 movl %eax, %edi
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl -28(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 movl -36(%ebp), %eax
 jmp BB11
E18:
 movl -28(%ebp), %eax
BB11:

 jmp BB12
E17:
 movl %edi, %eax
BB12:
 pushl %eax
 call print_any
 addl $(4), %esp
 movl %esi, %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF20:
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
 movl %eax, -40(%ebp)
 jmp BB15
E19:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB15
E21:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E22
IF22:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB13
E22:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB13:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB14
E23:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB14:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB15:
 movl -40(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF25:
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
 movl %eax, -12(%ebp)
 jmp BB18
E24:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB18
E26:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E27
IF27:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB16
E27:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB16:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB17
E28:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB18:
 movl -12(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF30:
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
 jmp BB21
E29:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB21
E31:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E32
IF32:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB19
E32:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB19:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB20
E33:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB21:
 movl %ebx, %esi
 pushl %esi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 movl %esi, %eax
 jmp BB22
E34:
 movl %esi, %eax
BB22:
 pushl %eax
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
