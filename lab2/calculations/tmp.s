	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_fillArray                      ## -- Begin function fillArray
	.p2align	4, 0x90
_fillArray:                             ## @fillArray
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	$8601600, %esi                  ## imm = 0x834000
	movq	%rsi, %rdi
	callq	_calloc
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-20(%rbp), %rax
	cmpq	$8601600, %rax                  ## imm = 0x834000
	jae	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB0_1
LBB0_4:
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_time
	movl	%eax, %edi
	callq	_srand
	movl	$0, -24(%rbp)
	movl	$0, -32(%rbp)
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_7 Depth 2
	movslq	-32(%rbp), %rax
	cmpq	$8601600, %rax                  ## imm = 0x834000
	jae	LBB0_17
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_7
LBB0_7:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	callq	_rand
	cltq
	movl	$8601600, %ecx                  ## imm = 0x834000
	xorl	%edx, %edx
                                        ## kill: def $rdx killed $edx
	divq	%rcx
	movl	%edx, %eax
	movl	%eax, -28(%rbp)
## %bb.8:                               ##   in Loop: Header=BB0_7 Depth=2
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	(%rax,%rcx), %al
	andb	$1, %al
	movzbl	%al, %ecx
	movb	$1, %al
	cmpl	$1, %ecx
	movb	%al, -33(%rbp)                  ## 1-byte Spill
	je	LBB0_14
## %bb.9:                               ##   in Loop: Header=BB0_7 Depth=2
	movl	-24(%rbp), %ecx
	movb	$1, %al
	cmpl	-28(%rbp), %ecx
	movb	%al, -33(%rbp)                  ## 1-byte Spill
	je	LBB0_14
## %bb.10:                              ##   in Loop: Header=BB0_7 Depth=2
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %ecx
	movb	$1, %al
	cmpl	-24(%rbp), %ecx
	movb	%al, -33(%rbp)                  ## 1-byte Spill
	je	LBB0_14
## %bb.11:                              ##   in Loop: Header=BB0_7 Depth=2
	movq	-8(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	cmpl	$-1, (%rcx,%rdx,4)
	movb	%al, -34(%rbp)                  ## 1-byte Spill
	je	LBB0_13
## %bb.12:                              ##   in Loop: Header=BB0_7 Depth=2
	movslq	-32(%rbp), %rax
	cmpq	$8601599, %rax                  ## imm = 0x833FFF
	setne	%al
	movb	%al, -34(%rbp)                  ## 1-byte Spill
LBB0_13:                                ##   in Loop: Header=BB0_7 Depth=2
	movb	-34(%rbp), %al                  ## 1-byte Reload
	movb	%al, -33(%rbp)                  ## 1-byte Spill
LBB0_14:                                ##   in Loop: Header=BB0_7 Depth=2
	movb	-33(%rbp), %al                  ## 1-byte Reload
	testb	$1, %al
	jne	LBB0_7
## %bb.15:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	movl	-28(%rbp), %eax
	movl	%eax, -24(%rbp)
## %bb.16:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB0_5
LBB0_17:
	movq	-16(%rbp), %rdi
	callq	_free
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printArray                     ## -- Begin function printArray
	.p2align	4, 0x90
_printArray:                            ## @printArray
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-12(%rbp), %rax
	cmpq	$8601600, %rax                  ## imm = 0x834000
	jae	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB1_1
LBB1_4:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$0, -4(%rbp)
	movl	$34406400, %edi                 ## imm = 0x20D0000
	callq	_malloc
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rdi
	callq	_fillArray
	movl	$0, -52(%rbp)
	## InlineAsm Start
	rdtscp

	## InlineAsm End
	movq	%rax, -24(%rbp)
	movq	%rdx, -16(%rbp)
	movl	$0, -56(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-56(%rbp), %rax
	cmpq	$8601600, %rax                  ## imm = 0x834000
	jae	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-48(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -52(%rbp)
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
	## InlineAsm Start
	nop
	## InlineAsm End
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB2_1
LBB2_4:
	## InlineAsm Start
	rdtscp

	## InlineAsm End
	movq	%rax, -40(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-40(%rbp), %rax
	subq	-24(%rbp), %rax
	movl	$8601600, %ecx                  ## imm = 0x834000
	xorl	%edx, %edx
                                        ## kill: def $rdx killed $edx
	divq	%rcx
	movq	%rax, %rsi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-48(%rbp), %rdi
	callq	_free
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d "

L_.str.1:                               ## @.str.1
	.asciz	"\n"

L_.str.2:                               ## @.str.2
	.asciz	"%llu"

.subsections_via_symbols
