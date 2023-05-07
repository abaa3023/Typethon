.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(20), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 pushl %edi
 call set_subscript
 addl $(12), %esp
 movl %edi, -4(%ebp)
 pushl $(2)
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
 pushl $(3)
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
 pushl $(4)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -4(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, -20(%ebp)
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl -20(%ebp)
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
 pushl -20(%ebp)
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl -20(%ebp)
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
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -4(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %ecx
 movl -12(%ebp), %eax
 movl %eax, -8(%ebp)
 movl %ecx, %edi
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF7:
 pushl -8(%ebp)
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
 movl %eax, %esi
 jmp BB6
E6:
 pushl %edi
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB4
E9:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB4:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB5
E10:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB5:
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB6:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %esi, %edi
 movl %eax, %ebx
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB9
IF12:
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
 movl %eax, -16(%ebp)
 jmp BB9
E11:
 pushl %ebx
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E14
IF14:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB7
E14:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB7:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB9:
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
