.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(144), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -96(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -132(%ebp)
 pushl -96(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -132(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -96(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -128(%ebp)
 pushl -132(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -128(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB3
E1:
 pushl -132(%ebp)
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
 pushl -96(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -96(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -84(%ebp)
 jmp BB1
E4:
 pushl -96(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -84(%ebp)
BB1:
 pushl -132(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -132(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -132(%ebp)
 call project_bool
 addl $(4), %esp
BB2:
 movl -84(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB3:
 movl -16(%ebp), %eax
 movl %eax, -64(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -104(%ebp)
 pushl -64(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -104(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -64(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -88(%ebp)
 pushl -104(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -88(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -136(%ebp)
 jmp BB6
E6:
 pushl -104(%ebp)
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
 pushl -64(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -64(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
 jmp BB4
E9:
 pushl -64(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -56(%ebp)
BB4:
 pushl -104(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -104(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB5
E10:
 pushl -104(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB5:
 movl -56(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -136(%ebp)
BB6:
 movl -136(%ebp), %eax
 movl %eax, -100(%ebp)
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl -100(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -28(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl -100(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
 pushl -28(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -44(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -52(%ebp)
 jmp BB9
E11:
 pushl -28(%ebp)
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
 pushl -100(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -100(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -144(%ebp)
 jmp BB7
E14:
 pushl -100(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -144(%ebp)
BB7:
 pushl -28(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl -28(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB8
E15:
 pushl -28(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB8:
 movl -144(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -52(%ebp)
BB9:
 movl -52(%ebp), %eax
 movl %eax, -108(%ebp)
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -60(%ebp)
 pushl -108(%ebp)
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
 pushl -108(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -120(%ebp)
 pushl -60(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -120(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -92(%ebp)
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
 pushl -108(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -108(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 jmp BB10
E19:
 pushl -108(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -36(%ebp)
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
 movl -36(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -92(%ebp)
BB12:
 movl -92(%ebp), %eax
 movl %eax, -112(%ebp)
 pushl $(5)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl -112(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -24(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB15
IF22:
 pushl -112(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -32(%ebp)
 pushl -24(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -32(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -68(%ebp)
 jmp BB15
E21:
 pushl -24(%ebp)
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
 pushl -112(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E24
IF24:
 pushl -112(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -80(%ebp)
 jmp BB13
E24:
 pushl -112(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -80(%ebp)
BB13:
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 movl -80(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -68(%ebp)
BB15:
 movl -68(%ebp), %eax
 movl %eax, -124(%ebp)
 pushl $(6)
 call inject_int
 addl $(4), %esp
 movl %eax, -72(%ebp)
 pushl -124(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E26
IF26:
 pushl -72(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB18
IF27:
 pushl -124(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl -72(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -12(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -140(%ebp)
 jmp BB18
E26:
 pushl -72(%ebp)
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
 pushl -124(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E29
IF29:
 pushl -124(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
 jmp BB16
E29:
 pushl -124(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB16:
 pushl -72(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E30
IF30:
 pushl -72(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB17
E30:
 pushl -72(%ebp)
 call project_bool
 addl $(4), %esp
BB17:
 movl -48(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -140(%ebp)
BB18:
 movl -140(%ebp), %eax
 movl %eax, -76(%ebp)
 pushl $(7)
 call inject_int
 addl $(4), %esp
 movl %eax, -116(%ebp)
 pushl -76(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E31
IF31:
 pushl -116(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB21
IF32:
 pushl -76(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -116(%ebp)
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
 jmp BB21
E31:
 pushl -116(%ebp)
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
 pushl -76(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E34
IF34:
 pushl -76(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB19
E34:
 pushl -76(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB19:
 pushl -116(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E35
IF35:
 pushl -116(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB20
E35:
 pushl -116(%ebp)
 call project_bool
 addl $(4), %esp
BB20:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB21:
 movl %edi, -40(%ebp)
 pushl $(8)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -40(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E36
IF36:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB24
IF37:
 pushl -40(%ebp)
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
 jmp BB24
E36:
 pushl %edi
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
 pushl -40(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E39
IF39:
 pushl -40(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB22
E39:
 pushl -40(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB22:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E40
IF40:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB23
E40:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB23:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB24:
 movl %ebx, %edi
 pushl $(9)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E41
IF41:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB27
IF42:
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
 movl %eax, -4(%ebp)
 jmp BB27
E41:
 pushl %ebx
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E44
IF44:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB25
E44:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB25:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E45
IF45:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB26
E45:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB26:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB27:
 movl -4(%ebp), %edi
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E46
IF46:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB30
IF47:
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
 movl %eax, -8(%ebp)
 jmp BB30
E46:
 pushl %ebx
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E50
IF50:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB29
E50:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB29:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB30:
 movl -8(%ebp), %edi
 pushl $(11)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E51
IF51:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB33
IF52:
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
 movl %eax, -20(%ebp)
 jmp BB33
E51:
 pushl %ebx
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E55
IF55:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB32
E55:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB32:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB33:
 movl -20(%ebp), %edi
 pushl $(12)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
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
 movl %eax, %esi
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
 jmp BB34
E59:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
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
 jmp BB35
E60:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB35:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB36:
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
