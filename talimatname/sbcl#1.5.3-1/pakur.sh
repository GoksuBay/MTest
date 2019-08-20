INSTALL_ROOT="$PKG/usr" \
		LIB_DIR="/usr/lib" \
		DOC_DIR="$PKG/usr/share/doc/$isim" \
		sh install.sh

	paxmark -rm "$PKG"/usr/bin/sbcl

	rmdir "$PKG"/usr/share/doc/sbcl/html \
		"$PKG"/usr/share/info 2>/dev/null || true