.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(192), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, -56(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
 movl -56(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -88(%ebp)
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
 movl %eax, %ebx
 jmp BB3
E1:
 pushl -52(%ebp)
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
 pushl -88(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -88(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl -88(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB1:
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 movl %ebx, -180(%ebp)
 movl -180(%ebp), %eax
 movl %eax, -148(%ebp)
 movl -180(%ebp), %ebx
 pushl -148(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -148(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -28(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -48(%ebp)
 jmp BB6
E6:
 pushl %ebx
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
 pushl -148(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -148(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -156(%ebp)
 jmp BB4
E9:
 pushl -148(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -156(%ebp)
BB4:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB5:
 movl -156(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB6:
 movl -48(%ebp), %eax
 movl %eax, -184(%ebp)
 movl -184(%ebp), %ebx
 movl -184(%ebp), %eax
 movl %eax, -124(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -124(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -124(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB9
E11:
 pushl -124(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB7
E14:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB7:
 pushl -124(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -124(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl -124(%ebp)
 call project_bool
 addl $(4), %esp
BB8:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB9:
 movl -44(%ebp), %ebx
 movl %ebx, -60(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -60(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl %ebx
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
 movl %eax, %edi
 jmp BB12
E16:
 pushl -60(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB10
E19:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB10:
 pushl -60(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -60(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -60(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB12:
 movl %edi, -64(%ebp)
 movl -64(%ebp), %eax
 movl %eax, -12(%ebp)
 movl -64(%ebp), %edi
 pushl -12(%ebp)
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
 pushl -12(%ebp)
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
 movl %eax, -192(%ebp)
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
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -84(%ebp)
 jmp BB13
E24:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -84(%ebp)
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
 movl -84(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -192(%ebp)
BB15:
 movl -192(%ebp), %eax
 movl %eax, -112(%ebp)
 movl -112(%ebp), %edi
 movl -112(%ebp), %eax
 movl %eax, -168(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl -168(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -168(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -128(%ebp)
 jmp BB18
E26:
 pushl -168(%ebp)
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
 pushl -168(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -168(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl -168(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
BB18:
 movl -128(%ebp), %eax
 movl %eax, -176(%ebp)
 movl -176(%ebp), %edi
 movl -176(%ebp), %eax
 movl %eax, -24(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
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
 movl %eax, -72(%ebp)
 jmp BB21
E31:
 pushl -24(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB19
E34:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB19:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -72(%ebp)
BB21:
 movl -72(%ebp), %eax
 movl %eax, -80(%ebp)
 movl -80(%ebp), %edi
 movl -80(%ebp), %eax
 movl %eax, -76(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF37:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -76(%ebp)
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
 jmp BB24
E36:
 pushl -76(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB22
E39:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB22:
 pushl -76(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -76(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB23
E40:
 pushl -76(%ebp)
 call project_bool
 addl $(4), %esp
BB23:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
BB24:
 movl -104(%ebp), %edi
 movl %edi, -144(%ebp)
 pushl -144(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E41
IF41:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB27
IF42:
 pushl -144(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -152(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -152(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 jmp BB27
E41:
 pushl %edi
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
 pushl -144(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -144(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -120(%ebp)
 jmp BB25
E44:
 pushl -144(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -120(%ebp)
BB25:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB26
E45:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB26:
 movl -120(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
BB27:
 movl -36(%ebp), %eax
 movl %eax, -132(%ebp)
 movl -180(%ebp), %eax
 movl %eax, -100(%ebp)
 movl -184(%ebp), %eax
 movl %eax, -116(%ebp)
 pushl -100(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl -116(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF47:
 pushl -100(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -92(%ebp)
 pushl -116(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -92(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB30
E46:
 pushl -116(%ebp)
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
 pushl -100(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl -100(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
 jmp BB28
E49:
 pushl -100(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB28:
 pushl -116(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl -116(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB29
E50:
 pushl -116(%ebp)
 call project_bool
 addl $(4), %esp
BB29:
 movl -136(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB30:
 movl -16(%ebp), %eax
 movl %eax, -140(%ebp)
 movl %ebx, -4(%ebp)
 pushl -140(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF52:
 pushl -140(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -68(%ebp)
 jmp BB33
E51:
 pushl -4(%ebp)
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
 pushl -140(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E54
IF54:
 pushl -140(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB31
E54:
 pushl -140(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB31:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB32
E55:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB32:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -68(%ebp)
BB33:
 movl -68(%ebp), %eax
 movl %eax, -108(%ebp)
 movl -64(%ebp), %ebx
 pushl -108(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB36
IF57:
 pushl -108(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -96(%ebp)
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -96(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB36
E56:
 pushl %ebx
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
 pushl -108(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl -108(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 jmp BB34
E59:
 pushl -108(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB34:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB35
E60:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB35:
 movl -40(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB36:
 movl -8(%ebp), %ebx
 movl -112(%ebp), %eax
 movl %eax, -20(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB39
IF62:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -20(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 jmp BB39
E61:
 pushl -20(%ebp)
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB38
E65:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
BB38:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB39:
 movl -176(%ebp), %ebx
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB42
IF67:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -172(%ebp)
 jmp BB42
E66:
 pushl %ebx
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E69
IF69:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB40
E69:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB40:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB41
E70:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB41:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -172(%ebp)
BB42:
 movl -172(%ebp), %ebx
 movl -80(%ebp), %esi
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
 movl %eax, -160(%ebp)
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
 movl %eax, -160(%ebp)
BB45:
 movl -160(%ebp), %ebx
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E76
IF76:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB48
IF77:
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
 movl %eax, -188(%ebp)
 jmp BB48
E76:
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E79
IF79:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB46
E79:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB46:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E80
IF80:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB47
E80:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB47:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -188(%ebp)
BB48:
 movl -188(%ebp), %edi
 movl -132(%ebp), %ebx
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
 movl %eax, -32(%ebp)
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
 movl %eax, -32(%ebp)
BB51:
 movl -32(%ebp), %eax
 pushl -80(%ebp)
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
