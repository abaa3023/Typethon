.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(196), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -164(%ebp)
 movl %edi, -24(%ebp)
 pushl -164(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -164(%ebp)
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
 jmp BB3
E1:
 pushl -24(%ebp)
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
 pushl -164(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -164(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB1
E4:
 pushl -164(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB1:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB3:
 movl -12(%ebp), %eax
 movl %eax, -176(%ebp)
 movl -176(%ebp), %edi
 movl -176(%ebp), %eax
 movl %eax, -36(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -36(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -112(%ebp)
 jmp BB6
E6:
 pushl -36(%ebp)
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB4
E9:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB4:
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
BB5:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -112(%ebp)
BB6:
 movl -112(%ebp), %edi
 movl %edi, -4(%ebp)
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -28(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -132(%ebp)
 jmp BB9
E11:
 pushl %edi
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB7
E14:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB7:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB8:
 movl -20(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -132(%ebp)
BB9:
 movl -132(%ebp), %eax
 movl %eax, -172(%ebp)
 movl -172(%ebp), %eax
 movl %eax, -104(%ebp)
 movl -172(%ebp), %eax
 movl %eax, -148(%ebp)
 pushl -104(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -148(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl -104(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -148(%ebp)
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
 jmp BB12
E16:
 pushl -148(%ebp)
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
 pushl -104(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -104(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB10
E19:
 pushl -104(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB10:
 pushl -148(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl -148(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl -148(%ebp)
 call project_bool
 addl $(4), %esp
BB11:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB12:
 movl %esi, -136(%ebp)
 movl -136(%ebp), %esi
 movl -136(%ebp), %eax
 movl %eax, -32(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -32(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl %esi
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
 movl %eax, -76(%ebp)
 jmp BB15
E21:
 pushl -32(%ebp)
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
 pushl -32(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -32(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -32(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -76(%ebp)
BB15:
 movl -76(%ebp), %eax
 movl %eax, -68(%ebp)
 movl -68(%ebp), %eax
 movl %eax, -84(%ebp)
 movl -68(%ebp), %esi
 pushl -84(%ebp)
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
 pushl -84(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -140(%ebp)
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
 pushl -84(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl -84(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -128(%ebp)
 jmp BB16
E29:
 pushl -84(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -128(%ebp)
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
 movl -128(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -140(%ebp)
BB18:
 movl -140(%ebp), %esi
 movl %esi, -168(%ebp)
 pushl -168(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
 pushl -168(%ebp)
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
 movl %eax, %ebx
 jmp BB21
E31:
 pushl %esi
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
 pushl -168(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl -168(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB19
E34:
 pushl -168(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB19:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB20:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB21:
 movl %ebx, -44(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl -44(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF37:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, -196(%ebp)
 pushl -44(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -196(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -116(%ebp)
 jmp BB24
E36:
 pushl -44(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, -108(%ebp)
 jmp BB22
E39:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, -108(%ebp)
BB22:
 pushl -44(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl -44(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB23
E40:
 pushl -44(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB23:
 movl -108(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -116(%ebp)
BB24:
 movl -116(%ebp), %eax
 movl %eax, -144(%ebp)
 movl -144(%ebp), %eax
 movl %eax, -152(%ebp)
 movl -144(%ebp), %eax
 movl %eax, -64(%ebp)
 pushl -152(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E41
IF41:
 pushl -64(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB27
IF42:
 pushl -152(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -96(%ebp)
 pushl -64(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -96(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -180(%ebp)
 jmp BB27
E41:
 pushl -64(%ebp)
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
 pushl -152(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl -152(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -52(%ebp)
 jmp BB25
E44:
 pushl -152(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -52(%ebp)
BB25:
 pushl -64(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl -64(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB26
E45:
 pushl -64(%ebp)
 call project_bool
 addl $(4), %esp
BB26:
 movl -52(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -180(%ebp)
BB27:
 movl -180(%ebp), %eax
 movl %eax, -80(%ebp)
 movl -176(%ebp), %eax
 movl %eax, -156(%ebp)
 pushl -156(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF47:
 pushl -156(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -192(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -192(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -188(%ebp)
 jmp BB30
E46:
 pushl %edi
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
 pushl -156(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E49
IF49:
 pushl -156(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -100(%ebp)
 jmp BB28
E49:
 pushl -156(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -100(%ebp)
BB28:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB29
E50:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB29:
 movl -100(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -188(%ebp)
BB30:
 movl -188(%ebp), %edi
 movl -172(%ebp), %eax
 movl %eax, -92(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl -92(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF52:
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
 jmp BB33
E51:
 pushl -92(%ebp)
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
 pushl -92(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl -92(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB32
E55:
 pushl -92(%ebp)
 call project_bool
 addl $(4), %esp
BB32:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -60(%ebp)
BB33:
 movl -60(%ebp), %eax
 movl %eax, -56(%ebp)
 movl -136(%ebp), %edi
 pushl -56(%ebp)
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
 pushl -56(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -160(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -160(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -120(%ebp)
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
 pushl -56(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E59
IF59:
 pushl -56(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
 jmp BB34
E59:
 pushl -56(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -48(%ebp)
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
 movl -48(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -120(%ebp)
BB36:
 movl -120(%ebp), %edi
 movl -68(%ebp), %eax
 movl %eax, -40(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E61
IF61:
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB39
IF62:
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
 movl %eax, -88(%ebp)
 jmp BB39
E61:
 pushl -40(%ebp)
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
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E65
IF65:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB38
E65:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
BB38:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -88(%ebp)
BB39:
 movl -88(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E66
IF66:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB42
IF67:
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
 movl %eax, -184(%ebp)
 jmp BB42
E66:
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E70
IF70:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB41
E70:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB41:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -184(%ebp)
BB42:
 movl -184(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E71
IF71:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB45
IF72:
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
E71:
 pushl %ebx
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
 jmp BB43
E74:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB43:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E75
IF75:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB44
E75:
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
 movl -72(%ebp), %esi
 movl -144(%ebp), %edi
 pushl %esi
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
 movl %eax, -124(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E79
IF79:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB46
E79:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -124(%ebp)
BB48:
 movl -124(%ebp), %esi
 movl -80(%ebp), %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E81
IF81:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB51
IF82:
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
 movl %eax, -16(%ebp)
 jmp BB51
E81:
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E84
IF84:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB49
E84:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB49:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E85
IF85:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB50
E85:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB50:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB51:
 movl -16(%ebp), %eax
 pushl %ebx
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
