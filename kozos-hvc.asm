
kozos-hvc.elf:	file format ELF64-aarch64-little

Disassembly of section .text:
_text_start:
       0:	df 43 03 d5 	msr	DAIFSet, #3
       4:	a0 00 38 d5 	mrs	x0, MPIDR_EL1
       8:	00 04 40 92 	and	x0, x0, #0x3
       c:	40 04 00 b5 	cbnz	x0, #136
      10:	41 42 38 d5 	mrs	x1, CurrentEL
      14:	3f 30 00 f1 	cmp	x1, #12
      18:	c0 00 00 54 	b.eq	#24
      1c:	3f 20 00 f1 	cmp	x1, #8
      20:	60 01 00 54 	b.eq	#44
      24:	3f 10 00 f1 	cmp	x1, #4
      28:	a0 02 00 54 	b.eq	#84
      2c:	1a 00 00 14 	b	#104

start_el3:
      30:	22 b6 80 d2 	mov	x2, #1457
      34:	02 11 1e d5 	msr	SCR_EL3, x2
      38:	22 79 80 d2 	mov	x2, #969
      3c:	02 40 1e d5 	msr	SPSR_EL3, x2
      40:	62 00 00 10 	adr	x2, #12
      44:	22 40 1e d5 	msr	ELR_EL3, x2
      48:	e0 03 9f d6 	eret

start_el2:
      4c:	e1 00 a0 d2 	mov	x1, #458752
      50:	01 41 1c d5 	msr	SP_EL1, x1
      54:	01 01 a0 d2 	mov	x1, #524288
      58:	00 00 b0 d2 	mov	x0, #2147483648
      5c:	00 00 7f b2 	orr	x0, x0, #0x2
      60:	00 11 1c d5 	msr	HCR_EL2, x0
      64:	00 11 3c d5 	mrs	x0, HCR_EL2
      68:	a2 00 80 d2 	mov	x2, #5
      6c:	02 40 1c d5 	msr	SPSR_EL2, x2
      70:	62 00 00 10 	adr	x2, #12
      74:	22 40 1c d5 	msr	ELR_EL2, x2
      78:	e0 03 9f d6 	eret

start_el1:
      7c:	20 04 00 58 	ldr	x0, #132
      80:	00 c0 18 d5 	msr	VBAR_EL1, x0
      84:	20 04 00 58 	ldr	x0, #132
      88:	1f 00 00 91 	mov	sp, x0
      8c:	21 00 00 94 	bl	#132
      90:	01 00 00 14 	b	#4

cpu_halt:
      94:	df 43 03 d5 	msr	DAIFSet, #3
      98:	5f 20 03 d5 	wfe
      9c:	ff ff ff 17 	b	#-4

dispatch:
      a0:	1f 00 00 91 	mov	sp, x0
      a4:	e0 07 c1 a8 	ldp	x0, x1, [sp], #16
      a8:	00 40 18 d5 	msr	SPSR_EL1, x0
      ac:	21 40 18 d5 	msr	ELR_EL1, x1
      b0:	e0 07 c1 a8 	ldp	x0, x1, [sp], #16
      b4:	00 41 18 d5 	msr	SP_EL0, x0
      b8:	e0 07 c1 a8 	ldp	x0, x1, [sp], #16
      bc:	e2 0f c1 a8 	ldp	x2, x3, [sp], #16
      c0:	e4 17 c1 a8 	ldp	x4, x5, [sp], #16
      c4:	e6 1f c1 a8 	ldp	x6, x7, [sp], #16
      c8:	e8 27 c1 a8 	ldp	x8, x9, [sp], #16
      cc:	ea 2f c1 a8 	ldp	x10, x11, [sp], #16
      d0:	ec 37 c1 a8 	ldp	x12, x13, [sp], #16
      d4:	ee 3f c1 a8 	ldp	x14, x15, [sp], #16
      d8:	f0 47 c1 a8 	ldp	x16, x17, [sp], #16
      dc:	f2 4f c1 a8 	ldp	x18, x19, [sp], #16
      e0:	f4 57 c1 a8 	ldp	x20, x21, [sp], #16
      e4:	f6 5f c1 a8 	ldp	x22, x23, [sp], #16
      e8:	f8 67 c1 a8 	ldp	x24, x25, [sp], #16
      ec:	fa 6f c1 a8 	ldp	x26, x27, [sp], #16
      f0:	fc 77 c1 a8 	ldp	x28, x29, [sp], #16
      f4:	fe 7f c1 a8 	ldp	x30, xzr, [sp], #16
      f8:	e0 03 9f d6 	eret
      fc:	1f 20 03 d5 	nop

$d.1:
     100:	00 08 00 00 	.word	0x00000800
     104:	00 00 00 00 	.word	0x00000000
     108:	00 80 0f 00 	.word	0x000f8000
     10c:	00 00 00 00 	.word	0x00000000

