# aapt

print (){
	ui_print "$@"
	}

print " "
print "    Curl Zip Flashable Binary By Wahyu6070"
print " "
print "ARCH : $ARCH"
print "API : $API"
print " "



if [  $API -gt 29 ]; then
AAPT_BIN=$MODPATH/bin/$ARCH/29
elif [  $API -gt 33 ]; then
AAPT_BIN=$MODPATH/bin/$ARCH/33
elif [  $API -gt 35 ]; then
AAPT_BIN=$MODPATH/bin/$ARCH/35
else
AAPT_BIN=$MODPATH/bin/$ARCH/26
fi

if [ ! -f $AAPT_BIN/aapt2 ]; then
	print "-  Curl binary not found"
	exit 1
fi

mkdir -p $MODPATH/system/bin

for G in aapt aapt2; do
	print "- Installing $G"
	cp -pf $AAPT_BIN/$G $MODPATH/system/bin/
	chmod 755 $MODPATH/system/bin/$G
done

termux_bin=/data/data/com.termux
for G in aapt aapt2; do
	print "- Installing in termux $G"
	cp -pf $AAPT_BIN/$G $termux_bin/
	chmod 755 $termux_bin/$G
done

for T in aapt aapt2 zipalign optipng pngquant; do
	print "- Installating $T"
	cp -pf $MODPATH/bin/$ARCH/$T $MODPATH/system/bin/
	chmod 755 $MODPATH/system/bin/$T
done

for T in aapt aapt2 zipalign optipng pngquant; do
	print "- Installating termux $T"
	cp -pf $MODPATH/bin/$ARCH/$T $termux_bin/
	chmod 755 $termux_bin/$T
done

print
print "*tips"
print "run in terminal"
print "su"
print "curl"
print " "