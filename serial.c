#include "defines.h"
#include "irq.h"
#include "serial.h"

#define SERIAL_SCI_NUM 1
#define AUX_BASE   (0x00215000)
#define AUX_REG(x) *((volatile uint32 *)PHY_PERI_ADDR(AUX_BASE+x))
#define AUX_IRQ		AUX_REG(0x00)
#define AUX_ENABLE  AUX_REG(0x04)

// Mini UART Peripheral
#define MU_IO		  AUX_REG(0x40)
#define MU_IER		AUX_REG(0x44)
#define MU_IIR		AUX_REG(0x48)
#define MU_LCR		AUX_REG(0x4C)
#define MU_MCR		AUX_REG(0x50)
#define MU_LSR		AUX_REG(0x54)
#define MU_MSR		AUX_REG(0x58)
#define MU_SCRATCH		AUX_REG(0x5C)
#define MU_CNTL		AUX_REG(0x60)
#define MU_STAT		AUX_REG(0x64)
#define MU_BAUD		AUX_REG(0x68)

#define MU_LSR_TX_IDLE	(1 << 6)
#define MU_LSR_TX_EMPTY	(1 << 5)
#define MU_LSR_RX_RDY	  (1 << 0)

int serial_init(int index)
{
  char r;

  r = MU_IO & 0xff;

  irq_is_pending(29);
  irq_set_enable(29);
  AUX_ENABLE = 1;
  return 0;
}

/* 送信可能か？ */
int serial_is_send_enable(int index)
{
  return (MU_LSR & MU_LSR_TX_IDLE) || (MU_LSR & MU_LSR_TX_EMPTY);
}

/* １文字送信 */
int serial_send_byte(int index, unsigned char c)
{
  while (!serial_is_send_enable(index));
  MU_IO = (unsigned int)c;
  return 0;
}

/* 受信可能か？ */
int serial_is_recv_enable(int index)
{
  // check FR:RXFE
  return MU_LSR & MU_LSR_RX_RDY;
}

/* １文字受信 */
unsigned char serial_recv_byte(int index)
{
  while(!serial_is_recv_enable(index));
  return (unsigned char)(MU_IO & 0xff);
}

/* 送信割込み有効か？ */
int serial_intr_is_send_enable(int index)
{
  return (MU_IER & ((uint32)1 << 1)) ? 1 : 0;
}

/* 送信割込み有効化 */
void serial_intr_send_enable(int index)
{
  MU_IER |= (uint32)1 << 1;
}

/* 送信割込み無効化 */
void serial_intr_send_disable(int index)
{
  MU_IER &= ~((uint32)1 << 1);
}

/* 受信割込み有効か？ */
int serial_intr_is_recv_enable(int index)
{
  return (MU_IER & ((uint32)1 << 0)) ? 1 : 0;
}

/* 受信割込み有効化 */
void serial_intr_recv_enable(int index)
{
  MU_IER |= (uint32)1 << 0;
}

/* 受信割込み無効化 */
void serial_intr_recv_disable(int index)
{
  MU_IER &= ~((uint32)1 << 0);
}
