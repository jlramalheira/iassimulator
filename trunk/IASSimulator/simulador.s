	.file	"simulador.c"
	.comm	AC,8,8
	.comm	MQ,8,8
	.comm	MBR,8,8
	.comm	IBR,8,8
	.comm	IR,8,8
	.comm	PC,4,4
	.comm	MAR,4,4
	.comm	CIRCUITOCONTROLE,4,4
	.text
	.globl	hexToDec
	.type	hexToDec, @function
hexToDec:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$1, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	$-1, -32(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-32(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	subq	$1, %rax
	subl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.L2
.L10:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$65, %al
	jne	.L3
	movl	$10, -12(%rbp)
	jmp	.L4
.L3:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$66, %al
	jne	.L5
	movl	$11, -12(%rbp)
	jmp	.L4
.L5:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L6
	movl	$12, -12(%rbp)
	jmp	.L4
.L6:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
	jne	.L7
	movl	$13, -12(%rbp)
	jmp	.L4
.L7:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$69, %al
	jne	.L8
	movl	$14, -12(%rbp)
	jmp	.L4
.L8:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jne	.L9
	movl	$15, -12(%rbp)
	jmp	.L4
.L9:
	movl	-16(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -12(%rbp)
.L4:
	movl	-12(%rbp), %eax
	imull	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
	sall	$4, -4(%rbp)
	subl	$1, -16(%rbp)
.L2:
	cmpl	$0, -16(%rbp)
	jns	.L10
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	hexToDec, .-hexToDec
	.globl	inverteAC
	.type	inverteAC, @function
inverteAC:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	AC(%rip), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cmpl	$22, %eax
	ja	.L11
	movl	%eax, %eax
	movq	.L29(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L29:
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
	.quad	.L11
	.quad	.L11
	.quad	.L11
	.quad	.L11
	.quad	.L11
	.quad	.L11
	.quad	.L11
	.quad	.L23
	.quad	.L24
	.quad	.L25
	.quad	.L26
	.quad	.L27
	.quad	.L28
	.text
.L13:
	movq	AC(%rip), %rax
	movb	$56, (%rax)
	jmp	.L11
.L14:
	movq	AC(%rip), %rax
	movb	$57, (%rax)
	jmp	.L11
.L15:
	movq	AC(%rip), %rax
	movb	$65, (%rax)
	jmp	.L11
.L16:
	movq	AC(%rip), %rax
	movb	$66, (%rax)
	jmp	.L11
.L17:
	movq	AC(%rip), %rax
	movb	$67, (%rax)
	jmp	.L11
.L18:
	movq	AC(%rip), %rax
	movb	$68, (%rax)
	jmp	.L11
.L19:
	movq	AC(%rip), %rax
	movb	$69, (%rax)
	jmp	.L11
.L20:
	movq	AC(%rip), %rax
	movb	$70, (%rax)
	jmp	.L11
.L21:
	movq	AC(%rip), %rax
	movb	$48, (%rax)
	jmp	.L11
.L22:
	movq	AC(%rip), %rax
	movb	$49, (%rax)
	jmp	.L11
.L23:
	movq	AC(%rip), %rax
	movb	$50, (%rax)
	jmp	.L11
.L24:
	movq	AC(%rip), %rax
	movb	$51, (%rax)
	jmp	.L11
.L25:
	movq	AC(%rip), %rax
	movb	$52, (%rax)
	jmp	.L11
.L26:
	movq	AC(%rip), %rax
	movb	$53, (%rax)
	jmp	.L11
.L27:
	movq	AC(%rip), %rax
	movb	$54, (%rax)
	jmp	.L11
.L28:
	movq	AC(%rip), %rax
	movb	$55, (%rax)
	nop
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inverteAC, .-inverteAC
	.globl	moduloAC
	.type	moduloAC, @function
moduloAC:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	ACisPositivo
	testl	%eax, %eax
	jne	.L30
	movl	$0, %eax
	call	inverteAC
.L30:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	moduloAC, .-moduloAC
	.globl	ACisPositivo
	.type	ACisPositivo, @function
ACisPositivo:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	AC(%rip), %rax
	movzbl	(%rax), %eax
	cmpb	$55, %al
	jg	.L33
	movl	$1, %eax
	jmp	.L34
.L33:
	movl	$0, %eax
.L34:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	ACisPositivo, .-ACisPositivo
	.comm	memoria,49152,32
	.globl	inicializaRegistradores
	.type	inicializaRegistradores, @function
inicializaRegistradores:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, %edi
	call	malloc
	movq	%rax, AC(%rip)
	movl	$10, %edi
	call	malloc
	movq	%rax, MQ(%rip)
	movl	$10, %edi
	call	malloc
	movq	%rax, MBR(%rip)
	movl	$5, %edi
	call	malloc
	movq	%rax, IBR(%rip)
	movl	$2, %edi
	call	malloc
	movq	%rax, IR(%rip)
	movl	$0, PC(%rip)
	movl	$0, MAR(%rip)
	movl	$1, CIRCUITOCONTROLE(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	inicializaRegistradores, .-inicializaRegistradores
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Falha ao abrir o arquivo .hex"
	.text
	.globl	carregaMemoria
	.type	carregaMemoria, @function
carregaMemoria:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.LC0, %edx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L37
	movl	$.LC1, %edi
	call	puts
.L37:
	movl	$0, -4(%rbp)
.L38:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	memoria(%rax), %rcx
	addl	$1, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$12, %esi
	movq	%rcx, %rdi
	call	fgets
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	feof
	testl	%eax, %eax
	je	.L38
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	carregaMemoria, .-carregaMemoria
	.section	.rodata
.LC2:
	.string	"linha: %d - %s"
	.text
	.globl	imprimeMemoria
	.type	imprimeMemoria, @function
imprimeMemoria:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L40
.L42:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	memoria(%rax), %rdx
	movl	$.LC2, %eax
	movl	-4(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L40:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	$memoria, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L39
	cmpl	$4095, -4(%rbp)
	jle	.L42
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	imprimeMemoria, .-imprimeMemoria
	.globl	busca
	.type	busca, @function
busca:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	cmpl	$0, -52(%rbp)
	je	.L44
	movq	IBR(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L45
	movl	PC(%rip), %eax
	movl	%eax, MAR(%rip)
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	$memoria, %rax
	movq	%rax, MBR(%rip)
	movl	$0, -40(%rbp)
	jmp	.L46
.L47:
	movq	IR(%rip), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	MBR(%rip), %rcx
	movl	-40(%rbp), %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -40(%rbp)
.L46:
	cmpl	$1, -40(%rbp)
	jle	.L47
	movl	$0, -36(%rbp)
	movl	$5, -40(%rbp)
	jmp	.L48
.L49:
	movq	IBR(%rip), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	MBR(%rip), %rcx
	movl	-40(%rbp), %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -36(%rbp)
	addl	$1, -40(%rbp)
.L48:
	cmpl	$9, -40(%rbp)
	jle	.L49
	movl	$0, -36(%rbp)
	movl	$2, -40(%rbp)
	jmp	.L50
.L51:
	movq	MBR(%rip), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-36(%rbp), %eax
	cltq
	movb	%dl, -16(%rbp,%rax)
	addl	$1, -36(%rbp)
	addl	$1, -40(%rbp)
.L50:
	cmpl	$4, -40(%rbp)
	jle	.L51
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, MAR(%rip)
	jmp	.L43
.L45:
	movl	$0, -32(%rbp)
	jmp	.L53
.L54:
	movq	IR(%rip), %rdx
	movl	-32(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	IBR(%rip), %rcx
	movl	-32(%rbp), %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -32(%rbp)
.L53:
	cmpl	$1, -32(%rbp)
	jle	.L54
	movl	$0, -28(%rbp)
	movl	$2, -32(%rbp)
	jmp	.L55
.L56:
	movq	IBR(%rip), %rdx
	movl	-32(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-28(%rbp), %eax
	cltq
	movb	%dl, -16(%rbp,%rax)
	addl	$1, -28(%rbp)
	addl	$1, -32(%rbp)
.L55:
	cmpl	$4, -32(%rbp)
	jle	.L56
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, MAR(%rip)
	movq	IBR(%rip), %rax
	movb	$0, (%rax)
	movl	PC(%rip), %eax
	addl	$1, %eax
	movl	%eax, PC(%rip)
	jmp	.L43
.L44:
	movl	PC(%rip), %eax
	movl	%eax, MAR(%rip)
	movl	$0, -24(%rbp)
	movl	$5, -20(%rbp)
	jmp	.L57
.L58:
	movq	IR(%rip), %rdx
	movl	-24(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movq	MBR(%rip), %rcx
	movl	-20(%rbp), %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -24(%rbp)
	addl	$1, -20(%rbp)
.L57:
	cmpl	$6, -20(%rbp)
	jle	.L58
	movl	$0, -24(%rbp)
	movl	$7, -20(%rbp)
	jmp	.L59
.L60:
	movq	MBR(%rip), %rdx
	movl	-20(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-24(%rbp), %eax
	cltq
	movb	%dl, -16(%rbp,%rax)
	addl	$1, -24(%rbp)
	addl	$1, -20(%rbp)
.L59:
	cmpl	$9, -20(%rbp)
	jle	.L60
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, MAR(%rip)
	movq	IBR(%rip), %rax
	movb	$0, (%rax)
	movl	PC(%rip), %eax
	addl	$1, %eax
	movl	%eax, PC(%rip)
	movl	$1, CIRCUITOCONTROLE(%rip)
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	busca, .-busca
	.section	.rodata
.LC3:
	.string	"0A"
.LC4:
	.string	"09"
.LC5:
	.string	"21"
.LC6:
	.string	"01"
.LC7:
	.string	"02"
.LC8:
	.string	"03"
.LC9:
	.string	"04"
.LC10:
	.string	"0D"
.LC11:
	.string	"0E"
.LC12:
	.string	"0F"
.LC13:
	.string	"10"
.LC14:
	.string	"05"
.LC15:
	.string	"07"
.LC16:
	.string	"06"
.LC17:
	.string	"08"
.LC18:
	.string	"0B"
.LC19:
	.string	"0C"
.LC20:
	.string	"14"
.LC21:
	.string	"15"
.LC22:
	.string	"12"
.LC23:
	.string	"13"
	.text
	.globl	execucao
	.type	execucao, @function
execucao:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	IR(%rip), %rax
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
	je	.L62
	movq	MQ(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L62:
	movq	IR(%rip), %rax
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
	je	.L64
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	MQ(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L64:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC5, %eax
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
	je	.L65
	movq	AC(%rip), %rax
	movq	%rax, %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rcx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	$memoria, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L65:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC6, %eax
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
	je	.L66
#APP
# 220 "simulador.c" 1
	testeASM:
# 0 "" 2
#NO_APP
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L66:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC7, %eax
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
	je	.L67
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movl	$0, %eax
	call	inverteAC
	jmp	.L61
.L67:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC8, %eax
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
	je	.L68
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movl	$0, %eax
	call	moduloAC
	jmp	.L61
.L68:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC9, %eax
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
	je	.L69
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movl	$0, %eax
	call	moduloAC
	movl	$0, %eax
	call	inverteAC
	jmp	.L61
.L69:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC10, %eax
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
	je	.L70
	movl	MAR(%rip), %eax
	movl	%eax, PC(%rip)
	jmp	.L61
.L70:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC11, %eax
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
	je	.L71
	movl	MAR(%rip), %eax
	movl	%eax, PC(%rip)
	movl	$0, CIRCUITOCONTROLE(%rip)
	jmp	.L61
.L71:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC12, %eax
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
	je	.L72
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movl	$0, %eax
	call	ACisPositivo
	testl	%eax, %eax
	je	.L61
	movl	MAR(%rip), %eax
	movl	%eax, PC(%rip)
	jmp	.L61
.L72:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC13, %eax
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
	je	.L73
	movq	MBR(%rip), %rax
	movq	%rax, %rdx
	movq	AC(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movl	$0, %eax
	call	ACisPositivo
	testl	%eax, %eax
	je	.L61
	movl	MAR(%rip), %eax
	movl	%eax, PC(%rip)
	movl	$0, CIRCUITOCONTROLE(%rip)
	jmp	.L61
.L73:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC14, %eax
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
	je	.L74
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L74:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC15, %eax
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
	je	.L75
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L75:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC16, %eax
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
	je	.L76
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L76:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC17, %eax
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
	je	.L77
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L77:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC18, %eax
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
	je	.L78
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L78:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC19, %eax
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
	je	.L79
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L79:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC20, %eax
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
	je	.L80
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L80:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC21, %eax
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
	je	.L81
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L81:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC22, %eax
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
	je	.L82
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L82:
	movq	IR(%rip), %rax
	movq	%rax, %rdx
	movl	$.LC23, %eax
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
	je	.L83
	movl	$memoria, %ecx
	movl	MAR(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	MBR(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	jmp	.L61
.L83:
	movl	$-1, PC(%rip)
.L61:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	execucao, .-execucao
	.section	.rodata
.LC24:
	.string	"teste2.hex"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %eax
	call	inicializaRegistradores
	movl	$.LC24, %edi
	call	carregaMemoria
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
