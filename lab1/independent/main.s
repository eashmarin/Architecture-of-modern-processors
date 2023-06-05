	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_heat_processor                 ## -- Begin function heat_processor
	.p2align	4, 0x90
_heat_processor:                        ## @heat_processor
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$2000000, %edi                  ## imm = 0x1E8480
	callq	_malloc
	movq	%rax, -16(%rbp)
	movl	$2000000, %edi                  ## imm = 0x1E8480
	callq	_malloc
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	cmpl	$500, -28(%rbp)                 ## imm = 0x1F4
	jge	LBB0_8
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -32(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$500, -32(%rbp)                 ## imm = 0x1F4
	jge	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	movslq	-28(%rbp), %rdx
	movq	-16(%rbp), %rax
	imull	$500, -28(%rbp), %ecx           ## imm = 0x1F4
	addl	-32(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rax,%rcx,8)
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_7
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_1
LBB0_8:
	movl	$0, -36(%rbp)
LBB0_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_11 Depth 2
                                        ##       Child Loop BB0_13 Depth 3
	cmpl	$500, -36(%rbp)                 ## imm = 0x1F4
	jge	LBB0_20
## %bb.10:                              ##   in Loop: Header=BB0_9 Depth=1
	movl	$0, -40(%rbp)
LBB0_11:                                ##   Parent Loop BB0_9 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_13 Depth 3
	cmpl	$500, -40(%rbp)                 ## imm = 0x1F4
	jge	LBB0_18
## %bb.12:                              ##   in Loop: Header=BB0_11 Depth=2
	imull	$500, -36(%rbp), %eax           ## imm = 0x1F4
	addl	-40(%rbp), %eax
	movl	%eax, -44(%rbp)
	movq	-24(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
	movl	$0, -48(%rbp)
LBB0_13:                                ##   Parent Loop BB0_9 Depth=1
                                        ##     Parent Loop BB0_11 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	$500, -48(%rbp)                 ## imm = 0x1F4
	jge	LBB0_16
## %bb.14:                              ##   in Loop: Header=BB0_13 Depth=3
	movq	-16(%rbp), %rax
	imull	$500, -36(%rbp), %ecx           ## imm = 0x1F4
	addl	-48(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdx
	movq	-16(%rbp), %rax
	imull	$500, -48(%rbp), %ecx           ## imm = 0x1F4
	addl	-40(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	(%rax,%rcx,8), %rdx
	movq	-24(%rbp), %rax
	movslq	-44(%rbp), %rcx
	addq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
## %bb.15:                              ##   in Loop: Header=BB0_13 Depth=3
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	LBB0_13
LBB0_16:                                ##   in Loop: Header=BB0_11 Depth=2
	jmp	LBB0_17
LBB0_17:                                ##   in Loop: Header=BB0_11 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB0_11
LBB0_18:                                ##   in Loop: Header=BB0_9 Depth=1
	jmp	LBB0_19
LBB0_19:                                ##   in Loop: Header=BB0_9 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB0_9
LBB0_20:
	movq	-24(%rbp), %rax
	movq	1002000(%rax), %rsi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-16(%rbp), %rdi
	callq	_free
	movq	-24(%rbp), %rdi
	callq	_free
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function main
LCPI1_0:
	.quad	0x4012000000000000              ## double 4.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movl	$0, -4(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -56(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -80(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -96(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -104(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -112(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -120(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -128(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -136(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -152(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -160(%rbp)
	movsd	LCPI1_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -176(%rbp)
	callq	_heat_processor

	movq    -48(%rbp), %xmm0
	movq    -56(%rbp), %xmm1
	movq    -64(%rbp), %xmm2
	movq    -72(%rbp), %xmm3
	movq    -80(%rbp), %xmm4
	movq    -88(%rbp), %xmm5
	movq    -96(%rbp), %xmm6
	movq    -104(%rbp), %xmm7
	movq    -112(%rbp), %xmm8
	movq    -120(%rbp), %xmm9
	movq    -128(%rbp), %xmm10
	movq    -136(%rbp), %xmm11
	movq    -144(%rbp), %xmm12
	movq    -152(%rbp), %xmm13
	movq    -160(%rbp), %xmm14
	movq    -176(%rbp), %xmm15

	## InlineAsm Start
	rdtsc

	## InlineAsm End
	movq	%rax, -24(%rbp)
	movq	%rdx, -16(%rbp)
	movl	$0, -180(%rbp)

	movl    -180(%rbp), %eax
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$70000, %eax              ## imm = 0xF424
	jge	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	addsd	%xmm15, %xmm0
	addsd	%xmm15, %xmm1
	addsd	%xmm15, %xmm2
	addsd	%xmm15, %xmm3
	addsd	%xmm15, %xmm4
	addsd	%xmm15, %xmm5
	addsd	%xmm15, %xmm6
	addsd	%xmm15, %xmm7
	addsd	%xmm15, %xmm8
	addsd	%xmm15, %xmm9
	addsd	%xmm15, %xmm10
	addsd	%xmm15, %xmm11
	addsd	%xmm15, %xmm12
	addsd	%xmm15, %xmm13
	addsd	%xmm15, %xmm14
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	addl	$1, %eax
	jmp	LBB1_1
LBB1_4:
	## InlineAsm Start
	rdtsc

	## InlineAsm End
	movq	%rax, -40(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-40(%rbp), %rsi
	subq	-24(%rbp), %rsi
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	#addsd	%xmm1, %xmm0
	#addsd	%xmm1, %xmm0
	#addsd	%xmm2, %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm3, %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm6, %xmm0
	addsd	%xmm7, %xmm0
	addsd	%xmm8, %xmm0
	addsd	%xmm9, %xmm0
	addsd	%xmm10, %xmm0
	addsd	%xmm11, %xmm0
	addsd	%xmm12, %xmm0
	addsd	%xmm13, %xmm0
	addsd	%xmm14, %xmm0

	leaq	L_.str.2(%rip), %rdi
	movb	$1, %al
	callq	_printf
	xorl	%eax, %eax
	addq	$192, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%ld\n"

L_.str.1:                               ## @.str.1
	.asciz	"%llu clock cycles.\n"

L_.str.2:                               ## @.str.2
	.asciz	"result = %f\n"

.subsections_via_symbols
