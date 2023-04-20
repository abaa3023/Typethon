.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(24), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, -20(%ebp)
 movl -20(%ebp), %esi
 pushl $(23)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -8(%ebp)
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
 pushl -8(%ebp)
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -8(%ebp)
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
 movl %eax, %esi
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF6:
 pushl %esi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB4:
 pushl -16(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 call eval_input_pyobj
 movl %eax, -4(%ebp)
 pushl $(42)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB7
E9:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E10:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB5
E11:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB5:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB6
E12:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB6:
 cmpl -12(%ebp), %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB7:
 movl %eax, %esi
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB8
IF13:
 pushl %esi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB8:
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 movl -20(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB11
IF16:
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
 jmp BB11
E15:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB11
E17:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB9
E18:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB9:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB10
E19:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB10:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB11:
 movl %ebx, -20(%ebp)
 jmp END0
E14:
 movl -20(%ebp), %esi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB12
E23:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
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
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB14:
 movl %ebx, -20(%ebp)
 jmp END0
E7:
 movl -20(%ebp), %esi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB17
IF26:
 pushl %esi
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
 jmp BB17
E25:
 pushl %ebx
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB15
E28:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB15:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB16
E29:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB16:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB17:
 movl %edi, -20(%ebp)
END0:

 popl %esi
 popl %ebx
 popl %edi
 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
