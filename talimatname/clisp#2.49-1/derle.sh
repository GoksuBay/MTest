sed -i 's|(:name "rl_readline_state") (:type int)|(:name "rl_readline_state") (:type ulong)|g' modules/readline/readline.lisp
  
  ./configure --prefix=/usr --with-readline --with-ffcall src
  
  cd src
  ./makemake --prefix=/usr --with-readline --with-ffcall --with-dynamic-ffi > Makefile
  make 
  sed -i 's|http://www.lisp.org/HyperSpec/|http://www.lispworks.com/reference/HyperSpec/|g' config.lisp
  make 