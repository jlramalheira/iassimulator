	.file	"uc.c"
	.comm	uc,16,16
	.text
	.globl	init
	.type	init, @function
init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	iniciaMemoria
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	stor
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	movq	%rax, ula(%rip)
	movq	ula+16(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	movq	%rax, ula+16(%rip)
	movq	ula+8(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	movq	%rax, ula+8(%rip)
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	movl	%eax, uc+4(%rip)
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	movw	%ax, uc+4(%rip)
	movb	$0, uc(%rip)
	movl	uc(%rip), %eax
	andl	$-268435201, %eax
	movl	%eax, uc(%rip)
	movzbl	uc+8(%rip), %eax
	orl	$1, %eax
	movb	%al, uc+8(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-3, %eax
	movb	%al, uc+8(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	init, .-init
	.globl	busca
	.type	busca, @function
busca:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzbl	uc+8(%rip), %eax
	andl	$1, %eax
	testb	%al, %al
	je	.L5
	movzbl	uc+8(%rip), %eax
	andl	$4, %eax
	testb	%al, %al
	je	.L6
	movl	uc(%rip), %eax
	shrl	$8, %eax
	andl	$1048575, %eax
	movl	$3, %edx
	movl	$1044480, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mask
	movb	%al, uc(%rip)
	movl	uc(%rip), %eax
	shrl	$8, %eax
	andl	$1048575, %eax
	movl	$0, %edx
	movl	$4095, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mask
	sall	$4, %eax
	sarw	$4, %ax
	movl	%eax, %edx
	andw	$4095, %dx
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	orl	%edx, %eax
	movw	%ax, uc+4(%rip)
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	addl	$1, %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	jmp	.L4
.L6:
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	movl	%eax, %edx
	andw	$4095, %dx
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	orl	%edx, %eax
	movw	%ax, uc+4(%rip)
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	%eax, %edi
	movl	$0, %eax
	call	load
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movl	$8, %edx
	movabsq	$1095216660480, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mask
	movb	%al, uc(%rip)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movl	$0, %edx
	movl	$1048575, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mask
	andl	$1048575, %eax
	andl	$1048575, %eax
	movl	%eax, %edx
	sall	$8, %edx
	movl	uc(%rip), %eax
	andl	$-268435201, %eax
	orl	%edx, %eax
	movl	%eax, uc(%rip)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movl	$5, %edx
	movl	$-1048576, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mask
	sall	$4, %eax
	sarw	$4, %ax
	movl	%eax, %edx
	andw	$4095, %dx
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	orl	%edx, %eax
	movw	%ax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	orl	$4, %eax
	movb	%al, uc+8(%rip)
	jmp	.L4
.L5:
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	movl	%eax, %edx
	andw	$4095, %dx
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	orl	%edx, %eax
	movw	%ax, uc+4(%rip)
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	%eax, %edi
	movl	$0, %eax
	call	load
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movl	$3, %edx
	movl	$1044480, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mask
	movb	%al, uc(%rip)
	movabsq	$1099511627775, %rax
	andq	ula+16(%rip), %rax
	movl	$0, %edx
	movl	$4095, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mask
	sall	$4, %eax
	sarw	$4, %ax
	movl	%eax, %edx
	andw	$4095, %dx
	movzwl	uc+4(%rip), %eax
	andw	$-4096, %ax
	orl	%edx, %eax
	movw	%ax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	movzbl	uc+8(%rip), %eax
	orl	$1, %eax
	movb	%al, uc+8(%rip)
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	addl	$1, %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	busca, .-busca
	.globl	buscaOperandos
	.type	buscaOperandos, @function
buscaOperandos:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	%eax, %edi
	movl	$0, %eax
	call	load
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	buscaOperandos, .-buscaOperandos
	.globl	decodificaExecuta
	.type	decodificaExecuta, @function
decodificaExecuta:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movzbl	uc(%rip), %eax
	movzbl	%al, %eax
	cmpl	$33, %eax
	ja	.L9
	movl	%eax, %eax
	movq	.L33(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L33:
	.quad	.L11
	.quad	.L12
	.quad	.L13
	.quad	.L14
	.quad	.L15
	.quad	.L16
	.quad	.L17
	.quad	.L18
	.quad	.L19
	.quad	.L20
	.quad	.L21
	.quad	.L22
	.quad	.L23
	.quad	.L24
	.quad	.L25
	.quad	.L26
	.quad	.L27
	.quad	.L9
	.quad	.L28
	.quad	.L29
	.quad	.L30
	.quad	.L31
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L9
	.quad	.L32
	.text
.L21:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+8(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L9
.L20:
	movl	$0, %eax
	call	buscaOperandos
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+8(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+8(%rip)
	jmp	.L9
.L32:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+16(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+16(%rip)
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	%eax, %edi
	movl	$0, %eax
	call	stor
	jmp	.L9
.L12:
	movl	$0, %eax
	call	buscaOperandos
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L9
.L13:
	movl	$0, %eax
	call	buscaOperandos
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdx
	movabsq	$549755813888, %rax
	xorq	%rdx, %rax
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
	jmp	.L9
.L14:
	movl	$0, %eax
	call	buscaOperandos
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$549755813887, %rax
	andq	%rdx, %rax
	movabsq	$1099511627775, %rdx
	andq	%rdx, %rax
	movabsq	$1099511627775, %rdx
	movq	%rax, %rcx
	andq	%rdx, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	jmp	.L9
.L15:
	movl	$0, %eax
	call	buscaOperandos
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula+16(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$549755813887, %rax
	andq	%rdx, %rax
	movabsq	$1099511627775, %rdx
	andq	%rdx, %rax
	movabsq	$1099511627775, %rdx
	movq	%rax, %rcx
	andq	%rdx, %rcx
	movq	ula(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula(%rip)
	movabsq	$1099511627775, %rax
	andq	ula(%rip), %rax
	movq	%rax, %rdx
	movabsq	$549755813888, %rax
	xorq	%rdx, %rax
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
	jmp	.L9
.L24:
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	jmp	.L9
.L25:
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-2, %eax
	movb	%al, uc+8(%rip)
	jmp	.L9
.L26:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$549755813887, %rax
	cmpq	%rax, %rdx
	ja	.L36
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	jmp	.L36
.L27:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$549755813887, %rax
	cmpq	%rax, %rdx
	ja	.L37
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	movzwl	%ax, %eax
	andl	$4095, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	uc+4(%rip), %eax
	andl	$-16773121, %eax
	orl	%edx, %eax
	movl	%eax, uc+4(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-5, %eax
	movb	%al, uc+8(%rip)
	movzbl	uc+8(%rip), %eax
	andl	$-2, %eax
	movb	%al, uc+8(%rip)
	jmp	.L37
.L16:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L17:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L18:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L19:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L22:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L23:
	movl	$0, %eax
	call	buscaOperandos
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L30:
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L31:
	movl	$0, %eax
	call	circuitoLogicoAritmetico
	jmp	.L9
.L28:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+16(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+16(%rip)
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	$1, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	storEndereco
	jmp	.L9
.L29:
	movabsq	$1099511627775, %rax
	movq	%rax, %rdx
	andq	ula(%rip), %rdx
	movabsq	$1099511627775, %rax
	movq	%rdx, %rcx
	andq	%rax, %rcx
	movq	ula+16(%rip), %rdx
	movabsq	$-1099511627776, %rax
	andq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, ula+16(%rip)
	movzwl	uc+4(%rip), %eax
	sall	$4, %eax
	sarw	$4, %ax
	cwtl
	movl	$0, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	storEndereco
	jmp	.L9
.L11:
	movl	uc+4(%rip), %eax
	orl	$16773120, %eax
	movl	%eax, uc+4(%rip)
	jmp	.L9
.L36:
	nop
	jmp	.L9
.L37:
	nop
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	decodificaExecuta, .-decodificaExecuta
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
