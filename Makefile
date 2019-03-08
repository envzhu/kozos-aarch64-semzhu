# configure

#ifdef LLVM
	ADDNAME = llvm-

	AR      = $(ADDNAME)ar
	AS 			= $(ADDNAME)as  -target aarch64-elf 
	CC 			= clang  -target aarch64-elf 
	LD 			= ld.lld
	NM      = $(ADDNAME)nm
	OBJCOPY = $(ADDNAME)objcopy-6.0
	OBJDUMP = $(ADDNAME)objdump
	RANLIB  = $(ADDNAME)ranlib
	STRIP = 	$(OBJCOPY) -strip-all
#endif

ifdef GCC
ADDNAME = aarch64-linux-gnu-

AR      = $(ADDNAME)ar
AS      = $(ADDNAME)as
CC      = $(ADDNAME)gcc
LD      = $(ADDNAME)ld
NM      = $(ADDNAME)nm
OBJCOPY = $(ADDNAME)objcopy
OBJDUMP = $(ADDNAME)objdump
RANLIB  = $(ADDNAME)ranlib
STRIP   = $(ADDNAME)strip
BIN2HEX = $(ADDNAME)bin2hex
endif

QEMU = /home/envzhu/programing/tools/arm/bin/qemu-system-aarch64
GDB  = /home/envzhu/programing/tools/arm/bin/aarch64-elf-gdb

OBJS  = startup.o main.o vector.o interrupt.o
OBJS += lib.o serial.o irq.o

# sources of kozos
OBJS += kozos.o syscall.o memory.o consdrv.o command.o

TARGET = kozos-hvc

CFLAGS = -Wall -mcpu=cortex-a53 -nostdinc -nostdlib -fno-builtin -mlittle-endian
CFLAGS += -I.
CFLAGS += -g
CFLAGS += -O0
CFLAGS += -DKOZOS

LFLAGS = -static -T ld.scr -L.

.SUFFIXES: .c .o
.SUFFIXES: .s .o
.SUFFIXES: .S .o

all :	$(TARGET) $(TARGET).img $(TARGET)-img.o $(TARGET).asm 

$(TARGET) : $(TARGET).elf
		cp $< $@
		$(STRIP) $@

$(TARGET).elf :	$(OBJS) ld.scr
		$(LD) $(OBJS) -o $@ $(LFLAGS)

$(TARGET).img :	$(TARGET).elf
		$(OBJCOPY) -O binary $< $@

$(TARGET)-img.o :	$(TARGET).img
		aarch64-linux-gnu-objcopy -I binary -B aarch64 -O elf64-littleaarch64 $< $@

$(TARGET).asm : $(TARGET).elf
	$(OBJDUMP) -d $< > $@

.c.o :		$<
		$(CC) -c $(CFLAGS) $<

.s.o :		$<
		$(CC) -c $(CFLAGS) $<

.S.o :		$<
		$(CC) -c $(CFLAGS) $<

clean :
		rm -f $(OBJS) $(TARGET) $(TARGET).elf
