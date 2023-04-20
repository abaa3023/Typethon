.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(12), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, -4(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl -4(%ebp)
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl -4(%ebp)
 call project_big
 addl $(4), %esp
 movl %eax, -8(%ebp)
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
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
 pushl %ebx
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
 pushl -4(%ebp)
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl -4(%ebp)
 call project_int
 addl $(4), %esp
 movl %eax, -12(%ebp)
 jmp BB1
E4:
 pushl -4(%ebp)
 call project_bool
 addl $(4), %esp
 movl %eax, -12(%ebp)
BB1:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %ebx
 call project_int
 addl $(4), %esp
 jmp BB2
E5:
 pushl %ebx
 call project_bool
 addl $(4), %esp
BB2:
 cmpl -12(%ebp), %eax
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
 movl %eax, %esi
BB4:
 pushl %esi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call not_equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB7
E9:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E8:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E10
IF10:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E10:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E11
IF11:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB5
E11:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
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
 cmpl %ebx, %eax
 setne %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB7:
 movl %eax, %ebx
 pushl %ebx
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB8
IF13:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB8:
 movl %edi, %eax
 jmp BB9
E7:
 movl %esi, %eax
BB9:
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
