.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(168), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, -152(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -156(%ebp)
 movl -152(%ebp), %eax
 movl %eax, -32(%ebp)
 pushl -156(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -156(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -32(%ebp)
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
 pushl -32(%ebp)
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
 pushl -156(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -156(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB1
E4:
 pushl -156(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB1:
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -32(%ebp)
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
 movl %esi, -84(%ebp)
 movl -84(%ebp), %esi
 movl -84(%ebp), %eax
 movl %eax, -132(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -132(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -132(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -112(%ebp)
 jmp BB6
E6:
 pushl -132(%ebp)
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
 pushl -132(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -132(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -132(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -112(%ebp)
BB6:
 movl -112(%ebp), %eax
 movl %eax, -116(%ebp)
 movl -116(%ebp), %esi
 movl -116(%ebp), %eax
 movl %eax, -80(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -80(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -80(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB9
E11:
 pushl -80(%ebp)
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
 pushl -80(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -80(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -80(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB9:
 movl -12(%ebp), %eax
 movl %eax, -56(%ebp)
 movl -56(%ebp), %esi
 movl -56(%ebp), %eax
 movl %eax, -24(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -24(%ebp)
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
 jmp BB12
E16:
 pushl -24(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB10
E19:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB10:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB12:
 movl -16(%ebp), %eax
 movl %eax, -104(%ebp)
 movl -104(%ebp), %esi
 movl -104(%ebp), %eax
 movl %eax, -36(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -36(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -40(%ebp)
 jmp BB15
E21:
 pushl -36(%ebp)
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
 movl %eax, %esi
 jmp BB13
E24:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB13:
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB15:
 movl -40(%ebp), %eax
 movl %eax, -124(%ebp)
 movl -124(%ebp), %esi
 movl -124(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
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
 movl %eax, -76(%ebp)
 jmp BB18
E26:
 pushl -4(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB16
E29:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB16:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -76(%ebp)
BB18:
 movl -76(%ebp), %eax
 movl %eax, -128(%ebp)
 movl -128(%ebp), %esi
 movl -128(%ebp), %eax
 movl %eax, -160(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl -160(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -160(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -144(%ebp)
 jmp BB21
E31:
 pushl -160(%ebp)
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
 jmp BB19
E34:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB19:
 pushl -160(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl -160(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl -160(%ebp)
 call project_bool
 addl $(4), %esp
BB20:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -144(%ebp)
BB21:
 movl -144(%ebp), %esi
 movl %esi, -92(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF37:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, -140(%ebp)
 pushl -92(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -140(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -88(%ebp)
 jmp BB24
E36:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E38
IF38:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB24
E38:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, -120(%ebp)
 jmp BB22
E39:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, -120(%ebp)
BB22:
 pushl -92(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -92(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB23
E40:
 pushl -92(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB23:
 movl -120(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
BB24:
 movl -88(%ebp), %eax
 movl %eax, -8(%ebp)
 movl -8(%ebp), %eax
 movl %eax, -44(%ebp)
 movl -8(%ebp), %eax
 movl %eax, -60(%ebp)
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E41
IF41:
 pushl -60(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB27
IF42:
 pushl -44(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -60(%ebp)
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
 jmp BB27
E41:
 pushl -60(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E43
IF43:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB27
E43:
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB25
E44:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB25:
 pushl -60(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl -60(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB26
E45:
 pushl -60(%ebp)
 call project_bool
 addl $(4), %esp
BB26:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB27:
 movl %ebx, -72(%ebp)
 movl -84(%ebp), %ebx
 movl -116(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF47:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -52(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -100(%ebp)
 jmp BB30
E46:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E48
IF48:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB30
E48:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB28
E49:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB28:
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB29
E50:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
BB29:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -100(%ebp)
BB30:
 movl -100(%ebp), %ebx
 movl -56(%ebp), %eax
 movl %eax, -28(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF52:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -136(%ebp)
 jmp BB33
E51:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E53
IF53:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB33
E53:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB31
E54:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB31:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB32
E55:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
BB32:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB33:
 movl -136(%ebp), %ebx
 movl -104(%ebp), %eax
 movl %eax, -96(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 pushl -96(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB36
IF57:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -96(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -108(%ebp)
 jmp BB36
E56:
 pushl -96(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E58
IF58:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB36
E58:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB34
E59:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB34:
 pushl -96(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl -96(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB35
E60:
 pushl -96(%ebp)
 call project_bool
 addl $(4), %esp
BB35:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
BB36:
 movl -108(%ebp), %ebx
 movl -124(%ebp), %eax
 movl %eax, -64(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl -64(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB39
IF62:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -64(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -168(%ebp)
 jmp BB39
E61:
 pushl -64(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E63
IF63:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB39
E63:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E64
IF64:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB37
E64:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB37:
 pushl -64(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl -64(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB38
E65:
 pushl -64(%ebp)
 call project_bool
 addl $(4), %esp
BB38:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -168(%ebp)
BB39:
 movl -168(%ebp), %ebx
 movl -128(%ebp), %eax
 movl %eax, -68(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl -68(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB42
IF67:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -68(%ebp)
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
 jmp BB42
E66:
 pushl -68(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E68
IF68:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB42
E68:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E69
IF69:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB40
E69:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB40:
 pushl -68(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 pushl -68(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB41
E70:
 pushl -68(%ebp)
 call project_bool
 addl $(4), %esp
BB41:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB42:
 movl -20(%ebp), %ebx
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E71
IF71:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB45
IF72:
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
 movl %eax, -148(%ebp)
 jmp BB45
E71:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E73
IF73:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB45
E73:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E74
IF74:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB43
E74:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB43:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E75
IF75:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB44
E75:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB44:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -148(%ebp)
BB45:
 movl -148(%ebp), %eax
 movl %eax, -48(%ebp)
 movl -8(%ebp), %ebx
 pushl -48(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E76
IF76:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB48
IF77:
 pushl -48(%ebp)
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
 jmp BB48
E76:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E78
IF78:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB48
E78:
 pushl -48(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E79
IF79:
 pushl -48(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB46
E79:
 pushl -48(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB46:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E80
IF80:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB47
E80:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB47:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB48:
 movl -72(%ebp), %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E81
IF81:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB51
IF82:
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
 movl %eax, -164(%ebp)
 jmp BB51
E81:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E83
IF83:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB51
E83:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E84
IF84:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB49
E84:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB49:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E85
IF85:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB50
E85:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB50:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -164(%ebp)
BB51:
 movl -164(%ebp), %eax
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
