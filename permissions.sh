# permissions.sh
# latest update 04-01-2025


for T in aapt aapt2 zipalign optipng pngquant; do
	print " set perm $T"
	chmod 755 $SYSTEM/bin/$T
done
