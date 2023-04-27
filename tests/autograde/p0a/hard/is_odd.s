.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(4), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB1
E1:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB1:
 movl %eax, %esi
 pushl %esi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB2
IF2:
 pushl %esi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB2:
 movl %ebx, %esi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB5
IF4:
 pushl %esi
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
 jmp BB5
E3:
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB5
E5:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB3
E6:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 jmp BB4
E7:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
BB4:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB5:
 pushl %edi
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
