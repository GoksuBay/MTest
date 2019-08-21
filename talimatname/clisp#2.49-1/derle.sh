cd $isim
  ./configure --prefix=/usr --with-readline --with-ffcall src

  cd src
  ./makemake --prefix=/usr --with-readline --with-ffcall --with-dynamic-ffi > Makefile
  make