main:
     110:	ff 03 01 d1 	sub	sp, sp, #64
     114:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
     118:	fd c3 00 91 	add	x29, sp, #48
     11c:	08 00 80 52 	mov	w8, #0
     120:	09 00 00 f0 	adrp	x9, #12288
     124:	29 cd 3c 91 	add	x9, x9, #3891
     128:	00 00 00 90 	adrp	x0, #0
     12c:	00 60 06 91 	add	x0, x0, #408
     130:	0a 00 00 f0 	adrp	x10, #12288
     134:	4a fd 3e 91 	add	x10, x10, #4031
     138:	e3 03 16 32 	orr	w3, wzr, #0x400
     13c:	05 00 80 d2 	mov	x5, #0
     140:	bf c3 1f b8 	stur	wzr, [x29, #-4]
     144:	df 43 03 d5 	msr	DAIFSet, #3
     148:	a0 03 1f f8 	stur	x0, [x29, #-16]
     14c:	e0 03 09 aa 	mov	x0, x9
     150:	a8 c3 1e b8 	stur	w8, [x29, #-20]
     154:	e5 0b 00 f9 	str	x5, [sp, #16]
     158:	e3 0f 00 b9 	str	w3, [sp, #12]
     15c:	ea 03 00 f9 	str	x10, [sp]
     160:	78 04 00 94 	bl	#4576
     164:	a9 03 5f f8 	ldur	x9, [x29, #-16]
     168:	e0 03 09 aa 	mov	x0, x9
     16c:	e1 03 40 f9 	ldr	x1, [sp]
     170:	a2 c3 5e b8 	ldur	w2, [x29, #-20]
     174:	e3 0f 40 b9 	ldr	w3, [sp, #12]
     178:	a4 c3 5e b8 	ldur	w4, [x29, #-20]
     17c:	e5 0b 40 f9 	ldr	x5, [sp, #16]
     180:	c2 06 00 94 	bl	#6920
     184:	a0 c3 5e b8 	ldur	w0, [x29, #-20]
     188:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
     18c:	ff 03 01 91 	add	sp, sp, #64
     190:	c0 03 5f d6 	ret
     194:	1f 20 03 d5 	nop

start_threads:
     198:	ff c3 01 d1 	sub	sp, sp, #112
     19c:	fd 7b 06 a9 	stp	x29, x30, [sp, #96]
     1a0:	fd 83 01 91 	add	x29, sp, #96
     1a4:	08 00 00 f0 	adrp	x8, #12288
     1a8:	08 1d 3e 91 	add	x8, x8, #3975
     1ac:	09 00 00 f0 	adrp	x9, #12288
     1b0:	29 61 1a 91 	add	x9, x9, #1688
     1b4:	0a 00 00 f0 	adrp	x10, #12288
     1b8:	4a b5 3e 91 	add	x10, x10, #4013
     1bc:	e2 03 00 32 	orr	w2, wzr, #0x1
     1c0:	eb 03 16 32 	orr	w11, wzr, #0x400
     1c4:	0c 00 80 52 	mov	w12, #0
     1c8:	0d 00 80 d2 	mov	x13, #0
     1cc:	0e 00 00 f0 	adrp	x14, #12288
     1d0:	ce 81 33 91 	add	x14, x14, #3296
     1d4:	0f 00 00 f0 	adrp	x15, #12288
     1d8:	ef 79 3f 91 	add	x15, x15, #4062
     1dc:	f0 03 1d 32 	orr	w16, wzr, #0x8
     1e0:	11 00 00 f0 	adrp	x17, #12288
     1e4:	31 9a 3f 91 	add	x17, x17, #4070
     1e8:	f2 0f 00 32 	orr	w18, wzr, #0xf
     1ec:	a0 83 1f b8 	stur	w0, [x29, #-8]
     1f0:	a1 03 1f f8 	stur	x1, [x29, #-16]
     1f4:	e0 03 08 aa 	mov	x0, x8
     1f8:	b2 c3 1e b8 	stur	w18, [x29, #-20]
     1fc:	b1 03 1e f8 	stur	x17, [x29, #-32]
     200:	b0 c3 1d b8 	stur	w16, [x29, #-36]
     204:	e9 1b 00 f9 	str	x9, [sp, #48]
     208:	ea 17 00 f9 	str	x10, [sp, #40]
     20c:	e2 27 00 b9 	str	w2, [sp, #36]
     210:	eb 23 00 b9 	str	w11, [sp, #32]
     214:	ec 1f 00 b9 	str	w12, [sp, #28]
     218:	ed 0b 00 f9 	str	x13, [sp, #16]
     21c:	ee 07 00 f9 	str	x14, [sp, #8]
     220:	ef 03 00 f9 	str	x15, [sp]
     224:	47 04 00 94 	bl	#4380
     228:	e8 1b 40 f9 	ldr	x8, [sp, #48]
     22c:	e0 03 08 aa 	mov	x0, x8
     230:	e1 17 40 f9 	ldr	x1, [sp, #40]
     234:	e2 27 40 b9 	ldr	w2, [sp, #36]
     238:	e3 23 40 b9 	ldr	w3, [sp, #32]
     23c:	e4 1f 40 b9 	ldr	w4, [sp, #28]
     240:	e5 0b 40 f9 	ldr	x5, [sp, #16]
     244:	17 0b 00 94 	bl	#11356
     248:	e8 07 40 f9 	ldr	x8, [sp, #8]
     24c:	e0 03 08 aa 	mov	x0, x8
     250:	e1 03 40 f9 	ldr	x1, [sp]
     254:	a2 c3 5d b8 	ldur	w2, [x29, #-36]
     258:	e3 23 40 b9 	ldr	w3, [sp, #32]
     25c:	e4 1f 40 b9 	ldr	w4, [sp, #28]
     260:	e5 0b 40 f9 	ldr	x5, [sp, #16]
     264:	0f 0b 00 94 	bl	#11324
     268:	a1 03 5e f8 	ldur	x1, [x29, #-32]
     26c:	e0 03 01 aa 	mov	x0, x1
     270:	34 04 00 94 	bl	#4304
     274:	ab c3 5e b8 	ldur	w11, [x29, #-20]
     278:	e0 03 0b 2a 	mov	w0, w11
     27c:	73 0b 00 94 	bl	#11724
     280:	ff 4f 03 d5 	msr	DAIFClr, #15
     284:	7f 20 03 d5 	wfi
     288:	ff ff ff 17 	b	#-4
     28c:	00 00 00 00  <unknown>
     290:	00 00 00 00  <unknown>
     294:	00 00 00 00  <unknown>
     298:	00 00 00 00  <unknown>
     29c:	00 00 00 00  <unknown>
     2a0:	00 00 00 00  <unknown>
     2a4:	00 00 00 00  <unknown>
     2a8:	00 00 00 00  <unknown>
     2ac:	00 00 00 00  <unknown>
     2b0:	00 00 00 00  <unknown>
     2b4:	00 00 00 00  <unknown>
     2b8:	00 00 00 00  <unknown>
     2bc:	00 00 00 00  <unknown>
     2c0:	00 00 00 00  <unknown>
     2c4:	00 00 00 00  <unknown>
     2c8:	00 00 00 00  <unknown>
     2cc:	00 00 00 00  <unknown>
     2d0:	00 00 00 00  <unknown>
     2d4:	00 00 00 00  <unknown>
     2d8:	00 00 00 00  <unknown>
     2dc:	00 00 00 00  <unknown>
     2e0:	00 00 00 00  <unknown>
     2e4:	00 00 00 00  <unknown>
     2e8:	00 00 00 00  <unknown>
     2ec:	00 00 00 00  <unknown>
     2f0:	00 00 00 00  <unknown>
     2f4:	00 00 00 00  <unknown>
     2f8:	00 00 00 00  <unknown>
     2fc:	00 00 00 00  <unknown>
     300:	00 00 00 00  <unknown>
     304:	00 00 00 00  <unknown>
     308:	00 00 00 00  <unknown>
     30c:	00 00 00 00  <unknown>
     310:	00 00 00 00  <unknown>
     314:	00 00 00 00  <unknown>
     318:	00 00 00 00  <unknown>
     31c:	00 00 00 00  <unknown>
     320:	00 00 00 00  <unknown>
     324:	00 00 00 00  <unknown>
     328:	00 00 00 00  <unknown>
     32c:	00 00 00 00  <unknown>
     330:	00 00 00 00  <unknown>
     334:	00 00 00 00  <unknown>
     338:	00 00 00 00  <unknown>
     33c:	00 00 00 00  <unknown>
     340:	00 00 00 00  <unknown>
     344:	00 00 00 00  <unknown>
     348:	00 00 00 00  <unknown>
     34c:	00 00 00 00  <unknown>
     350:	00 00 00 00  <unknown>
     354:	00 00 00 00  <unknown>
     358:	00 00 00 00  <unknown>
     35c:	00 00 00 00  <unknown>
     360:	00 00 00 00  <unknown>
     364:	00 00 00 00  <unknown>
     368:	00 00 00 00  <unknown>
     36c:	00 00 00 00  <unknown>
     370:	00 00 00 00  <unknown>
     374:	00 00 00 00  <unknown>
     378:	00 00 00 00  <unknown>
     37c:	00 00 00 00  <unknown>
     380:	00 00 00 00  <unknown>
     384:	00 00 00 00  <unknown>
     388:	00 00 00 00  <unknown>
     38c:	00 00 00 00  <unknown>
     390:	00 00 00 00  <unknown>
     394:	00 00 00 00  <unknown>
     398:	00 00 00 00  <unknown>
     39c:	00 00 00 00  <unknown>
     3a0:	00 00 00 00  <unknown>
     3a4:	00 00 00 00  <unknown>
     3a8:	00 00 00 00  <unknown>
     3ac:	00 00 00 00  <unknown>
     3b0:	00 00 00 00  <unknown>
     3b4:	00 00 00 00  <unknown>
     3b8:	00 00 00 00  <unknown>
     3bc:	00 00 00 00  <unknown>
     3c0:	00 00 00 00  <unknown>
     3c4:	00 00 00 00  <unknown>
     3c8:	00 00 00 00  <unknown>
     3cc:	00 00 00 00  <unknown>
     3d0:	00 00 00 00  <unknown>
     3d4:	00 00 00 00  <unknown>
     3d8:	00 00 00 00  <unknown>
     3dc:	00 00 00 00  <unknown>
     3e0:	00 00 00 00  <unknown>
     3e4:	00 00 00 00  <unknown>
     3e8:	00 00 00 00  <unknown>
     3ec:	00 00 00 00  <unknown>
     3f0:	00 00 00 00  <unknown>
     3f4:	00 00 00 00  <unknown>
     3f8:	00 00 00 00  <unknown>
     3fc:	00 00 00 00  <unknown>
     400:	00 00 00 00  <unknown>
     404:	00 00 00 00  <unknown>
     408:	00 00 00 00  <unknown>
     40c:	00 00 00 00  <unknown>
     410:	00 00 00 00  <unknown>
     414:	00 00 00 00  <unknown>
     418:	00 00 00 00  <unknown>
     41c:	00 00 00 00  <unknown>
     420:	00 00 00 00  <unknown>
     424:	00 00 00 00  <unknown>
     428:	00 00 00 00  <unknown>
     42c:	00 00 00 00  <unknown>
     430:	00 00 00 00  <unknown>
     434:	00 00 00 00  <unknown>
     438:	00 00 00 00  <unknown>
     43c:	00 00 00 00  <unknown>
     440:	00 00 00 00  <unknown>
     444:	00 00 00 00  <unknown>
     448:	00 00 00 00  <unknown>
     44c:	00 00 00 00  <unknown>
     450:	00 00 00 00  <unknown>
     454:	00 00 00 00  <unknown>
     458:	00 00 00 00  <unknown>
     45c:	00 00 00 00  <unknown>
     460:	00 00 00 00  <unknown>
     464:	00 00 00 00  <unknown>
     468:	00 00 00 00  <unknown>
     46c:	00 00 00 00  <unknown>
     470:	00 00 00 00  <unknown>
     474:	00 00 00 00  <unknown>
     478:	00 00 00 00  <unknown>
     47c:	00 00 00 00  <unknown>
     480:	00 00 00 00  <unknown>
     484:	00 00 00 00  <unknown>
     488:	00 00 00 00  <unknown>
     48c:	00 00 00 00  <unknown>
     490:	00 00 00 00  <unknown>
     494:	00 00 00 00  <unknown>
     498:	00 00 00 00  <unknown>
     49c:	00 00 00 00  <unknown>
     4a0:	00 00 00 00  <unknown>
     4a4:	00 00 00 00  <unknown>
     4a8:	00 00 00 00  <unknown>
     4ac:	00 00 00 00  <unknown>
     4b0:	00 00 00 00  <unknown>
     4b4:	00 00 00 00  <unknown>
     4b8:	00 00 00 00  <unknown>
     4bc:	00 00 00 00  <unknown>
     4c0:	00 00 00 00  <unknown>
     4c4:	00 00 00 00  <unknown>
     4c8:	00 00 00 00  <unknown>
     4cc:	00 00 00 00  <unknown>
     4d0:	00 00 00 00  <unknown>
     4d4:	00 00 00 00  <unknown>
     4d8:	00 00 00 00  <unknown>
     4dc:	00 00 00 00  <unknown>
     4e0:	00 00 00 00  <unknown>
     4e4:	00 00 00 00  <unknown>
     4e8:	00 00 00 00  <unknown>
     4ec:	00 00 00 00  <unknown>
     4f0:	00 00 00 00  <unknown>
     4f4:	00 00 00 00  <unknown>
     4f8:	00 00 00 00  <unknown>
     4fc:	00 00 00 00  <unknown>
     500:	00 00 00 00  <unknown>
     504:	00 00 00 00  <unknown>
     508:	00 00 00 00  <unknown>
     50c:	00 00 00 00  <unknown>
     510:	00 00 00 00  <unknown>
     514:	00 00 00 00  <unknown>
     518:	00 00 00 00  <unknown>
     51c:	00 00 00 00  <unknown>
     520:	00 00 00 00  <unknown>
     524:	00 00 00 00  <unknown>
     528:	00 00 00 00  <unknown>
     52c:	00 00 00 00  <unknown>
     530:	00 00 00 00  <unknown>
     534:	00 00 00 00  <unknown>
     538:	00 00 00 00  <unknown>
     53c:	00 00 00 00  <unknown>
     540:	00 00 00 00  <unknown>
     544:	00 00 00 00  <unknown>
     548:	00 00 00 00  <unknown>
     54c:	00 00 00 00  <unknown>
     550:	00 00 00 00  <unknown>
     554:	00 00 00 00  <unknown>
     558:	00 00 00 00  <unknown>
     55c:	00 00 00 00  <unknown>
     560:	00 00 00 00  <unknown>
     564:	00 00 00 00  <unknown>
     568:	00 00 00 00  <unknown>
     56c:	00 00 00 00  <unknown>
     570:	00 00 00 00  <unknown>
     574:	00 00 00 00  <unknown>
     578:	00 00 00 00  <unknown>
     57c:	00 00 00 00  <unknown>
     580:	00 00 00 00  <unknown>
     584:	00 00 00 00  <unknown>
     588:	00 00 00 00  <unknown>
     58c:	00 00 00 00  <unknown>
     590:	00 00 00 00  <unknown>
     594:	00 00 00 00  <unknown>
     598:	00 00 00 00  <unknown>
     59c:	00 00 00 00  <unknown>
     5a0:	00 00 00 00  <unknown>
     5a4:	00 00 00 00  <unknown>
     5a8:	00 00 00 00  <unknown>
     5ac:	00 00 00 00  <unknown>
     5b0:	00 00 00 00  <unknown>
     5b4:	00 00 00 00  <unknown>
     5b8:	00 00 00 00  <unknown>
     5bc:	00 00 00 00  <unknown>
     5c0:	00 00 00 00  <unknown>
     5c4:	00 00 00 00  <unknown>
     5c8:	00 00 00 00  <unknown>
     5cc:	00 00 00 00  <unknown>
     5d0:	00 00 00 00  <unknown>
     5d4:	00 00 00 00  <unknown>
     5d8:	00 00 00 00  <unknown>
     5dc:	00 00 00 00  <unknown>
     5e0:	00 00 00 00  <unknown>
     5e4:	00 00 00 00  <unknown>
     5e8:	00 00 00 00  <unknown>
     5ec:	00 00 00 00  <unknown>
     5f0:	00 00 00 00  <unknown>
     5f4:	00 00 00 00  <unknown>
     5f8:	00 00 00 00  <unknown>
     5fc:	00 00 00 00  <unknown>
     600:	00 00 00 00  <unknown>
     604:	00 00 00 00  <unknown>
     608:	00 00 00 00  <unknown>
     60c:	00 00 00 00  <unknown>
     610:	00 00 00 00  <unknown>
     614:	00 00 00 00  <unknown>
     618:	00 00 00 00  <unknown>
     61c:	00 00 00 00  <unknown>
     620:	00 00 00 00  <unknown>
     624:	00 00 00 00  <unknown>
     628:	00 00 00 00  <unknown>
     62c:	00 00 00 00  <unknown>
     630:	00 00 00 00  <unknown>
     634:	00 00 00 00  <unknown>
     638:	00 00 00 00  <unknown>
     63c:	00 00 00 00  <unknown>
     640:	00 00 00 00  <unknown>
     644:	00 00 00 00  <unknown>
     648:	00 00 00 00  <unknown>
     64c:	00 00 00 00  <unknown>
     650:	00 00 00 00  <unknown>
     654:	00 00 00 00  <unknown>
     658:	00 00 00 00  <unknown>
     65c:	00 00 00 00  <unknown>
     660:	00 00 00 00  <unknown>
     664:	00 00 00 00  <unknown>
     668:	00 00 00 00  <unknown>
     66c:	00 00 00 00  <unknown>
     670:	00 00 00 00  <unknown>
     674:	00 00 00 00  <unknown>
     678:	00 00 00 00  <unknown>
     67c:	00 00 00 00  <unknown>
     680:	00 00 00 00  <unknown>
     684:	00 00 00 00  <unknown>
     688:	00 00 00 00  <unknown>
     68c:	00 00 00 00  <unknown>
     690:	00 00 00 00  <unknown>
     694:	00 00 00 00  <unknown>
     698:	00 00 00 00  <unknown>
     69c:	00 00 00 00  <unknown>
     6a0:	00 00 00 00  <unknown>
     6a4:	00 00 00 00  <unknown>
     6a8:	00 00 00 00  <unknown>
     6ac:	00 00 00 00  <unknown>
     6b0:	00 00 00 00  <unknown>
     6b4:	00 00 00 00  <unknown>
     6b8:	00 00 00 00  <unknown>
     6bc:	00 00 00 00  <unknown>
     6c0:	00 00 00 00  <unknown>
     6c4:	00 00 00 00  <unknown>
     6c8:	00 00 00 00  <unknown>
     6cc:	00 00 00 00  <unknown>
     6d0:	00 00 00 00  <unknown>
     6d4:	00 00 00 00  <unknown>
     6d8:	00 00 00 00  <unknown>
     6dc:	00 00 00 00  <unknown>
     6e0:	00 00 00 00  <unknown>
     6e4:	00 00 00 00  <unknown>
     6e8:	00 00 00 00  <unknown>
     6ec:	00 00 00 00  <unknown>
     6f0:	00 00 00 00  <unknown>
     6f4:	00 00 00 00  <unknown>
     6f8:	00 00 00 00  <unknown>
     6fc:	00 00 00 00  <unknown>
     700:	00 00 00 00  <unknown>
     704:	00 00 00 00  <unknown>
     708:	00 00 00 00  <unknown>
     70c:	00 00 00 00  <unknown>
     710:	00 00 00 00  <unknown>
     714:	00 00 00 00  <unknown>
     718:	00 00 00 00  <unknown>
     71c:	00 00 00 00  <unknown>
     720:	00 00 00 00  <unknown>
     724:	00 00 00 00  <unknown>
     728:	00 00 00 00  <unknown>
     72c:	00 00 00 00  <unknown>
     730:	00 00 00 00  <unknown>
     734:	00 00 00 00  <unknown>
     738:	00 00 00 00  <unknown>
     73c:	00 00 00 00  <unknown>
     740:	00 00 00 00  <unknown>
     744:	00 00 00 00  <unknown>
     748:	00 00 00 00  <unknown>
     74c:	00 00 00 00  <unknown>
     750:	00 00 00 00  <unknown>
     754:	00 00 00 00  <unknown>
     758:	00 00 00 00  <unknown>
     75c:	00 00 00 00  <unknown>
     760:	00 00 00 00  <unknown>
     764:	00 00 00 00  <unknown>
     768:	00 00 00 00  <unknown>
     76c:	00 00 00 00  <unknown>
     770:	00 00 00 00  <unknown>
     774:	00 00 00 00  <unknown>
     778:	00 00 00 00  <unknown>
     77c:	00 00 00 00  <unknown>
     780:	00 00 00 00  <unknown>
     784:	00 00 00 00  <unknown>
     788:	00 00 00 00  <unknown>
     78c:	00 00 00 00  <unknown>
     790:	00 00 00 00  <unknown>
     794:	00 00 00 00  <unknown>
     798:	00 00 00 00  <unknown>
     79c:	00 00 00 00  <unknown>
     7a0:	00 00 00 00  <unknown>
     7a4:	00 00 00 00  <unknown>
     7a8:	00 00 00 00  <unknown>
     7ac:	00 00 00 00  <unknown>
     7b0:	00 00 00 00  <unknown>
     7b4:	00 00 00 00  <unknown>
     7b8:	00 00 00 00  <unknown>
     7bc:	00 00 00 00  <unknown>
     7c0:	00 00 00 00  <unknown>
     7c4:	00 00 00 00  <unknown>
     7c8:	00 00 00 00  <unknown>
     7cc:	00 00 00 00  <unknown>
     7d0:	00 00 00 00  <unknown>
     7d4:	00 00 00 00  <unknown>
     7d8:	00 00 00 00  <unknown>
     7dc:	00 00 00 00  <unknown>
     7e0:	00 00 00 00  <unknown>
     7e4:	00 00 00 00  <unknown>
     7e8:	00 00 00 00  <unknown>
     7ec:	00 00 00 00  <unknown>
     7f0:	00 00 00 00  <unknown>
     7f4:	00 00 00 00  <unknown>
     7f8:	00 00 00 00  <unknown>
     7fc:	00 00 00 00  <unknown>

el1_vector:
     800:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     804:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     808:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     80c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     810:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     814:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     818:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     81c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     820:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     824:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     828:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     82c:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     830:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     834:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     838:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     83c:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     840:	00 40 38 d5 	mrs	x0, SPSR_EL1
     844:	21 40 38 d5 	mrs	x1, ELR_EL1
     848:	02 41 38 d5 	mrs	x2, SP_EL0
     84c:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     850:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     854:	00 52 38 d5 	mrs	x0, ESR_EL1
     858:	e1 03 00 91 	mov	x1, sp
     85c:	22 40 38 d5 	mrs	x2, ELR_EL1
     860:	83 1c 00 58 	ldr	x3, #912
     864:	7f 00 00 91 	mov	sp, x3
     868:	1a 01 00 94 	bl	#1128
     86c:	1f 20 03 d5 	nop
     870:	1f 20 03 d5 	nop
     874:	1f 20 03 d5 	nop
     878:	1f 20 03 d5 	nop
     87c:	1f 20 03 d5 	nop
     880:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     884:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     888:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     88c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     890:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     894:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     898:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     89c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     8a0:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     8a4:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     8a8:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     8ac:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     8b0:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     8b4:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     8b8:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     8bc:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     8c0:	00 40 38 d5 	mrs	x0, SPSR_EL1
     8c4:	21 40 38 d5 	mrs	x1, ELR_EL1
     8c8:	02 41 38 d5 	mrs	x2, SP_EL0
     8cc:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     8d0:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     8d4:	00 52 38 d5 	mrs	x0, ESR_EL1
     8d8:	e1 03 00 91 	mov	x1, sp
     8dc:	22 40 38 d5 	mrs	x2, ELR_EL1
     8e0:	c3 18 00 58 	ldr	x3, #792
     8e4:	7f 00 00 91 	mov	sp, x3
     8e8:	28 01 00 94 	bl	#1184
     8ec:	1f 20 03 d5 	nop
     8f0:	1f 20 03 d5 	nop
     8f4:	1f 20 03 d5 	nop
     8f8:	1f 20 03 d5 	nop
     8fc:	1f 20 03 d5 	nop
     900:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     904:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     908:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     90c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     910:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     914:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     918:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     91c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     920:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     924:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     928:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     92c:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     930:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     934:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     938:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     93c:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     940:	00 40 38 d5 	mrs	x0, SPSR_EL1
     944:	21 40 38 d5 	mrs	x1, ELR_EL1
     948:	02 41 38 d5 	mrs	x2, SP_EL0
     94c:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     950:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     954:	00 52 38 d5 	mrs	x0, ESR_EL1
     958:	e1 03 00 91 	mov	x1, sp
     95c:	22 40 38 d5 	mrs	x2, ELR_EL1
     960:	03 15 00 58 	ldr	x3, #672
     964:	7f 00 00 91 	mov	sp, x3
     968:	18 01 00 94 	bl	#1120
     96c:	1f 20 03 d5 	nop
     970:	1f 20 03 d5 	nop
     974:	1f 20 03 d5 	nop
     978:	1f 20 03 d5 	nop
     97c:	1f 20 03 d5 	nop
     980:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     984:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     988:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     98c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     990:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     994:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     998:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     99c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     9a0:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     9a4:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     9a8:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     9ac:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     9b0:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     9b4:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     9b8:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     9bc:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     9c0:	00 40 38 d5 	mrs	x0, SPSR_EL1
     9c4:	21 40 38 d5 	mrs	x1, ELR_EL1
     9c8:	02 41 38 d5 	mrs	x2, SP_EL0
     9cc:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     9d0:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     9d4:	00 52 38 d5 	mrs	x0, ESR_EL1
     9d8:	e1 03 00 91 	mov	x1, sp
     9dc:	22 40 38 d5 	mrs	x2, ELR_EL1
     9e0:	43 11 00 58 	ldr	x3, #552
     9e4:	7f 00 00 91 	mov	sp, x3
     9e8:	e2 00 00 94 	bl	#904
     9ec:	1f 20 03 d5 	nop
     9f0:	1f 20 03 d5 	nop
     9f4:	1f 20 03 d5 	nop
     9f8:	1f 20 03 d5 	nop
     9fc:	1f 20 03 d5 	nop
     a00:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     a04:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     a08:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     a0c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     a10:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     a14:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     a18:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     a1c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     a20:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     a24:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     a28:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     a2c:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     a30:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     a34:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     a38:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     a3c:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     a40:	00 40 38 d5 	mrs	x0, SPSR_EL1
     a44:	21 40 38 d5 	mrs	x1, ELR_EL1
     a48:	02 41 38 d5 	mrs	x2, SP_EL0
     a4c:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     a50:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     a54:	00 52 38 d5 	mrs	x0, ESR_EL1
     a58:	e1 03 00 91 	mov	x1, sp
     a5c:	22 40 38 d5 	mrs	x2, ELR_EL1
     a60:	83 0d 00 58 	ldr	x3, #432
     a64:	7f 00 00 91 	mov	sp, x3
     a68:	9a 00 00 94 	bl	#616
     a6c:	1f 20 03 d5 	nop
     a70:	1f 20 03 d5 	nop
     a74:	1f 20 03 d5 	nop
     a78:	1f 20 03 d5 	nop
     a7c:	1f 20 03 d5 	nop
     a80:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     a84:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     a88:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     a8c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     a90:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     a94:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     a98:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     a9c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     aa0:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     aa4:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     aa8:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     aac:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     ab0:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     ab4:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     ab8:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     abc:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     ac0:	00 40 38 d5 	mrs	x0, SPSR_EL1
     ac4:	21 40 38 d5 	mrs	x1, ELR_EL1
     ac8:	02 41 38 d5 	mrs	x2, SP_EL0
     acc:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     ad0:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     ad4:	00 52 38 d5 	mrs	x0, ESR_EL1
     ad8:	e1 03 00 91 	mov	x1, sp
     adc:	22 40 38 d5 	mrs	x2, ELR_EL1
     ae0:	c3 09 00 58 	ldr	x3, #312
     ae4:	7f 00 00 91 	mov	sp, x3
     ae8:	a8 00 00 94 	bl	#672
     aec:	1f 20 03 d5 	nop
     af0:	1f 20 03 d5 	nop
     af4:	1f 20 03 d5 	nop
     af8:	1f 20 03 d5 	nop
     afc:	1f 20 03 d5 	nop
     b00:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     b04:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     b08:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     b0c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     b10:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     b14:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     b18:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     b1c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     b20:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     b24:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     b28:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     b2c:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     b30:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     b34:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     b38:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     b3c:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     b40:	00 40 38 d5 	mrs	x0, SPSR_EL1
     b44:	21 40 38 d5 	mrs	x1, ELR_EL1
     b48:	02 41 38 d5 	mrs	x2, SP_EL0
     b4c:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     b50:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     b54:	00 52 38 d5 	mrs	x0, ESR_EL1
     b58:	e1 03 00 91 	mov	x1, sp
     b5c:	22 40 38 d5 	mrs	x2, ELR_EL1
     b60:	03 06 00 58 	ldr	x3, #192
     b64:	7f 00 00 91 	mov	sp, x3
     b68:	98 00 00 94 	bl	#608
     b6c:	1f 20 03 d5 	nop
     b70:	1f 20 03 d5 	nop
     b74:	1f 20 03 d5 	nop
     b78:	1f 20 03 d5 	nop
     b7c:	1f 20 03 d5 	nop
     b80:	fe 7f bf a9 	stp	x30, xzr, [sp, #-16]!
     b84:	fc 77 bf a9 	stp	x28, x29, [sp, #-16]!
     b88:	fa 6f bf a9 	stp	x26, x27, [sp, #-16]!
     b8c:	f8 67 bf a9 	stp	x24, x25, [sp, #-16]!
     b90:	f6 5f bf a9 	stp	x22, x23, [sp, #-16]!
     b94:	f4 57 bf a9 	stp	x20, x21, [sp, #-16]!
     b98:	f2 4f bf a9 	stp	x18, x19, [sp, #-16]!
     b9c:	f0 47 bf a9 	stp	x16, x17, [sp, #-16]!
     ba0:	ee 3f bf a9 	stp	x14, x15, [sp, #-16]!
     ba4:	ec 37 bf a9 	stp	x12, x13, [sp, #-16]!
     ba8:	ea 2f bf a9 	stp	x10, x11, [sp, #-16]!
     bac:	e8 27 bf a9 	stp	x8, x9, [sp, #-16]!
     bb0:	e6 1f bf a9 	stp	x6, x7, [sp, #-16]!
     bb4:	e4 17 bf a9 	stp	x4, x5, [sp, #-16]!
     bb8:	e2 0f bf a9 	stp	x2, x3, [sp, #-16]!
     bbc:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     bc0:	00 40 38 d5 	mrs	x0, SPSR_EL1
     bc4:	21 40 38 d5 	mrs	x1, ELR_EL1
     bc8:	02 41 38 d5 	mrs	x2, SP_EL0
     bcc:	e2 7f bf a9 	stp	x2, xzr, [sp, #-16]!
     bd0:	e0 07 bf a9 	stp	x0, x1, [sp, #-16]!
     bd4:	00 52 38 d5 	mrs	x0, ESR_EL1
     bd8:	e1 03 00 91 	mov	x1, sp
     bdc:	22 40 38 d5 	mrs	x2, ELR_EL1
     be0:	43 02 00 58 	ldr	x3, #72
     be4:	7f 00 00 91 	mov	sp, x3
     be8:	62 00 00 94 	bl	#392
     bec:	1f 20 03 d5 	nop

$d.1:
     bf0:	00 00 10 00 	.word	0x00100000
     bf4:	00 00 00 00 	.word	0x00000000
     bf8:	00 00 10 00 	.word	0x00100000
     bfc:	00 00 00 00 	.word	0x00000000
     c00:	00 00 10 00 	.word	0x00100000
     c04:	00 00 00 00 	.word	0x00000000
     c08:	00 00 10 00 	.word	0x00100000
     c0c:	00 00 00 00 	.word	0x00000000
     c10:	00 00 10 00 	.word	0x00100000
     c14:	00 00 00 00 	.word	0x00000000
     c18:	00 00 10 00 	.word	0x00100000
     c1c:	00 00 00 00 	.word	0x00000000
     c20:	00 00 10 00 	.word	0x00100000
     c24:	00 00 00 00 	.word	0x00000000
     c28:	00 00 10 00 	.word	0x00100000
     c2c:	00 00 00 00 	.word	0x00000000

softvec_init:
     c30:	ff 83 00 d1 	sub	sp, sp, #32
     c34:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
     c38:	fd 43 00 91 	add	x29, sp, #16
     c3c:	bf c3 1f b8 	stur	wzr, [x29, #-4]
     c40:	e8 07 00 32 	orr	w8, wzr, #0x3
     c44:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
     c48:	3f 01 08 6b 	cmp	w9, w8
     c4c:	e8 a7 9f 1a 	cset	w8, lt
     c50:	48 00 00 37 	tbnz	w8, #0, #8
     c54:	08 00 00 14 	b	#32
     c58:	01 00 80 d2 	mov	x1, #0
     c5c:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
     c60:	0a 00 00 94 	bl	#40
     c64:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
     c68:	08 05 00 11 	add	w8, w8, #1
     c6c:	a8 c3 1f b8 	stur	w8, [x29, #-4]
     c70:	f4 ff ff 17 	b	#-48
     c74:	00 00 80 52 	mov	w0, #0
     c78:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
     c7c:	ff 83 00 91 	add	sp, sp, #32
     c80:	c0 03 5f d6 	ret
     c84:	1f 20 03 d5 	nop

softvec_setintr:
     c88:	ff 43 00 d1 	sub	sp, sp, #16
     c8c:	28 00 00 90 	adrp	x8, #16384
     c90:	08 c1 2a 91 	add	x8, x8, #2736
     c94:	e9 03 7e b2 	orr	x9, xzr, #0x4
     c98:	0a 00 80 52 	mov	w10, #0
     c9c:	e0 0f 00 b9 	str	w0, [sp, #12]
     ca0:	e1 03 00 f9 	str	x1, [sp]
     ca4:	e1 03 40 f9 	ldr	x1, [sp]
     ca8:	e0 03 01 2a 	mov	w0, w1
     cac:	eb 0f 40 b9 	ldr	w11, [sp, #12]
     cb0:	e1 03 0b 2a 	mov	w1, w11
     cb4:	21 7c 40 d3 	ubfx	x1, x1, #0, #32
     cb8:	29 7d 01 9b 	mul	x9, x9, x1
     cbc:	08 01 09 8b 	add	x8, x8, x9
     cc0:	00 01 00 b9 	str	w0, [x8]
     cc4:	e0 03 0a 2a 	mov	w0, w10
     cc8:	ff 43 00 91 	add	sp, sp, #16
     ccc:	c0 03 5f d6 	ret

software_interrupt_entry:
     cd0:	ff 03 01 d1 	sub	sp, sp, #64
     cd4:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
     cd8:	fd c3 00 91 	add	x29, sp, #48
     cdc:	48 03 80 52 	mov	w8, #26
     ce0:	29 00 00 90 	adrp	x9, #16384
     ce4:	29 c1 2a 91 	add	x9, x9, #2736
     ce8:	ea 03 7e b2 	orr	x10, xzr, #0x4
     cec:	0b 00 00 f0 	adrp	x11, #12288
     cf0:	6b 61 3c 91 	add	x11, x11, #3864
     cf4:	a0 c3 1f b8 	stur	w0, [x29, #-4]
     cf8:	a1 03 1f f8 	stur	x1, [x29, #-16]
     cfc:	e2 0f 00 f9 	str	x2, [sp, #24]
     d00:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
     d04:	08 24 c8 1a 	lsr	w8, w0, w8
     d08:	a8 c3 1f b8 	stur	w8, [x29, #-4]
     d0c:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
     d10:	e1 03 08 2a 	mov	w1, w8
     d14:	21 7c 40 d3 	ubfx	x1, x1, #0, #32
     d18:	4a 7d 01 9b 	mul	x10, x10, x1
     d1c:	29 01 0a 8b 	add	x9, x9, x10
     d20:	28 01 40 b9 	ldr	w8, [x9]
     d24:	e9 03 08 2a 	mov	w9, w8
     d28:	29 7d 40 d3 	ubfx	x9, x9, #0, #32
     d2c:	e9 0b 00 f9 	str	x9, [sp, #16]
     d30:	e9 0b 40 f9 	ldr	x9, [sp, #16]
     d34:	eb 07 00 f9 	str	x11, [sp, #8]
     d38:	49 00 00 b5 	cbnz	x9, #8
     d3c:	05 00 00 14 	b	#20
     d40:	e8 0b 40 f9 	ldr	x8, [sp, #16]
     d44:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
     d48:	a1 03 5f f8 	ldur	x1, [x29, #-16]
     d4c:	00 01 3f d6 	blr	x8
     d50:	e0 07 40 f9 	ldr	x0, [sp, #8]
     d54:	7b 01 00 94 	bl	#1516
     d58:	a8 03 5f f8 	ldur	x8, [x29, #-16]
     d5c:	e0 03 08 aa 	mov	x0, x8
     d60:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
     d64:	ff 03 01 91 	add	sp, sp, #64
     d68:	c0 03 5f d6 	ret
     d6c:	1f 20 03 d5 	nop

error_interrupt_entry:
     d70:	ff 83 00 d1 	sub	sp, sp, #32
     d74:	e0 17 00 b9 	str	w0, [sp, #20]
     d78:	e1 07 00 f9 	str	x1, [sp, #8]
     d7c:	e2 03 00 f9 	str	x2, [sp]
     d80:	00 00 00 14 	b	#0
     d84:	1f 20 03 d5 	nop

irq_entry:
     d88:	ff c3 00 d1 	sub	sp, sp, #48
     d8c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
     d90:	fd 83 00 91 	add	x29, sp, #32
     d94:	08 00 00 f0 	adrp	x8, #12288
     d98:	08 61 3c 91 	add	x8, x8, #3864
     d9c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
     da0:	e1 0b 00 f9 	str	x1, [sp, #16]
     da4:	e2 07 00 f9 	str	x2, [sp, #8]
     da8:	7f 20 03 d5 	wfi
     dac:	e0 03 08 aa 	mov	x0, x8
     db0:	64 01 00 94 	bl	#1424
     db4:	e8 0b 40 f9 	ldr	x8, [sp, #16]
     db8:	e0 03 08 aa 	mov	x0, x8
     dbc:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
     dc0:	ff c3 00 91 	add	sp, sp, #48
     dc4:	c0 03 5f d6 	ret

fiq_entry:
     dc8:	ff 03 01 d1 	sub	sp, sp, #64
     dcc:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
     dd0:	fd c3 00 91 	add	x29, sp, #48
     dd4:	a8 03 80 52 	mov	w8, #29
     dd8:	09 00 00 f0 	adrp	x9, #12288
     ddc:	29 21 3d 91 	add	x9, x9, #3912
     de0:	0a 00 00 f0 	adrp	x10, #12288
     de4:	4a 61 3c 91 	add	x10, x10, #3864
     de8:	a0 c3 1f b8 	stur	w0, [x29, #-4]
     dec:	a1 03 1f f8 	stur	x1, [x29, #-16]
     df0:	e2 0f 00 f9 	str	x2, [sp, #24]
     df4:	e0 03 08 2a 	mov	w0, w8
     df8:	ea 0b 00 f9 	str	x10, [sp, #16]
     dfc:	e9 07 00 f9 	str	x9, [sp, #8]
     e00:	bc 02 00 94 	bl	#2800
     e04:	40 00 00 35 	cbnz	w0, #8
     e08:	03 00 00 14 	b	#12
     e0c:	e0 07 40 f9 	ldr	x0, [sp, #8]
     e10:	4c 01 00 94 	bl	#1328
     e14:	7f 20 03 d5 	wfi
     e18:	e0 0b 40 f9 	ldr	x0, [sp, #16]
     e1c:	49 01 00 94 	bl	#1316
     e20:	a8 03 5f f8 	ldur	x8, [x29, #-16]
     e24:	e0 03 08 aa 	mov	x0, x8
     e28:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
     e2c:	ff 03 01 91 	add	sp, sp, #64
     e30:	c0 03 5f d6 	ret
     e34:	00 00 00 00  <unknown>

memset:
     e38:	ff 83 00 d1 	sub	sp, sp, #32
     e3c:	e0 0f 00 f9 	str	x0, [sp, #24]
     e40:	e1 17 00 b9 	str	w1, [sp, #20]
     e44:	e2 07 00 f9 	str	x2, [sp, #8]
     e48:	e0 0f 40 f9 	ldr	x0, [sp, #24]
     e4c:	e0 03 00 f9 	str	x0, [sp]
     e50:	08 00 80 d2 	mov	x8, #0
     e54:	e9 07 40 f9 	ldr	x9, [sp, #8]
     e58:	3f 01 08 eb 	cmp	x9, x8
     e5c:	ea d7 9f 1a 	cset	w10, gt
     e60:	4a 00 00 37 	tbnz	w10, #0, #8
     e64:	0c 00 00 14 	b	#48
     e68:	e8 03 40 b2 	orr	x8, xzr, #0x1
     e6c:	e9 17 40 b9 	ldr	w9, [sp, #20]
     e70:	ea 03 40 f9 	ldr	x10, [sp]
     e74:	48 01 08 8b 	add	x8, x10, x8
     e78:	e8 03 00 f9 	str	x8, [sp]
     e7c:	49 01 00 39 	strb	w9, [x10]
     e80:	08 00 80 92 	mov	x8, #-1
     e84:	e9 07 40 f9 	ldr	x9, [sp, #8]
     e88:	28 01 08 8b 	add	x8, x9, x8
     e8c:	e8 07 00 f9 	str	x8, [sp, #8]
     e90:	f0 ff ff 17 	b	#-64
     e94:	e0 0f 40 f9 	ldr	x0, [sp, #24]
     e98:	ff 83 00 91 	add	sp, sp, #32
     e9c:	c0 03 5f d6 	ret

memcpy:
     ea0:	ff c3 00 d1 	sub	sp, sp, #48
     ea4:	e0 17 00 f9 	str	x0, [sp, #40]
     ea8:	e1 13 00 f9 	str	x1, [sp, #32]
     eac:	e2 0f 00 f9 	str	x2, [sp, #24]
     eb0:	e0 17 40 f9 	ldr	x0, [sp, #40]
     eb4:	e0 0b 00 f9 	str	x0, [sp, #16]
     eb8:	e0 13 40 f9 	ldr	x0, [sp, #32]
     ebc:	e0 07 00 f9 	str	x0, [sp, #8]
     ec0:	08 00 80 d2 	mov	x8, #0
     ec4:	e9 0f 40 f9 	ldr	x9, [sp, #24]
     ec8:	3f 01 08 eb 	cmp	x9, x8
     ecc:	ea d7 9f 1a 	cset	w10, gt
     ed0:	4a 00 00 37 	tbnz	w10, #0, #8
     ed4:	0f 00 00 14 	b	#60
     ed8:	e8 03 40 b2 	orr	x8, xzr, #0x1
     edc:	e9 07 40 f9 	ldr	x9, [sp, #8]
     ee0:	2a 01 08 8b 	add	x10, x9, x8
     ee4:	ea 07 00 f9 	str	x10, [sp, #8]
     ee8:	2b 01 40 39 	ldrb	w11, [x9]
     eec:	e9 0b 40 f9 	ldr	x9, [sp, #16]
     ef0:	28 01 08 8b 	add	x8, x9, x8
     ef4:	e8 0b 00 f9 	str	x8, [sp, #16]
     ef8:	2b 01 00 39 	strb	w11, [x9]
     efc:	08 00 80 92 	mov	x8, #-1
     f00:	e9 0f 40 f9 	ldr	x9, [sp, #24]
     f04:	28 01 08 8b 	add	x8, x9, x8
     f08:	e8 0f 00 f9 	str	x8, [sp, #24]
     f0c:	ed ff ff 17 	b	#-76
     f10:	e0 17 40 f9 	ldr	x0, [sp, #40]
     f14:	ff c3 00 91 	add	sp, sp, #48
     f18:	c0 03 5f d6 	ret
     f1c:	1f 20 03 d5 	nop

memcmp:
     f20:	ff c3 00 d1 	sub	sp, sp, #48
     f24:	e0 13 00 f9 	str	x0, [sp, #32]
     f28:	e1 0f 00 f9 	str	x1, [sp, #24]
     f2c:	e2 0b 00 f9 	str	x2, [sp, #16]
     f30:	e0 13 40 f9 	ldr	x0, [sp, #32]
     f34:	e0 07 00 f9 	str	x0, [sp, #8]
     f38:	e0 0f 40 f9 	ldr	x0, [sp, #24]
     f3c:	e0 03 00 f9 	str	x0, [sp]
     f40:	08 00 80 d2 	mov	x8, #0
     f44:	e9 0b 40 f9 	ldr	x9, [sp, #16]
     f48:	3f 01 08 eb 	cmp	x9, x8
     f4c:	ea d7 9f 1a 	cset	w10, gt
     f50:	4a 00 00 37 	tbnz	w10, #0, #8
     f54:	21 00 00 14 	b	#132
     f58:	e8 07 40 f9 	ldr	x8, [sp, #8]
     f5c:	09 01 40 39 	ldrb	w9, [x8]
     f60:	e8 03 40 f9 	ldr	x8, [sp]
     f64:	0a 01 40 39 	ldrb	w10, [x8]
     f68:	3f 01 0a 6b 	cmp	w9, w10
     f6c:	e9 07 9f 1a 	cset	w9, ne
     f70:	49 00 00 37 	tbnz	w9, #0, #8
     f74:	0d 00 00 14 	b	#52
     f78:	08 00 80 12 	mov	w8, #-1
     f7c:	e9 03 00 32 	orr	w9, wzr, #0x1
     f80:	ea 07 40 f9 	ldr	x10, [sp, #8]
     f84:	4b 01 40 39 	ldrb	w11, [x10]
     f88:	ea 03 40 f9 	ldr	x10, [sp]
     f8c:	4c 01 40 39 	ldrb	w12, [x10]
     f90:	7f 01 0c 6b 	cmp	w11, w12
     f94:	eb d7 9f 1a 	cset	w11, gt
     f98:	7f 01 00 72 	tst	w11, #0x1
     f9c:	28 11 88 1a 	csel	w8, w9, w8, ne
     fa0:	e8 2f 00 b9 	str	w8, [sp, #44]
     fa4:	0e 00 00 14 	b	#56
     fa8:	e8 03 40 b2 	orr	x8, xzr, #0x1
     fac:	e9 07 40 f9 	ldr	x9, [sp, #8]
     fb0:	29 01 08 8b 	add	x9, x9, x8
     fb4:	e9 07 00 f9 	str	x9, [sp, #8]
     fb8:	e9 03 40 f9 	ldr	x9, [sp]
     fbc:	28 01 08 8b 	add	x8, x9, x8
     fc0:	e8 03 00 f9 	str	x8, [sp]
     fc4:	08 00 80 92 	mov	x8, #-1
     fc8:	e9 0b 40 f9 	ldr	x9, [sp, #16]
     fcc:	28 01 08 8b 	add	x8, x9, x8
     fd0:	e8 0b 00 f9 	str	x8, [sp, #16]
     fd4:	db ff ff 17 	b	#-148
     fd8:	ff 2f 00 b9 	str	wzr, [sp, #44]
     fdc:	e0 2f 40 b9 	ldr	w0, [sp, #44]
     fe0:	ff c3 00 91 	add	sp, sp, #48
     fe4:	c0 03 5f d6 	ret

strlen:
     fe8:	ff 43 00 d1 	sub	sp, sp, #16
     fec:	e0 07 00 f9 	str	x0, [sp, #8]
     ff0:	ff 07 00 b9 	str	wzr, [sp, #4]
     ff4:	08 00 80 52 	mov	w8, #0
     ff8:	e9 07 40 f9 	ldr	x9, [sp, #8]
     ffc:	2a 01 40 39 	ldrb	w10, [x9]
    1000:	eb 1f 00 32 	orr	w11, wzr, #0xff
    1004:	08 01 0b 0a 	and	w8, w8, w11
    1008:	5f 01 08 6b 	cmp	w10, w8
    100c:	e8 07 9f 1a 	cset	w8, ne
    1010:	48 00 00 37 	tbnz	w8, #0, #8
    1014:	09 00 00 14 	b	#36
    1018:	e8 03 40 b2 	orr	x8, xzr, #0x1
    101c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    1020:	28 01 08 8b 	add	x8, x9, x8
    1024:	e8 07 00 f9 	str	x8, [sp, #8]
    1028:	ea 07 40 b9 	ldr	w10, [sp, #4]
    102c:	4a 05 00 11 	add	w10, w10, #1
    1030:	ea 07 00 b9 	str	w10, [sp, #4]
    1034:	f0 ff ff 17 	b	#-64
    1038:	e0 07 40 b9 	ldr	w0, [sp, #4]
    103c:	ff 43 00 91 	add	sp, sp, #16
    1040:	c0 03 5f d6 	ret
    1044:	1f 20 03 d5 	nop

strcpy:
    1048:	ff 83 00 d1 	sub	sp, sp, #32
    104c:	e0 0f 00 f9 	str	x0, [sp, #24]
    1050:	e1 0b 00 f9 	str	x1, [sp, #16]
    1054:	e0 0f 40 f9 	ldr	x0, [sp, #24]
    1058:	e0 07 00 f9 	str	x0, [sp, #8]
    105c:	08 00 80 52 	mov	w8, #0
    1060:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    1064:	2a 01 40 39 	ldrb	w10, [x9]
    1068:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    106c:	2a 01 00 39 	strb	w10, [x9]
    1070:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    1074:	2a 01 40 39 	ldrb	w10, [x9]
    1078:	eb 1f 00 32 	orr	w11, wzr, #0xff
    107c:	08 01 0b 0a 	and	w8, w8, w11
    1080:	5f 01 08 6b 	cmp	w10, w8
    1084:	e8 07 9f 1a 	cset	w8, ne
    1088:	48 00 00 37 	tbnz	w8, #0, #8
    108c:	09 00 00 14 	b	#36
    1090:	e8 03 40 b2 	orr	x8, xzr, #0x1
    1094:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    1098:	29 01 08 8b 	add	x9, x9, x8
    109c:	e9 0f 00 f9 	str	x9, [sp, #24]
    10a0:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    10a4:	28 01 08 8b 	add	x8, x9, x8
    10a8:	e8 0b 00 f9 	str	x8, [sp, #16]
    10ac:	ec ff ff 17 	b	#-80
    10b0:	e0 07 40 f9 	ldr	x0, [sp, #8]
    10b4:	ff 83 00 91 	add	sp, sp, #32
    10b8:	c0 03 5f d6 	ret
    10bc:	1f 20 03 d5 	nop

strcmp:
    10c0:	ff 83 00 d1 	sub	sp, sp, #32
    10c4:	e0 0b 00 f9 	str	x0, [sp, #16]
    10c8:	e1 07 00 f9 	str	x1, [sp, #8]
    10cc:	08 00 80 12 	mov	w8, #-1
    10d0:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    10d4:	2a 01 40 39 	ldrb	w10, [x9]
    10d8:	e8 07 00 b9 	str	w8, [sp, #4]
    10dc:	ea 00 00 35 	cbnz	w10, #28
    10e0:	08 00 80 52 	mov	w8, #0
    10e4:	e9 07 40 f9 	ldr	x9, [sp, #8]
    10e8:	2a 01 40 39 	ldrb	w10, [x9]
    10ec:	5f 01 08 6b 	cmp	w10, w8
    10f0:	e8 07 9f 1a 	cset	w8, ne
    10f4:	e8 07 00 b9 	str	w8, [sp, #4]
    10f8:	e8 07 40 b9 	ldr	w8, [sp, #4]
    10fc:	48 00 00 37 	tbnz	w8, #0, #8
    1100:	1d 00 00 14 	b	#116
    1104:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    1108:	09 01 40 39 	ldrb	w9, [x8]
    110c:	e8 07 40 f9 	ldr	x8, [sp, #8]
    1110:	0a 01 40 39 	ldrb	w10, [x8]
    1114:	3f 01 0a 6b 	cmp	w9, w10
    1118:	e9 07 9f 1a 	cset	w9, ne
    111c:	49 00 00 37 	tbnz	w9, #0, #8
    1120:	0d 00 00 14 	b	#52
    1124:	08 00 80 12 	mov	w8, #-1
    1128:	e9 03 00 32 	orr	w9, wzr, #0x1
    112c:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    1130:	4b 01 40 39 	ldrb	w11, [x10]
    1134:	ea 07 40 f9 	ldr	x10, [sp, #8]
    1138:	4c 01 40 39 	ldrb	w12, [x10]
    113c:	7f 01 0c 6b 	cmp	w11, w12
    1140:	eb d7 9f 1a 	cset	w11, gt
    1144:	7f 01 00 72 	tst	w11, #0x1
    1148:	28 11 88 1a 	csel	w8, w9, w8, ne
    114c:	e8 1f 00 b9 	str	w8, [sp, #28]
    1150:	0a 00 00 14 	b	#40
    1154:	e8 03 40 b2 	orr	x8, xzr, #0x1
    1158:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    115c:	29 01 08 8b 	add	x9, x9, x8
    1160:	e9 0b 00 f9 	str	x9, [sp, #16]
    1164:	e9 07 40 f9 	ldr	x9, [sp, #8]
    1168:	28 01 08 8b 	add	x8, x9, x8
    116c:	e8 07 00 f9 	str	x8, [sp, #8]
    1170:	d7 ff ff 17 	b	#-164
    1174:	ff 1f 00 b9 	str	wzr, [sp, #28]
    1178:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    117c:	ff 83 00 91 	add	sp, sp, #32
    1180:	c0 03 5f d6 	ret
    1184:	1f 20 03 d5 	nop

strncmp:
    1188:	ff 83 00 d1 	sub	sp, sp, #32
    118c:	e0 0b 00 f9 	str	x0, [sp, #16]
    1190:	e1 07 00 f9 	str	x1, [sp, #8]
    1194:	e2 07 00 b9 	str	w2, [sp, #4]
    1198:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    119c:	09 01 40 39 	ldrb	w9, [x8]
    11a0:	e9 00 00 35 	cbnz	w9, #28
    11a4:	08 00 80 52 	mov	w8, #0
    11a8:	e9 07 40 f9 	ldr	x9, [sp, #8]
    11ac:	2a 01 40 39 	ldrb	w10, [x9]
    11b0:	e8 03 00 b9 	str	w8, [sp]
    11b4:	4a 00 00 35 	cbnz	w10, #8
    11b8:	06 00 00 14 	b	#24
    11bc:	08 00 80 52 	mov	w8, #0
    11c0:	e9 07 40 b9 	ldr	w9, [sp, #4]
    11c4:	3f 01 08 6b 	cmp	w9, w8
    11c8:	e8 d7 9f 1a 	cset	w8, gt
    11cc:	e8 03 00 b9 	str	w8, [sp]
    11d0:	e8 03 40 b9 	ldr	w8, [sp]
    11d4:	48 00 00 37 	tbnz	w8, #0, #8
    11d8:	21 00 00 14 	b	#132
    11dc:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    11e0:	09 01 40 39 	ldrb	w9, [x8]
    11e4:	e8 07 40 f9 	ldr	x8, [sp, #8]
    11e8:	0a 01 40 39 	ldrb	w10, [x8]
    11ec:	3f 01 0a 6b 	cmp	w9, w10
    11f0:	e9 07 9f 1a 	cset	w9, ne
    11f4:	49 00 00 37 	tbnz	w9, #0, #8
    11f8:	0d 00 00 14 	b	#52
    11fc:	08 00 80 12 	mov	w8, #-1
    1200:	e9 03 00 32 	orr	w9, wzr, #0x1
    1204:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    1208:	4b 01 40 39 	ldrb	w11, [x10]
    120c:	ea 07 40 f9 	ldr	x10, [sp, #8]
    1210:	4c 01 40 39 	ldrb	w12, [x10]
    1214:	7f 01 0c 6b 	cmp	w11, w12
    1218:	eb d7 9f 1a 	cset	w11, gt
    121c:	7f 01 00 72 	tst	w11, #0x1
    1220:	28 11 88 1a 	csel	w8, w9, w8, ne
    1224:	e8 1f 00 b9 	str	w8, [sp, #28]
    1228:	0e 00 00 14 	b	#56
    122c:	e8 03 40 b2 	orr	x8, xzr, #0x1
    1230:	09 00 80 12 	mov	w9, #-1
    1234:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    1238:	4a 01 08 8b 	add	x10, x10, x8
    123c:	ea 0b 00 f9 	str	x10, [sp, #16]
    1240:	ea 07 40 f9 	ldr	x10, [sp, #8]
    1244:	48 01 08 8b 	add	x8, x10, x8
    1248:	e8 07 00 f9 	str	x8, [sp, #8]
    124c:	eb 07 40 b9 	ldr	w11, [sp, #4]
    1250:	69 01 09 0b 	add	w9, w11, w9
    1254:	e9 07 00 b9 	str	w9, [sp, #4]
    1258:	d0 ff ff 17 	b	#-192
    125c:	ff 1f 00 b9 	str	wzr, [sp, #28]
    1260:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    1264:	ff 83 00 91 	add	sp, sp, #32
    1268:	c0 03 5f d6 	ret
    126c:	1f 20 03 d5 	nop

putc:
    1270:	ff 83 00 d1 	sub	sp, sp, #32
    1274:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    1278:	fd 43 00 91 	add	x29, sp, #16
    127c:	48 01 80 52 	mov	w8, #10
    1280:	a0 f3 1f 38 	sturb	w0, [x29, #-1]
    1284:	a0 f3 5f 38 	ldurb	w0, [x29, #-1]
    1288:	1f 00 08 6b 	cmp	w0, w8
    128c:	e8 17 9f 1a 	cset	w8, eq
    1290:	48 00 00 37 	tbnz	w8, #0, #8
    1294:	05 00 00 14 	b	#20
    1298:	a8 01 80 52 	mov	w8, #13
    129c:	e0 03 00 32 	orr	w0, wzr, #0x1
    12a0:	e1 03 08 2a 	mov	w1, w8
    12a4:	f7 00 00 94 	bl	#988
    12a8:	e0 03 00 32 	orr	w0, wzr, #0x1
    12ac:	a8 f3 5f 38 	ldurb	w8, [x29, #-1]
    12b0:	e1 03 08 2a 	mov	w1, w8
    12b4:	f3 00 00 94 	bl	#972
    12b8:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    12bc:	ff 83 00 91 	add	sp, sp, #32
    12c0:	c0 03 5f d6 	ret
    12c4:	1f 20 03 d5 	nop

getc:
    12c8:	ff 83 00 d1 	sub	sp, sp, #32
    12cc:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    12d0:	fd 43 00 91 	add	x29, sp, #16
    12d4:	e0 03 00 32 	orr	w0, wzr, #0x1
    12d8:	a8 01 80 52 	mov	w8, #13
    12dc:	e8 0b 00 b9 	str	w8, [sp, #8]
    12e0:	12 01 00 94 	bl	#1096
    12e4:	a0 f3 1f 38 	sturb	w0, [x29, #-1]
    12e8:	a8 f3 5f 38 	ldurb	w8, [x29, #-1]
    12ec:	e0 0b 40 b9 	ldr	w0, [sp, #8]
    12f0:	1f 01 00 6b 	cmp	w8, w0
    12f4:	e8 17 9f 1a 	cset	w8, eq
    12f8:	48 00 00 37 	tbnz	w8, #0, #8
    12fc:	04 00 00 14 	b	#16
    1300:	48 01 80 52 	mov	w8, #10
    1304:	e8 07 00 b9 	str	w8, [sp, #4]
    1308:	03 00 00 14 	b	#12
    130c:	a8 f3 5f 38 	ldurb	w8, [x29, #-1]
    1310:	e8 07 00 b9 	str	w8, [sp, #4]
    1314:	e8 07 40 b9 	ldr	w8, [sp, #4]
    1318:	a8 f3 1f 38 	sturb	w8, [x29, #-1]
    131c:	a8 f3 5f 38 	ldurb	w8, [x29, #-1]
    1320:	e0 03 08 2a 	mov	w0, w8
    1324:	d3 ff ff 97 	bl	#-180
    1328:	a8 f3 5f 38 	ldurb	w8, [x29, #-1]
    132c:	e0 03 08 2a 	mov	w0, w8
    1330:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    1334:	ff 83 00 91 	add	sp, sp, #32
    1338:	c0 03 5f d6 	ret
    133c:	1f 20 03 d5 	nop

puts:
    1340:	ff 83 00 d1 	sub	sp, sp, #32
    1344:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    1348:	fd 43 00 91 	add	x29, sp, #16
    134c:	e8 03 6c b2 	orr	x8, xzr, #0x100000
    1350:	09 00 80 52 	mov	w9, #0
    1354:	e0 07 00 f9 	str	x0, [sp, #8]
    1358:	e1 07 40 f9 	ldr	x1, [sp, #8]
    135c:	e0 03 08 aa 	mov	x0, x8
    1360:	e9 07 00 b9 	str	w9, [sp, #4]
    1364:	39 ff ff 97 	bl	#-796
    1368:	02 00 00 d4 	hvc	#0
    136c:	e9 07 40 b9 	ldr	w9, [sp, #4]
    1370:	e0 03 09 2a 	mov	w0, w9
    1374:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    1378:	ff 83 00 91 	add	sp, sp, #32
    137c:	c0 03 5f d6 	ret

gets:
    1380:	ff c3 00 d1 	sub	sp, sp, #48
    1384:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    1388:	fd 83 00 91 	add	x29, sp, #32
    138c:	08 00 80 52 	mov	w8, #0
    1390:	a0 83 1f f8 	stur	x0, [x29, #-8]
    1394:	bf 43 1f b8 	stur	wzr, [x29, #-12]
    1398:	e8 0f 00 b9 	str	w8, [sp, #12]
    139c:	48 01 80 52 	mov	w8, #10
    13a0:	e8 0b 00 b9 	str	w8, [sp, #8]
    13a4:	c9 ff ff 97 	bl	#-220
    13a8:	a0 33 1f 38 	sturb	w0, [x29, #-13]
    13ac:	a8 33 5f 38 	ldurb	w8, [x29, #-13]
    13b0:	e0 0b 40 b9 	ldr	w0, [sp, #8]
    13b4:	1f 01 00 6b 	cmp	w8, w0
    13b8:	e8 17 9f 1a 	cset	w8, eq
    13bc:	48 00 00 37 	tbnz	w8, #0, #8
    13c0:	03 00 00 14 	b	#12
    13c4:	e8 0f 40 b9 	ldr	w8, [sp, #12]
    13c8:	a8 33 1f 38 	sturb	w8, [x29, #-13]
    13cc:	e8 03 40 b2 	orr	x8, xzr, #0x1
    13d0:	a9 33 5f 38 	ldurb	w9, [x29, #-13]
    13d4:	aa 83 5f f8 	ldur	x10, [x29, #-8]
    13d8:	ab 43 5f b8 	ldur	w11, [x29, #-12]
    13dc:	6c 05 00 11 	add	w12, w11, #1
    13e0:	ac 43 1f b8 	stur	w12, [x29, #-12]
    13e4:	ed 03 0b 2a 	mov	w13, w11
    13e8:	ad 7d 40 93 	sxtw	x13, w13
    13ec:	08 7d 0d 9b 	mul	x8, x8, x13
    13f0:	48 01 08 8b 	add	x8, x10, x8
    13f4:	09 01 00 39 	strb	w9, [x8]
    13f8:	08 00 80 52 	mov	w8, #0
    13fc:	a9 33 5f 38 	ldurb	w9, [x29, #-13]
    1400:	ea 1f 00 32 	orr	w10, wzr, #0xff
    1404:	08 01 0a 0a 	and	w8, w8, w10
    1408:	3f 01 08 6b 	cmp	w9, w8
    140c:	e8 07 9f 1a 	cset	w8, ne
    1410:	68 fc 07 37 	tbnz	w8, #0, #-116
    1414:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    1418:	00 05 00 71 	subs	w0, w8, #1
    141c:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    1420:	ff c3 00 91 	add	sp, sp, #48
    1424:	c0 03 5f d6 	ret

putxval:
    1428:	ff 43 01 d1 	sub	sp, sp, #80
    142c:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    1430:	fd 03 01 91 	add	x29, sp, #64
    1434:	68 01 80 d2 	mov	x8, #11
    1438:	09 00 80 92 	mov	x9, #-1
    143c:	0a 00 80 52 	mov	w10, #0
    1440:	eb 03 1b 32 	orr	w11, wzr, #0x20
    1444:	0c 00 00 d0 	adrp	x12, #8192
    1448:	8c d9 3d 91 	add	x12, x12, #3958
    144c:	ed 0f 1d 32 	orr	w13, wzr, #0x78
    1450:	ee 07 1c 32 	orr	w14, wzr, #0x30
    1454:	af 5f 00 d1 	sub	x15, x29, #23
    1458:	a0 83 1f f8 	stur	x0, [x29, #-8]
    145c:	a1 43 1f b8 	stur	w1, [x29, #-12]
    1460:	e8 01 08 8b 	add	x8, x15, x8
    1464:	08 01 09 8b 	add	x8, x8, x9
    1468:	e8 13 00 f9 	str	x8, [sp, #32]
    146c:	e8 13 40 f9 	ldr	x8, [sp, #32]
    1470:	0f 01 09 8b 	add	x15, x8, x9
    1474:	ef 13 00 f9 	str	x15, [sp, #32]
    1478:	0a 01 00 39 	strb	w10, [x8]
    147c:	e8 13 40 f9 	ldr	x8, [sp, #32]
    1480:	09 01 09 8b 	add	x9, x8, x9
    1484:	e9 13 00 f9 	str	x9, [sp, #32]
    1488:	0b 01 00 39 	strb	w11, [x8]
    148c:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    1490:	ed 1f 00 b9 	str	w13, [sp, #28]
    1494:	ee 1b 00 b9 	str	w14, [sp, #24]
    1498:	ec 0b 00 f9 	str	x12, [sp, #16]
    149c:	c8 00 00 b5 	cbnz	x8, #24
    14a0:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    14a4:	88 00 00 35 	cbnz	w8, #16
    14a8:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    14ac:	08 05 00 11 	add	w8, w8, #1
    14b0:	a8 43 1f b8 	stur	w8, [x29, #-12]
    14b4:	08 00 80 12 	mov	w8, #-1
    14b8:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    14bc:	e8 0f 00 b9 	str	w8, [sp, #12]
    14c0:	c9 00 00 b5 	cbnz	x9, #24
    14c4:	08 00 80 52 	mov	w8, #0
    14c8:	a9 43 5f b8 	ldur	w9, [x29, #-12]
    14cc:	3f 01 08 6b 	cmp	w9, w8
    14d0:	e8 07 9f 1a 	cset	w8, ne
    14d4:	e8 0f 00 b9 	str	w8, [sp, #12]
    14d8:	e8 0f 40 b9 	ldr	w8, [sp, #12]
    14dc:	48 00 00 37 	tbnz	w8, #0, #8
    14e0:	19 00 00 14 	b	#100
    14e4:	e8 03 40 b2 	orr	x8, xzr, #0x1
    14e8:	e9 0f 40 b2 	orr	x9, xzr, #0xf
    14ec:	0a 00 80 92 	mov	x10, #-1
    14f0:	ab 83 5f f8 	ldur	x11, [x29, #-8]
    14f4:	69 01 09 8a 	and	x9, x11, x9
    14f8:	08 7d 09 9b 	mul	x8, x8, x9
    14fc:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    1500:	28 01 08 8b 	add	x8, x9, x8
    1504:	0c 01 40 39 	ldrb	w12, [x8]
    1508:	e8 13 40 f9 	ldr	x8, [sp, #32]
    150c:	0a 01 0a 8b 	add	x10, x8, x10
    1510:	ea 13 00 f9 	str	x10, [sp, #32]
    1514:	0c 01 00 39 	strb	w12, [x8]
    1518:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    151c:	08 fd 44 d3 	lsr	x8, x8, #4
    1520:	a8 83 1f f8 	stur	x8, [x29, #-8]
    1524:	ac 43 5f b8 	ldur	w12, [x29, #-12]
    1528:	4c 00 00 35 	cbnz	w12, #8
    152c:	05 00 00 14 	b	#20
    1530:	08 00 80 12 	mov	w8, #-1
    1534:	a9 43 5f b8 	ldur	w9, [x29, #-12]
    1538:	28 01 08 0b 	add	w8, w9, w8
    153c:	a8 43 1f b8 	stur	w8, [x29, #-12]
    1540:	dd ff ff 17 	b	#-140
    1544:	e8 03 40 b2 	orr	x8, xzr, #0x1
    1548:	00 00 80 52 	mov	w0, #0
    154c:	09 00 80 92 	mov	x9, #-1
    1550:	ea 13 40 f9 	ldr	x10, [sp, #32]
    1554:	4b 01 09 8b 	add	x11, x10, x9
    1558:	eb 13 00 f9 	str	x11, [sp, #32]
    155c:	ec 1f 40 b9 	ldr	w12, [sp, #28]
    1560:	4c 01 00 39 	strb	w12, [x10]
    1564:	ea 13 40 f9 	ldr	x10, [sp, #32]
    1568:	49 01 09 8b 	add	x9, x10, x9
    156c:	e9 13 00 f9 	str	x9, [sp, #32]
    1570:	ed 1b 40 b9 	ldr	w13, [sp, #24]
    1574:	4d 01 00 39 	strb	w13, [x10]
    1578:	e9 13 40 f9 	ldr	x9, [sp, #32]
    157c:	28 01 08 8b 	add	x8, x9, x8
    1580:	e0 0b 00 b9 	str	w0, [sp, #8]
    1584:	e0 03 08 aa 	mov	x0, x8
    1588:	6e ff ff 97 	bl	#-584
    158c:	ec 0b 40 b9 	ldr	w12, [sp, #8]
    1590:	e0 03 0c 2a 	mov	w0, w12
    1594:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    1598:	ff 43 01 91 	add	sp, sp, #80
    159c:	c0 03 5f d6 	ret

serial_init:
    15a0:	ff 03 01 d1 	sub	sp, sp, #64
    15a4:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    15a8:	fd c3 00 91 	add	x29, sp, #48
    15ac:	08 08 8a d2 	mov	x8, #20544
    15b0:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    15b4:	e9 1f 40 b2 	orr	x9, xzr, #0xff
    15b8:	aa 03 80 52 	mov	w10, #29
    15bc:	eb 03 40 b2 	orr	x11, xzr, #0x1
    15c0:	8c 00 8a d2 	mov	x12, #20484
    15c4:	2c e4 a7 f2 	movk	x12, #16161, lsl #16
    15c8:	0d 00 80 52 	mov	w13, #0
    15cc:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    15d0:	08 01 40 f9 	ldr	x8, [x8]
    15d4:	08 01 09 8a 	and	x8, x8, x9
    15d8:	e0 03 08 2a 	mov	w0, w8
    15dc:	a0 b3 1f 38 	sturb	w0, [x29, #-5]
    15e0:	e0 03 0a 2a 	mov	w0, w10
    15e4:	ad 43 1f b8 	stur	w13, [x29, #-12]
    15e8:	ec 0f 00 f9 	str	x12, [sp, #24]
    15ec:	eb 0b 00 f9 	str	x11, [sp, #16]
    15f0:	ea 0f 00 b9 	str	w10, [sp, #12]
    15f4:	bf 00 00 94 	bl	#764
    15f8:	ea 0f 40 b9 	ldr	w10, [sp, #12]
    15fc:	e0 03 0a 2a 	mov	w0, w10
    1600:	56 01 00 94 	bl	#1368
    1604:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    1608:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    160c:	28 01 00 f9 	str	x8, [x9]
    1610:	a0 43 5f b8 	ldur	w0, [x29, #-12]
    1614:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    1618:	ff 03 01 91 	add	sp, sp, #64
    161c:	c0 03 5f d6 	ret

serial_is_send_enable:
    1620:	ff 43 00 d1 	sub	sp, sp, #16
    1624:	88 0a 8a d2 	mov	x8, #20564
    1628:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    162c:	e9 03 7a b2 	orr	x9, xzr, #0x40
    1630:	0a 00 80 12 	mov	w10, #-1
    1634:	e0 0f 00 b9 	str	w0, [sp, #12]
    1638:	0b 01 40 f9 	ldr	x11, [x8]
    163c:	69 01 09 8a 	and	x9, x11, x9
    1640:	ea 0b 00 b9 	str	w10, [sp, #8]
    1644:	e8 03 00 f9 	str	x8, [sp]
    1648:	29 01 00 b5 	cbnz	x9, #36
    164c:	e8 03 7b b2 	orr	x8, xzr, #0x20
    1650:	09 00 80 d2 	mov	x9, #0
    1654:	ea 03 40 f9 	ldr	x10, [sp]
    1658:	4b 01 40 f9 	ldr	x11, [x10]
    165c:	68 01 08 8a 	and	x8, x11, x8
    1660:	1f 01 09 eb 	cmp	x8, x9
    1664:	ec 07 9f 1a 	cset	w12, ne
    1668:	ec 0b 00 b9 	str	w12, [sp, #8]
    166c:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    1670:	e9 03 00 32 	orr	w9, wzr, #0x1
    1674:	00 01 09 0a 	and	w0, w8, w9
    1678:	ff 43 00 91 	add	sp, sp, #16
    167c:	c0 03 5f d6 	ret

serial_send_byte:
    1680:	ff c3 00 d1 	sub	sp, sp, #48
    1684:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    1688:	fd 83 00 91 	add	x29, sp, #32
    168c:	08 08 8a d2 	mov	x8, #20544
    1690:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    1694:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    1698:	a1 b3 1f 38 	sturb	w1, [x29, #-5]
    169c:	e8 0b 00 f9 	str	x8, [sp, #16]
    16a0:	08 00 80 12 	mov	w8, #-1
    16a4:	09 00 80 52 	mov	w9, #0
    16a8:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    16ac:	e8 0f 00 b9 	str	w8, [sp, #12]
    16b0:	e9 0b 00 b9 	str	w9, [sp, #8]
    16b4:	db ff ff 97 	bl	#-148
    16b8:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    16bc:	1f 00 08 6b 	cmp	w0, w8
    16c0:	e9 07 9f 1a 	cset	w9, ne
    16c4:	e0 0f 40 b9 	ldr	w0, [sp, #12]
    16c8:	29 01 00 4a 	eor	w9, w9, w0
    16cc:	49 00 00 37 	tbnz	w9, #0, #8
    16d0:	02 00 00 14 	b	#8
    16d4:	f3 ff ff 17 	b	#-52
    16d8:	00 00 80 52 	mov	w0, #0
    16dc:	a8 b3 5f 38 	ldurb	w8, [x29, #-5]
    16e0:	e9 03 08 2a 	mov	w9, w8
    16e4:	29 7d 40 d3 	ubfx	x9, x9, #0, #32
    16e8:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    16ec:	49 01 00 f9 	str	x9, [x10]
    16f0:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    16f4:	ff c3 00 91 	add	sp, sp, #48
    16f8:	c0 03 5f d6 	ret
    16fc:	1f 20 03 d5 	nop

serial_is_recv_enable:
    1700:	ff 43 00 d1 	sub	sp, sp, #16
    1704:	88 0a 8a d2 	mov	x8, #20564
    1708:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    170c:	e9 03 40 b2 	orr	x9, xzr, #0x1
    1710:	e0 0f 00 b9 	str	w0, [sp, #12]
    1714:	08 01 40 f9 	ldr	x8, [x8]
    1718:	08 01 09 8a 	and	x8, x8, x9
    171c:	e0 03 08 2a 	mov	w0, w8
    1720:	ff 43 00 91 	add	sp, sp, #16
    1724:	c0 03 5f d6 	ret

serial_recv_byte:
    1728:	ff c3 00 d1 	sub	sp, sp, #48
    172c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    1730:	fd 83 00 91 	add	x29, sp, #32
    1734:	08 08 8a d2 	mov	x8, #20544
    1738:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    173c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    1740:	e8 0b 00 f9 	str	x8, [sp, #16]
    1744:	08 00 80 12 	mov	w8, #-1
    1748:	09 00 80 52 	mov	w9, #0
    174c:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    1750:	e8 0f 00 b9 	str	w8, [sp, #12]
    1754:	e9 0b 00 b9 	str	w9, [sp, #8]
    1758:	ea ff ff 97 	bl	#-88
    175c:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    1760:	1f 00 08 6b 	cmp	w0, w8
    1764:	e9 07 9f 1a 	cset	w9, ne
    1768:	e0 0f 40 b9 	ldr	w0, [sp, #12]
    176c:	29 01 00 4a 	eor	w9, w9, w0
    1770:	49 00 00 37 	tbnz	w9, #0, #8
    1774:	02 00 00 14 	b	#8
    1778:	f3 ff ff 17 	b	#-52
    177c:	e8 1f 40 b2 	orr	x8, xzr, #0xff
    1780:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    1784:	2a 01 40 f9 	ldr	x10, [x9]
    1788:	48 01 08 8a 	and	x8, x10, x8
    178c:	eb 03 08 2a 	mov	w11, w8
    1790:	e0 03 0b 2a 	mov	w0, w11
    1794:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    1798:	ff c3 00 91 	add	sp, sp, #48
    179c:	c0 03 5f d6 	ret

serial_intr_is_send_enable:
    17a0:	ff 43 00 d1 	sub	sp, sp, #16
    17a4:	88 08 8a d2 	mov	x8, #20548
    17a8:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    17ac:	e9 03 7f b2 	orr	x9, xzr, #0x2
    17b0:	0a 00 80 d2 	mov	x10, #0
    17b4:	eb 03 00 32 	orr	w11, wzr, #0x1
    17b8:	0c 00 80 52 	mov	w12, #0
    17bc:	e0 0f 00 b9 	str	w0, [sp, #12]
    17c0:	08 01 40 f9 	ldr	x8, [x8]
    17c4:	08 01 09 8a 	and	x8, x8, x9
    17c8:	1f 01 0a eb 	cmp	x8, x10
    17cc:	e0 07 9f 1a 	cset	w0, ne
    17d0:	1f 00 00 72 	tst	w0, #0x1
    17d4:	60 11 8c 1a 	csel	w0, w11, w12, ne
    17d8:	ff 43 00 91 	add	sp, sp, #16
    17dc:	c0 03 5f d6 	ret

serial_intr_send_enable:
    17e0:	ff 43 00 d1 	sub	sp, sp, #16
    17e4:	88 08 8a d2 	mov	x8, #20548
    17e8:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    17ec:	e9 03 7f b2 	orr	x9, xzr, #0x2
    17f0:	e0 0f 00 b9 	str	w0, [sp, #12]
    17f4:	0a 01 40 f9 	ldr	x10, [x8]
    17f8:	49 01 09 aa 	orr	x9, x10, x9
    17fc:	09 01 00 f9 	str	x9, [x8]
    1800:	ff 43 00 91 	add	sp, sp, #16
    1804:	c0 03 5f d6 	ret

serial_intr_send_disable:
    1808:	ff 43 00 d1 	sub	sp, sp, #16
    180c:	88 08 8a d2 	mov	x8, #20548
    1810:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    1814:	e9 fb 7e b2 	orr	x9, xzr, #0xfffffffffffffffd
    1818:	e0 0f 00 b9 	str	w0, [sp, #12]
    181c:	0a 01 40 f9 	ldr	x10, [x8]
    1820:	49 01 09 8a 	and	x9, x10, x9
    1824:	09 01 00 f9 	str	x9, [x8]
    1828:	ff 43 00 91 	add	sp, sp, #16
    182c:	c0 03 5f d6 	ret

serial_intr_is_recv_enable:
    1830:	ff 43 00 d1 	sub	sp, sp, #16
    1834:	88 08 8a d2 	mov	x8, #20548
    1838:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    183c:	e9 03 40 b2 	orr	x9, xzr, #0x1
    1840:	0a 00 80 d2 	mov	x10, #0
    1844:	eb 03 00 32 	orr	w11, wzr, #0x1
    1848:	0c 00 80 52 	mov	w12, #0
    184c:	e0 0f 00 b9 	str	w0, [sp, #12]
    1850:	08 01 40 f9 	ldr	x8, [x8]
    1854:	08 01 09 8a 	and	x8, x8, x9
    1858:	1f 01 0a eb 	cmp	x8, x10
    185c:	e0 07 9f 1a 	cset	w0, ne
    1860:	1f 00 00 72 	tst	w0, #0x1
    1864:	60 11 8c 1a 	csel	w0, w11, w12, ne
    1868:	ff 43 00 91 	add	sp, sp, #16
    186c:	c0 03 5f d6 	ret

serial_intr_recv_enable:
    1870:	ff 43 00 d1 	sub	sp, sp, #16
    1874:	88 08 8a d2 	mov	x8, #20548
    1878:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    187c:	e9 03 40 b2 	orr	x9, xzr, #0x1
    1880:	e0 0f 00 b9 	str	w0, [sp, #12]
    1884:	0a 01 40 f9 	ldr	x10, [x8]
    1888:	49 01 09 aa 	orr	x9, x10, x9
    188c:	09 01 00 f9 	str	x9, [x8]
    1890:	ff 43 00 91 	add	sp, sp, #16
    1894:	c0 03 5f d6 	ret

serial_intr_recv_disable:
    1898:	ff 43 00 d1 	sub	sp, sp, #16
    189c:	88 08 8a d2 	mov	x8, #20548
    18a0:	28 e4 a7 f2 	movk	x8, #16161, lsl #16
    18a4:	e9 fb 7f b2 	orr	x9, xzr, #0xfffffffffffffffe
    18a8:	e0 0f 00 b9 	str	w0, [sp, #12]
    18ac:	0a 01 40 f9 	ldr	x10, [x8]
    18b0:	49 01 09 8a 	and	x9, x10, x9
    18b4:	09 01 00 f9 	str	x9, [x8]
    18b8:	ff 43 00 91 	add	sp, sp, #16
    18bc:	c0 03 5f d6 	ret

irq_init:
    18c0:	e8 3f 40 b2 	orr	x8, xzr, #0xffff
    18c4:	89 44 96 d2 	mov	x9, #45604
    18c8:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    18cc:	8a 43 96 d2 	mov	x10, #45596
    18d0:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    18d4:	0b 44 96 d2 	mov	x11, #45600
    18d8:	0b e0 a7 f2 	movk	x11, #16128, lsl #16
    18dc:	28 01 00 f9 	str	x8, [x9]
    18e0:	48 01 00 f9 	str	x8, [x10]
    18e4:	68 01 00 f9 	str	x8, [x11]
    18e8:	c0 03 5f d6 	ret
    18ec:	1f 20 03 d5 	nop

irq_is_pending:
    18f0:	ff 83 00 d1 	sub	sp, sp, #32
    18f4:	e8 03 1b 32 	orr	w8, wzr, #0x20
    18f8:	89 40 96 d2 	mov	x9, #45572
    18fc:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    1900:	0a 41 96 d2 	mov	x10, #45576
    1904:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    1908:	e0 1b 00 b9 	str	w0, [sp, #24]
    190c:	e0 1b 40 b9 	ldr	w0, [sp, #24]
    1910:	1f 00 08 6b 	cmp	w0, w8
    1914:	e8 a7 9f 1a 	cset	w8, lt
    1918:	ea 0b 00 f9 	str	x10, [sp, #16]
    191c:	e9 07 00 f9 	str	x9, [sp, #8]
    1920:	48 00 00 37 	tbnz	w8, #0, #8
    1924:	11 00 00 14 	b	#68
    1928:	08 00 80 52 	mov	w8, #0
    192c:	09 00 80 d2 	mov	x9, #0
    1930:	ea 03 00 32 	orr	w10, wzr, #0x1
    1934:	eb 07 40 f9 	ldr	x11, [sp, #8]
    1938:	6c 01 40 f9 	ldr	x12, [x11]
    193c:	ed 1b 40 b9 	ldr	w13, [sp, #24]
    1940:	4d 21 cd 1a 	lsl	w13, w10, w13
    1944:	ee 03 0d 2a 	mov	w14, w13
    1948:	ce 7d 40 93 	sxtw	x14, w14
    194c:	8c 01 0e 8a 	and	x12, x12, x14
    1950:	9f 01 09 eb 	cmp	x12, x9
    1954:	ed 07 9f 1a 	cset	w13, ne
    1958:	bf 01 00 72 	tst	w13, #0x1
    195c:	48 11 88 1a 	csel	w8, w10, w8, ne
    1960:	e8 1f 00 b9 	str	w8, [sp, #28]
    1964:	18 00 00 14 	b	#96
    1968:	e8 03 1a 32 	orr	w8, wzr, #0x40
    196c:	e9 1b 40 b9 	ldr	w9, [sp, #24]
    1970:	3f 01 08 6b 	cmp	w9, w8
    1974:	e8 a7 9f 1a 	cset	w8, lt
    1978:	48 00 00 37 	tbnz	w8, #0, #8
    197c:	12 00 00 14 	b	#72
    1980:	08 00 80 52 	mov	w8, #0
    1984:	09 00 80 d2 	mov	x9, #0
    1988:	ea 03 00 32 	orr	w10, wzr, #0x1
    198c:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    1990:	6c 01 40 f9 	ldr	x12, [x11]
    1994:	ed 1b 40 b9 	ldr	w13, [sp, #24]
    1998:	ad 81 00 71 	subs	w13, w13, #32
    199c:	4d 21 cd 1a 	lsl	w13, w10, w13
    19a0:	ee 03 0d 2a 	mov	w14, w13
    19a4:	ce 7d 40 93 	sxtw	x14, w14
    19a8:	8c 01 0e 8a 	and	x12, x12, x14
    19ac:	9f 01 09 eb 	cmp	x12, x9
    19b0:	ed 07 9f 1a 	cset	w13, ne
    19b4:	bf 01 00 72 	tst	w13, #0x1
    19b8:	48 11 88 1a 	csel	w8, w10, w8, ne
    19bc:	e8 1f 00 b9 	str	w8, [sp, #28]
    19c0:	01 00 00 14 	b	#4
    19c4:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    19c8:	ff 83 00 91 	add	sp, sp, #32
    19cc:	c0 03 5f d6 	ret

irq_is_enable:
    19d0:	ff 83 00 d1 	sub	sp, sp, #32
    19d4:	e8 03 1b 32 	orr	w8, wzr, #0x20
    19d8:	89 43 96 d2 	mov	x9, #45596
    19dc:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    19e0:	0a 44 96 d2 	mov	x10, #45600
    19e4:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    19e8:	e0 1b 00 b9 	str	w0, [sp, #24]
    19ec:	e0 1b 40 b9 	ldr	w0, [sp, #24]
    19f0:	1f 00 08 6b 	cmp	w0, w8
    19f4:	e8 a7 9f 1a 	cset	w8, lt
    19f8:	ea 0b 00 f9 	str	x10, [sp, #16]
    19fc:	e9 07 00 f9 	str	x9, [sp, #8]
    1a00:	48 00 00 37 	tbnz	w8, #0, #8
    1a04:	11 00 00 14 	b	#68
    1a08:	08 00 80 52 	mov	w8, #0
    1a0c:	09 00 80 d2 	mov	x9, #0
    1a10:	ea 03 00 32 	orr	w10, wzr, #0x1
    1a14:	eb 07 40 f9 	ldr	x11, [sp, #8]
    1a18:	6c 01 40 f9 	ldr	x12, [x11]
    1a1c:	ed 1b 40 b9 	ldr	w13, [sp, #24]
    1a20:	4d 21 cd 1a 	lsl	w13, w10, w13
    1a24:	ee 03 0d 2a 	mov	w14, w13
    1a28:	ce 7d 40 93 	sxtw	x14, w14
    1a2c:	8c 01 0e 8a 	and	x12, x12, x14
    1a30:	9f 01 09 eb 	cmp	x12, x9
    1a34:	ed 07 9f 1a 	cset	w13, ne
    1a38:	bf 01 00 72 	tst	w13, #0x1
    1a3c:	48 11 88 1a 	csel	w8, w10, w8, ne
    1a40:	e8 1f 00 b9 	str	w8, [sp, #28]
    1a44:	18 00 00 14 	b	#96
    1a48:	e8 03 1a 32 	orr	w8, wzr, #0x40
    1a4c:	e9 1b 40 b9 	ldr	w9, [sp, #24]
    1a50:	3f 01 08 6b 	cmp	w9, w8
    1a54:	e8 a7 9f 1a 	cset	w8, lt
    1a58:	48 00 00 37 	tbnz	w8, #0, #8
    1a5c:	12 00 00 14 	b	#72
    1a60:	08 00 80 52 	mov	w8, #0
    1a64:	09 00 80 d2 	mov	x9, #0
    1a68:	ea 03 00 32 	orr	w10, wzr, #0x1
    1a6c:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    1a70:	6c 01 40 f9 	ldr	x12, [x11]
    1a74:	ed 1b 40 b9 	ldr	w13, [sp, #24]
    1a78:	ad 81 00 71 	subs	w13, w13, #32
    1a7c:	4d 21 cd 1a 	lsl	w13, w10, w13
    1a80:	ee 03 0d 2a 	mov	w14, w13
    1a84:	ce 7d 40 93 	sxtw	x14, w14
    1a88:	8c 01 0e 8a 	and	x12, x12, x14
    1a8c:	9f 01 09 eb 	cmp	x12, x9
    1a90:	ed 07 9f 1a 	cset	w13, ne
    1a94:	bf 01 00 72 	tst	w13, #0x1
    1a98:	48 11 88 1a 	csel	w8, w10, w8, ne
    1a9c:	e8 1f 00 b9 	str	w8, [sp, #28]
    1aa0:	01 00 00 14 	b	#4
    1aa4:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    1aa8:	ff 83 00 91 	add	sp, sp, #32
    1aac:	c0 03 5f d6 	ret

irq_clr_pending:
    1ab0:	ff 83 00 d1 	sub	sp, sp, #32
    1ab4:	e8 03 1b 32 	orr	w8, wzr, #0x20
    1ab8:	89 40 96 d2 	mov	x9, #45572
    1abc:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    1ac0:	0a 41 96 d2 	mov	x10, #45576
    1ac4:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    1ac8:	e0 1f 00 b9 	str	w0, [sp, #28]
    1acc:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    1ad0:	1f 00 08 6b 	cmp	w0, w8
    1ad4:	e8 a7 9f 1a 	cset	w8, lt
    1ad8:	ea 0b 00 f9 	str	x10, [sp, #16]
    1adc:	e9 07 00 f9 	str	x9, [sp, #8]
    1ae0:	48 00 00 37 	tbnz	w8, #0, #8
    1ae4:	0b 00 00 14 	b	#44
    1ae8:	e8 03 00 32 	orr	w8, wzr, #0x1
    1aec:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1af0:	08 21 c9 1a 	lsl	w8, w8, w9
    1af4:	ea 03 08 2a 	mov	w10, w8
    1af8:	4a 7d 40 93 	sxtw	x10, w10
    1afc:	eb 07 40 f9 	ldr	x11, [sp, #8]
    1b00:	6c 01 40 f9 	ldr	x12, [x11]
    1b04:	8a 01 0a 8a 	and	x10, x12, x10
    1b08:	6a 01 00 f9 	str	x10, [x11]
    1b0c:	11 00 00 14 	b	#68
    1b10:	e8 03 1a 32 	orr	w8, wzr, #0x40
    1b14:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1b18:	3f 01 08 6b 	cmp	w9, w8
    1b1c:	e8 a7 9f 1a 	cset	w8, lt
    1b20:	48 00 00 37 	tbnz	w8, #0, #8
    1b24:	0b 00 00 14 	b	#44
    1b28:	e8 03 00 32 	orr	w8, wzr, #0x1
    1b2c:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1b30:	29 81 00 71 	subs	w9, w9, #32
    1b34:	08 21 c9 1a 	lsl	w8, w8, w9
    1b38:	ea 03 08 2a 	mov	w10, w8
    1b3c:	4a 7d 40 93 	sxtw	x10, w10
    1b40:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    1b44:	6c 01 40 f9 	ldr	x12, [x11]
    1b48:	8a 01 0a 8a 	and	x10, x12, x10
    1b4c:	6a 01 00 f9 	str	x10, [x11]
    1b50:	ff 83 00 91 	add	sp, sp, #32
    1b54:	c0 03 5f d6 	ret

irq_set_enable:
    1b58:	ff 83 00 d1 	sub	sp, sp, #32
    1b5c:	e8 03 1b 32 	orr	w8, wzr, #0x20
    1b60:	09 42 96 d2 	mov	x9, #45584
    1b64:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    1b68:	8a 42 96 d2 	mov	x10, #45588
    1b6c:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    1b70:	e0 1f 00 b9 	str	w0, [sp, #28]
    1b74:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    1b78:	1f 00 08 6b 	cmp	w0, w8
    1b7c:	e8 a7 9f 1a 	cset	w8, lt
    1b80:	ea 0b 00 f9 	str	x10, [sp, #16]
    1b84:	e9 07 00 f9 	str	x9, [sp, #8]
    1b88:	48 00 00 37 	tbnz	w8, #0, #8
    1b8c:	09 00 00 14 	b	#36
    1b90:	e8 03 00 32 	orr	w8, wzr, #0x1
    1b94:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1b98:	08 21 c9 1a 	lsl	w8, w8, w9
    1b9c:	ea 03 08 2a 	mov	w10, w8
    1ba0:	4a 7d 40 93 	sxtw	x10, w10
    1ba4:	eb 07 40 f9 	ldr	x11, [sp, #8]
    1ba8:	6a 01 00 f9 	str	x10, [x11]
    1bac:	0f 00 00 14 	b	#60
    1bb0:	e8 03 1a 32 	orr	w8, wzr, #0x40
    1bb4:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1bb8:	3f 01 08 6b 	cmp	w9, w8
    1bbc:	e8 a7 9f 1a 	cset	w8, lt
    1bc0:	48 00 00 37 	tbnz	w8, #0, #8
    1bc4:	09 00 00 14 	b	#36
    1bc8:	e8 03 00 32 	orr	w8, wzr, #0x1
    1bcc:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1bd0:	29 81 00 71 	subs	w9, w9, #32
    1bd4:	08 21 c9 1a 	lsl	w8, w8, w9
    1bd8:	ea 03 08 2a 	mov	w10, w8
    1bdc:	4a 7d 40 93 	sxtw	x10, w10
    1be0:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    1be4:	6a 01 00 f9 	str	x10, [x11]
    1be8:	ff 83 00 91 	add	sp, sp, #32
    1bec:	c0 03 5f d6 	ret

irq_set_disable:
    1bf0:	ff 83 00 d1 	sub	sp, sp, #32
    1bf4:	e8 03 1b 32 	orr	w8, wzr, #0x20
    1bf8:	89 43 96 d2 	mov	x9, #45596
    1bfc:	09 e0 a7 f2 	movk	x9, #16128, lsl #16
    1c00:	0a 44 96 d2 	mov	x10, #45600
    1c04:	0a e0 a7 f2 	movk	x10, #16128, lsl #16
    1c08:	e0 1f 00 b9 	str	w0, [sp, #28]
    1c0c:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    1c10:	1f 00 08 6b 	cmp	w0, w8
    1c14:	e8 a7 9f 1a 	cset	w8, lt
    1c18:	ea 0b 00 f9 	str	x10, [sp, #16]
    1c1c:	e9 07 00 f9 	str	x9, [sp, #8]
    1c20:	48 00 00 37 	tbnz	w8, #0, #8
    1c24:	09 00 00 14 	b	#36
    1c28:	e8 03 00 32 	orr	w8, wzr, #0x1
    1c2c:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1c30:	08 21 c9 1a 	lsl	w8, w8, w9
    1c34:	ea 03 08 2a 	mov	w10, w8
    1c38:	4a 7d 40 93 	sxtw	x10, w10
    1c3c:	eb 07 40 f9 	ldr	x11, [sp, #8]
    1c40:	6a 01 00 f9 	str	x10, [x11]
    1c44:	0f 00 00 14 	b	#60
    1c48:	e8 03 1a 32 	orr	w8, wzr, #0x40
    1c4c:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1c50:	3f 01 08 6b 	cmp	w9, w8
    1c54:	e8 a7 9f 1a 	cset	w8, lt
    1c58:	48 00 00 37 	tbnz	w8, #0, #8
    1c5c:	09 00 00 14 	b	#36
    1c60:	e8 03 00 32 	orr	w8, wzr, #0x1
    1c64:	e9 1f 40 b9 	ldr	w9, [sp, #28]
    1c68:	29 81 00 71 	subs	w9, w9, #32
    1c6c:	08 21 c9 1a 	lsl	w8, w8, w9
    1c70:	ea 03 08 2a 	mov	w10, w8
    1c74:	4a 7d 40 93 	sxtw	x10, w10
    1c78:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    1c7c:	6a 01 00 f9 	str	x10, [x11]
    1c80:	ff 83 00 91 	add	sp, sp, #32
    1c84:	c0 03 5f d6 	ret

kz_start:
    1c88:	ff 03 03 d1 	sub	sp, sp, #192
    1c8c:	f3 53 00 f9 	str	x19, [sp, #160]
    1c90:	fd 7b 0b a9 	stp	x29, x30, [sp, #176]
    1c94:	fd c3 02 91 	add	x29, sp, #176
    1c98:	08 00 00 f0 	adrp	x8, #12288
    1c9c:	08 01 01 91 	add	x8, x8, #64
    1ca0:	09 00 00 f0 	adrp	x9, #12288
    1ca4:	29 21 01 91 	add	x9, x9, #72
    1ca8:	0a 00 80 52 	mov	w10, #0
    1cac:	eb 03 78 b2 	orr	x11, xzr, #0x100
    1cb0:	0c 00 00 f0 	adrp	x12, #12288
    1cb4:	8c 21 05 91 	add	x12, x12, #328
    1cb8:	0d 1a 81 d2 	mov	x13, #2256
    1cbc:	0e 00 00 f0 	adrp	x14, #12288
    1cc0:	ce 61 28 91 	add	x14, x14, #2584
    1cc4:	ef 07 7d b2 	orr	x15, xzr, #0x18
    1cc8:	10 00 00 f0 	adrp	x16, #12288
    1ccc:	10 c2 28 91 	add	x16, x16, #2608
    1cd0:	f1 03 7a b2 	orr	x17, xzr, #0x40
    1cd4:	b2 02 80 52 	mov	w18, #21
    1cd8:	06 00 00 90 	adrp	x6, #0
    1cdc:	c6 00 3a 91 	add	x6, x6, #3712
    1ce0:	07 00 00 90 	adrp	x7, #0
    1ce4:	e7 e0 3a 91 	add	x7, x7, #3768
    1ce8:	13 0b 80 d2 	mov	x19, #88
    1cec:	a0 83 1e f8 	stur	x0, [x29, #-24]
    1cf0:	a1 03 1e f8 	stur	x1, [x29, #-32]
    1cf4:	a2 c3 1d b8 	stur	w2, [x29, #-36]
    1cf8:	a3 83 1d b8 	stur	w3, [x29, #-40]
    1cfc:	a4 43 1d b8 	stur	w4, [x29, #-44]
    1d00:	a5 83 1c f8 	stur	x5, [x29, #-56]
    1d04:	b3 03 1c f8 	stur	x19, [x29, #-64]
    1d08:	a7 83 1b f8 	stur	x7, [x29, #-72]
    1d0c:	a6 03 1b f8 	stur	x6, [x29, #-80]
    1d10:	b2 c3 1a b8 	stur	w18, [x29, #-84]
    1d14:	f1 2b 00 f9 	str	x17, [sp, #80]
    1d18:	f0 27 00 f9 	str	x16, [sp, #72]
    1d1c:	e8 23 00 f9 	str	x8, [sp, #64]
    1d20:	e9 1f 00 f9 	str	x9, [sp, #56]
    1d24:	ea 37 00 b9 	str	w10, [sp, #52]
    1d28:	eb 17 00 f9 	str	x11, [sp, #40]
    1d2c:	ec 13 00 f9 	str	x12, [sp, #32]
    1d30:	ed 0f 00 f9 	str	x13, [sp, #24]
    1d34:	ee 0b 00 f9 	str	x14, [sp, #16]
    1d38:	ef 07 00 f9 	str	x15, [sp, #8]
    1d3c:	93 05 00 94 	bl	#5708
    1d40:	e8 23 40 f9 	ldr	x8, [sp, #64]
    1d44:	1f 01 00 f9 	str	xzr, [x8]
    1d48:	e1 1f 40 f9 	ldr	x1, [sp, #56]
    1d4c:	e0 03 01 aa 	mov	x0, x1
    1d50:	e1 37 40 b9 	ldr	w1, [sp, #52]
    1d54:	e2 17 40 f9 	ldr	x2, [sp, #40]
    1d58:	38 fc ff 97 	bl	#-3872
    1d5c:	e2 13 40 f9 	ldr	x2, [sp, #32]
    1d60:	e0 03 02 aa 	mov	x0, x2
    1d64:	e1 37 40 b9 	ldr	w1, [sp, #52]
    1d68:	e2 0f 40 f9 	ldr	x2, [sp, #24]
    1d6c:	33 fc ff 97 	bl	#-3892
    1d70:	e2 0b 40 f9 	ldr	x2, [sp, #16]
    1d74:	e0 03 02 aa 	mov	x0, x2
    1d78:	e1 37 40 b9 	ldr	w1, [sp, #52]
    1d7c:	e2 07 40 f9 	ldr	x2, [sp, #8]
    1d80:	2e fc ff 97 	bl	#-3912
    1d84:	e2 27 40 f9 	ldr	x2, [sp, #72]
    1d88:	e0 03 02 aa 	mov	x0, x2
    1d8c:	e1 37 40 b9 	ldr	w1, [sp, #52]
    1d90:	e2 2b 40 f9 	ldr	x2, [sp, #80]
    1d94:	29 fc ff 97 	bl	#-3932
    1d98:	aa c3 5a b8 	ldur	w10, [x29, #-84]
    1d9c:	e0 03 0a 2a 	mov	w0, w10
    1da0:	a1 03 5b f8 	ldur	x1, [x29, #-80]
    1da4:	17 00 00 94 	bl	#92
    1da8:	ea 37 40 b9 	ldr	w10, [sp, #52]
    1dac:	e0 03 0a 2a 	mov	w0, w10
    1db0:	a1 83 5b f8 	ldur	x1, [x29, #-72]
    1db4:	13 00 00 94 	bl	#76
    1db8:	a8 83 5e f8 	ldur	x8, [x29, #-24]
    1dbc:	a1 03 5e f8 	ldur	x1, [x29, #-32]
    1dc0:	a2 c3 5d b8 	ldur	w2, [x29, #-36]
    1dc4:	a3 83 5d b8 	ldur	w3, [x29, #-40]
    1dc8:	a4 43 5d b8 	ldur	w4, [x29, #-44]
    1dcc:	a5 83 5c f8 	ldur	x5, [x29, #-56]
    1dd0:	e0 03 08 aa 	mov	x0, x8
    1dd4:	4f 00 00 94 	bl	#316
    1dd8:	e8 23 40 f9 	ldr	x8, [sp, #64]
    1ddc:	00 01 00 f9 	str	x0, [x8]
    1de0:	09 01 40 f9 	ldr	x9, [x8]
    1de4:	ab 03 5c f8 	ldur	x11, [x29, #-64]
    1de8:	20 01 0b 8b 	add	x0, x9, x11
    1dec:	ad f8 ff 97 	bl	#-7500
    1df0:	fd 7b 4b a9 	ldp	x29, x30, [sp, #176]
    1df4:	f3 53 40 f9 	ldr	x19, [sp, #160]
    1df8:	ff 03 03 91 	add	sp, sp, #192
    1dfc:	c0 03 5f d6 	ret

thread_setintr:
    1e00:	ff 03 01 d1 	sub	sp, sp, #64
    1e04:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    1e08:	fd c3 00 91 	add	x29, sp, #48
    1e0c:	08 00 00 b0 	adrp	x8, #4096
    1e10:	08 c1 0a 91 	add	x8, x8, #688
    1e14:	09 00 00 f0 	adrp	x9, #12288
    1e18:	29 61 28 91 	add	x9, x9, #2584
    1e1c:	ea 03 7d b2 	orr	x10, xzr, #0x8
    1e20:	0b 00 80 52 	mov	w11, #0
    1e24:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    1e28:	a1 03 1f f8 	stur	x1, [x29, #-16]
    1e2c:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    1e30:	e1 03 08 aa 	mov	x1, x8
    1e34:	ab c3 1e b8 	stur	w11, [x29, #-20]
    1e38:	ea 0b 00 f9 	str	x10, [sp, #16]
    1e3c:	e9 07 00 f9 	str	x9, [sp, #8]
    1e40:	92 fb ff 97 	bl	#-4536
    1e44:	a8 03 5f f8 	ldur	x8, [x29, #-16]
    1e48:	ab c3 5f b8 	ldur	w11, [x29, #-4]
    1e4c:	e9 03 0b 2a 	mov	w9, w11
    1e50:	29 7d 40 d3 	ubfx	x9, x9, #0, #32
    1e54:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    1e58:	49 7d 09 9b 	mul	x9, x10, x9
    1e5c:	e1 07 40 f9 	ldr	x1, [sp, #8]
    1e60:	29 00 09 8b 	add	x9, x1, x9
    1e64:	28 01 00 f9 	str	x8, [x9]
    1e68:	44 01 00 94 	bl	#1296
    1e6c:	ab c3 5e b8 	ldur	w11, [x29, #-20]
    1e70:	e0 03 0b 2a 	mov	w0, w11
    1e74:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    1e78:	ff 03 01 91 	add	sp, sp, #64
    1e7c:	c0 03 5f d6 	ret

syscall_intr:
    1e80:	fd 7b bf a9 	stp	x29, x30, [sp, #-16]!
    1e84:	fd 03 00 91 	mov	x29, sp
    1e88:	08 00 00 f0 	adrp	x8, #12288
    1e8c:	08 01 01 91 	add	x8, x8, #64
    1e90:	09 09 80 d2 	mov	x9, #72
    1e94:	0a 01 40 f9 	ldr	x10, [x8]
    1e98:	4a 01 09 8b 	add	x10, x10, x9
    1e9c:	40 01 40 b9 	ldr	w0, [x10]
    1ea0:	08 01 40 f9 	ldr	x8, [x8]
    1ea4:	08 01 09 8b 	add	x8, x8, x9
    1ea8:	01 05 40 f9 	ldr	x1, [x8, #8]
    1eac:	ab 01 00 94 	bl	#1708
    1eb0:	fd 7b c1 a8 	ldp	x29, x30, [sp], #16
    1eb4:	c0 03 5f d6 	ret

softerr_intr:
    1eb8:	ff 83 00 d1 	sub	sp, sp, #32
    1ebc:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    1ec0:	fd 43 00 91 	add	x29, sp, #16
    1ec4:	08 00 00 f0 	adrp	x8, #12288
    1ec8:	08 01 01 91 	add	x8, x8, #64
    1ecc:	e9 03 7d b2 	orr	x9, xzr, #0x8
    1ed0:	0a 00 00 d0 	adrp	x10, #8192
    1ed4:	4a 95 3e 91 	add	x10, x10, #4005
    1ed8:	08 01 40 f9 	ldr	x8, [x8]
    1edc:	08 01 09 8b 	add	x8, x8, x9
    1ee0:	e0 03 08 aa 	mov	x0, x8
    1ee4:	ea 07 00 f9 	str	x10, [sp, #8]
    1ee8:	16 fd ff 97 	bl	#-2984
    1eec:	e8 07 40 f9 	ldr	x8, [sp, #8]
    1ef0:	e0 03 08 aa 	mov	x0, x8
    1ef4:	13 fd ff 97 	bl	#-2996
    1ef8:	a6 01 00 94 	bl	#1688
    1efc:	83 02 00 94 	bl	#2572
    1f00:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    1f04:	ff 83 00 91 	add	sp, sp, #32
    1f08:	c0 03 5f d6 	ret
    1f0c:	1f 20 03 d5 	nop

thread_run:
    1f10:	ff 43 03 d1 	sub	sp, sp, #208
    1f14:	fd 7b 0c a9 	stp	x29, x30, [sp, #192]
    1f18:	fd 03 03 91 	add	x29, sp, #192
    1f1c:	08 00 00 f0 	adrp	x8, #12288
    1f20:	08 21 05 91 	add	x8, x8, #328
    1f24:	09 00 00 f0 	adrp	x9, #12288
    1f28:	29 01 00 91 	add	x9, x9, #0
    1f2c:	0a 00 00 b0 	adrp	x10, #4096
    1f30:	4a 21 24 91 	add	x10, x10, #2312
    1f34:	0b 00 00 b0 	adrp	x11, #4096
    1f38:	6b c1 38 91 	add	x11, x11, #3632
    1f3c:	0c 00 00 d0 	adrp	x12, #8192
    1f40:	8c 75 3d 91 	add	x12, x12, #3933
    1f44:	0d 00 00 d0 	adrp	x13, #8192
    1f48:	ad f5 3e 91 	add	x13, x13, #4029
    1f4c:	0e 00 00 f0 	adrp	x14, #12288
    1f50:	ce 01 01 91 	add	x14, x14, #64
    1f54:	a0 03 1f f8 	stur	x0, [x29, #-16]
    1f58:	a1 83 1e f8 	stur	x1, [x29, #-24]
    1f5c:	a2 43 1e b8 	stur	w2, [x29, #-28]
    1f60:	a3 03 1e b8 	stur	w3, [x29, #-32]
    1f64:	a4 c3 1d b8 	stur	w4, [x29, #-36]
    1f68:	a5 03 1d f8 	stur	x5, [x29, #-48]
    1f6c:	bf c3 1c b8 	stur	wzr, [x29, #-52]
    1f70:	ae 03 1b f8 	stur	x14, [x29, #-80]
    1f74:	ad 83 1a f8 	stur	x13, [x29, #-88]
    1f78:	ec 33 00 f9 	str	x12, [sp, #96]
    1f7c:	eb 2f 00 f9 	str	x11, [sp, #88]
    1f80:	ea 2b 00 f9 	str	x10, [sp, #80]
    1f84:	e9 27 00 f9 	str	x9, [sp, #72]
    1f88:	e8 23 00 f9 	str	x8, [sp, #64]
    1f8c:	e8 07 1f 32 	orr	w8, wzr, #0x6
    1f90:	a9 c3 5c b8 	ldur	w9, [x29, #-52]
    1f94:	3f 01 08 6b 	cmp	w9, w8
    1f98:	e8 a7 9f 1a 	cset	w8, lt
    1f9c:	48 00 00 37 	tbnz	w8, #0, #8
    1fa0:	11 00 00 14 	b	#68
    1fa4:	e8 07 7c b2 	orr	x8, xzr, #0x30
    1fa8:	09 2f 80 d2 	mov	x9, #376
    1fac:	aa c3 9c b8 	ldursw	x10, [x29, #-52]
    1fb0:	29 7d 0a 9b 	mul	x9, x9, x10
    1fb4:	ea 23 40 f9 	ldr	x10, [sp, #64]
    1fb8:	49 01 09 8b 	add	x9, x10, x9
    1fbc:	a9 03 1c f8 	stur	x9, [x29, #-64]
    1fc0:	a9 03 5c f8 	ldur	x9, [x29, #-64]
    1fc4:	28 01 08 8b 	add	x8, x9, x8
    1fc8:	08 01 40 f9 	ldr	x8, [x8]
    1fcc:	48 00 00 b5 	cbnz	x8, #8
    1fd0:	05 00 00 14 	b	#20
    1fd4:	a8 c3 5c b8 	ldur	w8, [x29, #-52]
    1fd8:	08 05 00 11 	add	w8, w8, #1
    1fdc:	a8 c3 1c b8 	stur	w8, [x29, #-52]
    1fe0:	eb ff ff 17 	b	#-84
    1fe4:	e8 07 1f 32 	orr	w8, wzr, #0x6
    1fe8:	a9 c3 5c b8 	ldur	w9, [x29, #-52]
    1fec:	3f 01 08 6b 	cmp	w9, w8
    1ff0:	e8 17 9f 1a 	cset	w8, eq
    1ff4:	48 00 00 37 	tbnz	w8, #0, #8
    1ff8:	04 00 00 14 	b	#16
    1ffc:	08 00 80 92 	mov	x8, #-1
    2000:	a8 83 1f f8 	stur	x8, [x29, #-8]
    2004:	72 00 00 14 	b	#456
    2008:	88 18 80 d2 	mov	x8, #196
    200c:	09 0b 80 d2 	mov	x9, #88
    2010:	e1 03 1d 32 	orr	w1, wzr, #0x8
    2014:	ea 03 7b b2 	orr	x10, xzr, #0x20
    2018:	eb 03 40 b2 	orr	x11, xzr, #0x1
    201c:	ec 03 7d b2 	orr	x12, xzr, #0x8
    2020:	ed 07 7c b2 	orr	x13, xzr, #0x30
    2024:	02 2f 80 d2 	mov	x2, #376
    2028:	0e 00 80 52 	mov	w14, #0
    202c:	a0 03 5c f8 	ldur	x0, [x29, #-64]
    2030:	e1 3f 00 b9 	str	w1, [sp, #60]
    2034:	e1 03 0e 2a 	mov	w1, w14
    2038:	e8 1b 00 f9 	str	x8, [sp, #48]
    203c:	e9 17 00 f9 	str	x9, [sp, #40]
    2040:	ee 27 00 b9 	str	w14, [sp, #36]
    2044:	ea 0f 00 f9 	str	x10, [sp, #24]
    2048:	eb 0b 00 f9 	str	x11, [sp, #16]
    204c:	ec 07 00 f9 	str	x12, [sp, #8]
    2050:	ed 03 00 f9 	str	x13, [sp]
    2054:	79 fb ff 97 	bl	#-4636
    2058:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    205c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2060:	08 01 09 8b 	add	x8, x8, x9
    2064:	a1 83 5e f8 	ldur	x1, [x29, #-24]
    2068:	e0 03 08 aa 	mov	x0, x8
    206c:	f7 fb ff 97 	bl	#-4132
    2070:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2074:	1f 01 00 f9 	str	xzr, [x8]
    2078:	ae 43 5e b8 	ldur	w14, [x29, #-28]
    207c:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2080:	0e 19 00 b9 	str	w14, [x8, #24]
    2084:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2088:	1f 15 00 f9 	str	xzr, [x8, #40]
    208c:	a8 03 5f f8 	ldur	x8, [x29, #-16]
    2090:	a9 03 5c f8 	ldur	x9, [x29, #-64]
    2094:	ea 03 40 f9 	ldr	x10, [sp]
    2098:	29 01 0a 8b 	add	x9, x9, x10
    209c:	28 01 00 f9 	str	x8, [x9]
    20a0:	ae c3 5d b8 	ldur	w14, [x29, #-36]
    20a4:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    20a8:	08 01 0a 8b 	add	x8, x8, x10
    20ac:	0e 09 00 b9 	str	w14, [x8, #8]
    20b0:	a8 03 5d f8 	ldur	x8, [x29, #-48]
    20b4:	a9 03 5c f8 	ldur	x9, [x29, #-64]
    20b8:	29 01 0a 8b 	add	x9, x9, x10
    20bc:	28 09 00 f9 	str	x8, [x9, #16]
    20c0:	e8 27 40 f9 	ldr	x8, [sp, #72]
    20c4:	09 01 40 f9 	ldr	x9, [x8]
    20c8:	a2 03 9e b8 	ldursw	x2, [x29, #-32]
    20cc:	e0 03 09 aa 	mov	x0, x9
    20d0:	e1 27 40 b9 	ldr	w1, [sp, #36]
    20d4:	59 fb ff 97 	bl	#-4764
    20d8:	ae 03 5e b8 	ldur	w14, [x29, #-32]
    20dc:	e8 27 40 f9 	ldr	x8, [sp, #72]
    20e0:	09 01 40 f9 	ldr	x9, [x8]
    20e4:	ea 03 0e 2a 	mov	w10, w14
    20e8:	4a 7d 40 93 	sxtw	x10, w10
    20ec:	eb 0b 40 f9 	ldr	x11, [sp, #16]
    20f0:	6a 7d 0a 9b 	mul	x10, x11, x10
    20f4:	29 01 0a 8b 	add	x9, x9, x10
    20f8:	09 01 00 f9 	str	x9, [x8]
    20fc:	09 01 40 f9 	ldr	x9, [x8]
    2100:	aa 03 5c f8 	ldur	x10, [x29, #-64]
    2104:	49 11 00 f9 	str	x9, [x10, #32]
    2108:	a9 03 5c f8 	ldur	x9, [x29, #-64]
    210c:	29 11 40 f9 	ldr	x9, [x9, #32]
    2110:	e0 03 09 aa 	mov	x0, x9
    2114:	e1 3f 40 b9 	ldr	w1, [sp, #60]
    2118:	c4 fc ff 97 	bl	#-3312
    211c:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2120:	08 11 40 f9 	ldr	x8, [x8, #32]
    2124:	a8 83 1b f8 	stur	x8, [x29, #-72]
    2128:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    212c:	e9 17 40 f9 	ldr	x9, [sp, #40]
    2130:	08 01 09 8b 	add	x8, x8, x9
    2134:	ea 1b 40 f9 	ldr	x10, [sp, #48]
    2138:	0a 01 00 f9 	str	x10, [x8]
    213c:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2140:	ab 03 5c f8 	ldur	x11, [x29, #-64]
    2144:	6b 01 09 8b 	add	x11, x11, x9
    2148:	ec 0f 40 f9 	ldr	x12, [sp, #24]
    214c:	6b 01 0c 8b 	add	x11, x11, x12
    2150:	68 01 00 f9 	str	x8, [x11]
    2154:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    2158:	08 01 09 8b 	add	x8, x8, x9
    215c:	08 01 0c 8b 	add	x8, x8, x12
    2160:	eb 2b 40 f9 	ldr	x11, [sp, #80]
    2164:	0b 79 00 f9 	str	x11, [x8, #240]
    2168:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    216c:	08 01 09 8b 	add	x8, x8, x9
    2170:	ed 2f 40 f9 	ldr	x13, [sp, #88]
    2174:	0d 05 00 f9 	str	x13, [x8, #8]
    2178:	a8 83 5b f8 	ldur	x8, [x29, #-72]
    217c:	a2 03 5c f8 	ldur	x2, [x29, #-64]
    2180:	42 00 09 8b 	add	x2, x2, x9
    2184:	48 08 00 f9 	str	x8, [x2, #16]
    2188:	e2 33 40 f9 	ldr	x2, [sp, #96]
    218c:	e0 03 02 aa 	mov	x0, x2
    2190:	6c fc ff 97 	bl	#-3664
    2194:	a8 83 5e f8 	ldur	x8, [x29, #-24]
    2198:	e0 03 08 aa 	mov	x0, x8
    219c:	69 fc ff 97 	bl	#-3676
    21a0:	a2 83 5a f8 	ldur	x2, [x29, #-88]
    21a4:	e0 03 02 aa 	mov	x0, x2
    21a8:	66 fc ff 97 	bl	#-3688
    21ac:	73 00 00 94 	bl	#460
    21b0:	a8 03 5c f8 	ldur	x8, [x29, #-64]
    21b4:	a9 03 5b f8 	ldur	x9, [x29, #-80]
    21b8:	28 01 00 f9 	str	x8, [x9]
    21bc:	6f 00 00 94 	bl	#444
    21c0:	a8 03 5b f8 	ldur	x8, [x29, #-80]
    21c4:	09 01 40 f9 	ldr	x9, [x8]
    21c8:	a9 83 1f f8 	stur	x9, [x29, #-8]
    21cc:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    21d0:	fd 7b 4c a9 	ldp	x29, x30, [sp, #192]
    21d4:	ff 43 03 91 	add	sp, sp, #208
    21d8:	c0 03 5f d6 	ret
    21dc:	1f 20 03 d5 	nop

kz_sysdown:
    21e0:	fd 7b bf a9 	stp	x29, x30, [sp, #-16]!
    21e4:	fd 03 00 91 	mov	x29, sp
    21e8:	08 00 00 b0 	adrp	x8, #4096
    21ec:	08 59 3e 91 	add	x8, x8, #3990
    21f0:	e0 03 08 aa 	mov	x0, x8
    21f4:	53 fc ff 97 	bl	#-3764
    21f8:	00 00 00 14 	b	#0
    21fc:	1f 20 03 d5 	nop

kz_syscall:
    2200:	ff 43 00 d1 	sub	sp, sp, #16
    2204:	08 00 00 d0 	adrp	x8, #8192
    2208:	08 01 01 91 	add	x8, x8, #64
    220c:	09 09 80 d2 	mov	x9, #72
    2210:	e0 0f 00 b9 	str	w0, [sp, #12]
    2214:	e1 03 00 f9 	str	x1, [sp]
    2218:	e0 0f 40 b9 	ldr	w0, [sp, #12]
    221c:	01 01 40 f9 	ldr	x1, [x8]
    2220:	21 00 09 8b 	add	x1, x1, x9
    2224:	20 00 00 b9 	str	w0, [x1]
    2228:	e1 03 40 f9 	ldr	x1, [sp]
    222c:	08 01 40 f9 	ldr	x8, [x8]
    2230:	08 01 09 8b 	add	x8, x8, x9
    2234:	01 05 00 f9 	str	x1, [x8, #8]
    2238:	01 00 00 d4 	svc	#0
    223c:	ff 43 00 91 	add	sp, sp, #16
    2240:	c0 03 5f d6 	ret
    2244:	1f 20 03 d5 	nop

kz_srvcall:
    2248:	ff 83 00 d1 	sub	sp, sp, #32
    224c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2250:	fd 43 00 91 	add	x29, sp, #16
    2254:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2258:	e1 03 00 f9 	str	x1, [sp]
    225c:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    2260:	e1 03 40 f9 	ldr	x1, [sp]
    2264:	05 00 00 94 	bl	#20
    2268:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    226c:	ff 83 00 91 	add	sp, sp, #32
    2270:	c0 03 5f d6 	ret
    2274:	1f 20 03 d5 	nop

srvcall_proc:
    2278:	ff 83 00 d1 	sub	sp, sp, #32
    227c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2280:	fd 43 00 91 	add	x29, sp, #16
    2284:	08 00 00 d0 	adrp	x8, #8192
    2288:	08 01 01 91 	add	x8, x8, #64
    228c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2290:	e1 03 00 f9 	str	x1, [sp]
    2294:	1f 01 00 f9 	str	xzr, [x8]
    2298:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    229c:	e1 03 40 f9 	ldr	x1, [sp]
    22a0:	f8 00 00 94 	bl	#992
    22a4:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    22a8:	ff 83 00 91 	add	sp, sp, #32
    22ac:	c0 03 5f d6 	ret

thread_intr:
    22b0:	ff 03 01 d1 	sub	sp, sp, #64
    22b4:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    22b8:	fd c3 00 91 	add	x29, sp, #48
    22bc:	08 00 00 d0 	adrp	x8, #8192
    22c0:	08 01 01 91 	add	x8, x8, #64
    22c4:	09 0b 80 d2 	mov	x9, #88
    22c8:	02 24 80 d2 	mov	x2, #288
    22cc:	0a 00 00 d0 	adrp	x10, #8192
    22d0:	4a 61 28 91 	add	x10, x10, #2584
    22d4:	eb 03 7d b2 	orr	x11, xzr, #0x8
    22d8:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    22dc:	a1 03 1f f8 	stur	x1, [x29, #-16]
    22e0:	01 01 40 f9 	ldr	x1, [x8]
    22e4:	20 00 09 8b 	add	x0, x1, x9
    22e8:	a9 03 5f f8 	ldur	x9, [x29, #-16]
    22ec:	e1 03 09 aa 	mov	x1, x9
    22f0:	eb 0f 00 f9 	str	x11, [sp, #24]
    22f4:	ea 0b 00 f9 	str	x10, [sp, #16]
    22f8:	e8 07 00 f9 	str	x8, [sp, #8]
    22fc:	e9 fa ff 97 	bl	#-5212
    2300:	ac c3 5f b8 	ldur	w12, [x29, #-4]
    2304:	e8 03 0c 2a 	mov	w8, w12
    2308:	08 7d 40 d3 	ubfx	x8, x8, #0, #32
    230c:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    2310:	28 7d 08 9b 	mul	x8, x9, x8
    2314:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    2318:	48 01 08 8b 	add	x8, x10, x8
    231c:	08 01 40 f9 	ldr	x8, [x8]
    2320:	48 00 00 b5 	cbnz	x8, #8
    2324:	0a 00 00 14 	b	#40
    2328:	e8 03 7d b2 	orr	x8, xzr, #0x8
    232c:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
    2330:	ea 03 09 2a 	mov	w10, w9
    2334:	4a 7d 40 d3 	ubfx	x10, x10, #0, #32
    2338:	08 7d 0a 9b 	mul	x8, x8, x10
    233c:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    2340:	48 01 08 8b 	add	x8, x10, x8
    2344:	08 01 40 f9 	ldr	x8, [x8]
    2348:	00 01 3f d6 	blr	x8
    234c:	08 0b 80 d2 	mov	x8, #88
    2350:	e8 03 00 f9 	str	x8, [sp]
    2354:	51 00 00 94 	bl	#324
    2358:	e8 07 40 f9 	ldr	x8, [sp, #8]
    235c:	09 01 40 f9 	ldr	x9, [x8]
    2360:	ea 03 40 f9 	ldr	x10, [sp]
    2364:	20 01 0a 8b 	add	x0, x9, x10
    2368:	4e f7 ff 97 	bl	#-8904
    236c:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    2370:	ff 03 01 91 	add	sp, sp, #64
    2374:	c0 03 5f d6 	ret

putcurrent:
    2378:	ff 83 00 d1 	sub	sp, sp, #32
    237c:	08 00 00 d0 	adrp	x8, #8192
    2380:	08 01 01 91 	add	x8, x8, #64
    2384:	09 00 00 d0 	adrp	x9, #8192
    2388:	29 21 01 91 	add	x9, x9, #72
    238c:	0a 01 40 f9 	ldr	x10, [x8]
    2390:	e8 0b 00 f9 	str	x8, [sp, #16]
    2394:	e9 07 00 f9 	str	x9, [sp, #8]
    2398:	4a 00 00 b4 	cbz	x10, #8
    239c:	04 00 00 14 	b	#16
    23a0:	08 00 80 12 	mov	w8, #-1
    23a4:	e8 1f 00 b9 	str	w8, [sp, #28]
    23a8:	38 00 00 14 	b	#224
    23ac:	e8 03 40 b2 	orr	x8, xzr, #0x1
    23b0:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    23b4:	2a 01 40 f9 	ldr	x10, [x9]
    23b8:	4a 15 40 f9 	ldr	x10, [x10, #40]
    23bc:	48 01 08 8a 	and	x8, x10, x8
    23c0:	48 00 00 b5 	cbnz	x8, #8
    23c4:	04 00 00 14 	b	#16
    23c8:	e8 03 00 32 	orr	w8, wzr, #0x1
    23cc:	e8 1f 00 b9 	str	w8, [sp, #28]
    23d0:	2e 00 00 14 	b	#184
    23d4:	e8 03 7c b2 	orr	x8, xzr, #0x10
    23d8:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    23dc:	2a 01 40 f9 	ldr	x10, [x9]
    23e0:	4a 19 80 b9 	ldrsw	x10, [x10, #24]
    23e4:	08 7d 0a 9b 	mul	x8, x8, x10
    23e8:	ea 07 40 f9 	ldr	x10, [sp, #8]
    23ec:	48 01 08 8b 	add	x8, x10, x8
    23f0:	08 05 40 f9 	ldr	x8, [x8, #8]
    23f4:	48 00 00 b5 	cbnz	x8, #8
    23f8:	0c 00 00 14 	b	#48
    23fc:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2400:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2404:	2a 01 40 f9 	ldr	x10, [x9]
    2408:	2b 01 40 f9 	ldr	x11, [x9]
    240c:	6b 19 80 b9 	ldrsw	x11, [x11, #24]
    2410:	08 7d 0b 9b 	mul	x8, x8, x11
    2414:	eb 07 40 f9 	ldr	x11, [sp, #8]
    2418:	68 01 08 8b 	add	x8, x11, x8
    241c:	08 05 40 f9 	ldr	x8, [x8, #8]
    2420:	0a 01 00 f9 	str	x10, [x8]
    2424:	0a 00 00 14 	b	#40
    2428:	e8 03 7c b2 	orr	x8, xzr, #0x10
    242c:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2430:	2a 01 40 f9 	ldr	x10, [x9]
    2434:	2b 01 40 f9 	ldr	x11, [x9]
    2438:	6b 19 80 b9 	ldrsw	x11, [x11, #24]
    243c:	08 7d 0b 9b 	mul	x8, x8, x11
    2440:	eb 07 40 f9 	ldr	x11, [sp, #8]
    2444:	68 01 08 8b 	add	x8, x11, x8
    2448:	0a 01 00 f9 	str	x10, [x8]
    244c:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2450:	e9 03 40 b2 	orr	x9, xzr, #0x1
    2454:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    2458:	4b 01 40 f9 	ldr	x11, [x10]
    245c:	4c 01 40 f9 	ldr	x12, [x10]
    2460:	8c 19 80 b9 	ldrsw	x12, [x12, #24]
    2464:	08 7d 0c 9b 	mul	x8, x8, x12
    2468:	ec 07 40 f9 	ldr	x12, [sp, #8]
    246c:	88 01 08 8b 	add	x8, x12, x8
    2470:	0b 05 00 f9 	str	x11, [x8, #8]
    2474:	48 01 40 f9 	ldr	x8, [x10]
    2478:	0b 15 40 f9 	ldr	x11, [x8, #40]
    247c:	69 01 09 aa 	orr	x9, x11, x9
    2480:	09 15 00 f9 	str	x9, [x8, #40]
    2484:	ff 1f 00 b9 	str	wzr, [sp, #28]
    2488:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    248c:	ff 83 00 91 	add	sp, sp, #32
    2490:	c0 03 5f d6 	ret
    2494:	1f 20 03 d5 	nop

schedule:
    2498:	ff c3 00 d1 	sub	sp, sp, #48
    249c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    24a0:	fd 83 00 91 	add	x29, sp, #32
    24a4:	08 00 00 d0 	adrp	x8, #8192
    24a8:	08 21 01 91 	add	x8, x8, #72
    24ac:	09 00 00 d0 	adrp	x9, #8192
    24b0:	29 01 01 91 	add	x9, x9, #64
    24b4:	bf c3 1f b8 	stur	wzr, [x29, #-4]
    24b8:	e8 0b 00 f9 	str	x8, [sp, #16]
    24bc:	e9 07 00 f9 	str	x9, [sp, #8]
    24c0:	e8 03 1c 32 	orr	w8, wzr, #0x10
    24c4:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
    24c8:	3f 01 08 6b 	cmp	w9, w8
    24cc:	e8 a7 9f 1a 	cset	w8, lt
    24d0:	48 00 00 37 	tbnz	w8, #0, #8
    24d4:	0e 00 00 14 	b	#56
    24d8:	e8 03 7c b2 	orr	x8, xzr, #0x10
    24dc:	a9 c3 9f b8 	ldursw	x9, [x29, #-4]
    24e0:	08 7d 09 9b 	mul	x8, x8, x9
    24e4:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    24e8:	28 01 08 8b 	add	x8, x9, x8
    24ec:	08 01 40 f9 	ldr	x8, [x8]
    24f0:	48 00 00 b5 	cbnz	x8, #8
    24f4:	02 00 00 14 	b	#8
    24f8:	05 00 00 14 	b	#20
    24fc:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    2500:	08 05 00 11 	add	w8, w8, #1
    2504:	a8 c3 1f b8 	stur	w8, [x29, #-4]
    2508:	ee ff ff 17 	b	#-72
    250c:	e8 03 1c 32 	orr	w8, wzr, #0x10
    2510:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
    2514:	3f 01 08 6b 	cmp	w9, w8
    2518:	e8 17 9f 1a 	cset	w8, eq
    251c:	48 00 00 37 	tbnz	w8, #0, #8
    2520:	02 00 00 14 	b	#8
    2524:	2f ff ff 97 	bl	#-836
    2528:	e8 03 7c b2 	orr	x8, xzr, #0x10
    252c:	a9 c3 9f b8 	ldursw	x9, [x29, #-4]
    2530:	08 7d 09 9b 	mul	x8, x8, x9
    2534:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2538:	28 01 08 8b 	add	x8, x9, x8
    253c:	08 01 40 f9 	ldr	x8, [x8]
    2540:	ea 07 40 f9 	ldr	x10, [sp, #8]
    2544:	48 01 00 f9 	str	x8, [x10]
    2548:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    254c:	ff c3 00 91 	add	sp, sp, #48
    2550:	c0 03 5f d6 	ret
    2554:	1f 20 03 d5 	nop

syscall_proc:
    2558:	ff 83 00 d1 	sub	sp, sp, #32
    255c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2560:	fd 43 00 91 	add	x29, sp, #16
    2564:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2568:	e1 03 00 f9 	str	x1, [sp]
    256c:	09 00 00 94 	bl	#36
    2570:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    2574:	e1 03 40 f9 	ldr	x1, [sp]
    2578:	e0 03 08 2a 	mov	w0, w8
    257c:	41 00 00 94 	bl	#260
    2580:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2584:	ff 83 00 91 	add	sp, sp, #32
    2588:	c0 03 5f d6 	ret
    258c:	1f 20 03 d5 	nop

getcurrent:
    2590:	ff 83 00 d1 	sub	sp, sp, #32
    2594:	08 00 00 d0 	adrp	x8, #8192
    2598:	08 01 01 91 	add	x8, x8, #64
    259c:	09 00 00 d0 	adrp	x9, #8192
    25a0:	29 21 01 91 	add	x9, x9, #72
    25a4:	0a 01 40 f9 	ldr	x10, [x8]
    25a8:	e8 0b 00 f9 	str	x8, [sp, #16]
    25ac:	e9 07 00 f9 	str	x9, [sp, #8]
    25b0:	4a 00 00 b4 	cbz	x10, #8
    25b4:	04 00 00 14 	b	#16
    25b8:	08 00 80 12 	mov	w8, #-1
    25bc:	e8 1f 00 b9 	str	w8, [sp, #28]
    25c0:	2c 00 00 14 	b	#176
    25c4:	e8 03 40 b2 	orr	x8, xzr, #0x1
    25c8:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    25cc:	2a 01 40 f9 	ldr	x10, [x9]
    25d0:	4a 15 40 f9 	ldr	x10, [x10, #40]
    25d4:	48 01 08 8a 	and	x8, x10, x8
    25d8:	88 00 00 b5 	cbnz	x8, #16
    25dc:	e8 03 00 32 	orr	w8, wzr, #0x1
    25e0:	e8 1f 00 b9 	str	w8, [sp, #28]
    25e4:	23 00 00 14 	b	#140
    25e8:	e8 03 7c b2 	orr	x8, xzr, #0x10
    25ec:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    25f0:	2a 01 40 f9 	ldr	x10, [x9]
    25f4:	4a 01 40 f9 	ldr	x10, [x10]
    25f8:	2b 01 40 f9 	ldr	x11, [x9]
    25fc:	6b 19 80 b9 	ldrsw	x11, [x11, #24]
    2600:	0b 7d 0b 9b 	mul	x11, x8, x11
    2604:	ec 07 40 f9 	ldr	x12, [sp, #8]
    2608:	8b 01 0b 8b 	add	x11, x12, x11
    260c:	6a 01 00 f9 	str	x10, [x11]
    2610:	2a 01 40 f9 	ldr	x10, [x9]
    2614:	4a 19 80 b9 	ldrsw	x10, [x10, #24]
    2618:	08 7d 0a 9b 	mul	x8, x8, x10
    261c:	88 01 08 8b 	add	x8, x12, x8
    2620:	08 01 40 f9 	ldr	x8, [x8]
    2624:	48 00 00 b4 	cbz	x8, #8
    2628:	09 00 00 14 	b	#36
    262c:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2630:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2634:	2a 01 40 f9 	ldr	x10, [x9]
    2638:	4a 19 80 b9 	ldrsw	x10, [x10, #24]
    263c:	08 7d 0a 9b 	mul	x8, x8, x10
    2640:	ea 07 40 f9 	ldr	x10, [sp, #8]
    2644:	48 01 08 8b 	add	x8, x10, x8
    2648:	1f 05 00 f9 	str	xzr, [x8, #8]
    264c:	e8 fb 7f b2 	orr	x8, xzr, #0xfffffffffffffffe
    2650:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2654:	2a 01 40 f9 	ldr	x10, [x9]
    2658:	4b 15 40 f9 	ldr	x11, [x10, #40]
    265c:	68 01 08 8a 	and	x8, x11, x8
    2660:	48 15 00 f9 	str	x8, [x10, #40]
    2664:	28 01 40 f9 	ldr	x8, [x9]
    2668:	1f 01 00 f9 	str	xzr, [x8]
    266c:	ff 1f 00 b9 	str	wzr, [sp, #28]
    2670:	e0 1f 40 b9 	ldr	w0, [sp, #28]
    2674:	ff 83 00 91 	add	sp, sp, #32
    2678:	c0 03 5f d6 	ret
    267c:	1f 20 03 d5 	nop

call_functions:
    2680:	ff c3 00 d1 	sub	sp, sp, #48
    2684:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    2688:	fd 83 00 91 	add	x29, sp, #32
    268c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2690:	e1 0b 00 f9 	str	x1, [sp, #16]
    2694:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    2698:	e0 0f 00 b9 	str	w0, [sp, #12]
    269c:	a0 08 00 34 	cbz	w0, #276
    26a0:	01 00 00 14 	b	#4
    26a4:	e8 03 00 32 	orr	w8, wzr, #0x1
    26a8:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    26ac:	1f 01 09 6b 	cmp	w8, w9
    26b0:	e8 17 9f 1a 	cset	w8, eq
    26b4:	e8 09 00 37 	tbnz	w8, #0, #316
    26b8:	01 00 00 14 	b	#4
    26bc:	e8 03 1f 32 	orr	w8, wzr, #0x2
    26c0:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    26c4:	1f 01 09 6b 	cmp	w8, w9
    26c8:	e8 17 9f 1a 	cset	w8, eq
    26cc:	68 09 00 37 	tbnz	w8, #0, #300
    26d0:	01 00 00 14 	b	#4
    26d4:	e8 07 00 32 	orr	w8, wzr, #0x3
    26d8:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    26dc:	1f 01 09 6b 	cmp	w8, w9
    26e0:	e8 17 9f 1a 	cset	w8, eq
    26e4:	28 09 00 37 	tbnz	w8, #0, #292
    26e8:	01 00 00 14 	b	#4
    26ec:	e8 03 1e 32 	orr	w8, wzr, #0x4
    26f0:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    26f4:	1f 01 09 6b 	cmp	w8, w9
    26f8:	e8 17 9f 1a 	cset	w8, eq
    26fc:	e8 08 00 37 	tbnz	w8, #0, #284
    2700:	01 00 00 14 	b	#4
    2704:	a8 00 80 52 	mov	w8, #5
    2708:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    270c:	1f 01 09 6b 	cmp	w8, w9
    2710:	e8 17 9f 1a 	cset	w8, eq
    2714:	e8 08 00 37 	tbnz	w8, #0, #284
    2718:	01 00 00 14 	b	#4
    271c:	e8 07 1f 32 	orr	w8, wzr, #0x6
    2720:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    2724:	1f 01 09 6b 	cmp	w8, w9
    2728:	e8 17 9f 1a 	cset	w8, eq
    272c:	a8 08 00 37 	tbnz	w8, #0, #276
    2730:	01 00 00 14 	b	#4
    2734:	e8 0b 00 32 	orr	w8, wzr, #0x7
    2738:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    273c:	1f 01 09 6b 	cmp	w8, w9
    2740:	e8 17 9f 1a 	cset	w8, eq
    2744:	a8 08 00 37 	tbnz	w8, #0, #276
    2748:	01 00 00 14 	b	#4
    274c:	e8 03 1d 32 	orr	w8, wzr, #0x8
    2750:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    2754:	1f 01 09 6b 	cmp	w8, w9
    2758:	e8 17 9f 1a 	cset	w8, eq
    275c:	a8 08 00 37 	tbnz	w8, #0, #276
    2760:	01 00 00 14 	b	#4
    2764:	28 01 80 52 	mov	w8, #9
    2768:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    276c:	1f 01 09 6b 	cmp	w8, w9
    2770:	e8 17 9f 1a 	cset	w8, eq
    2774:	a8 08 00 37 	tbnz	w8, #0, #276
    2778:	01 00 00 14 	b	#4
    277c:	48 01 80 52 	mov	w8, #10
    2780:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    2784:	1f 01 09 6b 	cmp	w8, w9
    2788:	e8 17 9f 1a 	cset	w8, eq
    278c:	28 09 00 37 	tbnz	w8, #0, #292
    2790:	01 00 00 14 	b	#4
    2794:	68 01 80 52 	mov	w8, #11
    2798:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    279c:	1f 01 09 6b 	cmp	w8, w9
    27a0:	e8 17 9f 1a 	cset	w8, eq
    27a4:	a8 09 00 37 	tbnz	w8, #0, #308
    27a8:	01 00 00 14 	b	#4
    27ac:	53 00 00 14 	b	#332
    27b0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27b4:	00 01 40 f9 	ldr	x0, [x8]
    27b8:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27bc:	01 05 40 f9 	ldr	x1, [x8, #8]
    27c0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27c4:	02 11 40 b9 	ldr	w2, [x8, #16]
    27c8:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27cc:	03 15 40 b9 	ldr	w3, [x8, #20]
    27d0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27d4:	04 19 40 b9 	ldr	w4, [x8, #24]
    27d8:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27dc:	05 11 40 f9 	ldr	x5, [x8, #32]
    27e0:	cc fd ff 97 	bl	#-2256
    27e4:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    27e8:	00 15 00 f9 	str	x0, [x8, #40]
    27ec:	43 00 00 14 	b	#268
    27f0:	46 00 00 94 	bl	#280
    27f4:	41 00 00 14 	b	#260
    27f8:	64 00 00 94 	bl	#400
    27fc:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2800:	00 01 00 b9 	str	w0, [x8]
    2804:	3d 00 00 14 	b	#244
    2808:	6c 00 00 94 	bl	#432
    280c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2810:	00 01 00 b9 	str	w0, [x8]
    2814:	39 00 00 14 	b	#228
    2818:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    281c:	00 01 40 f9 	ldr	x0, [x8]
    2820:	68 00 00 94 	bl	#416
    2824:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2828:	00 09 00 b9 	str	w0, [x8, #8]
    282c:	33 00 00 14 	b	#204
    2830:	78 00 00 94 	bl	#480
    2834:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2838:	00 01 00 f9 	str	x0, [x8]
    283c:	2f 00 00 14 	b	#188
    2840:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2844:	00 01 40 b9 	ldr	w0, [x8]
    2848:	80 00 00 94 	bl	#512
    284c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2850:	00 05 00 b9 	str	w0, [x8, #4]
    2854:	29 00 00 14 	b	#164
    2858:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    285c:	00 01 40 b9 	ldr	w0, [x8]
    2860:	94 00 00 94 	bl	#592
    2864:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2868:	00 05 00 f9 	str	x0, [x8, #8]
    286c:	23 00 00 14 	b	#140
    2870:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2874:	00 01 40 f9 	ldr	x0, [x8]
    2878:	9a 00 00 94 	bl	#616
    287c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2880:	00 09 00 b9 	str	w0, [x8, #8]
    2884:	1d 00 00 14 	b	#116
    2888:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    288c:	00 01 40 b9 	ldr	w0, [x8]
    2890:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2894:	01 05 40 b9 	ldr	w1, [x8, #4]
    2898:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    289c:	02 05 40 f9 	ldr	x2, [x8, #8]
    28a0:	9e 00 00 94 	bl	#632
    28a4:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28a8:	00 11 00 b9 	str	w0, [x8, #16]
    28ac:	13 00 00 14 	b	#76
    28b0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28b4:	00 01 40 b9 	ldr	w0, [x8]
    28b8:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28bc:	01 05 40 f9 	ldr	x1, [x8, #8]
    28c0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28c4:	02 09 40 f9 	ldr	x2, [x8, #16]
    28c8:	be 00 00 94 	bl	#760
    28cc:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28d0:	00 0d 00 f9 	str	x0, [x8, #24]
    28d4:	09 00 00 14 	b	#36
    28d8:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28dc:	00 01 40 b9 	ldr	w0, [x8]
    28e0:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28e4:	01 05 40 f9 	ldr	x1, [x8, #8]
    28e8:	46 fd ff 97 	bl	#-2792
    28ec:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    28f0:	00 11 00 b9 	str	w0, [x8, #16]
    28f4:	01 00 00 14 	b	#4
    28f8:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    28fc:	ff c3 00 91 	add	sp, sp, #48
    2900:	c0 03 5f d6 	ret
    2904:	1f 20 03 d5 	nop

thread_exit:
    2908:	ff c3 00 d1 	sub	sp, sp, #48
    290c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    2910:	fd 83 00 91 	add	x29, sp, #32
    2914:	08 00 00 d0 	adrp	x8, #8192
    2918:	08 01 01 91 	add	x8, x8, #64
    291c:	e9 03 7d b2 	orr	x9, xzr, #0x8
    2920:	0a 00 00 b0 	adrp	x10, #4096
    2924:	4a d5 3e 91 	add	x10, x10, #4021
    2928:	0b 00 80 52 	mov	w11, #0
    292c:	02 2f 80 d2 	mov	x2, #376
    2930:	0c 01 40 f9 	ldr	x12, [x8]
    2934:	89 01 09 8b 	add	x9, x12, x9
    2938:	e0 03 09 aa 	mov	x0, x9
    293c:	a8 83 1f f8 	stur	x8, [x29, #-8]
    2940:	e2 0b 00 f9 	str	x2, [sp, #16]
    2944:	ea 07 00 f9 	str	x10, [sp, #8]
    2948:	eb 07 00 b9 	str	w11, [sp, #4]
    294c:	7d fa ff 97 	bl	#-5644
    2950:	e2 07 40 f9 	ldr	x2, [sp, #8]
    2954:	e0 03 02 aa 	mov	x0, x2
    2958:	7a fa ff 97 	bl	#-5656
    295c:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2960:	09 01 40 f9 	ldr	x9, [x8]
    2964:	e0 03 09 aa 	mov	x0, x9
    2968:	e1 07 40 b9 	ldr	w1, [sp, #4]
    296c:	e2 0b 40 f9 	ldr	x2, [sp, #16]
    2970:	32 f9 ff 97 	bl	#-6968
    2974:	eb 07 40 b9 	ldr	w11, [sp, #4]
    2978:	e0 03 0b 2a 	mov	w0, w11
    297c:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    2980:	ff c3 00 91 	add	sp, sp, #48
    2984:	c0 03 5f d6 	ret

thread_wait:
    2988:	ff 83 00 d1 	sub	sp, sp, #32
    298c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2990:	fd 43 00 91 	add	x29, sp, #16
    2994:	00 00 80 52 	mov	w0, #0
    2998:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    299c:	77 fe ff 97 	bl	#-1572
    29a0:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    29a4:	e0 03 08 2a 	mov	w0, w8
    29a8:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    29ac:	ff 83 00 91 	add	sp, sp, #32
    29b0:	c0 03 5f d6 	ret
    29b4:	1f 20 03 d5 	nop

thread_sleep:
    29b8:	00 00 80 52 	mov	w0, #0
    29bc:	c0 03 5f d6 	ret

thread_wakeup:
    29c0:	ff c3 00 d1 	sub	sp, sp, #48
    29c4:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    29c8:	fd 83 00 91 	add	x29, sp, #32
    29cc:	08 00 00 d0 	adrp	x8, #8192
    29d0:	08 01 01 91 	add	x8, x8, #64
    29d4:	09 00 80 52 	mov	w9, #0
    29d8:	a0 83 1f f8 	stur	x0, [x29, #-8]
    29dc:	a9 43 1f b8 	stur	w9, [x29, #-12]
    29e0:	e8 07 00 f9 	str	x8, [sp, #8]
    29e4:	65 fe ff 97 	bl	#-1644
    29e8:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    29ec:	ea 07 40 f9 	ldr	x10, [sp, #8]
    29f0:	48 01 00 f9 	str	x8, [x10]
    29f4:	61 fe ff 97 	bl	#-1660
    29f8:	a9 43 5f b8 	ldur	w9, [x29, #-12]
    29fc:	e0 03 09 2a 	mov	w0, w9
    2a00:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    2a04:	ff c3 00 91 	add	sp, sp, #48
    2a08:	c0 03 5f d6 	ret
    2a0c:	1f 20 03 d5 	nop

thread_getid:
    2a10:	ff 83 00 d1 	sub	sp, sp, #32
    2a14:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2a18:	fd 43 00 91 	add	x29, sp, #16
    2a1c:	08 00 00 d0 	adrp	x8, #8192
    2a20:	08 01 01 91 	add	x8, x8, #64
    2a24:	e8 07 00 f9 	str	x8, [sp, #8]
    2a28:	54 fe ff 97 	bl	#-1712
    2a2c:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2a30:	09 01 40 f9 	ldr	x9, [x8]
    2a34:	e0 03 09 aa 	mov	x0, x9
    2a38:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2a3c:	ff 83 00 91 	add	sp, sp, #32
    2a40:	c0 03 5f d6 	ret
    2a44:	1f 20 03 d5 	nop

thread_chpri:
    2a48:	ff 83 00 d1 	sub	sp, sp, #32
    2a4c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2a50:	fd 43 00 91 	add	x29, sp, #16
    2a54:	08 00 00 d0 	adrp	x8, #8192
    2a58:	08 01 01 91 	add	x8, x8, #64
    2a5c:	09 00 80 52 	mov	w9, #0
    2a60:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2a64:	0a 01 40 f9 	ldr	x10, [x8]
    2a68:	40 19 40 b9 	ldr	w0, [x10, #24]
    2a6c:	e0 0b 00 b9 	str	w0, [sp, #8]
    2a70:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    2a74:	1f 00 09 6b 	cmp	w0, w9
    2a78:	e9 b7 9f 1a 	cset	w9, ge
    2a7c:	e8 03 00 f9 	str	x8, [sp]
    2a80:	49 00 00 37 	tbnz	w9, #0, #8
    2a84:	05 00 00 14 	b	#20
    2a88:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    2a8c:	e9 03 40 f9 	ldr	x9, [sp]
    2a90:	2a 01 40 f9 	ldr	x10, [x9]
    2a94:	48 19 00 b9 	str	w8, [x10, #24]
    2a98:	38 fe ff 97 	bl	#-1824
    2a9c:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    2aa0:	e0 03 08 2a 	mov	w0, w8
    2aa4:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2aa8:	ff 83 00 91 	add	sp, sp, #32
    2aac:	c0 03 5f d6 	ret

thread_kmalloc:
    2ab0:	ff 83 00 d1 	sub	sp, sp, #32
    2ab4:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2ab8:	fd 43 00 91 	add	x29, sp, #16
    2abc:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2ac0:	2e fe ff 97 	bl	#-1864
    2ac4:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    2ac8:	e0 03 08 2a 	mov	w0, w8
    2acc:	87 02 00 94 	bl	#2588
    2ad0:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2ad4:	ff 83 00 91 	add	sp, sp, #32
    2ad8:	c0 03 5f d6 	ret
    2adc:	1f 20 03 d5 	nop

thread_kmfree:
    2ae0:	ff 83 00 d1 	sub	sp, sp, #32
    2ae4:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2ae8:	fd 43 00 91 	add	x29, sp, #16
    2aec:	08 00 80 52 	mov	w8, #0
    2af0:	e0 07 00 f9 	str	x0, [sp, #8]
    2af4:	e0 07 40 f9 	ldr	x0, [sp, #8]
    2af8:	e8 07 00 b9 	str	w8, [sp, #4]
    2afc:	b7 02 00 94 	bl	#2780
    2b00:	1e fe ff 97 	bl	#-1928
    2b04:	e8 07 40 b9 	ldr	w8, [sp, #4]
    2b08:	e0 03 08 2a 	mov	w0, w8
    2b0c:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2b10:	ff 83 00 91 	add	sp, sp, #32
    2b14:	c0 03 5f d6 	ret

thread_send:
    2b18:	ff c3 00 d1 	sub	sp, sp, #48
    2b1c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    2b20:	fd 83 00 91 	add	x29, sp, #32
    2b24:	08 00 00 d0 	adrp	x8, #8192
    2b28:	08 c1 28 91 	add	x8, x8, #2608
    2b2c:	e9 03 7b b2 	orr	x9, xzr, #0x20
    2b30:	0a 00 00 d0 	adrp	x10, #8192
    2b34:	4a 01 01 91 	add	x10, x10, #64
    2b38:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    2b3c:	a1 83 1f b8 	stur	w1, [x29, #-8]
    2b40:	e2 0b 00 f9 	str	x2, [sp, #16]
    2b44:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    2b48:	e2 03 00 2a 	mov	w2, w0
    2b4c:	42 7c 40 d3 	ubfx	x2, x2, #0, #32
    2b50:	29 7d 02 9b 	mul	x9, x9, x2
    2b54:	08 01 09 8b 	add	x8, x8, x9
    2b58:	e8 07 00 f9 	str	x8, [sp, #8]
    2b5c:	ea 03 00 f9 	str	x10, [sp]
    2b60:	06 fe ff 97 	bl	#-2024
    2b64:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2b68:	e9 03 40 f9 	ldr	x9, [sp]
    2b6c:	21 01 40 f9 	ldr	x1, [x9]
    2b70:	a2 83 5f b8 	ldur	w2, [x29, #-8]
    2b74:	e3 0b 40 f9 	ldr	x3, [sp, #16]
    2b78:	e0 03 08 aa 	mov	x0, x8
    2b7c:	43 00 00 94 	bl	#268
    2b80:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2b84:	08 01 40 f9 	ldr	x8, [x8]
    2b88:	48 00 00 b5 	cbnz	x8, #8
    2b8c:	08 00 00 14 	b	#32
    2b90:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2b94:	08 01 40 f9 	ldr	x8, [x8]
    2b98:	e9 03 40 f9 	ldr	x9, [sp]
    2b9c:	28 01 00 f9 	str	x8, [x9]
    2ba0:	e0 07 40 f9 	ldr	x0, [sp, #8]
    2ba4:	69 00 00 94 	bl	#420
    2ba8:	f4 fd ff 97 	bl	#-2096
    2bac:	a0 83 5f b8 	ldur	w0, [x29, #-8]
    2bb0:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    2bb4:	ff c3 00 91 	add	sp, sp, #48
    2bb8:	c0 03 5f d6 	ret
    2bbc:	1f 20 03 d5 	nop

thread_recv:
    2bc0:	ff 43 01 d1 	sub	sp, sp, #80
    2bc4:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    2bc8:	fd 03 01 91 	add	x29, sp, #64
    2bcc:	08 00 00 d0 	adrp	x8, #8192
    2bd0:	08 c1 28 91 	add	x8, x8, #2608
    2bd4:	e9 03 7b b2 	orr	x9, xzr, #0x20
    2bd8:	0a 00 00 d0 	adrp	x10, #8192
    2bdc:	4a 01 01 91 	add	x10, x10, #64
    2be0:	a0 43 1f b8 	stur	w0, [x29, #-12]
    2be4:	a1 83 1e f8 	stur	x1, [x29, #-24]
    2be8:	e2 13 00 f9 	str	x2, [sp, #32]
    2bec:	a0 43 5f b8 	ldur	w0, [x29, #-12]
    2bf0:	e1 03 00 2a 	mov	w1, w0
    2bf4:	21 7c 40 d3 	ubfx	x1, x1, #0, #32
    2bf8:	29 7d 01 9b 	mul	x9, x9, x1
    2bfc:	08 01 09 8b 	add	x8, x8, x9
    2c00:	e8 0f 00 f9 	str	x8, [sp, #24]
    2c04:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    2c08:	08 01 40 f9 	ldr	x8, [x8]
    2c0c:	ea 0b 00 f9 	str	x10, [sp, #16]
    2c10:	48 00 00 b5 	cbnz	x8, #8
    2c14:	02 00 00 14 	b	#8
    2c18:	72 fd ff 97 	bl	#-2616
    2c1c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2c20:	09 01 40 f9 	ldr	x9, [x8]
    2c24:	ea 0f 40 f9 	ldr	x10, [sp, #24]
    2c28:	49 01 00 f9 	str	x9, [x10]
    2c2c:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    2c30:	29 05 40 f9 	ldr	x9, [x9, #8]
    2c34:	49 00 00 b4 	cbz	x9, #8
    2c38:	04 00 00 14 	b	#16
    2c3c:	08 00 80 92 	mov	x8, #-1
    2c40:	a8 83 1f f8 	stur	x8, [x29, #-8]
    2c44:	0d 00 00 14 	b	#52
    2c48:	08 09 80 d2 	mov	x8, #72
    2c4c:	e0 0f 40 f9 	ldr	x0, [sp, #24]
    2c50:	e8 07 00 f9 	str	x8, [sp, #8]
    2c54:	3d 00 00 94 	bl	#244
    2c58:	c8 fd ff 97 	bl	#-2272
    2c5c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2c60:	09 01 40 f9 	ldr	x9, [x8]
    2c64:	ea 07 40 f9 	ldr	x10, [sp, #8]
    2c68:	29 01 0a 8b 	add	x9, x9, x10
    2c6c:	29 05 40 f9 	ldr	x9, [x9, #8]
    2c70:	29 0d 40 f9 	ldr	x9, [x9, #24]
    2c74:	a9 83 1f f8 	stur	x9, [x29, #-8]
    2c78:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    2c7c:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    2c80:	ff 43 01 91 	add	sp, sp, #80
    2c84:	c0 03 5f d6 	ret

sendmsg:
    2c88:	ff 03 01 d1 	sub	sp, sp, #64
    2c8c:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    2c90:	fd c3 00 91 	add	x29, sp, #48
    2c94:	e8 03 1b 32 	orr	w8, wzr, #0x20
    2c98:	a0 83 1f f8 	stur	x0, [x29, #-8]
    2c9c:	a1 03 1f f8 	stur	x1, [x29, #-16]
    2ca0:	a2 c3 1e b8 	stur	w2, [x29, #-20]
    2ca4:	e3 0b 00 f9 	str	x3, [sp, #16]
    2ca8:	e0 03 08 2a 	mov	w0, w8
    2cac:	0f 02 00 94 	bl	#2108
    2cb0:	e0 07 00 f9 	str	x0, [sp, #8]
    2cb4:	e0 07 40 f9 	ldr	x0, [sp, #8]
    2cb8:	40 00 00 b4 	cbz	x0, #8
    2cbc:	02 00 00 14 	b	#8
    2cc0:	48 fd ff 97 	bl	#-2784
    2cc4:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2cc8:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2ccc:	3f 01 00 f9 	str	xzr, [x9]
    2cd0:	a9 03 5f f8 	ldur	x9, [x29, #-16]
    2cd4:	ea 07 40 f9 	ldr	x10, [sp, #8]
    2cd8:	49 05 00 f9 	str	x9, [x10, #8]
    2cdc:	ab c3 5e b8 	ldur	w11, [x29, #-20]
    2ce0:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2ce4:	29 01 08 8b 	add	x9, x9, x8
    2ce8:	2b 01 00 b9 	str	w11, [x9]
    2cec:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2cf0:	ea 07 40 f9 	ldr	x10, [sp, #8]
    2cf4:	48 01 08 8b 	add	x8, x10, x8
    2cf8:	09 05 00 f9 	str	x9, [x8, #8]
    2cfc:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2d00:	08 09 40 f9 	ldr	x8, [x8, #16]
    2d04:	48 00 00 b5 	cbnz	x8, #8
    2d08:	06 00 00 14 	b	#24
    2d0c:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2d10:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    2d14:	29 09 40 f9 	ldr	x9, [x9, #16]
    2d18:	28 01 00 f9 	str	x8, [x9]
    2d1c:	04 00 00 14 	b	#16
    2d20:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2d24:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    2d28:	28 05 00 f9 	str	x8, [x9, #8]
    2d2c:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2d30:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    2d34:	28 09 00 f9 	str	x8, [x9, #16]
    2d38:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    2d3c:	ff 03 01 91 	add	sp, sp, #64
    2d40:	c0 03 5f d6 	ret
    2d44:	1f 20 03 d5 	nop

recvmsg:
    2d48:	ff c3 00 d1 	sub	sp, sp, #48
    2d4c:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    2d50:	fd 83 00 91 	add	x29, sp, #32
    2d54:	a0 83 1f f8 	stur	x0, [x29, #-8]
    2d58:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    2d5c:	00 04 40 f9 	ldr	x0, [x0, #8]
    2d60:	e0 0b 00 f9 	str	x0, [sp, #16]
    2d64:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    2d68:	00 00 40 f9 	ldr	x0, [x0]
    2d6c:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2d70:	00 05 00 f9 	str	x0, [x8, #8]
    2d74:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2d78:	08 05 40 f9 	ldr	x8, [x8, #8]
    2d7c:	48 00 00 b4 	cbz	x8, #8
    2d80:	03 00 00 14 	b	#12
    2d84:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2d88:	1f 09 00 f9 	str	xzr, [x8, #16]
    2d8c:	08 09 80 d2 	mov	x8, #72
    2d90:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2d94:	3f 01 00 f9 	str	xzr, [x9]
    2d98:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    2d9c:	29 01 40 f9 	ldr	x9, [x9]
    2da0:	28 01 08 8b 	add	x8, x9, x8
    2da4:	08 05 40 f9 	ldr	x8, [x8, #8]
    2da8:	e8 07 00 f9 	str	x8, [sp, #8]
    2dac:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    2db0:	08 05 40 f9 	ldr	x8, [x8, #8]
    2db4:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2db8:	28 0d 00 f9 	str	x8, [x9, #24]
    2dbc:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2dc0:	08 05 40 f9 	ldr	x8, [x8, #8]
    2dc4:	48 00 00 b5 	cbnz	x8, #8
    2dc8:	08 00 00 14 	b	#32
    2dcc:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2dd0:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2dd4:	28 01 08 8b 	add	x8, x9, x8
    2dd8:	0a 01 40 b9 	ldr	w10, [x8]
    2ddc:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2de0:	08 05 40 f9 	ldr	x8, [x8, #8]
    2de4:	0a 01 00 b9 	str	w10, [x8]
    2de8:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2dec:	08 09 40 f9 	ldr	x8, [x8, #16]
    2df0:	48 00 00 b5 	cbnz	x8, #8
    2df4:	08 00 00 14 	b	#32
    2df8:	e8 03 7c b2 	orr	x8, xzr, #0x10
    2dfc:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    2e00:	28 01 08 8b 	add	x8, x9, x8
    2e04:	08 05 40 f9 	ldr	x8, [x8, #8]
    2e08:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2e0c:	29 09 40 f9 	ldr	x9, [x9, #16]
    2e10:	28 01 00 f9 	str	x8, [x9]
    2e14:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    2e18:	1f 01 00 f9 	str	xzr, [x8]
    2e1c:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    2e20:	ee 01 00 94 	bl	#1976
    2e24:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    2e28:	ff c3 00 91 	add	sp, sp, #48
    2e2c:	c0 03 5f d6 	ret

thread_init:
    2e30:	ff 83 00 d1 	sub	sp, sp, #32
    2e34:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    2e38:	fd 43 00 91 	add	x29, sp, #16
    2e3c:	e8 07 7c b2 	orr	x8, xzr, #0x30
    2e40:	e0 07 00 f9 	str	x0, [sp, #8]
    2e44:	e0 07 40 f9 	ldr	x0, [sp, #8]
    2e48:	00 00 08 8b 	add	x0, x0, x8
    2e4c:	00 00 40 f9 	ldr	x0, [x0]
    2e50:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2e54:	29 01 08 8b 	add	x9, x9, x8
    2e58:	2a 09 40 b9 	ldr	w10, [x9, #8]
    2e5c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    2e60:	28 01 08 8b 	add	x8, x9, x8
    2e64:	01 09 40 f9 	ldr	x1, [x8, #16]
    2e68:	e0 03 00 f9 	str	x0, [sp]
    2e6c:	e0 03 0a 2a 	mov	w0, w10
    2e70:	e8 03 40 f9 	ldr	x8, [sp]
    2e74:	00 01 3f d6 	blr	x8
    2e78:	04 00 00 94 	bl	#16
    2e7c:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    2e80:	ff 83 00 91 	add	sp, sp, #32
    2e84:	c0 03 5f d6 	ret

thread_end:
    2e88:	fd 7b bf a9 	stp	x29, x30, [sp, #-16]!
    2e8c:	fd 03 00 91 	mov	x29, sp
    2e90:	2a 00 00 94 	bl	#168
    2e94:	fd 7b c1 a8 	ldp	x29, x30, [sp], #16
    2e98:	c0 03 5f d6 	ret
    2e9c:	00 00 00 00  <unknown>

kz_run:
    2ea0:	ff c3 01 d1 	sub	sp, sp, #112
    2ea4:	fd 7b 06 a9 	stp	x29, x30, [sp, #96]
    2ea8:	fd 83 01 91 	add	x29, sp, #96
    2eac:	08 00 80 52 	mov	w8, #0
    2eb0:	e9 23 00 91 	add	x9, sp, #8
    2eb4:	a0 83 1f f8 	stur	x0, [x29, #-8]
    2eb8:	a1 03 1f f8 	stur	x1, [x29, #-16]
    2ebc:	a2 c3 1e b8 	stur	w2, [x29, #-20]
    2ec0:	a3 83 1e b8 	stur	w3, [x29, #-24]
    2ec4:	a4 43 1e b8 	stur	w4, [x29, #-28]
    2ec8:	a5 83 1d f8 	stur	x5, [x29, #-40]
    2ecc:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    2ed0:	e1 03 09 aa 	mov	x1, x9
    2ed4:	20 00 00 f9 	str	x0, [x1]
    2ed8:	a0 03 5f f8 	ldur	x0, [x29, #-16]
    2edc:	e1 03 09 aa 	mov	x1, x9
    2ee0:	20 04 00 f9 	str	x0, [x1, #8]
    2ee4:	a2 c3 5e b8 	ldur	w2, [x29, #-20]
    2ee8:	e0 03 09 aa 	mov	x0, x9
    2eec:	02 10 00 b9 	str	w2, [x0, #16]
    2ef0:	a2 83 5e b8 	ldur	w2, [x29, #-24]
    2ef4:	e0 03 09 aa 	mov	x0, x9
    2ef8:	02 14 00 b9 	str	w2, [x0, #20]
    2efc:	a2 43 5e b8 	ldur	w2, [x29, #-28]
    2f00:	e0 03 09 aa 	mov	x0, x9
    2f04:	02 18 00 b9 	str	w2, [x0, #24]
    2f08:	a0 83 5d f8 	ldur	x0, [x29, #-40]
    2f0c:	e1 03 09 aa 	mov	x1, x9
    2f10:	20 10 00 f9 	str	x0, [x1, #32]
    2f14:	e0 03 08 2a 	mov	w0, w8
    2f18:	e1 03 09 aa 	mov	x1, x9
    2f1c:	e9 03 00 f9 	str	x9, [sp]
    2f20:	b8 fc ff 97 	bl	#-3360
    2f24:	e9 03 40 f9 	ldr	x9, [sp]
    2f28:	20 15 40 f9 	ldr	x0, [x9, #40]
    2f2c:	fd 7b 46 a9 	ldp	x29, x30, [sp, #96]
    2f30:	ff c3 01 91 	add	sp, sp, #112
    2f34:	c0 03 5f d6 	ret

kz_exit:
    2f38:	fd 7b bf a9 	stp	x29, x30, [sp, #-16]!
    2f3c:	fd 03 00 91 	mov	x29, sp
    2f40:	e0 03 00 32 	orr	w0, wzr, #0x1
    2f44:	01 00 80 d2 	mov	x1, #0
    2f48:	ae fc ff 97 	bl	#-3400
    2f4c:	fd 7b c1 a8 	ldp	x29, x30, [sp], #16
    2f50:	c0 03 5f d6 	ret
    2f54:	1f 20 03 d5 	nop

kz_wait:
    2f58:	ff 43 01 d1 	sub	sp, sp, #80
    2f5c:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    2f60:	fd 03 01 91 	add	x29, sp, #64
    2f64:	e0 03 1f 32 	orr	w0, wzr, #0x2
    2f68:	e8 43 00 91 	add	x8, sp, #16
    2f6c:	e1 03 08 aa 	mov	x1, x8
    2f70:	e8 07 00 f9 	str	x8, [sp, #8]
    2f74:	a3 fc ff 97 	bl	#-3444
    2f78:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2f7c:	00 01 40 b9 	ldr	w0, [x8]
    2f80:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    2f84:	ff 43 01 91 	add	sp, sp, #80
    2f88:	c0 03 5f d6 	ret
    2f8c:	1f 20 03 d5 	nop

kz_sleep:
    2f90:	ff 43 01 d1 	sub	sp, sp, #80
    2f94:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    2f98:	fd 03 01 91 	add	x29, sp, #64
    2f9c:	e0 07 00 32 	orr	w0, wzr, #0x3
    2fa0:	e8 43 00 91 	add	x8, sp, #16
    2fa4:	e1 03 08 aa 	mov	x1, x8
    2fa8:	e8 07 00 f9 	str	x8, [sp, #8]
    2fac:	95 fc ff 97 	bl	#-3500
    2fb0:	e8 07 40 f9 	ldr	x8, [sp, #8]
    2fb4:	00 01 40 b9 	ldr	w0, [x8]
    2fb8:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    2fbc:	ff 43 01 91 	add	sp, sp, #80
    2fc0:	c0 03 5f d6 	ret
    2fc4:	1f 20 03 d5 	nop

kz_wakeup:
    2fc8:	ff 43 01 d1 	sub	sp, sp, #80
    2fcc:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    2fd0:	fd 03 01 91 	add	x29, sp, #64
    2fd4:	e8 03 1e 32 	orr	w8, wzr, #0x4
    2fd8:	e9 23 00 91 	add	x9, sp, #8
    2fdc:	a0 83 1f f8 	stur	x0, [x29, #-8]
    2fe0:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    2fe4:	e1 03 09 aa 	mov	x1, x9
    2fe8:	20 00 00 f9 	str	x0, [x1]
    2fec:	e0 03 08 2a 	mov	w0, w8
    2ff0:	e1 03 09 aa 	mov	x1, x9
    2ff4:	e9 03 00 f9 	str	x9, [sp]
    2ff8:	82 fc ff 97 	bl	#-3576
    2ffc:	e9 03 40 f9 	ldr	x9, [sp]
    3000:	20 09 40 b9 	ldr	w0, [x9, #8]
    3004:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3008:	ff 43 01 91 	add	sp, sp, #80
    300c:	c0 03 5f d6 	ret

kz_getid:
    3010:	ff 43 01 d1 	sub	sp, sp, #80
    3014:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3018:	fd 03 01 91 	add	x29, sp, #64
    301c:	a0 00 80 52 	mov	w0, #5
    3020:	e8 43 00 91 	add	x8, sp, #16
    3024:	e1 03 08 aa 	mov	x1, x8
    3028:	e8 07 00 f9 	str	x8, [sp, #8]
    302c:	75 fc ff 97 	bl	#-3628
    3030:	e8 07 40 f9 	ldr	x8, [sp, #8]
    3034:	00 01 40 f9 	ldr	x0, [x8]
    3038:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    303c:	ff 43 01 91 	add	sp, sp, #80
    3040:	c0 03 5f d6 	ret
    3044:	1f 20 03 d5 	nop

kz_chpri:
    3048:	ff 43 01 d1 	sub	sp, sp, #80
    304c:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3050:	fd 03 01 91 	add	x29, sp, #64
    3054:	e8 07 1f 32 	orr	w8, wzr, #0x6
    3058:	e9 23 00 91 	add	x9, sp, #8
    305c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    3060:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    3064:	e1 03 09 aa 	mov	x1, x9
    3068:	20 00 00 b9 	str	w0, [x1]
    306c:	e0 03 08 2a 	mov	w0, w8
    3070:	e1 03 09 aa 	mov	x1, x9
    3074:	e9 03 00 f9 	str	x9, [sp]
    3078:	62 fc ff 97 	bl	#-3704
    307c:	e9 03 40 f9 	ldr	x9, [sp]
    3080:	20 05 40 b9 	ldr	w0, [x9, #4]
    3084:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3088:	ff 43 01 91 	add	sp, sp, #80
    308c:	c0 03 5f d6 	ret

kz_kmalloc:
    3090:	ff 43 01 d1 	sub	sp, sp, #80
    3094:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3098:	fd 03 01 91 	add	x29, sp, #64
    309c:	e8 0b 00 32 	orr	w8, wzr, #0x7
    30a0:	e9 23 00 91 	add	x9, sp, #8
    30a4:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    30a8:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    30ac:	e1 03 09 aa 	mov	x1, x9
    30b0:	20 00 00 b9 	str	w0, [x1]
    30b4:	e0 03 08 2a 	mov	w0, w8
    30b8:	e1 03 09 aa 	mov	x1, x9
    30bc:	e9 03 00 f9 	str	x9, [sp]
    30c0:	50 fc ff 97 	bl	#-3776
    30c4:	e9 03 40 f9 	ldr	x9, [sp]
    30c8:	20 05 40 f9 	ldr	x0, [x9, #8]
    30cc:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    30d0:	ff 43 01 91 	add	sp, sp, #80
    30d4:	c0 03 5f d6 	ret

kz_kmfree:
    30d8:	ff 43 01 d1 	sub	sp, sp, #80
    30dc:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    30e0:	fd 03 01 91 	add	x29, sp, #64
    30e4:	e8 03 1d 32 	orr	w8, wzr, #0x8
    30e8:	e9 23 00 91 	add	x9, sp, #8
    30ec:	a0 83 1f f8 	stur	x0, [x29, #-8]
    30f0:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    30f4:	e1 03 09 aa 	mov	x1, x9
    30f8:	20 00 00 f9 	str	x0, [x1]
    30fc:	e0 03 08 2a 	mov	w0, w8
    3100:	e1 03 09 aa 	mov	x1, x9
    3104:	e9 03 00 f9 	str	x9, [sp]
    3108:	3e fc ff 97 	bl	#-3848
    310c:	e9 03 40 f9 	ldr	x9, [sp]
    3110:	20 09 40 b9 	ldr	w0, [x9, #8]
    3114:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3118:	ff 43 01 91 	add	sp, sp, #80
    311c:	c0 03 5f d6 	ret

kz_send:
    3120:	ff 83 01 d1 	sub	sp, sp, #96
    3124:	fd 7b 05 a9 	stp	x29, x30, [sp, #80]
    3128:	fd 43 01 91 	add	x29, sp, #80
    312c:	28 01 80 52 	mov	w8, #9
    3130:	e9 43 00 91 	add	x9, sp, #16
    3134:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    3138:	a1 83 1f b8 	stur	w1, [x29, #-8]
    313c:	a2 03 1f f8 	stur	x2, [x29, #-16]
    3140:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    3144:	e2 03 09 aa 	mov	x2, x9
    3148:	40 00 00 b9 	str	w0, [x2]
    314c:	a0 83 5f b8 	ldur	w0, [x29, #-8]
    3150:	e2 03 09 aa 	mov	x2, x9
    3154:	40 04 00 b9 	str	w0, [x2, #4]
    3158:	a2 03 5f f8 	ldur	x2, [x29, #-16]
    315c:	ea 03 09 aa 	mov	x10, x9
    3160:	42 05 00 f9 	str	x2, [x10, #8]
    3164:	e0 03 08 2a 	mov	w0, w8
    3168:	e1 03 09 aa 	mov	x1, x9
    316c:	e9 07 00 f9 	str	x9, [sp, #8]
    3170:	24 fc ff 97 	bl	#-3952
    3174:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3178:	20 11 40 b9 	ldr	w0, [x9, #16]
    317c:	fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
    3180:	ff 83 01 91 	add	sp, sp, #96
    3184:	c0 03 5f d6 	ret

kz_recv:
    3188:	ff 83 01 d1 	sub	sp, sp, #96
    318c:	fd 7b 05 a9 	stp	x29, x30, [sp, #80]
    3190:	fd 43 01 91 	add	x29, sp, #80
    3194:	48 01 80 52 	mov	w8, #10
    3198:	e9 23 00 91 	add	x9, sp, #8
    319c:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    31a0:	a1 03 1f f8 	stur	x1, [x29, #-16]
    31a4:	a2 83 1e f8 	stur	x2, [x29, #-24]
    31a8:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    31ac:	e1 03 09 aa 	mov	x1, x9
    31b0:	20 00 00 b9 	str	w0, [x1]
    31b4:	a1 03 5f f8 	ldur	x1, [x29, #-16]
    31b8:	e2 03 09 aa 	mov	x2, x9
    31bc:	41 04 00 f9 	str	x1, [x2, #8]
    31c0:	a1 83 5e f8 	ldur	x1, [x29, #-24]
    31c4:	e2 03 09 aa 	mov	x2, x9
    31c8:	41 08 00 f9 	str	x1, [x2, #16]
    31cc:	e0 03 08 2a 	mov	w0, w8
    31d0:	e1 03 09 aa 	mov	x1, x9
    31d4:	e9 03 00 f9 	str	x9, [sp]
    31d8:	0a fc ff 97 	bl	#-4056
    31dc:	e9 03 40 f9 	ldr	x9, [sp]
    31e0:	20 0d 40 f9 	ldr	x0, [x9, #24]
    31e4:	fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
    31e8:	ff 83 01 91 	add	sp, sp, #96
    31ec:	c0 03 5f d6 	ret

kz_setintr:
    31f0:	ff 83 01 d1 	sub	sp, sp, #96
    31f4:	fd 7b 05 a9 	stp	x29, x30, [sp, #80]
    31f8:	fd 43 01 91 	add	x29, sp, #80
    31fc:	68 01 80 52 	mov	w8, #11
    3200:	e9 43 00 91 	add	x9, sp, #16
    3204:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    3208:	a1 03 1f f8 	stur	x1, [x29, #-16]
    320c:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    3210:	e1 03 09 aa 	mov	x1, x9
    3214:	20 00 00 b9 	str	w0, [x1]
    3218:	a1 03 5f f8 	ldur	x1, [x29, #-16]
    321c:	ea 03 09 aa 	mov	x10, x9
    3220:	41 05 00 f9 	str	x1, [x10, #8]
    3224:	e0 03 08 2a 	mov	w0, w8
    3228:	e1 03 09 aa 	mov	x1, x9
    322c:	e9 07 00 f9 	str	x9, [sp, #8]
    3230:	f4 fb ff 97 	bl	#-4144
    3234:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3238:	20 11 40 b9 	ldr	w0, [x9, #16]
    323c:	fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
    3240:	ff 83 01 91 	add	sp, sp, #96
    3244:	c0 03 5f d6 	ret

kx_wakeup:
    3248:	ff 43 01 d1 	sub	sp, sp, #80
    324c:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3250:	fd 03 01 91 	add	x29, sp, #64
    3254:	e8 03 1e 32 	orr	w8, wzr, #0x4
    3258:	e9 23 00 91 	add	x9, sp, #8
    325c:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3260:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3264:	e1 03 09 aa 	mov	x1, x9
    3268:	20 00 00 f9 	str	x0, [x1]
    326c:	e0 03 08 2a 	mov	w0, w8
    3270:	e1 03 09 aa 	mov	x1, x9
    3274:	e9 03 00 f9 	str	x9, [sp]
    3278:	f4 fb ff 97 	bl	#-4144
    327c:	e9 03 40 f9 	ldr	x9, [sp]
    3280:	20 09 40 b9 	ldr	w0, [x9, #8]
    3284:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3288:	ff 43 01 91 	add	sp, sp, #80
    328c:	c0 03 5f d6 	ret

kx_kmalloc:
    3290:	ff 43 01 d1 	sub	sp, sp, #80
    3294:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3298:	fd 03 01 91 	add	x29, sp, #64
    329c:	e8 0b 00 32 	orr	w8, wzr, #0x7
    32a0:	e9 23 00 91 	add	x9, sp, #8
    32a4:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    32a8:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    32ac:	e1 03 09 aa 	mov	x1, x9
    32b0:	20 00 00 b9 	str	w0, [x1]
    32b4:	e0 03 08 2a 	mov	w0, w8
    32b8:	e1 03 09 aa 	mov	x1, x9
    32bc:	e9 03 00 f9 	str	x9, [sp]
    32c0:	e2 fb ff 97 	bl	#-4216
    32c4:	e9 03 40 f9 	ldr	x9, [sp]
    32c8:	20 05 40 f9 	ldr	x0, [x9, #8]
    32cc:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    32d0:	ff 43 01 91 	add	sp, sp, #80
    32d4:	c0 03 5f d6 	ret

kx_kmfree:
    32d8:	ff 43 01 d1 	sub	sp, sp, #80
    32dc:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    32e0:	fd 03 01 91 	add	x29, sp, #64
    32e4:	e8 03 1d 32 	orr	w8, wzr, #0x8
    32e8:	e9 23 00 91 	add	x9, sp, #8
    32ec:	a0 83 1f f8 	stur	x0, [x29, #-8]
    32f0:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    32f4:	e1 03 09 aa 	mov	x1, x9
    32f8:	20 00 00 f9 	str	x0, [x1]
    32fc:	e0 03 08 2a 	mov	w0, w8
    3300:	e1 03 09 aa 	mov	x1, x9
    3304:	e9 03 00 f9 	str	x9, [sp]
    3308:	d0 fb ff 97 	bl	#-4288
    330c:	e9 03 40 f9 	ldr	x9, [sp]
    3310:	20 09 40 b9 	ldr	w0, [x9, #8]
    3314:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3318:	ff 43 01 91 	add	sp, sp, #80
    331c:	c0 03 5f d6 	ret

kx_send:
    3320:	ff 83 01 d1 	sub	sp, sp, #96
    3324:	fd 7b 05 a9 	stp	x29, x30, [sp, #80]
    3328:	fd 43 01 91 	add	x29, sp, #80
    332c:	28 01 80 52 	mov	w8, #9
    3330:	e9 43 00 91 	add	x9, sp, #16
    3334:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    3338:	a1 83 1f b8 	stur	w1, [x29, #-8]
    333c:	a2 03 1f f8 	stur	x2, [x29, #-16]
    3340:	a0 c3 5f b8 	ldur	w0, [x29, #-4]
    3344:	e2 03 09 aa 	mov	x2, x9
    3348:	40 00 00 b9 	str	w0, [x2]
    334c:	a0 83 5f b8 	ldur	w0, [x29, #-8]
    3350:	e2 03 09 aa 	mov	x2, x9
    3354:	40 04 00 b9 	str	w0, [x2, #4]
    3358:	a2 03 5f f8 	ldur	x2, [x29, #-16]
    335c:	ea 03 09 aa 	mov	x10, x9
    3360:	42 05 00 f9 	str	x2, [x10, #8]
    3364:	e0 03 08 2a 	mov	w0, w8
    3368:	e1 03 09 aa 	mov	x1, x9
    336c:	e9 07 00 f9 	str	x9, [sp, #8]
    3370:	b6 fb ff 97 	bl	#-4392
    3374:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3378:	20 11 40 b9 	ldr	w0, [x9, #16]
    337c:	fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
    3380:	ff 83 01 91 	add	sp, sp, #96
    3384:	c0 03 5f d6 	ret

kzmem_init:
    3388:	ff 83 00 d1 	sub	sp, sp, #32
    338c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    3390:	fd 43 00 91 	add	x29, sp, #16
    3394:	08 00 00 b0 	adrp	x8, #4096
    3398:	08 21 00 91 	add	x8, x8, #8
    339c:	bf c3 1f b8 	stur	wzr, [x29, #-4]
    33a0:	e8 03 00 f9 	str	x8, [sp]
    33a4:	e8 07 40 b2 	orr	x8, xzr, #0x3
    33a8:	a9 c3 9f b8 	ldursw	x9, [x29, #-4]
    33ac:	3f 01 08 eb 	cmp	x9, x8
    33b0:	ea 27 9f 1a 	cset	w10, lo
    33b4:	4a 00 00 37 	tbnz	w10, #0, #8
    33b8:	0c 00 00 14 	b	#48
    33bc:	e8 03 7c b2 	orr	x8, xzr, #0x10
    33c0:	a9 c3 9f b8 	ldursw	x9, [x29, #-4]
    33c4:	08 7d 09 9b 	mul	x8, x8, x9
    33c8:	e9 03 40 f9 	ldr	x9, [sp]
    33cc:	28 01 08 8b 	add	x8, x9, x8
    33d0:	e0 03 08 aa 	mov	x0, x8
    33d4:	09 00 00 94 	bl	#36
    33d8:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    33dc:	08 05 00 11 	add	w8, w8, #1
    33e0:	a8 c3 1f b8 	stur	w8, [x29, #-4]
    33e4:	f0 ff ff 17 	b	#-64
    33e8:	00 00 80 52 	mov	w0, #0
    33ec:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    33f0:	ff 83 00 91 	add	sp, sp, #32
    33f4:	c0 03 5f d6 	ret

kzmem_init_pool:
    33f8:	ff 03 01 d1 	sub	sp, sp, #64
    33fc:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    3400:	fd c3 00 91 	add	x29, sp, #48
    3404:	08 00 00 b0 	adrp	x8, #4096
    3408:	08 e1 00 91 	add	x8, x8, #56
    340c:	e9 03 7d b2 	orr	x9, xzr, #0x8
    3410:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3414:	00 01 40 f9 	ldr	x0, [x8]
    3418:	e0 0f 00 f9 	str	x0, [sp, #24]
    341c:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3420:	09 00 09 8b 	add	x9, x0, x9
    3424:	e9 0b 00 f9 	str	x9, [sp, #16]
    3428:	bf 43 1f b8 	stur	wzr, [x29, #-12]
    342c:	e8 07 00 f9 	str	x8, [sp, #8]
    3430:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    3434:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3438:	2a 05 40 b9 	ldr	w10, [x9, #4]
    343c:	1f 01 0a 6b 	cmp	w8, w10
    3440:	e8 a7 9f 1a 	cset	w8, lt
    3444:	48 00 00 37 	tbnz	w8, #0, #8
    3448:	24 00 00 14 	b	#144
    344c:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3450:	e2 03 7c b2 	orr	x2, xzr, #0x10
    3454:	01 00 80 52 	mov	w1, #0
    3458:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    345c:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    3460:	49 01 00 f9 	str	x9, [x10]
    3464:	e0 0f 40 f9 	ldr	x0, [sp, #24]
    3468:	e8 03 00 f9 	str	x8, [sp]
    346c:	73 f6 ff 97 	bl	#-9780
    3470:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3474:	01 01 40 b9 	ldr	w1, [x8]
    3478:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    347c:	01 09 00 b9 	str	w1, [x8, #8]
    3480:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    3484:	e8 0b 00 f9 	str	x8, [sp, #16]
    3488:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    348c:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3490:	29 01 80 b9 	ldrsw	x9, [x9]
    3494:	ea 03 40 f9 	ldr	x10, [sp]
    3498:	49 7d 09 9b 	mul	x9, x10, x9
    349c:	08 01 09 8b 	add	x8, x8, x9
    34a0:	e8 0f 00 f9 	str	x8, [sp, #24]
    34a4:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    34a8:	01 01 40 b9 	ldr	w1, [x8]
    34ac:	e8 07 40 f9 	ldr	x8, [sp, #8]
    34b0:	09 01 40 f9 	ldr	x9, [x8]
    34b4:	e2 03 01 2a 	mov	w2, w1
    34b8:	42 7c 40 93 	sxtw	x2, w2
    34bc:	42 7d 02 9b 	mul	x2, x10, x2
    34c0:	29 01 02 8b 	add	x9, x9, x2
    34c4:	09 01 00 f9 	str	x9, [x8]
    34c8:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    34cc:	08 05 00 11 	add	w8, w8, #1
    34d0:	a8 43 1f b8 	stur	w8, [x29, #-12]
    34d4:	d7 ff ff 17 	b	#-164
    34d8:	00 00 80 52 	mov	w0, #0
    34dc:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    34e0:	ff 03 01 91 	add	sp, sp, #64
    34e4:	c0 03 5f d6 	ret

kzmem_alloc:
    34e8:	ff 03 01 d1 	sub	sp, sp, #64
    34ec:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    34f0:	fd c3 00 91 	add	x29, sp, #48
    34f4:	08 00 00 b0 	adrp	x8, #4096
    34f8:	08 21 00 91 	add	x8, x8, #8
    34fc:	a0 43 1f b8 	stur	w0, [x29, #-12]
    3500:	bf 03 1f b8 	stur	wzr, [x29, #-16]
    3504:	e8 07 00 f9 	str	x8, [sp, #8]
    3508:	e8 07 40 b2 	orr	x8, xzr, #0x3
    350c:	a9 03 9f b8 	ldursw	x9, [x29, #-16]
    3510:	3f 01 08 eb 	cmp	x9, x8
    3514:	ea 27 9f 1a 	cset	w10, lo
    3518:	4a 00 00 37 	tbnz	w10, #0, #8
    351c:	29 00 00 14 	b	#164
    3520:	e8 03 7c b2 	orr	x8, xzr, #0x10
    3524:	a9 03 9f b8 	ldursw	x9, [x29, #-16]
    3528:	08 7d 09 9b 	mul	x8, x8, x9
    352c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3530:	28 01 08 8b 	add	x8, x9, x8
    3534:	e8 0b 00 f9 	str	x8, [sp, #16]
    3538:	a8 43 9f b8 	ldursw	x8, [x29, #-12]
    353c:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    3540:	4a 01 80 b9 	ldrsw	x10, [x10]
    3544:	4a 41 00 f1 	subs	x10, x10, #16
    3548:	1f 01 0a eb 	cmp	x8, x10
    354c:	eb 87 9f 1a 	cset	w11, ls
    3550:	4b 00 00 37 	tbnz	w11, #0, #8
    3554:	17 00 00 14 	b	#92
    3558:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    355c:	08 05 40 f9 	ldr	x8, [x8, #8]
    3560:	48 00 00 b4 	cbz	x8, #8
    3564:	04 00 00 14 	b	#16
    3568:	1e fb ff 97 	bl	#-5000
    356c:	bf 83 1f f8 	stur	xzr, [x29, #-8]
    3570:	16 00 00 14 	b	#88
    3574:	e8 03 7c b2 	orr	x8, xzr, #0x10
    3578:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    357c:	29 05 40 f9 	ldr	x9, [x9, #8]
    3580:	e9 0f 00 f9 	str	x9, [sp, #24]
    3584:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    3588:	29 05 40 f9 	ldr	x9, [x9, #8]
    358c:	29 01 40 f9 	ldr	x9, [x9]
    3590:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    3594:	49 05 00 f9 	str	x9, [x10, #8]
    3598:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    359c:	3f 01 00 f9 	str	xzr, [x9]
    35a0:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    35a4:	28 01 08 8b 	add	x8, x9, x8
    35a8:	a8 83 1f f8 	stur	x8, [x29, #-8]
    35ac:	07 00 00 14 	b	#28
    35b0:	a8 03 5f b8 	ldur	w8, [x29, #-16]
    35b4:	08 05 00 11 	add	w8, w8, #1
    35b8:	a8 03 1f b8 	stur	w8, [x29, #-16]
    35bc:	d3 ff ff 17 	b	#-180
    35c0:	08 fb ff 97 	bl	#-5088
    35c4:	bf 83 1f f8 	stur	xzr, [x29, #-8]
    35c8:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    35cc:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    35d0:	ff 03 01 91 	add	sp, sp, #64
    35d4:	c0 03 5f d6 	ret

kzmem_free:
    35d8:	ff 03 01 d1 	sub	sp, sp, #64
    35dc:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    35e0:	fd c3 00 91 	add	x29, sp, #48
    35e4:	e8 ef 7c b2 	orr	x8, xzr, #0xfffffffffffffff0
    35e8:	09 00 00 b0 	adrp	x9, #4096
    35ec:	29 21 00 91 	add	x9, x9, #8
    35f0:	a0 83 1f f8 	stur	x0, [x29, #-8]
    35f4:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    35f8:	08 00 08 8b 	add	x8, x0, x8
    35fc:	e8 0f 00 f9 	str	x8, [sp, #24]
    3600:	bf 43 1f b8 	stur	wzr, [x29, #-12]
    3604:	e9 07 00 f9 	str	x9, [sp, #8]
    3608:	e8 07 40 b2 	orr	x8, xzr, #0x3
    360c:	a9 43 9f b8 	ldursw	x9, [x29, #-12]
    3610:	3f 01 08 eb 	cmp	x9, x8
    3614:	ea 27 9f 1a 	cset	w10, lo
    3618:	4a 00 00 37 	tbnz	w10, #0, #8
    361c:	1b 00 00 14 	b	#108
    3620:	e8 03 7c b2 	orr	x8, xzr, #0x10
    3624:	a9 43 9f b8 	ldursw	x9, [x29, #-12]
    3628:	08 7d 09 9b 	mul	x8, x8, x9
    362c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3630:	28 01 08 8b 	add	x8, x9, x8
    3634:	e8 0b 00 f9 	str	x8, [sp, #16]
    3638:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    363c:	0a 09 40 b9 	ldr	w10, [x8, #8]
    3640:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    3644:	0b 01 40 b9 	ldr	w11, [x8]
    3648:	5f 01 0b 6b 	cmp	w10, w11
    364c:	ea 17 9f 1a 	cset	w10, eq
    3650:	4a 00 00 37 	tbnz	w10, #0, #8
    3654:	09 00 00 14 	b	#36
    3658:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    365c:	08 05 40 f9 	ldr	x8, [x8, #8]
    3660:	e9 0f 40 f9 	ldr	x9, [sp, #24]
    3664:	28 01 00 f9 	str	x8, [x9]
    3668:	e8 0f 40 f9 	ldr	x8, [sp, #24]
    366c:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    3670:	28 05 00 f9 	str	x8, [x9, #8]
    3674:	06 00 00 14 	b	#24
    3678:	a8 43 5f b8 	ldur	w8, [x29, #-12]
    367c:	08 05 00 11 	add	w8, w8, #1
    3680:	a8 43 1f b8 	stur	w8, [x29, #-12]
    3684:	e1 ff ff 17 	b	#-124
    3688:	d6 fa ff 97 	bl	#-5288
    368c:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    3690:	ff 03 01 91 	add	sp, sp, #64
    3694:	c0 03 5f d6 	ret

consdrv_main:
    3698:	ff 83 01 d1 	sub	sp, sp, #96
    369c:	fd 7b 05 a9 	stp	x29, x30, [sp, #80]
    36a0:	fd 43 01 91 	add	x29, sp, #80
    36a4:	e8 03 1f 32 	orr	w8, wzr, #0x2
    36a8:	09 00 00 90 	adrp	x9, #0
    36ac:	29 81 1e 91 	add	x9, x9, #1952
    36b0:	0a 00 00 b0 	adrp	x10, #4096
    36b4:	4a c1 29 91 	add	x10, x10, #2672
    36b8:	a0 83 1f b8 	stur	w0, [x29, #-8]
    36bc:	a1 03 1f f8 	stur	x1, [x29, #-16]
    36c0:	ea 13 00 f9 	str	x10, [sp, #32]
    36c4:	e9 0f 00 f9 	str	x9, [sp, #24]
    36c8:	e8 17 00 b9 	str	w8, [sp, #20]
    36cc:	25 00 00 94 	bl	#148
    36d0:	e8 17 40 b9 	ldr	w8, [sp, #20]
    36d4:	e0 03 08 2a 	mov	w0, w8
    36d8:	e1 0f 40 f9 	ldr	x1, [sp, #24]
    36dc:	c5 fe ff 97 	bl	#-1260
    36e0:	e2 a3 00 91 	add	x2, sp, #40
    36e4:	a1 53 00 d1 	sub	x1, x29, #20
    36e8:	e8 03 40 b2 	orr	x8, xzr, #0x1
    36ec:	e9 03 7a b2 	orr	x9, xzr, #0x40
    36f0:	e0 03 00 32 	orr	w0, wzr, #0x1
    36f4:	e8 07 00 f9 	str	x8, [sp, #8]
    36f8:	e9 03 00 f9 	str	x9, [sp]
    36fc:	a3 fe ff 97 	bl	#-1396
    3700:	a0 03 1e f8 	stur	x0, [x29, #-32]
    3704:	e8 17 40 f9 	ldr	x8, [sp, #40]
    3708:	0a 01 40 39 	ldrb	w10, [x8]
    370c:	4a c1 00 71 	subs	w10, w10, #48
    3710:	aa 83 1e b8 	stur	w10, [x29, #-24]
    3714:	a8 83 9e b8 	ldursw	x8, [x29, #-24]
    3718:	e9 03 40 f9 	ldr	x9, [sp]
    371c:	28 7d 08 9b 	mul	x8, x9, x8
    3720:	e0 13 40 f9 	ldr	x0, [sp, #32]
    3724:	08 00 08 8b 	add	x8, x0, x8
    3728:	a1 03 5e f8 	ldur	x1, [x29, #-32]
    372c:	a2 83 5e b8 	ldur	w2, [x29, #-24]
    3730:	aa c3 5e b8 	ldur	w10, [x29, #-20]
    3734:	43 05 00 71 	subs	w3, w10, #1
    3738:	eb 17 40 f9 	ldr	x11, [sp, #40]
    373c:	ec 07 40 f9 	ldr	x12, [sp, #8]
    3740:	64 01 0c 8b 	add	x4, x11, x12
    3744:	e0 03 08 aa 	mov	x0, x8
    3748:	40 00 00 94 	bl	#256
    374c:	e8 17 40 f9 	ldr	x8, [sp, #40]
    3750:	e0 03 08 aa 	mov	x0, x8
    3754:	61 fe ff 97 	bl	#-1660
    3758:	e2 ff ff 17 	b	#-120
    375c:	1f 20 03 d5 	nop

consdrv_init:
    3760:	ff 83 00 d1 	sub	sp, sp, #32
    3764:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    3768:	fd 43 00 91 	add	x29, sp, #16
    376c:	08 00 00 b0 	adrp	x8, #4096
    3770:	08 c1 29 91 	add	x8, x8, #2672
    3774:	09 00 80 52 	mov	w9, #0
    3778:	e2 03 7a b2 	orr	x2, xzr, #0x40
    377c:	e0 03 08 aa 	mov	x0, x8
    3780:	e1 03 09 2a 	mov	w1, w9
    3784:	a9 c3 1f b8 	stur	w9, [x29, #-4]
    3788:	ac f5 ff 97 	bl	#-10576
    378c:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
    3790:	e0 03 09 2a 	mov	w0, w9
    3794:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    3798:	ff 83 00 91 	add	sp, sp, #32
    379c:	c0 03 5f d6 	ret

consdrv_intr:
    37a0:	ff c3 00 d1 	sub	sp, sp, #48
    37a4:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    37a8:	fd 83 00 91 	add	x29, sp, #32
    37ac:	08 00 00 b0 	adrp	x8, #4096
    37b0:	08 c1 29 91 	add	x8, x8, #2672
    37b4:	bf c3 1f b8 	stur	wzr, [x29, #-4]
    37b8:	e8 07 00 f9 	str	x8, [sp, #8]
    37bc:	e8 03 00 32 	orr	w8, wzr, #0x1
    37c0:	a9 c3 5f b8 	ldur	w9, [x29, #-4]
    37c4:	3f 01 08 6b 	cmp	w9, w8
    37c8:	e8 a7 9f 1a 	cset	w8, lt
    37cc:	48 00 00 37 	tbnz	w8, #0, #8
    37d0:	1a 00 00 14 	b	#104
    37d4:	e8 03 7a b2 	orr	x8, xzr, #0x40
    37d8:	a9 c3 9f b8 	ldursw	x9, [x29, #-4]
    37dc:	08 7d 09 9b 	mul	x8, x8, x9
    37e0:	e9 07 40 f9 	ldr	x9, [sp, #8]
    37e4:	28 01 08 8b 	add	x8, x9, x8
    37e8:	e8 0b 00 f9 	str	x8, [sp, #16]
    37ec:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    37f0:	08 01 40 f9 	ldr	x8, [x8]
    37f4:	48 00 00 b5 	cbnz	x8, #8
    37f8:	0c 00 00 14 	b	#48
    37fc:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    3800:	00 09 40 b9 	ldr	w0, [x8, #8]
    3804:	87 f7 ff 97 	bl	#-8676
    3808:	c0 00 00 35 	cbnz	w0, #24
    380c:	e8 0b 40 f9 	ldr	x8, [sp, #16]
    3810:	00 09 40 b9 	ldr	w0, [x8, #8]
    3814:	bb f7 ff 97 	bl	#-8468
    3818:	40 00 00 35 	cbnz	w0, #8
    381c:	03 00 00 14 	b	#12
    3820:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    3824:	53 00 00 94 	bl	#332
    3828:	a8 c3 5f b8 	ldur	w8, [x29, #-4]
    382c:	08 05 00 11 	add	w8, w8, #1
    3830:	a8 c3 1f b8 	stur	w8, [x29, #-4]
    3834:	e2 ff ff 17 	b	#-120
    3838:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    383c:	ff c3 00 91 	add	sp, sp, #48
    3840:	c0 03 5f d6 	ret
    3844:	1f 20 03 d5 	nop

consdrv_command:
    3848:	ff 43 01 d1 	sub	sp, sp, #80
    384c:	fd 7b 04 a9 	stp	x29, x30, [sp, #64]
    3850:	fd 03 01 91 	add	x29, sp, #64
    3854:	a8 0e 80 52 	mov	w8, #117
    3858:	e9 03 6c b2 	orr	x9, xzr, #0x100000
    385c:	0a 00 80 52 	mov	w10, #0
    3860:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3864:	a1 03 1f f8 	stur	x1, [x29, #-16]
    3868:	a2 c3 1e b8 	stur	w2, [x29, #-20]
    386c:	a3 83 1e b8 	stur	w3, [x29, #-24]
    3870:	e4 13 00 f9 	str	x4, [sp, #32]
    3874:	e0 13 40 f9 	ldr	x0, [sp, #32]
    3878:	02 00 40 39 	ldrb	w2, [x0]
    387c:	1f 01 02 6b 	cmp	w8, w2
    3880:	e8 17 9f 1a 	cset	w8, eq
    3884:	ea 1f 00 b9 	str	w10, [sp, #28]
    3888:	e9 0b 00 f9 	str	x9, [sp, #16]
    388c:	e2 0f 00 b9 	str	w2, [sp, #12]
    3890:	28 01 00 37 	tbnz	w8, #0, #36
    3894:	01 00 00 14 	b	#4
    3898:	e8 0e 80 52 	mov	w8, #119
    389c:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    38a0:	1f 01 09 6b 	cmp	w8, w9
    38a4:	e8 17 9f 1a 	cset	w8, eq
    38a8:	48 03 00 37 	tbnz	w8, #0, #104
    38ac:	01 00 00 14 	b	#4
    38b0:	2c 00 00 14 	b	#176
    38b4:	e8 07 1d 32 	orr	w8, wzr, #0x18
    38b8:	a9 03 5f f8 	ldur	x9, [x29, #-16]
    38bc:	aa 83 5f f8 	ldur	x10, [x29, #-8]
    38c0:	49 01 00 f9 	str	x9, [x10]
    38c4:	e9 13 40 f9 	ldr	x9, [sp, #32]
    38c8:	2b 05 40 39 	ldrb	w11, [x9, #1]
    38cc:	6b c1 00 71 	subs	w11, w11, #48
    38d0:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    38d4:	2b 09 00 b9 	str	w11, [x9, #8]
    38d8:	e0 03 08 2a 	mov	w0, w8
    38dc:	e8 0b 00 b9 	str	w8, [sp, #8]
    38e0:	ec fd ff 97 	bl	#-2128
    38e4:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    38e8:	20 09 00 f9 	str	x0, [x9, #16]
    38ec:	e0 0b 40 b9 	ldr	w0, [sp, #8]
    38f0:	e8 fd ff 97 	bl	#-2144
    38f4:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    38f8:	20 0d 00 f9 	str	x0, [x9, #24]
    38fc:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3900:	3f 21 00 b9 	str	wzr, [x9, #32]
    3904:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3908:	3f 25 00 b9 	str	wzr, [x9, #36]
    390c:	15 00 00 14 	b	#84
    3910:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3914:	df 43 03 d5 	msr	DAIFSet, #3
    3918:	e9 13 40 f9 	ldr	x9, [sp, #32]
    391c:	21 01 08 8b 	add	x1, x9, x8
    3920:	aa 83 5e b8 	ldur	w10, [x29, #-24]
    3924:	4a 05 00 71 	subs	w10, w10, #1
    3928:	e8 03 0a 2a 	mov	w8, w10
    392c:	02 7d 40 93 	sxtw	x2, w8
    3930:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    3934:	5b f5 ff 97 	bl	#-10900
    3938:	aa 83 5e b8 	ldur	w10, [x29, #-24]
    393c:	4a 01 44 11 	add	w10, w10, #256, lsl #12
    3940:	4a 05 00 71 	subs	w10, w10, #1
    3944:	e8 03 0a 2a 	mov	w8, w10
    3948:	08 7d 40 93 	sxtw	x8, w8
    394c:	ea 1f 40 b9 	ldr	w10, [sp, #28]
    3950:	0a 01 00 39 	strb	w10, [x8]
    3954:	02 00 00 d4 	hvc	#0
    3958:	ff 4f 03 d5 	msr	DAIFClr, #15
    395c:	01 00 00 14 	b	#4
    3960:	00 00 80 52 	mov	w0, #0
    3964:	fd 7b 44 a9 	ldp	x29, x30, [sp, #64]
    3968:	ff 43 01 91 	add	sp, sp, #80
    396c:	c0 03 5f d6 	ret

consdrv_intrproc:
    3970:	ff 03 01 d1 	sub	sp, sp, #64
    3974:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    3978:	fd c3 00 91 	add	x29, sp, #48
    397c:	48 01 80 52 	mov	w8, #10
    3980:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3984:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3988:	00 08 40 b9 	ldr	w0, [x0, #8]
    398c:	e8 17 00 b9 	str	w8, [sp, #20]
    3990:	5c f7 ff 97 	bl	#-8848
    3994:	40 00 00 35 	cbnz	w0, #8
    3998:	3e 00 00 14 	b	#248
    399c:	a8 01 80 52 	mov	w8, #13
    39a0:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    39a4:	20 09 40 b9 	ldr	w0, [x9, #8]
    39a8:	e8 13 00 b9 	str	w8, [sp, #16]
    39ac:	5f f7 ff 97 	bl	#-8836
    39b0:	a0 73 1f 38 	sturb	w0, [x29, #-9]
    39b4:	a8 73 5f 38 	ldurb	w8, [x29, #-9]
    39b8:	e0 13 40 b9 	ldr	w0, [sp, #16]
    39bc:	1f 01 00 6b 	cmp	w8, w0
    39c0:	e8 17 9f 1a 	cset	w8, eq
    39c4:	48 00 00 37 	tbnz	w8, #0, #8
    39c8:	03 00 00 14 	b	#12
    39cc:	e8 17 40 b9 	ldr	w8, [sp, #20]
    39d0:	a8 73 1f 38 	sturb	w8, [x29, #-9]
    39d4:	a1 27 00 d1 	sub	x1, x29, #9
    39d8:	e2 03 00 32 	orr	w2, wzr, #0x1
    39dc:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    39e0:	42 00 00 94 	bl	#264
    39e4:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    39e8:	00 00 40 f9 	ldr	x0, [x0]
    39ec:	40 00 00 b5 	cbnz	x0, #8
    39f0:	28 00 00 14 	b	#160
    39f4:	48 01 80 52 	mov	w8, #10
    39f8:	a9 73 5f 38 	ldurb	w9, [x29, #-9]
    39fc:	3f 01 08 6b 	cmp	w9, w8
    3a00:	e8 07 9f 1a 	cset	w8, ne
    3a04:	48 00 00 37 	tbnz	w8, #0, #8
    3a08:	0f 00 00 14 	b	#60
    3a0c:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3a10:	a9 73 5f 38 	ldurb	w9, [x29, #-9]
    3a14:	aa 83 5f f8 	ldur	x10, [x29, #-8]
    3a18:	4a 0d 40 f9 	ldr	x10, [x10, #24]
    3a1c:	ab 83 5f f8 	ldur	x11, [x29, #-8]
    3a20:	6c 25 40 b9 	ldr	w12, [x11, #36]
    3a24:	8d 05 00 11 	add	w13, w12, #1
    3a28:	6d 25 00 b9 	str	w13, [x11, #36]
    3a2c:	eb 03 0c 2a 	mov	w11, w12
    3a30:	6b 7d 40 93 	sxtw	x11, w11
    3a34:	08 7d 0b 9b 	mul	x8, x8, x11
    3a38:	48 01 08 8b 	add	x8, x10, x8
    3a3c:	09 01 00 39 	strb	w9, [x8]
    3a40:	14 00 00 14 	b	#80
    3a44:	e0 07 1d 32 	orr	w0, wzr, #0x18
    3a48:	08 00 80 52 	mov	w8, #0
    3a4c:	e8 0f 00 b9 	str	w8, [sp, #12]
    3a50:	10 fe ff 97 	bl	#-1984
    3a54:	e0 0f 00 f9 	str	x0, [sp, #24]
    3a58:	e0 0f 40 f9 	ldr	x0, [sp, #24]
    3a5c:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3a60:	21 0d 40 f9 	ldr	x1, [x9, #24]
    3a64:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3a68:	22 25 80 b9 	ldrsw	x2, [x9, #36]
    3a6c:	0d f5 ff 97 	bl	#-11212
    3a70:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3a74:	21 25 40 b9 	ldr	w1, [x9, #36]
    3a78:	e2 0f 40 f9 	ldr	x2, [sp, #24]
    3a7c:	e8 0f 40 b9 	ldr	w8, [sp, #12]
    3a80:	e0 03 08 2a 	mov	w0, w8
    3a84:	27 fe ff 97 	bl	#-1892
    3a88:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3a8c:	3f 25 00 b9 	str	wzr, [x9, #36]
    3a90:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3a94:	00 09 40 b9 	ldr	w0, [x8, #8]
    3a98:	e2 f6 ff 97 	bl	#-9336
    3a9c:	40 00 00 35 	cbnz	w0, #8
    3aa0:	0e 00 00 14 	b	#56
    3aa4:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3aa8:	08 01 40 f9 	ldr	x8, [x8]
    3aac:	48 00 00 b5 	cbnz	x8, #8
    3ab0:	04 00 00 14 	b	#16
    3ab4:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3ab8:	09 21 40 b9 	ldr	w9, [x8, #32]
    3abc:	a9 00 00 35 	cbnz	w9, #20
    3ac0:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3ac4:	00 09 40 b9 	ldr	w0, [x8, #8]
    3ac8:	50 f7 ff 97 	bl	#-8896
    3acc:	03 00 00 14 	b	#12
    3ad0:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3ad4:	51 00 00 94 	bl	#324
    3ad8:	00 00 80 52 	mov	w0, #0
    3adc:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    3ae0:	ff 03 01 91 	add	sp, sp, #64
    3ae4:	c0 03 5f d6 	ret

send_string:
    3ae8:	ff c3 00 d1 	sub	sp, sp, #48
    3aec:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    3af0:	fd 83 00 91 	add	x29, sp, #32
    3af4:	a8 01 80 52 	mov	w8, #13
    3af8:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3afc:	e1 0b 00 f9 	str	x1, [sp, #16]
    3b00:	e2 0f 00 b9 	str	w2, [sp, #12]
    3b04:	ff 0b 00 b9 	str	wzr, [sp, #8]
    3b08:	e8 07 00 b9 	str	w8, [sp, #4]
    3b0c:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    3b10:	e9 0f 40 b9 	ldr	w9, [sp, #12]
    3b14:	1f 01 09 6b 	cmp	w8, w9
    3b18:	e8 a7 9f 1a 	cset	w8, lt
    3b1c:	48 00 00 37 	tbnz	w8, #0, #8
    3b20:	2e 00 00 14 	b	#184
    3b24:	48 01 80 52 	mov	w8, #10
    3b28:	e9 03 40 b2 	orr	x9, xzr, #0x1
    3b2c:	ea 0b 40 f9 	ldr	x10, [sp, #16]
    3b30:	eb 0b 80 b9 	ldrsw	x11, [sp, #8]
    3b34:	29 7d 0b 9b 	mul	x9, x9, x11
    3b38:	49 01 09 8b 	add	x9, x10, x9
    3b3c:	2c 01 40 39 	ldrb	w12, [x9]
    3b40:	9f 01 08 6b 	cmp	w12, w8
    3b44:	e8 17 9f 1a 	cset	w8, eq
    3b48:	48 00 00 37 	tbnz	w8, #0, #8
    3b4c:	0e 00 00 14 	b	#56
    3b50:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3b54:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3b58:	29 09 40 f9 	ldr	x9, [x9, #16]
    3b5c:	aa 83 5f f8 	ldur	x10, [x29, #-8]
    3b60:	4b 21 40 b9 	ldr	w11, [x10, #32]
    3b64:	6c 05 00 11 	add	w12, w11, #1
    3b68:	4c 21 00 b9 	str	w12, [x10, #32]
    3b6c:	ea 03 0b 2a 	mov	w10, w11
    3b70:	4a 7d 40 93 	sxtw	x10, w10
    3b74:	08 7d 0a 9b 	mul	x8, x8, x10
    3b78:	28 01 08 8b 	add	x8, x9, x8
    3b7c:	eb 07 40 b9 	ldr	w11, [sp, #4]
    3b80:	0b 01 00 39 	strb	w11, [x8]
    3b84:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3b88:	e9 0b 40 f9 	ldr	x9, [sp, #16]
    3b8c:	ea 0b 80 b9 	ldrsw	x10, [sp, #8]
    3b90:	0a 7d 0a 9b 	mul	x10, x8, x10
    3b94:	29 01 0a 8b 	add	x9, x9, x10
    3b98:	2b 01 40 39 	ldrb	w11, [x9]
    3b9c:	a9 83 5f f8 	ldur	x9, [x29, #-8]
    3ba0:	29 09 40 f9 	ldr	x9, [x9, #16]
    3ba4:	aa 83 5f f8 	ldur	x10, [x29, #-8]
    3ba8:	4c 21 40 b9 	ldr	w12, [x10, #32]
    3bac:	8d 05 00 11 	add	w13, w12, #1
    3bb0:	4d 21 00 b9 	str	w13, [x10, #32]
    3bb4:	ea 03 0c 2a 	mov	w10, w12
    3bb8:	4a 7d 40 93 	sxtw	x10, w10
    3bbc:	08 7d 0a 9b 	mul	x8, x8, x10
    3bc0:	28 01 08 8b 	add	x8, x9, x8
    3bc4:	0b 01 00 39 	strb	w11, [x8]
    3bc8:	e8 0b 40 b9 	ldr	w8, [sp, #8]
    3bcc:	08 05 00 11 	add	w8, w8, #1
    3bd0:	e8 0b 00 b9 	str	w8, [sp, #8]
    3bd4:	ce ff ff 17 	b	#-200
    3bd8:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3bdc:	09 21 40 b9 	ldr	w9, [x8, #32]
    3be0:	49 00 00 35 	cbnz	w9, #8
    3be4:	0a 00 00 14 	b	#40
    3be8:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3bec:	00 09 40 b9 	ldr	w0, [x8, #8]
    3bf0:	ec f6 ff 97 	bl	#-9296
    3bf4:	c0 00 00 35 	cbnz	w0, #24
    3bf8:	a8 83 5f f8 	ldur	x8, [x29, #-8]
    3bfc:	00 09 40 b9 	ldr	w0, [x8, #8]
    3c00:	f8 f6 ff 97 	bl	#-9248
    3c04:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3c08:	04 00 00 94 	bl	#16
    3c0c:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    3c10:	ff c3 00 91 	add	sp, sp, #48
    3c14:	c0 03 5f d6 	ret

send_char:
    3c18:	ff 83 00 d1 	sub	sp, sp, #32
    3c1c:	fd 7b 01 a9 	stp	x29, x30, [sp, #16]
    3c20:	fd 43 00 91 	add	x29, sp, #16
    3c24:	08 00 80 12 	mov	w8, #-1
    3c28:	e0 07 00 f9 	str	x0, [sp, #8]
    3c2c:	e0 07 40 f9 	ldr	x0, [sp, #8]
    3c30:	00 08 40 b9 	ldr	w0, [x0, #8]
    3c34:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3c38:	29 09 40 f9 	ldr	x9, [x9, #16]
    3c3c:	2a 01 40 39 	ldrb	w10, [x9]
    3c40:	e1 03 0a 2a 	mov	w1, w10
    3c44:	e8 03 00 b9 	str	w8, [sp]
    3c48:	8e f6 ff 97 	bl	#-9672
    3c4c:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3c50:	28 21 40 b9 	ldr	w8, [x9, #32]
    3c54:	ea 03 40 b9 	ldr	w10, [sp]
    3c58:	08 01 0a 0b 	add	w8, w8, w10
    3c5c:	28 21 00 b9 	str	w8, [x9, #32]
    3c60:	ff 07 00 b9 	str	wzr, [sp, #4]
    3c64:	e8 07 40 b9 	ldr	w8, [sp, #4]
    3c68:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3c6c:	2a 21 40 b9 	ldr	w10, [x9, #32]
    3c70:	1f 01 0a 6b 	cmp	w8, w10
    3c74:	e8 a7 9f 1a 	cset	w8, lt
    3c78:	48 00 00 37 	tbnz	w8, #0, #8
    3c7c:	15 00 00 14 	b	#84
    3c80:	e8 03 40 b2 	orr	x8, xzr, #0x1
    3c84:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3c88:	29 09 40 f9 	ldr	x9, [x9, #16]
    3c8c:	ea 07 40 b9 	ldr	w10, [sp, #4]
    3c90:	4a 05 00 11 	add	w10, w10, #1
    3c94:	eb 03 0a 2a 	mov	w11, w10
    3c98:	6b 7d 40 93 	sxtw	x11, w11
    3c9c:	0b 7d 0b 9b 	mul	x11, x8, x11
    3ca0:	29 01 0b 8b 	add	x9, x9, x11
    3ca4:	2a 01 40 39 	ldrb	w10, [x9]
    3ca8:	e9 07 40 f9 	ldr	x9, [sp, #8]
    3cac:	29 09 40 f9 	ldr	x9, [x9, #16]
    3cb0:	eb 07 80 b9 	ldrsw	x11, [sp, #4]
    3cb4:	08 7d 0b 9b 	mul	x8, x8, x11
    3cb8:	28 01 08 8b 	add	x8, x9, x8
    3cbc:	0a 01 00 39 	strb	w10, [x8]
    3cc0:	e8 07 40 b9 	ldr	w8, [sp, #4]
    3cc4:	08 05 00 11 	add	w8, w8, #1
    3cc8:	e8 07 00 b9 	str	w8, [sp, #4]
    3ccc:	e6 ff ff 17 	b	#-104
    3cd0:	fd 7b 41 a9 	ldp	x29, x30, [sp, #16]
    3cd4:	ff 83 00 91 	add	sp, sp, #32
    3cd8:	c0 03 5f d6 	ret
    3cdc:	00 00 00 00  <unknown>

command_main:
    3ce0:	ff 03 02 d1 	sub	sp, sp, #128
    3ce4:	fd 7b 07 a9 	stp	x29, x30, [sp, #112]
    3ce8:	fd c3 01 91 	add	x29, sp, #112
    3cec:	08 00 00 90 	adrp	x8, #0
    3cf0:	08 39 3f 91 	add	x8, x8, #4046
    3cf4:	e9 03 00 32 	orr	w9, wzr, #0x1
    3cf8:	0a 00 00 90 	adrp	x10, #0
    3cfc:	4a 4d 3d 91 	add	x10, x10, #3923
    3d00:	0b 00 80 52 	mov	w11, #0
    3d04:	0c 00 00 90 	adrp	x12, #0
    3d08:	8c 39 3d 91 	add	x12, x12, #3918
    3d0c:	0d 00 00 90 	adrp	x13, #0
    3d10:	ad f5 3e 91 	add	x13, x13, #4029
    3d14:	0e 00 00 90 	adrp	x14, #0
    3d18:	ce 11 3f 91 	add	x14, x14, #4036
    3d1c:	a0 83 1f b8 	stur	w0, [x29, #-8]
    3d20:	a1 03 1f f8 	stur	x1, [x29, #-16]
    3d24:	e0 03 08 aa 	mov	x0, x8
    3d28:	ae 83 1d f8 	stur	x14, [x29, #-40]
    3d2c:	ad 03 1d f8 	stur	x13, [x29, #-48]
    3d30:	ec 1f 00 f9 	str	x12, [sp, #56]
    3d34:	e9 37 00 b9 	str	w9, [sp, #52]
    3d38:	ea 17 00 f9 	str	x10, [sp, #40]
    3d3c:	eb 27 00 b9 	str	w11, [sp, #36]
    3d40:	80 f5 ff 97 	bl	#-10752
    3d44:	e9 37 40 b9 	ldr	w9, [sp, #52]
    3d48:	e0 03 09 2a 	mov	w0, w9
    3d4c:	2b 00 00 94 	bl	#172
    3d50:	a1 73 00 d1 	sub	x1, x29, #28
    3d54:	a2 63 00 d1 	sub	x2, x29, #24
    3d58:	e8 03 1e 32 	orr	w8, wzr, #0x4
    3d5c:	e9 03 40 b2 	orr	x9, xzr, #0x1
    3d60:	00 00 80 52 	mov	w0, #0
    3d64:	e3 17 40 f9 	ldr	x3, [sp, #40]
    3d68:	e0 23 00 b9 	str	w0, [sp, #32]
    3d6c:	e0 03 03 aa 	mov	x0, x3
    3d70:	e1 0f 00 f9 	str	x1, [sp, #24]
    3d74:	e2 0b 00 f9 	str	x2, [sp, #16]
    3d78:	e8 0f 00 b9 	str	w8, [sp, #12]
    3d7c:	e9 03 00 f9 	str	x9, [sp]
    3d80:	3e 00 00 94 	bl	#248
    3d84:	e0 23 40 b9 	ldr	w0, [sp, #32]
    3d88:	e1 0f 40 f9 	ldr	x1, [sp, #24]
    3d8c:	e2 0b 40 f9 	ldr	x2, [sp, #16]
    3d90:	fe fc ff 97 	bl	#-3080
    3d94:	a9 83 5e f8 	ldur	x9, [x29, #-24]
    3d98:	a1 43 9e b8 	ldursw	x1, [x29, #-28]
    3d9c:	e2 03 40 f9 	ldr	x2, [sp]
    3da0:	41 7c 01 9b 	mul	x1, x2, x1
    3da4:	29 01 01 8b 	add	x9, x9, x1
    3da8:	e8 27 40 b9 	ldr	w8, [sp, #36]
    3dac:	28 01 00 39 	strb	w8, [x9]
    3db0:	a9 83 5e f8 	ldur	x9, [x29, #-24]
    3db4:	e0 03 09 aa 	mov	x0, x9
    3db8:	e1 1f 40 f9 	ldr	x1, [sp, #56]
    3dbc:	e2 0f 40 b9 	ldr	w2, [sp, #12]
    3dc0:	f2 f4 ff 97 	bl	#-11320
    3dc4:	00 01 00 35 	cbnz	w0, #32
    3dc8:	e8 03 7e b2 	orr	x8, xzr, #0x4
    3dcc:	a9 83 5e f8 	ldur	x9, [x29, #-24]
    3dd0:	20 01 08 8b 	add	x0, x9, x8
    3dd4:	29 00 00 94 	bl	#164
    3dd8:	a0 03 5d f8 	ldur	x0, [x29, #-48]
    3ddc:	27 00 00 94 	bl	#156
    3de0:	03 00 00 14 	b	#12
    3de4:	a0 83 5d f8 	ldur	x0, [x29, #-40]
    3de8:	24 00 00 94 	bl	#144
    3dec:	a0 83 5e f8 	ldur	x0, [x29, #-24]
    3df0:	ba fc ff 97 	bl	#-3352
    3df4:	d7 ff ff 17 	b	#-164

send_use:
    3df8:	ff c3 00 d1 	sub	sp, sp, #48
    3dfc:	fd 7b 02 a9 	stp	x29, x30, [sp, #32]
    3e00:	fd 83 00 91 	add	x29, sp, #32
    3e04:	e8 07 00 32 	orr	w8, wzr, #0x3
    3e08:	e9 07 1c 32 	orr	w9, wzr, #0x30
    3e0c:	aa 0e 80 52 	mov	w10, #117
    3e10:	eb 03 00 32 	orr	w11, wzr, #0x1
    3e14:	a0 c3 1f b8 	stur	w0, [x29, #-4]
    3e18:	e0 03 08 2a 	mov	w0, w8
    3e1c:	eb 0f 00 b9 	str	w11, [sp, #12]
    3e20:	e8 0b 00 b9 	str	w8, [sp, #8]
    3e24:	e9 07 00 b9 	str	w9, [sp, #4]
    3e28:	ea 03 00 b9 	str	w10, [sp]
    3e2c:	99 fc ff 97 	bl	#-3484
    3e30:	e0 0b 00 f9 	str	x0, [sp, #16]
    3e34:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    3e38:	e8 07 40 b9 	ldr	w8, [sp, #4]
    3e3c:	08 00 00 39 	strb	w8, [x0]
    3e40:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    3e44:	e9 03 40 b9 	ldr	w9, [sp]
    3e48:	09 04 00 39 	strb	w9, [x0, #1]
    3e4c:	aa c3 5f b8 	ldur	w10, [x29, #-4]
    3e50:	4a c1 00 11 	add	w10, w10, #48
    3e54:	e0 0b 40 f9 	ldr	x0, [sp, #16]
    3e58:	0a 08 00 39 	strb	w10, [x0, #2]
    3e5c:	e2 0b 40 f9 	ldr	x2, [sp, #16]
    3e60:	e0 0f 40 b9 	ldr	w0, [sp, #12]
    3e64:	e1 0b 40 b9 	ldr	w1, [sp, #8]
    3e68:	ae fc ff 97 	bl	#-3400
    3e6c:	fd 7b 42 a9 	ldp	x29, x30, [sp, #32]
    3e70:	ff c3 00 91 	add	sp, sp, #48
    3e74:	c0 03 5f d6 	ret

send_write:
    3e78:	ff 03 01 d1 	sub	sp, sp, #64
    3e7c:	fd 7b 03 a9 	stp	x29, x30, [sp, #48]
    3e80:	fd c3 00 91 	add	x29, sp, #48
    3e84:	e8 07 1c 32 	orr	w8, wzr, #0x30
    3e88:	e9 0e 80 52 	mov	w9, #119
    3e8c:	ea 03 7f b2 	orr	x10, xzr, #0x2
    3e90:	eb 03 00 32 	orr	w11, wzr, #0x1
    3e94:	a0 83 1f f8 	stur	x0, [x29, #-8]
    3e98:	a0 83 5f f8 	ldur	x0, [x29, #-8]
    3e9c:	eb 1b 00 b9 	str	w11, [sp, #24]
    3ea0:	e8 17 00 b9 	str	w8, [sp, #20]
    3ea4:	e9 13 00 b9 	str	w9, [sp, #16]
    3ea8:	ea 07 00 f9 	str	x10, [sp, #8]
    3eac:	4f f4 ff 97 	bl	#-11972
    3eb0:	a0 c3 1e b8 	stur	w0, [x29, #-20]
    3eb4:	a8 c3 5e b8 	ldur	w8, [x29, #-20]
    3eb8:	00 09 00 11 	add	w0, w8, #2
    3ebc:	75 fc ff 97 	bl	#-3628
    3ec0:	a0 03 1f f8 	stur	x0, [x29, #-16]
    3ec4:	aa 03 5f f8 	ldur	x10, [x29, #-16]
    3ec8:	e8 17 40 b9 	ldr	w8, [sp, #20]
    3ecc:	48 01 00 39 	strb	w8, [x10]
    3ed0:	aa 03 5f f8 	ldur	x10, [x29, #-16]
    3ed4:	e9 13 40 b9 	ldr	w9, [sp, #16]
    3ed8:	49 05 00 39 	strb	w9, [x10, #1]
    3edc:	aa 03 5f f8 	ldur	x10, [x29, #-16]
    3ee0:	e0 07 40 f9 	ldr	x0, [sp, #8]
    3ee4:	40 01 00 8b 	add	x0, x10, x0
    3ee8:	a1 83 5f f8 	ldur	x1, [x29, #-8]
    3eec:	a2 c3 9e b8 	ldursw	x2, [x29, #-20]
    3ef0:	ec f3 ff 97 	bl	#-12368
    3ef4:	a8 c3 5e b8 	ldur	w8, [x29, #-20]
    3ef8:	01 09 00 11 	add	w1, w8, #2
    3efc:	a2 03 5f f8 	ldur	x2, [x29, #-16]
    3f00:	e8 1b 40 b9 	ldr	w8, [sp, #24]
    3f04:	e0 03 08 2a 	mov	w0, w8
    3f08:	86 fc ff 97 	bl	#-3560
    3f0c:	fd 7b 43 a9 	ldp	x29, x30, [sp, #48]
    3f10:	ff 03 01 91 	add	sp, sp, #64
    3f14:	c0 03 5f d6 	ret
