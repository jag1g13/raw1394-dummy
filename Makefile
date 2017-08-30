obj-m += raw1394.o
.PHONY: clean install
compile:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
all: compile
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
install:
	cp raw1394.ko /lib/modules/$(shell uname -r)/kernel/drivers/firewire
	depmod
	modprobe raw1394
