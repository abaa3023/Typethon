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
 movl %eax, %esi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %esi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E3
IF3:
 pushl %esi
 call project_big
 addl $(4), %esp
 movl %eax, %esi
 pushl %edi
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %esi
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
 pushl %edi
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
 pushl %esi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E5
IF5:
 pushl %esi
 call project_int
 addl $(4), %esp
 movl %eax, %esi
 jmp BB1
E5:
 pushl %esi
 call project_bool
 addl $(4), %esp
 movl %eax, %esi
BB1:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB2
E6:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB2:
 cmpl %esi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
 movl %eax, %edi
 pushl %edi
 call is_bool
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF7:
 pushl %edi
 call project_bool
 addl $(4), %esp
 pushl %eax
 call inject_int
 addl $(4), %esp
 movl %eax, %ebx
BB4:
 movl %ebx, %edi
 jmp BB5
E1:
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
BB5:
 pushl %edi
 call is_true
 addl $(4), %esp
 cmpl $(0), %eax
 je E8
IF8:
 pushl $(4)
 call inject_int
 addl $(4), %esp
 jmp BB6
E8:
 movl %edi, %eax
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
