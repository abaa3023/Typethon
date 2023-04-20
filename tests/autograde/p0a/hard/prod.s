.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(136), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -52(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 movl -52(%ebp), %eax
 movl %eax, -64(%ebp)
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -64(%ebp)
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
 pushl -64(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -84(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -84(%ebp)
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
 pushl -64(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -64(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -116(%ebp)
 jmp BB1
E4:
 pushl -64(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -116(%ebp)
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
 cmpl -116(%ebp), %eax
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
 movl %eax, -128(%ebp)
BB4:
 pushl -128(%ebp)
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB42
WB1:
 movl -104(%ebp), %eax
 movl %eax, -112(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -112(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl -112(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -40(%ebp)
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB7
E8:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E7:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E9:
 pushl -112(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -112(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
 jmp BB5
E10:
 pushl -112(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB5:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB6:
 cmpl -136(%ebp), %eax
 setne %al
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
 movl %eax, %ebx
BB8:
 pushl %ebx
 call is_true
 addl $(4), %esp
WC2:
 cmpl $(0), %eax
 je BB34
WB2:
 movl -52(%ebp), %eax
 movl %eax, -120(%ebp)
 movl -104(%ebp), %eax
 movl %eax, -32(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -124(%ebp)
 movl -120(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl -108(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -108(%ebp)
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
E14:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB11
E13:
 pushl -108(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB11
E15:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB9
E16:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB9:
 pushl -108(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl -108(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB10
E17:
 pushl -108(%ebp)
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
IF18:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -92(%ebp)
BB12:
 pushl -92(%ebp)
 call is_true
 addl $(4), %esp
WC3:
 cmpl $(0), %eax
 je BB23
WB3:
 movl -124(%ebp), %edi
 movl -32(%ebp), %eax
 movl %eax, -88(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF20:
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
 movl %eax, -68(%ebp)
 jmp BB15
E19:
 pushl -88(%ebp)
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
 pushl -88(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl -88(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E23:
 pushl -88(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -68(%ebp)
BB15:
 movl -68(%ebp), %eax
 movl %eax, -124(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ecx
 movl -120(%ebp), %eax
 movl %eax, -72(%ebp)
 movl %ecx, %edi
 pushl -72(%ebp)
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
 pushl -72(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
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
 pushl -72(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E27
IF27:
 pushl -72(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -80(%ebp)
 jmp BB16
E27:
 pushl -72(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -80(%ebp)
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
 movl %eax, %ecx
 jmp BB17
E28:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB17:
 movl -80(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB18:
 movl -44(%ebp), %eax
 movl %eax, -120(%ebp)
 movl -120(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -96(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl -96(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -96(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB21
E30:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB21
E29:
 pushl -96(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl $(1)
 call inject_bool
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
 pushl -96(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl -96(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E33:
 pushl -96(%ebp)
 call project_bool
 addl $(4), %esp
BB20:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB21:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB22
IF34:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -92(%ebp)
BB22:
 pushl -92(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC3
BB23:
 movl -20(%ebp), %eax
 movl %eax, -132(%ebp)
 movl -124(%ebp), %edi
 pushl -132(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB26
IF36:
 pushl -132(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -60(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -60(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -48(%ebp)
 jmp BB26
E35:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E37
IF37:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB26
E37:
 pushl -132(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E38
IF38:
 pushl -132(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 jmp BB24
E38:
 pushl -132(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -24(%ebp)
BB24:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB25
E39:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB25:
 movl -24(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB26:
 movl -48(%ebp), %eax
 movl %eax, -20(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ecx
 movl -104(%ebp), %eax
 movl %eax, -76(%ebp)
 movl %ecx, %edi
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB29
IF41:
 pushl -76(%ebp)
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
 jmp BB29
E40:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E42
IF42:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB29
E42:
 pushl -76(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E43
IF43:
 pushl -76(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB27
E43:
 pushl -76(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB27:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB28
E44:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB28:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB29:
 movl %esi, -104(%ebp)
 movl -104(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB32
E46:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB32
E45:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E47
IF47:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB32
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
 jmp BB30
E48:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB30:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB31
E49:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB31:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB32:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF50:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB33:
 pushl %ebx
 call is_true
 addl $(4), %esp
 jmp WC2
BB34:
 movl -52(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB37
IF52:
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -36(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -56(%ebp)
 jmp BB37
E51:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E53
IF53:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB37
E53:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -100(%ebp)
 jmp BB35
E54:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -100(%ebp)
BB35:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB36
E55:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB36:
 movl -100(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
BB37:
 movl -56(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
 movl -52(%ebp), %edi
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E57
IF57:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB40
E57:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB40
E56:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E58
IF58:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB40
E58:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB38
E59:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB38:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB39
E60:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
BB39:
 cmpl %edi, %eax
 setne %al
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
IF61:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
BB41:
 pushl -128(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC1
BB42:
 movl -20(%ebp), %edi
 movl -20(%ebp), %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E62
IF62:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB45
IF63:
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
 movl %eax, -12(%ebp)
 jmp BB45
E62:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E64
IF64:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB45
E64:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB43
E65:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB43:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB44
E66:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB44:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB45:
 movl -12(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl -20(%ebp)
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
