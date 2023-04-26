.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(24), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl $(0)
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
 movl %eax, -24(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
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
 movl %eax, -12(%ebp)
 jmp BB1
E4:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, -12(%ebp)
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
 cmpl -12(%ebp), %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
 pushl %eax
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB13
WB1:
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
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
 pushl %esi
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
 movl %eax, -4(%ebp)
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB6:
 movl -4(%ebp), %esi
 movl -8(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
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
 movl %ebx, -8(%ebp)
 movl %esi, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB12
E17:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB12
E16:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl $(1)
 call inject_bool
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
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB12:
 pushl %eax
 call is_true
 addl $(4), %esp
 jmp WC1
BB13:
 movl -8(%ebp), %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
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
 je E22
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
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB16
E22:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB16
E21:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB16
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
 jmp BB14
E24:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB14:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB15
E25:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB15:
 cmpl %ebx, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB16:
 pushl %eax
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call print_any
 addl $(4), %esp
 jmp END0
E26:
 pushl $(0)
 call inject_int
 addl $(4), %esp
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
