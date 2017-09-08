SDCC=sdcc
SDLD=sdcc
OBJECTS=ldr.ihx

.PHONY: all clean flash

all: $(OBJECTS)

clean:
	rm -f $(OBJECTS)

flash: ldr.ihx
	stm8flash -c stlink-v2 -pstm8s103?3 -w ldr.ihx

%.ihx: %.c stm8.h
	$(SDCC) -lstm8 -mstm8 --out-fmt-ihx $(CFLAGS) $(LDFLAGS) $<
	stm8flash -c stlinkv2 -p stm8s103?3 -w ldr.ihx
	# minicom -b 115200 -D /dev/ttyUSB4
