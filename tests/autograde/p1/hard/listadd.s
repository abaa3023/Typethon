.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(24), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(15)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl $(4)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -20(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, -24(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 movl -20(%ebp), %eax
 movl %eax, -8(%ebp)
 movl %esi, -4(%ebp)
 pushl -8(%ebp)
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
 pushl -8(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call add
 addl $(8), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -16(%ebp)
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
 pushl -8(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -8(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB1
E4:
 pushl -8(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
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
 movl %esi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, -16(%ebp)
BB3:
 movl -16(%ebp), %eax
 movl %eax, -20(%ebp)
 movl $(1), %eax
 negl %eax
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %edi, %esi
 movl %eax, %edi
 pushl %esi
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
 pushl %esi
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
 movl %eax, -12(%ebp)
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB4
E9:
 pushl %esi
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
 movl %eax, -12(%ebp)
BB6:
 movl -12(%ebp), %edi
 movl -24(%ebp), %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E15
IF15:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB8
E15:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB8:
 movl %edi, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB9:
 movl %ebx, -24(%ebp)
 pushl -20(%ebp)
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
