.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(28), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 movl -12(%ebp), %esi
 pushl $(23)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
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
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB1
E4:
 pushl %esi
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
 cmpl %esi, %eax
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
 movl %eax, -24(%ebp)
BB4:
 pushl -24(%ebp)
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je END0
WB1:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB5
E7:
 pushl -28(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB5
IF8:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB5:
 movl -12(%ebp), %edi
 movl -16(%ebp), %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB8
IF10:
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
 movl %eax, -4(%ebp)
 jmp BB8
E9:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB8
E11:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB6
E12:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB6:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB7
E13:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB7:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB8:
 movl -4(%ebp), %edi
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB11
E15:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB11
E14:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB11
E16:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB9
E17:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB9:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB10
E18:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB10:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB11:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF19:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB12:
 pushl -20(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 movl -12(%ebp), %esi
 movl -28(%ebp), %edi
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB13
E24:
 pushl %esi
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
 movl %eax, %ebx
BB15:
 movl %ebx, -12(%ebp)
 jmp BB19
E20:
 movl -12(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
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
 movl %eax, -8(%ebp)
 jmp BB18
E26:
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB18:
 movl -8(%ebp), %eax
 movl %eax, -12(%ebp)
BB19:
 movl -12(%ebp), %esi
 pushl $(23)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E32
IF32:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB22
E32:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB22
E31:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB22
E33:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB20
E34:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB20:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB21
E35:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB21:
 cmpl %esi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB22:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB23
IF36:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB23:
 pushl -24(%ebp)
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
