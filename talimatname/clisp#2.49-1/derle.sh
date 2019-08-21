  ./configure --prefix=/usr --with-readline --with-ffcall src

  cd /sources
  ./makemake --prefix=/usr --with-readline --with-ffcall --with-dynamic-ffi > Makefile
  make