ulimit -s 16384
	./configure \
		--prefix=/usr \
		--with-ffcall \
		--with-dynamic-ffi \
		--without-dynamic-modules \
		--disable-mmap \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		"$SRC"
	cd /tmp/work/src
	make -j1