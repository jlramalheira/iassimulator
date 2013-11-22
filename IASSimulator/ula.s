	.file	"ula.c"
	.comm	ula,24,16
	.text
	.globl	sinalNumero
	.type	sinalNumero, @function
sinalNumero:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movabsq	$549755813887, %rax
	cmpq	%rax, -8(%rbp)
	jle	.L2
	movabsq	$549755813888, %rax
	xorq	%rax, -8(%rbp)
	negq	-8(%rbp)
	movq	-8(%rbp), %rax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sinalNumero, .-sinalNumero
	.globl	numeroSinal
	.type	numeroSinal, @function
numeroSinal:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jns	.L5
	negq	-8(%rbp)
	movabsq	$549755813888, %rax
	addq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	jmp	.L6
.L5:
	movq	-8(%rbp), %rax
.L6:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	numeroSinal, .-numeroSinal
	.globl	circuitoLogicoAritmetico
	.type	circuitoLogicoAritmetico, @function
circuitoLogicoAritmetico:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movzbl	uc(%rip), %eax
	movzbl	%al, %eax
	subl	$5, %eax
	cmpl	$16, %eax
	ja	.L7
	movl	%eax, %eax
	movq	.L17(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L17:
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.quad	.L12
	.quad	.L7
	.quad	.L7
	.quad	.L13
	.quad	.L14
	.quad	.L7
	.quad	.L7
	.quad	.L7
	.quad	.L7
	.quad	.L7
	.quad	.L7
	.quad	.L7
	.quad	.L15
	.quad	.L16
	.text
.L9:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L10:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L11:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdx
	movabsq	$549755813887, %rax
	andq	%rdx, %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L12:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdx
	movabsq	$549755813887, %rax
	andq	%rdx, %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L13:
	movabsq	$1099511627775, %rax
	andq	ula+8(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	imulq	-16(%rbp), %rdx
	movabsq	$549755813887, %rax
	cmpq	%rax, %rdx
	jle	.L18
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	imulq	-16(%rbp), %rdx
	movabsq	$-549755813887, %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movq	-16(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+8(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+8(%rip)
	jmp	.L7
.L18:
	movq	-16(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+8(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+8(%rip)
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L14:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	-8(%rbp)
	movq	%rdx, %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	-8(%rbp)
	movq	%rdx, %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L15:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	salq	-16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L7
.L16:
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdi
	call	sinalNumero
	movq	%rax, -16(%rbp)
	sarq	-16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	numeroSinal
	movq	%rax, %rdx
	movabsq	$1099511627775, %rax
	andq	%rax, %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	nop
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	circuitoLogicoAritmetico, .-circuitoLogicoAritmetico
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
