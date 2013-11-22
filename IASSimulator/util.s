	.file	"util.c"
	.text
	.globl	converteGrava
	.type	converteGrava, @function
converteGrava:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	$-1, -56(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-56(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	subq	$1, %rax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L2
.L14:
	movl	-8(%rbp), %eax
	cltq
	addq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$10, %eax
	cmpl	$60, %eax
	ja	.L3
	movl	%eax, %eax
	movq	.L12(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L12:
	.quad	.L15
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L5
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L3
	.quad	.L6
	.quad	.L7
	.quad	.L8
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.text
.L5:
	movl	-8(%rbp), %eax
	cltq
	addq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -4(%rbp)
	jmp	.L3
.L6:
	movl	$10, -4(%rbp)
	jmp	.L3
.L7:
	movl	$11, -4(%rbp)
	jmp	.L3
.L8:
	movl	$12, -4(%rbp)
	jmp	.L3
.L9:
	movl	$13, -4(%rbp)
	jmp	.L3
.L10:
	movl	$14, -4(%rbp)
	jmp	.L3
.L11:
	movl	$15, -4(%rbp)
	nop
.L3:
	movl	-4(%rbp), %eax
	cltq
	imulq	-16(%rbp), %rax
	addq	%rax, -24(%rbp)
	salq	$4, -16(%rbp)
	jmp	.L13
.L15:
	nop
.L13:
	subl	$1, -8(%rbp)
.L2:
	cmpl	$0, -8(%rbp)
	jns	.L14
	movq	-24(%rbp), %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+16(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+16(%rip)
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	stor
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	converteGrava, .-converteGrava
	.section	.rodata
.LC0:
	.string	"%d - %lX\n"
	.text
	.globl	imprimeMemoria
	.type	imprimeMemoria, @function
imprimeMemoria:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L17
.L18:
	movq	memoria(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	(%rdx), %rdx
	andq	%rax, %rdx
	movl	$.LC0, %eax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L18
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	imprimeMemoria, .-imprimeMemoria
	.section	.rodata
.LC1:
	.string	"AC: %lud - "
.LC2:
	.string	"MQ: %lud\n"
.LC3:
	.string	"MBR: %luX\n"
.LC4:
	.string	"IBR: %luX\n"
.LC5:
	.string	"IR: %luX\n"
.LC6:
	.string	"PC: %ud\n"
.LC7:
	.string	"MAR: %ud\n"
	.text
	.globl	imprimeRegistradores
	.type	imprimeRegistradores, @function
imprimeRegistradores:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movl	$.LC1, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+8(%rip), %rdx
	movl	$.LC2, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movl	$.LC3, %eax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	uc(%rip), %eax
	shrl	$8, %eax
	andl	$1048575, %eax
	movl	%eax, %edx
	movl	$.LC4, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movzbl	uc(%rip), %eax
	movzbl	%al, %edx
	movl	$.LC5, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	movswl	%ax, %edx
	movl	$.LC6, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	movswl	%ax, %edx
	movl	$.LC7, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	imprimeRegistradores, .-imprimeRegistradores
	.globl	mask
	.type	mask, @function
mask:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	andq	%rax, %rdx
	movl	-28(%rbp), %eax
	sall	$2, %eax
	movq	%rdx, %rbx
	.cfi_offset 3, -24
	movl	%eax, %ecx
	sarq	%cl, %rbx
	movq	%rbx, %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	mask, .-mask
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
