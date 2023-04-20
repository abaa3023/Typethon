.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(28), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 call eval_input_pyobj
 movl %eax, %esi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 movl -28(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
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
 pushl %esi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl %esi
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
 movl %eax, -8(%ebp)
BB4:
 pushl -8(%ebp)
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB14
WB1:
 pushl -16(%ebp)
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB5
E7:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB5:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF8:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB6:
 movl %ebx, -16(%ebp)
 movl -28(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF10:
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB9
E9:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB9
E11:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 jmp BB7
E12:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -20(%ebp)
BB7:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E13
IF13:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB8
E13:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB8:
 movl -20(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB9:
 movl -12(%ebp), %eax
 movl %eax, -28(%ebp)
 movl -28(%ebp), %edi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB12
E15:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB12
E14:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB12
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
 jmp BB10
E17:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB10:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E18
IF18:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB11
E18:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB11:
 cmpl %edi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB12:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB13
IF19:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
BB13:
 pushl -8(%ebp)
 call is_true
 addl $(4), %esp
 jmp WC1
BB14:
 pushl -16(%ebp)
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
