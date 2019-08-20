export CFLAGS+=" -D_GNU_SOURCE -fno-omit-frame-pointer -DSBCL_HOME=/usr/lib/sbcl"
  export GNUMAKE="make"

  # build system uses LINKFLAGS and OS_LIBS to build LDFLAGS
  export LINKFLAGS="$LDFLAGS"
  unset LDFLAGS
  unset MAKEFLAGS
  if [[ ${CARCH} = x86_64  ]]; then
    enable_disable_largefile=enable
  else
    enable_disable_largefile=disable
  fi
  # Make a multi-threaded SBCL, disable LARGEFILE
  cat >customize-target-features.lisp <<EOF
(lambda (features)
  (flet ((enable (x) (pushnew x features))
         (disable (x) (setf features (remove x features))))
  (enable :sb-thread)
  (enable :sb-core-compression)
  (${enable_disable_largefile} :largefile)))
EOF

  sh make.sh sbcl --prefix=/usr
  make -C doc/manual info