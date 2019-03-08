.macro _intr_handler handler
  
  /* save general purpose registers */
  stp   x30, xzr, [sp, #-16]!
  stp   x28, x29, [sp, #-16]!
  stp   x26, x27, [sp, #-16]!
  stp   x24, x25, [sp, #-16]!
  stp   x22, x23, [sp, #-16]!
  stp   x20, x21, [sp, #-16]!
  stp   x18, x19, [sp, #-16]!
  stp   x16, x17, [sp, #-16]!
  stp   x14, x15, [sp, #-16]!
  stp   x12, x13, [sp, #-16]!
  stp   x10, x11, [sp, #-16]!
  stp   x8,  x9,  [sp, #-16]!
  stp   x6,  x7,  [sp, #-16]!
  stp   x4,  x5,  [sp, #-16]!
  stp   x2,  x3,  [sp, #-16]!
  stp   x0,  x1,  [sp, #-16]!
	
  mrs   x0, spsr_el1
  mrs   x1, elr_el1
  mrs   x2, sp_el0

  stp   x2,  xzr,  [sp, #-16]!
  stp   x0,  x1,  [sp, #-16]!
  
  mrs   x0, esr_el1
  mov   x1, sp
  mrs   x2, elr_el1

  ldr		x3, =_intrstack
  mov		sp, x3
  
  bl    \handler

.endm

.text
.global el1_vector
// vector table
el1_vector:
.balign 0x800
  // Synchronous  Current EL with SP0
  // Kozos-raspi3 does not use SP_EL0 in EL1 (Kernel) Mode.
  // So this vector shoud not be called.

  _intr_handler software_interrupt_entry

.balign 0x80
  // IRQ/vIRQ  Current EL with SP0
  // Kozos-raspi3 does not use SP_EL0 in EL1 (Kernel) Mode.
  // So this vector shoud not be called.

  _intr_handler irq_entry

.balign 0x80
  // FIQ/vFRQ  Current EL with SP0
  // Kozos-raspi3 does not use SP_EL0 in EL1 (Kernel) Mode.
  // So this vector shoud not be called.

  _intr_handler fiq_entry

.balign 0x80
  // SError/vSError  Current EL with SP0
  // Kozos-raspi3 does not use SP_EL0 in EL1 (Kernel) Mode.
  // So this vector shoud not be called.

  _intr_handler error_interrupt_entry

.balign 0x80
  // Synchronous  Current EL with SPx

  _intr_handler software_interrupt_entry

.balign 0x80
  // IRQ/vIRQ  Current EL with SPx

  _intr_handler irq_entry

.balign 0x80
  // FIQ/vFRQ  Current EL with SPx

  _intr_handler fiq_entry

.balign 0x80
  // SError/vSError  Current EL with SPx
  _intr_handler error_interrupt_entry
