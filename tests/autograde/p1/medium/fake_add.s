.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 pushl %eax
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
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl %ebx
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E2
IF2:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je BB4
IF3:
 pushl %ebx
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
 movl %eax, %esi
 jmp BB4
E2:
 pushl %edi
 call is_big
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl $(0)
 call error_pyobj
 addl $(4), %esp
 jmp BB4
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
 jmp BB2
E5:
 pushl %ebx
 call project_bool
 addl $(4), %esp
 movl %eax, %ebx
BB2:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E6
IF6:
 pushl %edi
 call project_int
 addl $(4), %esp
 jmp BB3
E6:
 pushl %edi
 call project_bool
 addl $(4), %esp
BB3:
 movl %ebx, %ecx
 addl %eax, %ecx
 pushl %ecx
 call inject_int
 addl $(4), %esp
 movl %eax, %esi
BB4:
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
