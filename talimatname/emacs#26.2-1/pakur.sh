make DESTDIR="$PKG" install

  # remove conflict with ctags package
  mv "$PKG"/usr/bin/{ctags,ctags.emacs}
  mv "$PKG"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  find "$PKG"/usr/share/emacs/$surum -exec chown root:root {} \;