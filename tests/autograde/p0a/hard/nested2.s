.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(232), %esp
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
 movl %eax, -120(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -96(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl -24(%ebp), %eax
 movl %eax, -188(%ebp)
 pushl $(5)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -188(%ebp)
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
 pushl -188(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -80(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -80(%ebp)
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
 pushl -188(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -188(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
 jmp BB1
E4:
 pushl -188(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -56(%ebp)
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
 cmpl -56(%ebp), %eax
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
 movl %eax, -156(%ebp)
BB4:
 pushl -156(%ebp)
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB85
WB1:
 movl -24(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl -104(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -104(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB7
E8:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E7:
 pushl -104(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl $(0)
 call inject_bool
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
 pushl -104(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -104(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl -104(%ebp)
 call project_bool
 addl $(4), %esp
BB6:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB7:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB8
IF12:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -116(%ebp)
BB8:
 pushl -116(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 movl -116(%ebp), %eax
 jmp BB13
E13:
 movl -24(%ebp), %edi
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -52(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -52(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB11
E15:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB11
E14:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl $(0)
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
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB10
E18:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
BB10:
 cmpl %edi, %eax
 sete %al
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
 movl %eax, -192(%ebp)
BB12:
 movl -192(%ebp), %eax
BB13:
 pushl %eax
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 movl -120(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -168(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -168(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E22
IF22:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -168(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB16
E22:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB16
E21:
 pushl -168(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB16
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
 jmp BB14
E24:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB14:
 pushl -168(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -168(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB15
E25:
 pushl -168(%ebp)
 call project_bool
 addl $(4), %esp
BB15:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB16:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB17
IF26:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -64(%ebp)
BB17:
 pushl -64(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E27
IF27:
 movl -96(%ebp), %eax
 movl %eax, -68(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -68(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB20
IF29:
 pushl -68(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -180(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -180(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -112(%ebp)
 jmp BB20
E28:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB20
E30:
 pushl -68(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl -68(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -196(%ebp)
 jmp BB18
E31:
 pushl -68(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -196(%ebp)
BB18:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E32
IF32:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB19
E32:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB19:
 movl -196(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -112(%ebp)
BB20:
 movl -112(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E27:
 movl -120(%ebp), %eax
 movl %eax, -204(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -204(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl -204(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -200(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -200(%ebp)
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB23
E34:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB23
E33:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB23
E35:
 pushl -204(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -204(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -208(%ebp)
 jmp BB21
E36:
 pushl -204(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -208(%ebp)
BB21:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E37
IF37:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB22
E37:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB22:
 cmpl -208(%ebp), %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB23:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF38:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -144(%ebp)
BB24:
 pushl -144(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 movl -96(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -232(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -232(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB27
IF41:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -232(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -224(%ebp)
 jmp BB27
E40:
 pushl -232(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E42
IF42:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB27
E42:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E43
IF43:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB25
E43:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB25:
 pushl -232(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -232(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB26
E44:
 pushl -232(%ebp)
 call project_bool
 addl $(4), %esp
BB26:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -224(%ebp)
BB27:
 movl -224(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E39:
 movl -96(%ebp), %eax
 movl %eax, -48(%ebp)
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -48(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF46:
 pushl -48(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -128(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -128(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -220(%ebp)
 jmp BB30
E45:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E47
IF47:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB30
E47:
 pushl -48(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E48
IF48:
 pushl -48(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -212(%ebp)
 jmp BB28
E48:
 pushl -48(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -212(%ebp)
BB28:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB29
E49:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB29:
 movl -212(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -220(%ebp)
BB30:
 movl -220(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E20:
 movl -24(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB33
E51:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB33
E50:
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E52
IF52:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB33
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
 jmp BB31
E53:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB31:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB32
E54:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
BB32:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB33:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB34
IF55:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -152(%ebp)
BB34:
 pushl -152(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 movl -152(%ebp), %eax
 jmp BB39
E56:
 movl -24(%ebp), %edi
 pushl $(5)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E57
IF57:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E58
IF58:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB37
E58:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB37
E57:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB37
E59:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB35
E60:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB35:
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB36
E61:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
BB36:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB37:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB38
IF62:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB38:
 movl %esi, %eax
BB39:
 pushl %eax
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E63
IF63:
 movl -120(%ebp), %eax
 movl %eax, -140(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -140(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E64
IF64:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl -140(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -132(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -132(%ebp)
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB42
E65:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB42
E64:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB42
E66:
 pushl -140(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E67
IF67:
 pushl -140(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -172(%ebp)
 jmp BB40
E67:
 pushl -140(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -172(%ebp)
BB40:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E68
IF68:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB41
E68:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB41:
 cmpl -172(%ebp), %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB42:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB43
IF69:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
BB43:
 pushl -108(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 movl -96(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E71
IF71:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB46
IF72:
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
 movl %eax, -136(%ebp)
 jmp BB46
E71:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E73
IF73:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB46
E73:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E74
IF74:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB44
E74:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB44:
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E75
IF75:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB45
E75:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
BB45:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB46:
 movl -136(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E70:
 movl -120(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -76(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E76
IF76:
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E77
IF77:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -76(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB49
E77:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB49
E76:
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E78
IF78:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB49
E78:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E79
IF79:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB47
E79:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB47:
 pushl -76(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E80
IF80:
 pushl -76(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB48
E80:
 pushl -76(%ebp)
 call project_bool
 addl $(4), %esp
BB48:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB49:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB50
IF81:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB50:
 pushl -4(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E82
IF82:
 movl -96(%ebp), %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -160(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E83
IF83:
 pushl -160(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB53
IF84:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -160(%ebp)
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
 jmp BB53
E83:
 pushl -160(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E85
IF85:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB53
E85:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E86
IF86:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB51
E86:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB51:
 pushl -160(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E87
IF87:
 pushl -160(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB52
E87:
 pushl -160(%ebp)
 call project_bool
 addl $(4), %esp
BB52:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB53:
 movl %ebx, -96(%ebp)
 jmp BB74
E82:
 movl -96(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -228(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E88
IF88:
 pushl -228(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB56
IF89:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -228(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -84(%ebp)
 jmp BB56
E88:
 pushl -228(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E90
IF90:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB56
E90:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E91
IF91:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB54
E91:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB54:
 pushl -228(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E92
IF92:
 pushl -228(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB55
E92:
 pushl -228(%ebp)
 call project_bool
 addl $(4), %esp
BB55:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -84(%ebp)
BB56:
 movl -84(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E63:
 movl -120(%ebp), %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -176(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E93
IF93:
 pushl -176(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E94
IF94:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -176(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB59
E94:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB59
E93:
 pushl -176(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E95
IF95:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB59
E95:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E96
IF96:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB57
E96:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB57:
 pushl -176(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E97
IF97:
 pushl -176(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB58
E97:
 pushl -176(%ebp)
 call project_bool
 addl $(4), %esp
BB58:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB59:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB60
IF98:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB60:
 pushl -8(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E99
IF99:
 movl -96(%ebp), %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E100
IF100:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB63
IF101:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -88(%ebp)
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
 jmp BB63
E100:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E102
IF102:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB63
E102:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E103
IF103:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB61
E103:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB61:
 pushl -88(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E104
IF104:
 pushl -88(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB62
E104:
 pushl -88(%ebp)
 call project_bool
 addl $(4), %esp
BB62:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB63:
 movl -40(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E99:
 movl -120(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -184(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E105
IF105:
 pushl -184(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E106
IF106:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -184(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB66
E106:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB66
E105:
 pushl -184(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E107
IF107:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB66
E107:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E108
IF108:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB64
E108:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB64:
 pushl -184(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E109
IF109:
 pushl -184(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB65
E109:
 pushl -184(%ebp)
 call project_bool
 addl $(4), %esp
BB65:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB66:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB67
IF110:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
BB67:
 pushl -36(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E111
IF111:
 movl -96(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E112
IF112:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB70
IF113:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -216(%ebp)
 jmp BB70
E112:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E114
IF114:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB70
E114:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E115
IF115:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB68
E115:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB68:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E116
IF116:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB69
E116:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
BB69:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -216(%ebp)
BB70:
 movl -216(%ebp), %eax
 movl %eax, -96(%ebp)
 jmp BB74
E111:
 movl -96(%ebp), %eax
 movl %eax, -72(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -72(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E117
IF117:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB73
IF118:
 pushl -72(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -164(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -164(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB73
E117:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E119
IF119:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB73
E119:
 pushl -72(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E120
IF120:
 pushl -72(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -100(%ebp)
 jmp BB71
E120:
 pushl -72(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -100(%ebp)
BB71:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E121
IF121:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB72
E121:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB72:
 movl -100(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB73:
 movl -44(%ebp), %eax
 movl %eax, -96(%ebp)
BB74:
 movl -24(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -124(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E122
IF122:
 pushl -124(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB77
IF123:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -124(%ebp)
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
 jmp BB77
E122:
 pushl -124(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E124
IF124:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB77
E124:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E125
IF125:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB75
E125:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB75:
 pushl -124(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E126
IF126:
 pushl -124(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB76
E126:
 pushl -124(%ebp)
 call project_bool
 addl $(4), %esp
BB76:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
BB77:
 movl -32(%ebp), %eax
 movl %eax, -24(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -120(%ebp), %edi
 movl %eax, -92(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E127
IF127:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB80
IF128:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -92(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -60(%ebp)
 jmp BB80
E127:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E129
IF129:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB80
E129:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E130
IF130:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB78
E130:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB78:
 pushl -92(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E131
IF131:
 pushl -92(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB79
E131:
 pushl -92(%ebp)
 call project_bool
 addl $(4), %esp
BB79:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -60(%ebp)
BB80:
 movl -60(%ebp), %eax
 movl %eax, -120(%ebp)
 movl -24(%ebp), %edi
 pushl $(5)
 call inject_int
 addl $(4), %esp
 movl %eax, -148(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E132
IF132:
 pushl -148(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E133
IF133:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -148(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB83
E133:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB83
E132:
 pushl -148(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E134
IF134:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB83
E134:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E135
IF135:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB81
E135:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB81:
 pushl -148(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E136
IF136:
 pushl -148(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB82
E136:
 pushl -148(%ebp)
 call project_bool
 addl $(4), %esp
BB82:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB83:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB84
IF137:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -156(%ebp)
BB84:
 pushl -156(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC1
BB85:
 pushl -96(%ebp)
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
