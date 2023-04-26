.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 movl $(1), %eax
 cmpl $(0), %eax
 je E1
IF1:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl %esi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB3
E3:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E2:
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E4:
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB1
E5:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB1:
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %esi
 call project_int
 addl $(4), %esp
 jmp BB2
E6:
 pushl %esi
 call project_bool
 addl $(4), %esp
BB2:
 cmpl %ebx, %eax
 sete %al
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
IF7:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB4:
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl $(4)
 call inject_int
 addl $(4), %esp
 jmp BB5
E8:
 movl %edi, %eax
BB5:

 jmp BB6
E1:
 pushl $(1)
 call inject_int
 addl $(4), %esp
BB6:
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
