qemu-system-aarch64 -nographic -m 4096 -M sbsa-ref\
	-pflash blob/TFA.fd \
	-pflash main_repo/coreboot/build/coreboot.rom\
	-drive format=raw,file=/home/simon/Downloads/isofedorabesser.raw
