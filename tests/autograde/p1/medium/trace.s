.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(52), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(3)
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
 pushl $(1)
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
 pushl $(2)
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
 pushl $(3)
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
 movl %eax, -52(%ebp)
 pushl $(4)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -52(%ebp)
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl $(5)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -40(%ebp)
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -36(%ebp)
 pushl $(6)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -36(%ebp)
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 pushl $(7)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -12(%ebp)
 pushl -4(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -28(%ebp)
 pushl $(8)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -28(%ebp)
 pushl -4(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl $(9)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -24(%ebp)
 pushl -4(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl -16(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl -16(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl -4(%ebp)
 pushl %eax
 pushl -16(%ebp)
 call set_subscript
 addl $(12), %esp
 movl -16(%ebp), %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, -48(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %ecx
 movl -48(%ebp), %eax
 movl %eax, -20(%ebp)
 movl %ecx, %edi
 pushl -20(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -20(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -32(%ebp)
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -32(%ebp)
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -44(%ebp)
 jmp BB3
E1:
 pushl %edi
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
 pushl -20(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -20(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -8(%ebp)
 jmp BB1
E4:
 pushl -20(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -8(%ebp)
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
 movl %eax, %ecx
 jmp BB2
E5:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %ecx
BB2:
 movl -8(%ebp), %eax
 addl %ecx, %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -44(%ebp)
BB3:
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl -44(%ebp), %edi
 movl %eax, %ebx
 pushl %edi
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
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB6:
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
