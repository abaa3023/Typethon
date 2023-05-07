.globl main
main:
 pushl %ebp
 movl %esp , %ebp
 subl $(72), %esp
 pushl %edi
 pushl %ebx
 pushl %esi
START0:
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(4)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(7)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(5)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(8)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -72(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl -72(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(6)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl -72(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 movl %eax, %edi
 pushl $(9)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 pushl -72(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %esi
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl -72(%ebp)
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 movl %edi, -8(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %esi
 call get_subscript
 addl $(8), %esp
 movl %eax, -28(%ebp)
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl -28(%ebp)
 pushl %eax
 pushl %esi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, -20(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -40(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl -40(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -20(%ebp)
 pushl %eax
 pushl -40(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl -40(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, -60(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, -56(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl -56(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -60(%ebp)
 pushl %eax
 pushl -56(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl -56(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(3)
 call inject_int
 addl $(4), %esp
 pushl %eax
 call create_list
 addl $(4), %esp
 pushl %eax
 call inject_big
 addl $(4), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %esi
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -40(%ebp)
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl -56(%ebp)
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 movl %edi, %esi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, -48(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, -12(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -12(%ebp)
 pushl %eax
 pushl %ebx
 call set_subscript
 addl $(12), %esp
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %ebx
 call get_subscript
 addl $(8), %esp
 movl %eax, %ebx
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -32(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl -48(%ebp)
 pushl %eax
 pushl -32(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -64(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -64(%ebp)
 call get_subscript
 addl $(8), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -68(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -68(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -16(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -52(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl -16(%ebp)
 pushl %eax
 pushl -52(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -4(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -4(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -44(%ebp)
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -24(%ebp)
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl -24(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, -36(%ebp)
 pushl $(0)
 call inject_int
 addl $(4), %esp
 pushl %edi
 pushl %eax
 pushl -36(%ebp)
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(1)
 call inject_int
 addl $(4), %esp
 pushl -44(%ebp)
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %eax
 pushl -8(%ebp)
 call get_subscript
 addl $(8), %esp
 movl %eax, %edi
 pushl $(2)
 call inject_int
 addl $(4), %esp
 pushl %ebx
 pushl %eax
 pushl %edi
 call set_subscript
 addl $(12), %esp
 movl -8(%ebp), %edi
 movl %esi, %ebx
 pushl %edi
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
 pushl %edi
 call project_big
 addl $(4), %esp
 movl %eax, %edi
 pushl %ebx
 call project_big
 addl $(4), %esp
 pushl %eax
 pushl %edi
 call equal
 addl $(8), %esp
 pushl %eax
 call inject_bool
 addl $(4), %esp
 jmp BB3
E2:
 pushl $(0)
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
 pushl $(0)
 call inject_bool
 addl $(4), %esp
 jmp BB3
E3:
 pushl %edi
 call is_int
 addl $(4), %esp
 cmpl $(0), %eax
 je E4
IF4:
 pushl %edi
 call project_int
 addl $(4), %esp
 movl %eax, %edi
 jmp BB1
E4:
 pushl %edi
 call project_bool
 addl $(4), %esp
 movl %eax, %edi
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
 cmpl %edi, %eax
 sete %al
 movzbl %al, %ecx
 movl %ecx, %eax
 pushl %eax
 call inject_bool
 addl $(4), %esp
BB3:
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
