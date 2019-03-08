#ifndef _IRQ_H_INCLUDED_
#define _IRQ_H_INCLUDED_

void irq_init(void);
int irq_is_pending(int nirq);
int irq_is_enable(int nirq);
void irq_clr_pending(int nirq);
void irq_set_enable(int nirq);
void irq_set_disable(int nirq);

#endif
