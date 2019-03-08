#ifndef _INTERRUPT_H_INCLUDED_
#define _INTERRUPT_H_INCLUDED_

#define SOFTVEC_NUM 256
typedef unsigned int softvec_type_t;
typedef void (*softvec_handler_t)(softvec_type_t type, unsigned long sp);
extern softvec_type_t SOFTVECS[SOFTVEC_NUM];

#define INTR_ENABLE  asm volatile("msr  daifclr, #0b1111");
#define INTR_DISABLE asm volatile("msr  daifset, #0b0011");

/* ソフトウエア・割込みベクタの初期化 */
int softvec_init(void);

/* ソフトウエア・割込みベクタの設定 */
int softvec_setintr(softvec_type_t type, softvec_handler_t handler);

/* 共通割込みハンドラ */
uint32 interrupt(softvec_type_t type, unsigned long sp, uint32 addr);

#endif
