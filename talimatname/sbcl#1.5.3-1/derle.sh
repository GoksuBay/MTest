export CFLAGS+=" -D_GNU_SOURCE -fno-omit-frame-pointer -DSBCL_HOME=/usr/lib/sbcl"
	export LINKFLAGS="$LDFLAGS"
	bash make.sh \
		"$_bootstrap_lisp" \
		--without-sb-test --with-sb-core-compression --prefix=/usr