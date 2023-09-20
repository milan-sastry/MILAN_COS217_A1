	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L3
.L5:
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleSlashState
	.type	handleSlashState, %function
handleSlashState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L8
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L9
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L10
	mov	w0, 2
	str	w0, [sp, 44]
	mov	w0, 32
	bl	putchar
	b	.L9
.L10:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L11
	mov	w0, 4
	str	w0, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L9
.L11:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L12
	mov	w0, 5
	str	w0, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L9
.L12:
	str	wzr, [sp, 44]
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
.L9:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleSlashState, .-handleSlashState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L15
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L16
.L15:
	mov	w0, 2
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L16
	ldr	w0, [sp, 28]
	bl	putchar
.L16:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleEndStarState
	.type	handleEndStarState, %function
handleEndStarState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L19
	str	wzr, [sp, 44]
	b	.L20
.L19:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L21
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L20
.L21:
	mov	w0, 2
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L20
	ldr	w0, [sp, 28]
	bl	putchar
.L20:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleEndStarState, .-handleEndStarState
	.align	2
	.global	handleDoubleQuoteState
	.type	handleDoubleQuoteState, %function
handleDoubleQuoteState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L24
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L25
.L24:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L26
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L25
.L26:
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
.L25:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleDoubleQuoteState, .-handleDoubleQuoteState
	.align	2
	.global	handleSingleQuoteState
	.type	handleSingleQuoteState, %function
handleSingleQuoteState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L29
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L30
.L29:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L31
	mov	w0, 7
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	b	.L30
.L31:
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
.L30:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleSingleQuoteState, .-handleSingleQuoteState
	.align	2
	.global	handleDQBackslash
	.type	handleDQBackslash, %function
handleDQBackslash:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 4
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleDQBackslash, .-handleDQBackslash
	.align	2
	.global	handleSQBackslash
	.type	handleSQBackslash, %function
handleSQBackslash:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 5
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleSQBackslash, .-handleSQBackslash
	.align	2
	.global	updateState
	.type	updateState, %function
updateState:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	ldr	w0, [sp, 24]
	cmp	w0, 7
	beq	.L38
	ldr	w0, [sp, 24]
	cmp	w0, 7
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 6
	beq	.L40
	ldr	w0, [sp, 24]
	cmp	w0, 6
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 5
	beq	.L41
	ldr	w0, [sp, 24]
	cmp	w0, 5
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 4
	beq	.L42
	ldr	w0, [sp, 24]
	cmp	w0, 4
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 3
	beq	.L43
	ldr	w0, [sp, 24]
	cmp	w0, 3
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 2
	beq	.L44
	ldr	w0, [sp, 24]
	cmp	w0, 2
	bhi	.L39
	ldr	w0, [sp, 24]
	cmp	w0, 0
	beq	.L45
	ldr	w0, [sp, 24]
	cmp	w0, 1
	beq	.L46
	b	.L39
.L45:
	ldr	w0, [sp, 28]
	bl	handleNormalState
	str	w0, [sp, 24]
	b	.L39
.L46:
	ldr	w0, [sp, 28]
	bl	handleSlashState
	str	w0, [sp, 24]
	b	.L39
.L44:
	ldr	w0, [sp, 28]
	bl	handleInCommentState
	str	w0, [sp, 24]
	b	.L39
.L43:
	ldr	w0, [sp, 28]
	bl	handleEndStarState
	str	w0, [sp, 24]
	b	.L39
.L42:
	ldr	w0, [sp, 28]
	bl	handleDoubleQuoteState
	str	w0, [sp, 24]
	b	.L39
.L41:
	ldr	w0, [sp, 28]
	bl	handleSingleQuoteState
	str	w0, [sp, 24]
	b	.L39
.L40:
	ldr	w0, [sp, 28]
	bl	handleDQBackslash
	str	w0, [sp, 24]
	b	.L39
.L38:
	ldr	w0, [sp, 28]
	bl	handleSQBackslash
	str	w0, [sp, 24]
	nop
.L39:
	ldr	w0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	updateState, .-updateState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 1
	str	w0, [sp, 28]
	str	wzr, [sp, 24]
	str	wzr, [sp, 20]
	b	.L49
.L53:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	bne	.L50
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
	ldr	w0, [sp, 20]
	cmp	w0, 2
	beq	.L51
	ldr	w0, [sp, 20]
	cmp	w0, 3
	bne	.L52
.L51:
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
	b	.L50
.L52:
	str	wzr, [sp, 24]
.L50:
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 16]
	bl	updateState
	str	w0, [sp, 20]
.L49:
	bl	getchar
	str	w0, [sp, 16]
	ldr	w0, [sp, 16]
	cmn	w0, #1
	bne	.L53
	ldr	w0, [sp, 20]
	cmp	w0, 1
	bne	.L54
	mov	w0, 47
	bl	putchar
	b	.L55
.L54:
	ldr	w0, [sp, 20]
	cmp	w0, 2
	beq	.L56
	ldr	w0, [sp, 20]
	cmp	w0, 3
	bne	.L55
.L56:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 24]
	sub	w0, w1, w0
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L57
.L55:
	mov	w0, 0
.L57:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.3.1 20221121 (Red Hat 11.3.1-4)"
	.section	.note.GNU-stack,"",@progbits
