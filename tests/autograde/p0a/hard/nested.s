.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(152), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(5)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, -92(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -152(%ebp)
 movl -20(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
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
 jmp BB3
E2:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E1:
 pushl %esi
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
 cmpl %edi, %eax
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
 movl %eax, %ebx
BB4:
 pushl %ebx
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB71
WB1:
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -20(%ebp), %edi
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF8:
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
 movl %eax, -104(%ebp)
 jmp BB7
E7:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB7
E9:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB5
E10:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB5:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB6:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
BB7:
 movl -104(%ebp), %eax
 movl %eax, -20(%ebp)
 movl -92(%ebp), %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, -48(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -48(%ebp)
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB10
E13:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB10
E12:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB10
E14:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 jmp BB8
E15:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB8:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB9
E16:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB9:
 cmpl -4(%ebp), %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB10:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB11
IF17:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB11:
 pushl -28(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl -128(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB12
E19:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB12:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB13
IF20:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -72(%ebp)
BB13:
 movl -72(%ebp), %eax
 jmp BB14
E18:
 movl -28(%ebp), %eax
BB14:
 pushl %eax
 call is_true
 addl $(4), %esp
WC2:
 cmpl $(0), %eax
 je BB63
WB2:
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
 je E21
IF21:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB17
IF22:
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
 movl %eax, -64(%ebp)
 jmp BB17
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
 jmp BB17
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
 jmp BB15
E24:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB15:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB16
E25:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB16:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -64(%ebp)
BB17:
 movl -64(%ebp), %esi
 movl %esi, %edi
 pushl $(4)
 call inject_int
 addl $(4), %esp
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
 je E27
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
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB20
E27:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB20
E26:
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB20
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
 jmp BB18
E29:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB18:
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB19
E30:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
BB19:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB20:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF31:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -80(%ebp)
BB21:
 pushl -80(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je BB55
IF32:
 movl -152(%ebp), %eax
 movl %eax, -116(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -116(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF34:
 pushl -116(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -68(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -68(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -144(%ebp)
 jmp BB24
E33:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB24
E35:
 pushl -116(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -116(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -120(%ebp)
 jmp BB22
E36:
 pushl -116(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -120(%ebp)
BB22:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E37
IF37:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB23
E37:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB23:
 movl -120(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -144(%ebp)
BB24:
 movl -144(%ebp), %eax
 movl %eax, -152(%ebp)
 movl -20(%ebp), %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -100(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E38
IF38:
 pushl -100(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -100(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB27
E39:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB27
E38:
 pushl -100(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB27
E40:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E41
IF41:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB25
E41:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB25:
 pushl -100(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E42
IF42:
 pushl -100(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB26
E42:
 pushl -100(%ebp)
 call project_bool
 addl $(4), %esp
BB26:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB27:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB28
IF43:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -124(%ebp)
BB28:
 pushl -124(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 movl -152(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB31
IF46:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -24(%ebp)
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
 jmp BB31
E45:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E47
IF47:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB31
E47:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E48
IF48:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB29
E48:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB29:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB30
E49:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
BB30:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB31:
 movl -12(%ebp), %eax
 movl %eax, -152(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -92(%ebp), %edi
 movl %eax, -84(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl -84(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB34
IF51:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -84(%ebp)
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
 jmp BB34
E50:
 pushl -84(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E52
IF52:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB34
E52:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E53
IF53:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB32
E53:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB32:
 pushl -84(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl -84(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB33
E54:
 pushl -84(%ebp)
 call project_bool
 addl $(4), %esp
BB33:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB34:
 movl -8(%ebp), %eax
 movl %eax, -92(%ebp)
 movl -20(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB37
IF56:
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
 movl %eax, -148(%ebp)
 jmp BB37
E55:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E57
IF57:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB37
E57:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E58
IF58:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB35
E58:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB35:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB36
E59:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
BB36:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -148(%ebp)
BB37:
 movl -148(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
 jmp BB55
E44:
 movl -20(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -36(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB40
E61:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB40
E60:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E62
IF62:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB40
E62:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E63
IF63:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB38
E63:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB38:
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E64
IF64:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB39
E64:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB39:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB40:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB41
IF65:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -96(%ebp)
BB41:
 pushl -96(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 movl -152(%ebp), %eax
 movl %eax, -76(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E67
IF67:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB44
IF68:
 pushl -76(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -56(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -56(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -140(%ebp)
 jmp BB44
E67:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E69
IF69:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB44
E69:
 pushl -76(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 pushl -76(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -60(%ebp)
 jmp BB42
E70:
 pushl -76(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -60(%ebp)
BB42:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E71
IF71:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB43
E71:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB43:
 movl -60(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -140(%ebp)
BB44:
 movl -140(%ebp), %eax
 movl %eax, -152(%ebp)
 jmp BB48
E66:
 movl -152(%ebp), %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E72
IF72:
 pushl -136(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB47
IF73:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -136(%ebp)
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
 jmp BB47
E72:
 pushl -136(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E74
IF74:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB47
E74:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E75
IF75:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB45
E75:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB45:
 pushl -136(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E76
IF76:
 pushl -136(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB46
E76:
 pushl -136(%ebp)
 call project_bool
 addl $(4), %esp
BB46:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
BB47:
 movl -32(%ebp), %eax
 movl %eax, -152(%ebp)
BB48:
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -92(%ebp), %edi
 movl %eax, -40(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E77
IF77:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB51
IF78:
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
 movl %eax, -52(%ebp)
 jmp BB51
E77:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E79
IF79:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB51
E79:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E80
IF80:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB49
E80:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB49:
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E81
IF81:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB50
E81:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
BB50:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -52(%ebp)
BB51:
 movl -52(%ebp), %eax
 movl %eax, -92(%ebp)
 movl -20(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -112(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E82
IF82:
 pushl -112(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB54
IF83:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -112(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -132(%ebp)
 jmp BB54
E82:
 pushl -112(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E84
IF84:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB54
E84:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E85
IF85:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB52
E85:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB52:
 pushl -112(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E86
IF86:
 pushl -112(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB53
E86:
 pushl -112(%ebp)
 call project_bool
 addl $(4), %esp
BB53:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -132(%ebp)
BB54:
 movl -132(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
BB55:
 movl %esi, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E87
IF87:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E88
IF88:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -88(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB58
E88:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB58
E87:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E89
IF89:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB58
E89:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E90
IF90:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB56
E90:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB56:
 pushl -88(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E91
IF91:
 pushl -88(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB57
E91:
 pushl -88(%ebp)
 call project_bool
 addl $(4), %esp
BB57:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB58:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB59
IF92:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB59:
 pushl -28(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E93
IF93:
 pushl -128(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E94
IF94:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB60
E94:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB60:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB61
IF95:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -72(%ebp)
BB61:
 movl -72(%ebp), %eax
 jmp BB62
E93:
 movl -28(%ebp), %eax
BB62:
 pushl %eax
 call is_true
 addl $(4), %esp
 jmp WC2
BB63:
 pushl -128(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E96
IF96:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB64
E96:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB64:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB65
IF97:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
BB65:
 pushl -108(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je BB66
IF98:
 movl %esi, -92(%ebp)
BB66:
 movl -20(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E99
IF99:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E100
IF100:
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
 jmp BB69
E100:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB69
E99:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E101
IF101:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB69
E101:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E102
IF102:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB67
E102:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB67:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E103
IF103:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB68
E103:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB68:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB69:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB70
IF104:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB70:
 pushl %ebx
 call is_true
 addl $(4), %esp
 jmp WC1
BB71:
 pushl -152(%ebp)
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
