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
