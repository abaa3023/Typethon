.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(16), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(10)
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 movl -8(%ebp), %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %ebx
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
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
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
 cmpl %ebx, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
 movl %eax, %ebx
 pushl %ebx
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF6:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB4:
 pushl %edi
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je END0
WB1:
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ecx
 movl -8(%ebp), %eax
 movl %eax, -16(%ebp)
 movl %ecx, %ebx
 pushl -16(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF8:
 pushl -16(%ebp)
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
 movl %eax, %esi
 jmp BB7
E7:
 pushl %ebx
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
 movl %eax, %esi
 jmp BB5
E10:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB5:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB6
E11:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB6:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB7:
 movl %esi, -8(%ebp)
 call eval_input_pyobj
 movl -8(%ebp), %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
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
 pushl -12(%ebp)
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB8
E15:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB8:
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB9
E16:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
BB9:
 cmpl %ebx, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB10:
 movl %eax, %ebx
 pushl %ebx
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB11
IF17:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB11:
 pushl %edi
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
