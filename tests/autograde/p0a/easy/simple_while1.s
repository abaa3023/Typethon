.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(20), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl $(100)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 movl -8(%ebp), %esi
 pushl %esi
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
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
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
 movl %eax, %ebx
BB4:
 pushl %ebx
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je END0
WB1:
 movl -8(%ebp), %eax
 movl %eax, -16(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl -16(%ebp)
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
 pushl -16(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -4(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -20(%ebp)
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
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB5
E10:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -12(%ebp)
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
 movl %eax, %ecx
 jmp BB6
E11:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB6:
 movl -12(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB7:
 movl -20(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl -8(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 movl %edi, %eax
 jmp BB8
E12:
 movl -8(%ebp), %eax
BB8:
 pushl %eax
 call print_any
 addl $(4), %esp
 movl -8(%ebp), %esi
 pushl %esi
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
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB9
E16:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 cmpl %esi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB11:
 movl %eax, %esi
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF18:
 pushl %esi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB12:
 pushl %ebx
 call is_true
 addl $(4), %esp
 jmp WC1
END0:

 popl %esi
 popl %ebx
 popl %edi
 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
