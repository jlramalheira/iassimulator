	.file	"simulador.c"
	.section	.rodata
.LC0:
	.string	"-m"
.LC1:
	.string	"-n"
.LC2:
	.string	"-p"
.LC3:
	.string	"-i"
.LC4:
	.string	"-f"
.LC5:
	.string	"teste2.hex"
.LC6:
	.string	"e: %d\n"
.LC7:
	.string	"epc: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$30, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	$0, -16(%rbp)
	movl	$5, -12(%rbp)
	movl	$0, -4(%rbp)
	movl	$2000, -8(%rbp)
	movl	$1, -20(%rbp)
	jmp	.L2
.L8:
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC0, %eax
	movl	$3, %ecx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L3
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -8(%rbp)
.L3:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC1, %eax
	movl	$3, %ecx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L4
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L4:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC2, %eax
	movl	$3, %ecx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L5
	movl	$1, -4(%rbp)
.L5:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC3, %eax
	movl	$3, %ecx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L6
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -16(%rbp)
.L6:
	movq	-32(%rbp), %rax
	movq	%rax, %rdx
	movl	$.LC4, %eax
	movl	$3, %ecx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L7
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -12(%rbp)
.L7:
	addl	$1, -20(%rbp)
.L2:
	movl	-52(%rbp), %eax
	subl	$1, %eax
	cmpl	-20(%rbp), %eax
	jge	.L8
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	init
	movl	$.LC5, %edi
	movl	$0, %eax
	call	carregaMemoria
	movl	-12(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	imprimeMemoria
.L10:
	movl	$0, %eax
	call	busca
	movl	$0, %eax
	call	decodificaExecuta
	movzbl	uc+8(%rip), %eax
	shrb	%al
	andl	$1, %eax
	movzbl	%al, %edx
	movl	$.LC6, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	uc+4(%rip), %eax
	sall	$8, %eax
	sarl	$20, %eax
	movswl	%ax, %edx
	movl	$.LC7, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	uc+4(%rip), %eax
	andl	$16773120, %eax
	cmpl	$16773120, %eax
	je	.L9
	movzbl	uc+8(%rip), %eax
	andl	$2, %eax
	testb	%al, %al
	je	.L10
.L9:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
