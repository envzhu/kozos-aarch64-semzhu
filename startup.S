	.section .text
	.global	_start
_start:
  // disable IRQ/FIQ interrupt
  msr   daifset, #3
  
  // read cpu id, stop slave cores
  mrs		x0, mpidr_el1
  and 	x0, x0, #3
  // if cpu id > 0, stop
  cbnz  x0, cpu_halt

  mrs	  x1, CurrentEL

  /* If CurrentEL is EL3, start as EL3 */
  cmp   x1, #0xc
  beq   start_el3

  /* If CurrentEL is EL2, start as EL2 */
  cmp   x1, #0x8
  beq   start_el2

  /* If CurrentEL is EL1, start as EL1 */
  cmp   x1, #0x4
  beq   start_el1

  /*
   * If CurrentEL is EL0,
   * we cannnot start OS, so stop 
   */
  b     cpu_halt

start_el3:
// drop to EL2.
  mov   x2, #0x5b1    // RW=1, HCE=1, SMD=1, RES=1, NS=1
  msr   scr_el3, x2
  mov   x2, #0x3c9    // D=1, A=1, I=1, F=1 M=EL2h
  msr   spsr_el3, x2
  adr   x2, start_el2
  msr   elr_el3, x2
  eret

start_el2:
  // set sp in EL1.
  ldr   x1, =0x70000
  msr   sp_el1, x1
  ldr   x1, =0x80000
  // enable AArch64 in EL1.
  mov   x0, #(1 << 31)      // AArch64
  orr   x0, x0, #(1 << 1)   // SWIO hardwired on Pi3
  msr   hcr_el2, x0
  mrs   x0, hcr_el2
  // change execution level to EL1.
  mov   x2, #0x5         // D=1, M=EL1h
  msr   spsr_el2, x2
  adr   x2, start_el1
  msr   elr_el2, x2
  eret

start_el1:
  // set vector address in EL1.
  ldr   x0, = el1_vector
  msr   vbar_el1, x0 
  
  // set sp
  ldr		x0, =_bootstack
  mov		sp, x0
	bl		main
	b     cpu_halt
  
  .global	cpu_halt
cpu_halt:
  msr   daifset, #3
1:
	wfe
	b	1b


	.global	dispatch
dispatch:
  mov   sp, x0

  ldp   x0,  x1,  [sp], #16

	msr		spsr_el1, x0
	msr		elr_el1,  x1
  
  ldp   x0,  x1,  [sp], #16
	msr		sp_el0,   x0

  /* restore general purpose registers */
  ldp   x0,  x1,  [sp], #16
  ldp   x2,  x3,  [sp], #16
  ldp   x4,  x5,  [sp], #16
  ldp   x6,  x7,  [sp], #16
  ldp   x8,  x9,  [sp], #16
  ldp   x10, x11, [sp], #16
  ldp   x12, x13, [sp], #16
  ldp   x14, x15, [sp], #16
  ldp   x16, x17, [sp], #16
  ldp   x18, x19, [sp], #16
  ldp   x20, x21, [sp], #16
  ldp   x22, x23, [sp], #16
  ldp   x24, x25, [sp], #16
  ldp   x26, x27, [sp], #16
  ldp   x28, x29, [sp], #16
  ldp   x30, xzr, [sp], #16

  eret
