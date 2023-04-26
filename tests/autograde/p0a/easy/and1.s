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
 movl %eax, -4(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 movl -4(%ebp), %ebx
 pushl %ebx
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
 pushl %ebx
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
 movl %eax, -20(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl %ebx
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
 movl %eax, -20(%ebp)
BB3:
 movl -20(%ebp), %ebx
 movl -36(%ebp), %eax
 movl %eax, -32(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -32(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB6
E6:
 pushl -32(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB4
E9:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB4:
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB6:
 movl -16(%ebp), %eax
 movl %eax, -12(%ebp)
 movl -8(%ebp), %ebx
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl -12(%ebp)
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
 movl %eax, %edi
 jmp BB9
E11:
 pushl %ebx
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
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB7
E14:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB7:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB9:
 pushl -4(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 movl %esi, %eax
 jmp BB10
E16:
 movl -4(%ebp), %eax
BB10:
 movl %eax, %ebx
 pushl %ebx
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl -36(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 movl -8(%ebp), %eax
 jmp BB11
E18:
 movl -36(%ebp), %eax
BB11:

 jmp BB12
E17:
 movl %ebx, %eax
BB12:
 pushl %eax
 call print_any
 addl $(4), %esp
 movl %edi, %ebx
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF20:
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
 jmp BB15
E19:
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E22
IF22:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB13
E22:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB13:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB14
E23:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB14:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB15:
 movl -24(%ebp), %ebx
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF25:
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
 movl %eax, -40(%ebp)
 jmp BB18
E24:
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E27
IF27:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB16
E27:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB16:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB17
E28:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB17:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB18:
 movl -40(%ebp), %ebx
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF30:
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
 movl %eax, -28(%ebp)
 jmp BB21
E29:
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E32
IF32:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB19
E32:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB19:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB20
E33:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB20:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB21:
 movl -28(%ebp), %edi
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 movl %edi, %eax
 jmp BB22
E34:
 movl %edi, %eax
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
