qemu-system-aarch64 -nographic -m 4096 -M sbsa-ref\
	-pflash blob/TFA.fd \
	-pflash path/to/your/coreboot/build/coreboot.rom\
	#-drive format=raw,file=path/to/your/rawDiskImage.raw
