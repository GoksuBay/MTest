cd httpd-${surum}
# set default user
  sed -e 's#User daemon#User http#' \
      -e 's#Group daemon#Group http#' \
      -i docs/conf/httpd.conf.in

  cat "${SRC}/milis.layout" >> config.layout
  patch -Np1 -i ../openssl-malloc-init.patch
  ./configure --sbindir=/usr/bin \
      --enable-layout=milis \
      --enable-mpms-shared=all \
      --enable-modules=all \
      --enable-mods-shared=all \
      --enable-so \
      --enable-suexec \
      --with-suexec-caller=http \
      --with-suexec-docroot=/srv/http \
      --with-suexec-logfile=/var/log/httpd/suexec.log \
      --with-suexec-bin=/usr/bin/suexec \
      --with-suexec-uidmin=99 --with-suexec-gidmin=99 \
      --enable-ldap --enable-authnz-ldap --enable-authnz-fcgi \
      --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
      --enable-ssl --with-ssl \
      --enable-deflate --enable-cgi --enable-cgid \
      --enable-proxy --enable-proxy-connect \
      --enable-proxy-http --enable-proxy-ftp \
      --enable-dbd --enable-imagemap --enable-ident --enable-cern-meta \
      --enable-lua --enable-xml2enc --enable-http2 \
      --enable-proxy-http2 --enable-md --enable-brotli \
      --with-apr=/usr/bin/apr-1-config \
      --with-apr-util=/usr/bin/apu-1-config \
      --with-pcre=/usr

  make