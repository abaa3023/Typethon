.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(60), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(4)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(15)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(25)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(35)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(45)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 movl %ebx, %edi
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 movl -4(%ebp), %eax
 movl %eax, -24(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl -24(%ebp)
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
 pushl -24(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -32(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -32(%ebp)
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
 pushl -24(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -24(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 jmp BB1
E4:
 pushl -24(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -16(%ebp)
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
 cmpl -16(%ebp), %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
 pushl %eax
 call is_true
 addl $(4), %esp
WC1:
 cmpl $(0), %eax
 je BB16
WB1:
 pushl -20(%ebp)
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %esi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
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
 movl %eax, -48(%ebp)
 jmp BB6
E6:
 pushl %esi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB4
E9:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB4:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB5:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -48(%ebp)
BB6:
 movl -48(%ebp), %ebx
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ecx
 movl -4(%ebp), %eax
 movl %eax, -36(%ebp)
 movl %ecx, %esi
 pushl -36(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
 pushl -36(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -40(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -60(%ebp)
 jmp BB9
E11:
 pushl %esi
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
 pushl -36(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl -36(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -56(%ebp)
 jmp BB7
E14:
 pushl -36(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -56(%ebp)
BB7:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ecx
 jmp BB8
E15:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB8:
 movl -56(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -60(%ebp)
BB9:
 movl -60(%ebp), %eax
 movl %eax, -4(%ebp)
 movl -20(%ebp), %eax
 movl %eax, -52(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl -52(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E16
IF16:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB12
IF17:
 pushl -52(%ebp)
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
 movl %eax, -28(%ebp)
 jmp BB12
E16:
 pushl %esi
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
 pushl -52(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E19
IF19:
 pushl -52(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB10
E19:
 pushl -52(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB10:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E20
IF20:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB11
E20:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB11:
 movl -44(%ebp), %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
BB12:
 movl -28(%ebp), %eax
 movl %eax, -20(%ebp)
 movl -4(%ebp), %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E21
IF21:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E22
IF22:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB15
E22:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB15
E21:
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E23
IF23:
 pushl $(1)
 call inject_bool
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
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E25
IF25:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB14
E25:
 pushl -12(%ebp)
 call project_bool
 addl $(4), %esp
BB14:
 cmpl %esi, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB15:
 pushl %eax
 call is_true
 addl $(4), %esp
 jmp WC1
BB16:
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
