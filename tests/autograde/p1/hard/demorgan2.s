.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 movl $(False), %esi
 movl $(True), %ebx
 pushl %esi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E1
IF1:
 movl %ebx, %eax
 jmp BB1
E1:
 movl %esi, %eax
BB1:
 movl %eax, %edi
 pushl %esi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB2
E2:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB2:
 movl %eax, %esi
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB5
E4:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB5
E3:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB5
E5:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB3
E6:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
BB3:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB4
E7:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB4:
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB5:
 pushl %eax
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB6
E8:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB6:
 movl %eax, %edi
 pushl %ebx
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E9
IF9:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB7
E9:
 pushl $(1)
 call inject_bool
 addl $(4), %esp
BB7:
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
