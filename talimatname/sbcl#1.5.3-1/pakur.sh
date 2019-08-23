cd "$SRC/$isim-$surum"

  # cannot have both SBCL_HOME and INSTALL_ROOT
  SBCL_HOME="" INSTALL_ROOT="$PKG/usr" sh install.sh

  src/runtime/sbcl --core output/sbcl.core --script "${SRC}/fixes.lisp"
  mv sbcl-new.core "${PKG}/usr/lib/sbcl/sbcl.core"

  # sources
  mkdir -p "$PKG/usr/share/sbcl-source"
  cp -R -t "$PKG/usr/share/sbcl-source" "$SRC/$isim-$surum/"{src,contrib}

  # license
  install -D -m644 "$SRC/$isim-$surum/COPYING" \
                   "$PKG/usr/share/licenses/$isim/license.txt"

  # drop unwanted files
  find "$PKG" \( -name Makefile -o -name .cvsignore \) -delete
  find "$PKG/usr/share/sbcl-source" -type f \
    \( -name \*.fasl -o -name \*.o -o -name \*.log -o -name \*.so -o -name a.out \) -delete

  rm "$PKG/usr/share/sbcl-source/src/runtime/sbcl"{,.nm}