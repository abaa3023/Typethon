.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(8), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 call eval_input_pyobj
 movl %eax, %esi
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %esi
 call project_int
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 jmp BB1
E1:
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB1
IF2:
 pushl %esi
 call project_bool
 addl $(4), %esp
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
BB1:
 movl -4(%ebp), %eax
 movl %eax, -8(%ebp)
 pushl $(23)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl -8(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF4:
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
 jmp BB4
E3:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB4
E5:
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB2
E6:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB2:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB3
E7:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB3:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB4:
 movl %edi, %esi
 call eval_input_pyobj
 movl %eax, %edi
 pushl %edi
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
 movl %eax, %ebx
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
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB5
E11:
 pushl %edi
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
 movl %eax, %ebx
BB7:
 movl %ebx, %eax
 pushl %eax
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
