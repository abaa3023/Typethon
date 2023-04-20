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
 movl %eax, -20(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
 movl -20(%ebp), %eax
 movl %eax, -12(%ebp)
 movl -16(%ebp), %eax
 movl %eax, -4(%ebp)
 pushl -12(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB3
IF2:
 pushl -12(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl -4(%ebp)
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
 pushl -4(%ebp)
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
 pushl -12(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -12(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E4:
 pushl -12(%ebp)
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
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 pushl -16(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -16(%ebp)
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB4
E6:
 pushl -16(%ebp)
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF7:
 pushl -16(%ebp)
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB4:
 movl -20(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB7
IF9:
 pushl -8(%ebp)
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
 movl %eax, %edi
 jmp BB7
E8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB7
E10:
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB5
E11:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB5:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E12
IF12:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB6
E12:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB6:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB7:
 call create_dict
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 pushl %ebx
 pushl %esi
 call set_subscript
 addl $(12), %esp
 movl %esi, %eax
END0:

 popl %esi
 popl %ebx
 popl %edi
 movl $0, %eax
 movl %ebp , %esp
 popl %ebp
 ret
