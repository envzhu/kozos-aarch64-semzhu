#ifndef _INTR_H_INCLUDED_
#define _INTR_H_INCLUDED_

/* ソフトウエア・割込みベクタの定義 */

#define SOFTVEC_TYPE_NUM     3

#define SOFTVEC_TYPE_SOFTERR 0
#define SOFTVEC_TYPE_SYSCALL 0x15
#define SOFTVEC_TYPE_SERINTR 2



/* GPU interrupts */
#define GPU_INTR_TIMER0               0
#define GPU_INTR_TIMER1               1
#define GPU_INTR_TIMER2               2
#define GPU_INTR_TIMER3               3
#define GPU_INTR_CODEC0               4
#define GPU_INTR_CODEC1               5
#define GPU_INTR_CODEC2               6
#define GPU_INTR_JPEG                 7
#define GPU_INTR_ISP                  8
#define GPU_INTR_USB                  9
#define GPU_INTR_3D                   10
#define GPU_INTR_TRANSPOSER           11
#define GPU_INTR_MULTICORESYNC0       12
#define GPU_INTR_MULTICORESYNC1       13
#define GPU_INTR_MULTICORESYNC2       14
#define GPU_INTR_MULTICORESYNC3       15
#define GPU_INTR_DMA0                 16
#define GPU_INTR_DMA1                 17
#define GPU_INTR_DMA2                 18
#define GPU_INTR_DMA3                 19
#define GPU_INTR_DMA4                 20
#define GPU_INTR_DMA5                 21
#define GPU_INTR_DMA6                 22
#define GPU_INTR_DMA7                 23
#define GPU_INTR_DMA8                 24
#define GPU_INTR_DMA9                 25
#define GPU_INTR_DMA10                26
#define GPU_INTR_DMA11                27
#define GPU_INTR_DMA12                28
#define GPU_INTR_AUX                  29
#define GPU_INTR_ARM                  30
#define GPU_INTR_VPUDMA               31
#define GPU_INTR_HOSTPORT             32
#define GPU_INTR_VIDEOSCALER          33
#define GPU_INTR_CCP2TX               34
#define GPU_INTR_SDC                  35
#define GPU_INTR_DSI0                 36
#define GPU_INTR_AVE                  37
#define GPU_INTR_CAM0                 38
#define GPU_INTR_CAM1                 39
#define GPU_INTR_HDMI0                40
#define GPU_INTR_HDMI1                41
#define GPU_INTR_PIXELVALVE1          42
#define GPU_INTR_I2CSPISLV            43
#define GPU_INTR_DSI1                 44
#define GPU_INTR_PWA0                 45
#define GPU_INTR_PWA1                 46
#define GPU_INTR_CPR                  47
#define GPU_INTR_SMI                  48
#define GPU_INTR_GPIO0                49
#define GPU_INTR_GPIO1                50
#define GPU_INTR_GPIO2                51
#define GPU_INTR_GPIO3                52
#define GPU_INTR_I2C                  53
#define GPU_INTR_SPI                  54
#define GPU_INTR_I2SPCM               55
#define GPU_INTR_SDIO                 56
#define GPU_INTR_UART                 57
#define GPU_INTR_SLIMBUS              58
#define GPU_INTR_VEC                  59
#define GPU_INTR_CPG                  60
#define GPU_INTR_RNG                  61
#define GPU_INTR_ARASANSDIO           62
#define GPU_INTR_AVSPMON              63

#endif
