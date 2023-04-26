.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(104), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 movl %esi, %edi
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
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
 jmp BB3
E2:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E1:
 pushl -4(%ebp)
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -4(%ebp)
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
 movl %eax, -68(%ebp)
BB4:
 pushl -68(%ebp)
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB42
WB1:
 movl -36(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -64(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl -64(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -64(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
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
 pushl -64(%ebp)
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
 pushl -64(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -64(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl -64(%ebp)
 call project_bool
 addl $(4), %esp
BB6:
 cmpl %edi, %eax
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
 movl %eax, -104(%ebp)
BB8:
 pushl -104(%ebp)
 call is_true
 addl $(4), %esp
WC2:
 cmpl $(0), %eax
 je BB34
WB2:
 movl %esi, -56(%ebp)
 movl -36(%ebp), %eax
 movl %eax, -96(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 movl -56(%ebp), %eax
 movl %eax, -28(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -52(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -52(%ebp)
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
 pushl %edi
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
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB9
E16:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB9:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E17
IF17:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB10
E17:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB10:
 cmpl -20(%ebp), %eax
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
 movl %eax, -80(%ebp)
BB12:
 pushl -80(%ebp)
 call is_true
 addl $(4), %esp
WC3:
 cmpl $(0), %eax
 je BB23
WB3:
 movl -12(%ebp), %edi
 movl -96(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF20:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -8(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -76(%ebp)
 jmp BB15
E19:
 pushl -8(%ebp)
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E23:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -76(%ebp)
BB15:
 movl -76(%ebp), %eax
 movl %eax, -12(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -56(%ebp), %edi
 movl %eax, -32(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF25:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -32(%ebp)
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
 jmp BB18
E24:
 pushl -32(%ebp)
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
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E28
IF28:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E28:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -84(%ebp)
BB18:
 movl -84(%ebp), %eax
 movl %eax, -56(%ebp)
 movl -56(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -92(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -92(%ebp)
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
 pushl -92(%ebp)
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
 pushl -92(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E33
IF33:
 pushl -92(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E33:
 pushl -92(%ebp)
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
 movl %eax, -80(%ebp)
BB22:
 pushl -80(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC3
BB23:
 movl -24(%ebp), %edi
 movl -12(%ebp), %eax
 movl %eax, -60(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl -60(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB26
IF36:
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
 movl %eax, -16(%ebp)
 jmp BB26
E35:
 pushl -60(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E38
IF38:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB24
E38:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB24:
 pushl -60(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl -60(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB25
E39:
 pushl -60(%ebp)
 call project_bool
 addl $(4), %esp
BB25:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB26:
 movl -16(%ebp), %eax
 movl %eax, -24(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl -36(%ebp), %edi
 movl %eax, -48(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -48(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB29
IF41:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -48(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -88(%ebp)
 jmp BB29
E40:
 pushl -48(%ebp)
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
 jmp BB27
E43:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB27:
 pushl -48(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -48(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB28
E44:
 pushl -48(%ebp)
 call project_bool
 addl $(4), %esp
BB28:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
BB29:
 movl -88(%ebp), %eax
 movl %eax, -36(%ebp)
 movl -36(%ebp), %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -40(%ebp)
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
 pushl -40(%ebp)
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
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB31
E49:
 pushl -40(%ebp)
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
 movl %eax, -104(%ebp)
BB33:
 pushl -104(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC2
BB34:
 movl %esi, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB37
IF52:
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
 jmp BB37
E51:
 pushl %esi
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB35
E54:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB35:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB36
E55:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB36:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB37:
 movl %ebx, %esi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E57
IF57:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, -100(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -100(%ebp)
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
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB38
E59:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB38:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB39
E60:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB39:
 cmpl -44(%ebp), %eax
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
 movl %eax, -68(%ebp)
BB41:
 pushl -68(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC1
BB42:
 movl -24(%ebp), %edi
 movl -24(%ebp), %ebx
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
 movl %eax, -72(%ebp)
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
 movl %eax, -72(%ebp)
BB45:
 movl -72(%ebp), %eax
 movl %eax, -24(%ebp)
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
