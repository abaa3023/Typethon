.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(232), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, -60(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -232(%ebp)
 movl -60(%ebp), %eax
 movl %eax, -88(%ebp)
 pushl -232(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -88(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -232(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -212(%ebp)
 pushl -88(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -212(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -72(%ebp)
 jmp BB3
E1:
 pushl -88(%ebp)
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
 pushl -232(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -232(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
 jmp BB1
E4:
 pushl -232(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -108(%ebp)
BB1:
 pushl -88(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -88(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -88(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl -108(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -72(%ebp)
BB3:
 movl -72(%ebp), %eax
 movl %eax, -56(%ebp)
 movl -56(%ebp), %eax
 movl %eax, -80(%ebp)
 movl -56(%ebp), %eax
 movl %eax, -216(%ebp)
 pushl -80(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -216(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -80(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -132(%ebp)
 pushl -216(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -132(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -228(%ebp)
 jmp BB6
E6:
 pushl -216(%ebp)
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
 pushl -80(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -80(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -116(%ebp)
 jmp BB4
E9:
 pushl -80(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -116(%ebp)
BB4:
 pushl -216(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -216(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -216(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl -116(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -228(%ebp)
BB6:
 movl -228(%ebp), %eax
 movl %eax, -192(%ebp)
 movl -192(%ebp), %eax
 movl %eax, -144(%ebp)
 movl -192(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl -144(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl -144(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl -52(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -28(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -136(%ebp)
 jmp BB9
E11:
 pushl -52(%ebp)
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
 pushl -144(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -144(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 jmp BB7
E14:
 pushl -144(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -40(%ebp)
BB7:
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB8
E15:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB8:
 movl -40(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB9:
 movl -136(%ebp), %eax
 movl %eax, -68(%ebp)
 movl -68(%ebp), %eax
 movl %eax, -16(%ebp)
 movl -68(%ebp), %eax
 movl %eax, -24(%ebp)
 pushl -16(%ebp)
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
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl -24(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -36(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -120(%ebp)
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
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -160(%ebp)
 jmp BB10
E19:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -160(%ebp)
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
 movl -160(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -120(%ebp)
BB12:
 movl -120(%ebp), %eax
 movl %eax, -180(%ebp)
 movl -180(%ebp), %eax
 movl %eax, -164(%ebp)
 movl -180(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl -164(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl -164(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -140(%ebp)
 pushl -8(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -140(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -48(%ebp)
 jmp BB15
E21:
 pushl -8(%ebp)
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
 pushl -164(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl -164(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -32(%ebp)
 jmp BB13
E24:
 pushl -164(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -32(%ebp)
BB13:
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl -32(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB15:
 movl -48(%ebp), %eax
 movl %eax, -64(%ebp)
 movl -64(%ebp), %eax
 movl %eax, -148(%ebp)
 movl -64(%ebp), %eax
 movl %eax, -196(%ebp)
 pushl -148(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl -196(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
 pushl -148(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -196(%ebp)
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
 jmp BB18
E26:
 pushl -196(%ebp)
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
 pushl -148(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl -148(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB16
E29:
 pushl -148(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB16:
 pushl -196(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -196(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl -196(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB18:
 movl %edi, -188(%ebp)
 movl -188(%ebp), %edi
 movl -188(%ebp), %eax
 movl %eax, -128(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl -128(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -128(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -204(%ebp)
 jmp BB21
E31:
 pushl -128(%ebp)
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
 pushl -128(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl -128(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl -128(%ebp)
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -204(%ebp)
BB21:
 movl -204(%ebp), %eax
 movl %eax, -12(%ebp)
 movl -12(%ebp), %edi
 movl -12(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF37:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -4(%ebp)
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
 pushl -4(%ebp)
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB23
E40:
 pushl -4(%ebp)
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
 movl -104(%ebp), %eax
 movl %eax, -124(%ebp)
 movl -124(%ebp), %eax
 movl %eax, -200(%ebp)
 movl -124(%ebp), %edi
 pushl -200(%ebp)
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
 pushl -200(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -208(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -208(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -76(%ebp)
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
 pushl -200(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -200(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -96(%ebp)
 jmp BB25
E44:
 pushl -200(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -96(%ebp)
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
 movl -96(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -76(%ebp)
BB27:
 movl -76(%ebp), %eax
 movl %eax, -156(%ebp)
 movl -56(%ebp), %edi
 movl -192(%ebp), %eax
 movl %eax, -172(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl -172(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF47:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -172(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -220(%ebp)
 jmp BB30
E46:
 pushl -172(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB28
E49:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB28:
 pushl -172(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl -172(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB29
E50:
 pushl -172(%ebp)
 call project_bool
 addl $(4), %esp
BB29:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -220(%ebp)
BB30:
 movl -220(%ebp), %edi
 movl -68(%ebp), %eax
 movl %eax, -112(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl -112(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF52:
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
 movl %eax, -224(%ebp)
 jmp BB33
E51:
 pushl -112(%ebp)
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
 jmp BB31
E54:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB31:
 pushl -112(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl -112(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB32
E55:
 pushl -112(%ebp)
 call project_bool
 addl $(4), %esp
BB32:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -224(%ebp)
BB33:
 movl -224(%ebp), %eax
 movl %eax, -44(%ebp)
 movl -180(%ebp), %edi
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E56
IF56:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB36
IF57:
 pushl -44(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -168(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -168(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB36
E56:
 pushl %edi
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
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -176(%ebp)
 jmp BB34
E59:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -176(%ebp)
BB34:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E60
IF60:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB35
E60:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB35:
 movl -176(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB36:
 movl -20(%ebp), %edi
 movl -64(%ebp), %eax
 movl %eax, -152(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl -152(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB39
IF62:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -152(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -184(%ebp)
 jmp BB39
E61:
 pushl -152(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E64
IF64:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB37
E64:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB37:
 pushl -152(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl -152(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB38
E65:
 pushl -152(%ebp)
 call project_bool
 addl $(4), %esp
BB38:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -184(%ebp)
BB39:
 movl -184(%ebp), %edi
 movl -188(%ebp), %eax
 movl %eax, -100(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl -100(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB42
IF67:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -100(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 jmp BB42
E66:
 pushl -100(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E69
IF69:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB40
E69:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB40:
 pushl -100(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 pushl -100(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB41
E70:
 pushl -100(%ebp)
 call project_bool
 addl $(4), %esp
BB41:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB42:
 movl -12(%ebp), %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E71
IF71:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB45
IF72:
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
 jmp BB45
E71:
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E74
IF74:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB43
E74:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB43:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E75
IF75:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB44
E75:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB44:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB45:
 movl %ebx, %edi
 movl -124(%ebp), %ebx
 pushl %edi
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
 movl %eax, -92(%ebp)
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
 jmp BB46
E79:
 pushl %edi
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
 movl %eax, -92(%ebp)
BB48:
 movl -92(%ebp), %edi
 movl -156(%ebp), %ebx
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
 movl %eax, -84(%ebp)
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
 movl %eax, -84(%ebp)
BB51:
 movl -84(%ebp), %eax
 pushl -12(%ebp)
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
