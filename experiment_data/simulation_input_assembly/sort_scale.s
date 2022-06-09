	.file	"sort_scale.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-1600
	sw	ra,1596(sp)
	sw	s0,1592(sp)
	sw	s1,1588(sp)
	addi	s0,sp,1600
	li	t0,-32768
	add	sp,sp,t0
	li	a5,840273920
	addi	a5,a5,645
	sw	a5,-20(s0)
	sw	zero,-32(s0)
	j	.L2
.L3:
	lw	a0,-20(s0)
	call	rand_int
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,8
	li	a5,65536
	addi	a5,a5,-1
	and	a4,a4,a5
	li	a5,-16384
	addi	a5,a5,-16
	add	a3,a5,s0
	lw	a5,-32(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,-40(a5)
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L2:
	lw	a4,-32(s0)
	li	a5,4096
	blt	a4,a5,.L3
	li	a5,4
	sw	a5,-56(s0)
	sw	zero,-36(s0)
	sw	zero,-40(s0)
	j	.L4
.L6:
	li	a5,-32768
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-40(s0)
	slli	s1,a4,3
	add	s1,a5,s1
	lw	a1,-36(s0)
	lw	a0,-56(s0)
	call	zeno_create_object
	mv	a4,a0
	mv	a5,a1
	sw	a4,-1576(s1)
	sw	a5,-1572(s1)
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	li	a4,-4
	sw	a4,-552(a5)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a4,-36(s0)
	li	a5,63
	ble	a4,a5,.L5
	sw	zero,-36(s0)
.L5:
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L4:
	lw	a4,-40(s0)
	li	a5,127
	ble	a4,a5,.L6
	sw	zero,-44(s0)
	j	.L7
.L10:
	li	a5,127
	sw	a5,-24(s0)
	j	.L8
.L9:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
.L8:
	li	a5,-16384
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-44(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-40(a5)
	lw	a4,-24(s0)
	slli	a4,a4,9
	bltu	a5,a4,.L9
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-552(a5)
	addi	a4,a5,4
	li	a5,-32768
	addi	a5,a5,-16
	add	a3,a5,s0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,-552(a5)
	li	a5,-16384
	addi	a5,a5,-40
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-44(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	mv	a0,a5
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-552(a5)
	mv	a1,a5
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a5,-1576(a5)
	li	a4,4
	li	a3,1
	mv	a2,a5
	call	zeno_put_u4
	lw	a5,-44(s0)
	addi	a5,a5,1
	sw	a5,-44(s0)
.L7:
	lw	a4,-44(s0)
	li	a5,4096
	blt	a4,a5,.L10
	li	a5,-32768
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-1576(a5)
	mv	a4,a5
	li	a5,-32768
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-552(a5)
	srai	a5,a5,2
	mv	a2,a5
	li	a1,0
	mv	a0,a4
	call	quicksort
	sw	zero,-28(s0)
	sw	zero,-48(s0)
	j	.L11
.L15:
	lw	a4,-28(s0)
	li	a5,4096
	beq	a4,a5,.L20
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-48(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-552(a5)
	blt	a5,zero,.L14
	li	a5,-32768
	addi	a5,a5,-40
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	mv	a0,a5
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-48(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a5,-1576(a5)
	mv	a2,a5
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-48(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-552(a5)
	srai	a5,a5,2
	addi	a5,a5,1
	li	a4,4
	mv	a3,a5
	li	a1,0
	call	zeno_get_u4
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-48(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,-552(a5)
	srai	a5,a5,2
	mv	a4,a5
	lw	a5,-28(s0)
	add	a5,a4,a5
	addi	a5,a5,1
	sw	a5,-28(s0)
.L14:
	lw	a5,-48(s0)
	addi	a5,a5,1
	sw	a5,-48(s0)
.L11:
	lw	a4,-48(s0)
	li	a5,127
	ble	a4,a5,.L15
	j	.L13
.L20:
	nop
.L13:
	sw	zero,-52(s0)
	j	.L16
.L18:
	li	a5,-32768
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-52(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-40(a5)
	lw	a5,-52(s0)
	addi	a5,a5,1
	li	a3,-32768
	addi	a3,a3,-16
	add	a3,a3,s0
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,-40(a5)
	bleu	a4,a5,.L17
	lw	a5,-52(s0)
	mv	a0,a5
	call	halt
.L17:
	lw	a5,-52(s0)
	addi	a5,a5,1
	sw	a5,-52(s0)
.L16:
	li	a5,-32768
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-552(a5)
	srai	a5,a5,2
	addi	a5,a5,-1
	lw	a4,-52(s0)
	blt	a4,a5,.L18
	li	a0,-1
	call	halt
	li	a5,0
	mv	a0,a5
	li	t0,32768
	add	sp,sp,t0
	lw	ra,1596(sp)
	lw	s0,1592(sp)
	lw	s1,1588(sp)
	addi	sp,sp,1600
	jr	ra
	.size	main, .-main
	.align	2
	.globl	rand_int
	.type	rand_int, @function
rand_int:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,8
	sub	a5,a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,7
	add	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a3,a5,5
	add	a5,a5,a3
	slli	a5,a5,2
	sub	a5,a5,a4
	slli	a5,a5,2
	add	a4,a5,a4
	li	a5,12288
	addi	a5,a5,57
	add	a4,a4,a5
	li	a5,-2147483648
	xori	a5,a5,-1
	and	a5,a4,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	rand_int, .-rand_int
	.align	2
	.globl	quicksort
	.type	quicksort, @function
quicksort:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	lw	a4,-56(s0)
	lw	a5,-60(s0)
	bge	a4,a5,.L32
	lw	a5,-56(s0)
	sw	a5,-28(s0)
	lw	a5,-56(s0)
	sw	a5,-20(s0)
	lw	a5,-60(s0)
	sw	a5,-24(s0)
	addi	a0,s0,-44
	lw	a5,-28(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_get_u4
	addi	a0,s0,-36
	lw	a5,-20(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_get_u4
	addi	a0,s0,-40
	lw	a5,-24(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_get_u4
	j	.L25
.L28:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	addi	a0,s0,-36
	lw	a5,-20(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_get_u4
.L26:
	lw	a4,-36(s0)
	lw	a5,-44(s0)
	bgtu	a4,a5,.L29
	lw	a4,-20(s0)
	lw	a5,-60(s0)
	blt	a4,a5,.L28
	j	.L29
.L30:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	addi	a0,s0,-40
	lw	a5,-24(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_get_u4
.L29:
	lw	a4,-40(s0)
	lw	a5,-44(s0)
	bgtu	a4,a5,.L30
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	bge	a4,a5,.L25
	lw	a5,-36(s0)
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	sw	a5,-36(s0)
	addi	a0,s0,-36
	lw	a5,-20(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_put_u4
	lw	a5,-32(s0)
	sw	a5,-40(s0)
	addi	a0,s0,-40
	lw	a5,-24(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_put_u4
.L25:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	blt	a4,a5,.L26
	lw	a5,-44(s0)
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	sw	a5,-44(s0)
	addi	a0,s0,-44
	lw	a5,-28(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_put_u4
	lw	a5,-32(s0)
	sw	a5,-40(s0)
	addi	a0,s0,-40
	lw	a5,-24(s0)
	slli	a5,a5,2
	li	a4,4
	li	a3,1
	lw	a2,-52(s0)
	mv	a1,a5
	call	zeno_put_u4
	lw	a5,-24(s0)
	addi	a5,a5,-1
	mv	a2,a5
	lw	a1,-56(s0)
	lw	a0,-52(s0)
	call	quicksort
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a2,-60(s0)
	mv	a1,a5
	lw	a0,-52(s0)
	call	quicksort
.L32:
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	quicksort, .-quicksort
	.ident	"GCC: (GNU) 11.1.0"
# Calling Convention
#   - a0 = base address
#   - a1 = obj address
#   - a2 = obj ID
#   - a3 = nelems
#   - a4 = stride (in bytes)

zeno_put_u1:
  eaddie e11, a2, 0
  add t6,zero,zero
.put_u1_seq:
  lbu t5, 0(a0)
  add a0, a0, a4
  addi t6,t6,1
  esb t5, 0(a1)
  add a1,a1,a4
  bne t6,a3,.put_u1_seq
  jalr	zero,0(ra)
  .size __xbrtime_put_u1_seq, .-__xbrtime_put_u1_seq

zeno_put_u4:
  eaddie e11, a2, 0
  add t6,zero,zero
.put_u4_seq:
  lw  t5, 0(a0)
  add a0, a0, a4
  addi t6,t6,1
  esw t5, 0(a1)
  add a1,a1,a4
  bne t6,a3,.put_u4_seq
  jalr	zero,0(ra)
  .size __xbrtime_put_u4_seq, .-__xbrtime_put_u4_seq

zeno_get_u1:
  eaddie e11, a2, 0
  add t6,zero,zero
.get_u1_seq:
  elbu t5, 0(a1)
  add a1, a1, a4
  addi t6,t6,1
  sb t5, 0(a0)
  add a0, a0, a4
  bne t6,a3,.get_u1_seq
  jalr	zero,0(ra)
  .size __xbrtime_get_u1_seq, .-__xbrtime_get_u1_seq

zeno_get_u4:
  eaddie e11, a2, 0
  add t6,zero,zero
.get_u4_seq:
  elw t5, 0(a1)
  add a1, a1, a4
  addi t6,t6,1
  sw t5, 0(a0)
  add a0, a0, a4
  bne t6,a3,.get_u4_seq
  jalr	zero,0(ra)
  .size __xbrtime_get_u4_seq, .-__xbrtime_get_u4_seq

# Calling Convention
#   - a0 = src obj address
#   - a1 = dst obj address
#   - a2 = src obj ID
#   - a3 = dst obj ID
#   - a4 = nelems
#   - a5 = stride (in bytes)

zeno_copy_u1:
  eaddie e11, a2, 0
  eaddie e12, a3, 0
  add t6,zero,zero
.copy_u1_seq:
  lbu t5, 0(a0)
  add a0, a0, a5
  addi t6,t6,1
  esb t5, 0(a1)
  add a1,a1,a5
  bne t6,a4,.copy_u1_seq
  jalr	zero,0(ra)
  .size __xbrtime_put_u1_seq, .-__xbrtime_put_u1_seq

zeno_copy_u4:
  eaddie e11, a2, 0
  eaddie e12, a3, 0
  add t6,zero,zero
.copy_u4_seq:
  lw  t5, 0(a0)
  add a0, a0, a5
  addi t6,t6,1
  esw t5, 0(a1)
  add a1,a1,a5
  bne t6,a4,.copy_u4_seq
  jalr	zero,0(ra)
  .size __xbrtime_put_u4_seq, .-__xbrtime_put_u4_seq


halt:
  mv s1, a0
  halt
