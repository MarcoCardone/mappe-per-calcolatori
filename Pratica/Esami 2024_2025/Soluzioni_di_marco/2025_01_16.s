previsione:
  add sp sp -8
  sb s0  0(sp)
  sb s1  1(sp)
  sb s2  2(sp)
  sb s3  3(sp)
  sb s8  4(sp)
  sb s9  5(sp)
  sb s10 6(sp)
  sb s11 7(sp)

  # calcolo dell puntatore dell' ultima collonna
  addi s11 a2 -1
  add s11 a0 s11
  # calcolo del puntatore della penultima riga
  add s10 s11 -1
  #contatore
  mv s1 zero
  # supporto
  mv s2 zero
  mv s3 zero
  while:
    beq s11 a0 fine
    li s0 0

    mv s8 s10 # da
    mv s9 s11 # a
    for:beq s0 a1 done
      lb s2 0(s8)
      slt s3 zero s2
      add s1 s1 s3

      beqz s3 next # non bisogna fare niente
      and s3 s2 1
      srl s2 s2 1
      add s2 s2 s3
      sb s2 0(s9)

      next:
      addi s8 s8 a2
      addi s9 s9 a2
      addi s0 s0 1
      j for
    done:
    addi s10 s11 -1
    addi s11 s11 -1
    j while
  fine:
  li s0 0
  for_2:beq s0 a1 return
    sb zero 0(s11)
    addi s11 s11 1
    addi s0 s0 1
    j for_2
  return:

    mv a0 s1
    lb s0  0(sp)
    lb s1  1(sp)
    lb s2  2(sp)
    lb s3  3(sp)
    lb s8  4(sp)
    lb s9  5(sp)
    lb s10 6(sp)
    lb s11 7(sp)

    add sp sp +8
    jr ra

