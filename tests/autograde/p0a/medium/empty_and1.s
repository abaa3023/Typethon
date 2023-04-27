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
 pushl $(2)
 call inject_int
 addl $(4), %esp
 jmp BB1
E1:
 pushl $(1)
 call inject_int
 addl $(4), %esp
BB1:
 movl %eax, %edi
 movl $(3), %eax
 cmpl $(0), %eax
 je E2
IF2:
 pushl $(5)
 call inject_int
 addl $(4), %esp
 jmp BB2
E2:
 pushl $(3)
 call inject_int
 addl $(4), %esp
BB2:
 movl %edi, %ebx
 movl %eax, %edi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %ebx
 call project_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %ebx
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
 pushl %edi
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
 pushl %ebx
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %ebx
 call project_int
 addl $(4), %esp
 movl %eax, %ebx
 jmp BB3
E6:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB3:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E7
IF7:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB4
E7:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB4:
 cmpl %ebx, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB5:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB6
IF8:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
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
