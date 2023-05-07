.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(12), %esp
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
 movl %eax, -12(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl -12(%ebp)
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
 pushl -12(%ebp)
 call set_subscript
 addl $(12), %esp
 movl -12(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -4(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl -4(%ebp)
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
 pushl -4(%ebp)
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
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
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 pushl %ebx
 call print_any
 addl $(4), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
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
