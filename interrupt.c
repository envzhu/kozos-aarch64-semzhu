#include "defines.h"
#include "lib.h"
#include "intr.h"
#include "irq.h"
#include "interrupt.h"

softvec_type_t SOFTVECS[SOFTVEC_NUM];

/* ソフトウエア・割込みベクタの初期化 */
int softvec_init(void)
{
  int type;
  for (type = 0; type < SOFTVEC_TYPE_NUM; type++)
    softvec_setintr(type, NULL);
  return 0;
}

/* ソフトウエア・割込みベクタの設定 */
int softvec_setintr(softvec_type_t type, softvec_handler_t handler)
{
  SOFTVECS[type] = handler;
  return 0;
}

/*
 * 共通割込みハンドラ．
 * ソフトウエア・割込みベクタを見て，各ハンドラに分岐する．
 */
uint32 software_interrupt_entry(softvec_type_t type, unsigned long sp, uint32 addr)
{
  //while(1);

 /*
  type >>= 26;
  putxval(type, 2);
  puts("\n");
*/
   type >>= 26;

  softvec_handler_t handler = SOFTVECS[type];
  if (handler)
    handler(type, sp);
  puts("Maybe not come back here!\n");
  return sp;
}
uint32 error_interrupt_entry(softvec_type_t type, unsigned long sp, uint32 addr)
{
  // puts("error_interrupt_entry\n\n");
  while(1);
  
  type >>= 26;
  if(irq_is_pending(29))
    puts("hoge\n");
  puts("Maybe not come back here!\n");
  while(1);
  return sp;
}

uint32 irq_entry(softvec_type_t type, unsigned long sp, uint32 addr)
{
  //if(irq_is_pending(29))
    //puts("hoge\n");
  asm volatile("wfi");
  puts("Maybe not come back here!\n");
  return sp;
}

uint32 fiq_entry(softvec_type_t type, unsigned long sp, uint32 addr)
{
  if(irq_is_pending(29))
    puts("hoge\n");
  asm volatile("wfi");
  puts("Maybe not come back here!\n");
  return sp;
}
