	.file	"get_scalability.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-544
	sw	ra,540(sp)
	sw	s0,536(sp)
	sw	s1,532(sp)
	addi	s0,sp,544
	li	t0,-4096
	add	sp,sp,t0
	li	a5,4
	sw	a5,-28(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	li	a5,-4096
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-20(s0)
	slli	s1,a4,3
	add	s1,a5,s1
	lw	a1,-20(s0)
	lw	a0,-28(s0)
	call	zeno_create_object
	mv	a4,a0
	mv	a5,a1
	sw	a4,-524(s1)
	sw	a5,-520(s1)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,63
	ble	a4,a5,.L3
	sw	zero,-24(s0)
	j	.L4
.L5:
	li	a5,-4096
	addi	a5,a5,-12
	addi	a5,a5,-16
	add	a0,a5,s0
	li	a5,-4096
	addi	a5,a5,-16
	add	a4,a5,s0
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a5,-524(a5)
	li	a4,4
	li	a3,1024
	mv	a2,a5
	li	a1,0
	call	zeno_get_u4
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L4:
	lw	a4,-24(s0)
	li	a5,63
	ble	a4,a5,.L5
	li	a0,-1
	call	halt
	li	a5,0
	mv	a0,a5
	li	t0,4096
	add	sp,sp,t0
	lw	ra,540(sp)
	lw	s0,536(sp)
	lw	s1,532(sp)
	addi	sp,sp,544
	jr	ra
	.size	main, .-main
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
