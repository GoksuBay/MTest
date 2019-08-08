cd httpd-${surum}

  make DESTDIR="${PKG}" install
   
  install -D -m644 "${SRC}/httpd.logrotate" "${PKG}/etc/logrotate.d/httpd"
  install -D -m644 "${SRC}/apache.tmpfiles.conf" "${PKG}/usr/lib/tmpfiles.d/apache.conf"
  install -D -m644 "${SRC}/httpd.service" "${PKG}/usr/lib/systemd/system/httpd.service"	
  install -D -m644 LICENSE "${PKG}/usr/share/licenses/${isim}/LICENSE"

  # symlinks for /etc/httpd
  # do we really need this symlink?
  ln -fs /usr/lib/httpd/modules "${PKG}/etc/httpd/modules"

  # set sane defaults
  sed -e 's#/usr/lib/httpd/modules/#modules/#' \
      -e 's|#\(LoadModule negotiation_module \)|\1|' \
      -e 's|#\(LoadModule include_module \)|\1|' \
      -e 's|#\(LoadModule userdir_module \)|\1|' \
      -e 's|#\(LoadModule slotmem_shm_module \)|\1|' \
      -e 's|#\(Include conf/extra/httpd-multilang-errordoc.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-autoindex.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-languages.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-userdir.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-default.conf\)|\1|' \
      -e 's|#\(Include conf/extra/httpd-mpm.conf\)|\1|' \
      -i "${PKG}/etc/httpd/conf/httpd.conf"

  # cleanup
  rm -r "${PKG}/usr/share/httpd/manual"
  rm -r "${PKG}/etc/httpd/conf/original"
  rm -r "${PKG}/srv/"
  rm -r "${PKG}/run"