	.file	"memoria.c"
	.comm	memoria,8,8
	.comm	tamanhoMemoria,4,4
	.section	.rodata
	.align 8
.LC0:
	.string	"O tamanho m\303\241ximo da mem\303\263ria \303\251 4096, portanto a mem\303\263ria ter\303\241 somente este tamanho!"
	.text
	.globl	iniciaMemoria
	.type	iniciaMemoria, @function
iniciaMemoria:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$4096, -4(%rbp)
	jle	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$4096, tamanhoMemoria(%rip)
.L2:
	movl	-4(%rbp), %eax
	movl	%eax, tamanhoMemoria(%rip)
	movl	tamanhoMemoria(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, memoria(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	iniciaMemoria, .-iniciaMemoria
	.globl	load
	.type	load, @function
load:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movzbl	uc+8(%rip), %eax
	orl	$2, %eax
	movb	%al, uc+8(%rip)
	movl	$49, %edi
	call	putchar
#APP
# 48 "memoria.c" 1
	movl $5000, %edi 
	movq $0, %rax
	movl %edi, %eax 
	cmp tamanhoMemoria(%rip), %rax 
	jge load_else 
	movq memoria(%rip), %rbx
	shlq $3, %rax 
	addq %rax, %rbx 
	movq (%rbx), %rbx 
	movq %rbx, ula+16(%rip) 
	movq ula+16(%rip), %rdx 
	jmp load_exit 
	load_else:
	 movb $1, uc+8(%rip) 
	teste: 
	 
	 
	 
	 
	 
	load_exit: 
	
# 0 "" 2
#NO_APP
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	load, .-load
	.globl	stor
	.type	stor, @function
stor:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	tamanhoMemoria(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L5
	movq	memoria(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movabsq	$1099511627775, %rdx
	movq	%rdx, %rcx
	andq	ula+16(%rip), %rcx
	movabsq	$1099511627775, %rdx
	movq	%rcx, %rsi
	andq	%rdx, %rsi
	movq	(%rax), %rcx
	movabsq	$-1099511627776, %rdx
	andq	%rcx, %rdx
	orq	%rsi, %rdx
	movq	%rdx, (%rax)
	jmp	.L4
.L5:
	movzbl	uc+8(%rip), %eax
	orl	$2, %eax
	movb	%al, uc+8(%rip)
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	stor, .-stor
	.globl	storEndereco
	.type	storEndereco, @function
storEndereco:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	tamanhoMemoria(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jge	.L8
	cmpl	$0, -24(%rbp)
	je	.L9
	salq	$20, -8(%rbp)
	movq	memoria(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	memoria(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	andq	(%rcx), %rdx
	movq	%rdx, %rcx
	movabsq	$1095217709055, %rdx
	andq	%rcx, %rdx
	addq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	andq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	movq	%rcx, %rsi
	andq	%rdx, %rsi
	movq	(%rax), %rcx
	movabsq	$-1099511627776, %rdx
	andq	%rcx, %rdx
	orq	%rsi, %rdx
	movq	%rdx, (%rax)
	jmp	.L7
.L9:
	movq	memoria(%rip), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	memoria(%rip), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	andq	(%rcx), %rdx
	movq	%rdx, %rcx
	movabsq	$1099511623680, %rdx
	andq	%rcx, %rdx
	addq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	andq	%rdx, %rcx
	movabsq	$1099511627775, %rdx
	movq	%rcx, %rsi
	andq	%rdx, %rsi
	movq	(%rax), %rcx
	movabsq	$-1099511627776, %rdx
	andq	%rcx, %rdx
	orq	%rsi, %rdx
	movq	%rdx, (%rax)
	jmp	.L7
.L8:
	movzbl	uc+8(%rip), %eax
	orl	$2, %eax
	movb	%al, uc+8(%rip)
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	storEndereco, .-storEndereco
	.section	.rodata
.LC1:
	.string	"r"
.LC2:
	.string	"Falha ao abrir o arquivo .hex"
	.text
	.globl	carregaMemoria
	.type	carregaMemoria, @function
carregaMemoria:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$.LC1, %edx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L12
	movl	$.LC2, %edi
	call	puts
.L12:
	movl	$0, -4(%rbp)
	movl	$12, %edi
	call	malloc
	movq	%rax, -16(%rbp)
.L13:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$12, %esi
	movq	%rax, %rdi
	call	fgets
	movl	-4(%rbp), %edx
	addl	$1, -4(%rbp)
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	converteGrava
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	feof
	testl	%eax, %eax
	je	.L13
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	carregaMemoria, .-carregaMemoria
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
