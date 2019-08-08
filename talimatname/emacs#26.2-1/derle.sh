PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
                                    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft \
                                    --with-modules
  make