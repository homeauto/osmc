# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

#Use newclock5 for rbp1/2 builds
if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ] || [ "$1" == "atv" ] || [ "$1" == "pc" ]   
then
pull_source "https://github.com/popcornmix/xbmc/archive/f71c5e4c53c630e4d4161593ce8d0058bf633da6.tar.gz" "$(pwd)/src"
API_VERSION="18"

#use xbmc top of tree for vero builds
else
pull_source "https://github.com/xbmc/xbmc/archive/2a62f3e8cfc5300f919f37c85b00c0e75ce7aaa1.tar.gz" "$(pwd)/src"
API_VERSION="18"
fi
if [ $? != 0 ]; then echo -e "Error fetching Kodi source" && exit 1; fi
# Build in native environment
BUILD_OPTS=$BUILD_OPTION_DEFAULTS
BUILD_OPTS=$(($BUILD_OPTS - $BUILD_OPTION_USE_CCACHE))
if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ] || [ "$1" == "vero" ] || [ "$1" == "vero2" ] || [ "$1" == "vero3" ]
then
    BUILD_OPTS=$(($BUILD_OPTS + $BUILD_OPTION_NEEDS_SWAP))
fi
build_in_env "${1}" $(pwd) "mediacenter-next-osmc" "$BUILD_OPTS"
build_return=$?
if [ $build_return == 99 ]
then
	echo -e "Building package Kodi"
	out=$(pwd)/files
	make clean
	mount -t proc proc /proc >/dev/null 2>&1
	update_sources
	handle_dep "autopoint"
	handle_dep "automake"
	handle_dep "bison"
	handle_dep "make"
	handle_dep "curl"
	handle_dep "cvs"
	handle_dep "default-jre-headless"
	handle_dep "gawk"
	handle_dep "gdc"
	handle_dep "gettext"
	handle_dep "gperf"
	handle_dep "libasound2-dev"
	handle_dep "libboost-dev"
	handle_dep "libboost-thread-dev"
	handle_dep "libbz2-dev"
	handle_dep "libcap-dev"
	handle_dep "libcdio-dev"
	handle_dep "libcurl4-openssl-dev"
	handle_dep "libdbus-1-dev"
	handle_dep "libfontconfig1-dev"
	handle_dep "libfreetype6-dev"
	handle_dep "libfribidi-dev"
	handle_dep "libgif-dev"
	handle_dep "libiso9660-dev"
	handle_dep "libjasper-dev"
	handle_dep "libjpeg62-turbo-dev"
	handle_dep "liblzo2-dev"
	handle_dep "libmad0-dev"
	handle_dep "libmicrohttpd-dev"
	handle_dep "libmodplug-dev"
	handle_dep "libmpeg2-4-dev"
	handle_dep "libmpeg3-dev"
	handle_dep "libmysqlclient-dev"
	handle_dep "libogg-dev"
	handle_dep "libpcre3-dev"
	handle_dep "libplist-dev"
	handle_dep "libpng12-dev"
	handle_dep "libsmbclient-dev"
	handle_dep "libssh-dev"
	handle_dep "libavahi-client-dev"
	handle_dep "libssl-dev"
	handle_dep "libtiff5-dev"
	handle_dep "libtinyxml-dev"
	handle_dep "libtool"
	handle_dep "libudev-dev"
	handle_dep "libvorbis-dev"
	handle_dep "libxml2-dev"
	handle_dep "libxmu-dev"
	handle_dep "libxslt1-dev"
	handle_dep "libxt-dev"
	handle_dep "libyajl-dev"
	handle_dep "nasm"
	handle_dep "pmount"
	handle_dep "python-dev"
	handle_dep "python-imaging"
	handle_dep "python-sqlite"
	#handle_dep "swig"
	handle_dep "unzip"
	handle_dep "yasm"
	handle_dep "zip"
	handle_dep "zlib1g-dev"
	handle_dep "libtag1-dev"
	handle_dep "libsamplerate0-dev"
	handle_dep "libltdl-dev"
	handle_dep "libgnutls28-dev"
	handle_dep "libgcrypt11-dev"
	handle_dep "git"
	handle_dep "uuid-dev"
	handle_dep "rapidjson-dev-osmc"
	if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ]
	then
		handle_dep "rbp-userland-dev-osmc"
	fi
	if [ "$1" == "vero" ]
	then
		handle_dep "vero-userland-dev-osmc"
	fi
	if [ "$1" == "rbp1" ]
	then
		handle_dep "rbp1-libcec-dev-osmc"
		handle_dep "armv6l-libshairplay-dev-osmc"
		handle_dep "armv6l-librtmp-dev-osmc"
		handle_dep "armv6l-libnfs-dev-osmc"
		handle_dep "armv6l-libplatform-dev-osmc"
		handle_dep "armv6l-libbluray-dev-osmc"
		handle_dep "armv6l-libsqlite-dev-osmc"
		handle_dep "armv6l-libcrossguid-dev-osmc"
		handle_dep "armv6l-cmake-osmc"
		handle_dep "armv6l-libass-dev-osmc"
	fi
	if [ "$1" == "rbp2" ]
	then
		handle_dep "rbp2-libcec-dev-osmc"
		handle_dep "armv7-libshairplay-dev-osmc"
		handle_dep "armv7-librtmp-dev-osmc"
		handle_dep "armv7-libnfs-dev-osmc"
		handle_dep "armv7-libplatform-dev-osmc"
		handle_dep "armv7-libbluray-dev-osmc"
		handle_dep "armv7-libsqlite-dev-osmc"
		handle_dep "armv7-libcrossguid-dev-osmc"
		handle_dep "armv7-cmake-osmc"
		handle_dep "armv7-libass-dev-osmc"
	fi
	if [ "$1" == "vero" ]
	then
		handle_dep "vero-libcec-dev-osmc"
		handle_dep "armv7-libshairplay-dev-osmc"
		handle_dep "armv7-librtmp-dev-osmc"
		handle_dep "armv7-libnfs-dev-osmc"
		handle_dep "armv7-libplatform-dev-osmc"
		handle_dep "armv7-libbluray-dev-osmc"
		handle_dep "armv7-libsqlite-dev-osmc"
		handle_dep "armv7-libcrossguid-dev-osmc"
		handle_dep "armv7-cmake-osmc"
		handle_dep "armv7-libass-dev-osmc"
	fi
        if [ "$1" == "vero2" ]
        then
		handle_dep "vero2-libcec-dev-osmc"
		handle_dep "vero2-userland-dev-osmc"
		handle_dep "vero2-libamcodec-dev-osmc"
                handle_dep "armv7-libshairplay-dev-osmc"
                handle_dep "armv7-librtmp-dev-osmc"
                handle_dep "armv7-libnfs-dev-osmc"
                handle_dep "armv7-libplatform-dev-osmc"
                handle_dep "armv7-libbluray-dev-osmc"
                handle_dep "armv7-libsqlite-dev-osmc"
		handle_dep "armv7-libcrossguid-dev-osmc"
		handle_dep "armv7-cmake-osmc"
		handle_dep "armv7-libass-dev-osmc"
        fi
	if [ "$1" == "vero3" ]
 	then
 		handle_dep "vero3-libcec-dev-osmc"
 		handle_dep "vero3-userland-dev-osmc"
 		handle_dep "vero3-libamcodec-dev-osmc"
 		handle_dep "armv7-libshairplay-dev-osmc"
                handle_dep "armv7-librtmp-dev-osmc"
                handle_dep "armv7-libnfs-dev-osmc"
                handle_dep "armv7-libplatform-dev-osmc"
                handle_dep "armv7-libbluray-dev-osmc"
                handle_dep "armv7-libsqlite-dev-osmc"
                handle_dep "armv7-libcrossguid-dev-osmc"
                handle_dep "armv7-cmake-osmc"
                handle_dep "armv7-libass-dev-osmc"
	fi
	if [ "$1" == "atv" ] # later we change this to if_x11..
	then
		handle_dep "i386-libcec-dev-osmc"
		handle_dep "i386-libshairplay-dev-osmc"
		handle_dep "i386-librtmp-dev-osmc"
		handle_dep "i386-libnfs-dev-osmc"
		handle_dep "i386-libplatform-dev-osmc"
		handle_dep "i386-libbluray-dev-osmc"
		handle_dep "i386-libsqlite-dev-osmc"
		handle_dep "i386-libcrystalhd-dev-osmc"
		handle_dep "xserver-xorg-dev"
		handle_dep "libxrandr-dev"
		handle_dep "i386-libcrossguid-dev-osmc"
		handle_dep "i386-cmake-osmc"
		handle_dep "i386-libass-dev-osmc"
	fi
	if [ "$1" == "pc" ]
	then
		handle_dep "amd64-libshairplay-dev-osmc"
		handle_dep "amd64-librtmp-dev-osmc"
		handle_dep "amd64-libnfs-dev-osmc"
		handle_dep "amd64-libplatform-dev-osmc"
		handle_dep "amd64-libbluray-dev-osmc"
		handle_dep "amd64-libsqlite-dev-osmc"
		handle_dep "xserver-xorg-dev"
		handle_dep "libxrandr-dev"
		handle_dep "x11proto-randr-dev"
		handle_dep "amd64-libcrossguid-dev-osmc"
		handle_dep "libegl1-mesa-dev"
		handle_dep "libglew-dev"
		handle_dep "amd64-cmake-osmc"
		handle_dep "amd64-libass-dev-osmc"
	fi
	sed '/Package/d' -i files/DEBIAN/control
	sed '/Depends/d' -i files/DEBIAN/control
	sed '/Package/d' -i files-debug/DEBIAN/control
	sed '/Depends/d' -i files-debug/DEBIAN/control
	sed '/Version/d' -i files-debug/DEBIAN/control
	echo "Package: ${1}-mediacenter-osmc" >> files/DEBIAN/control
	echo "Package: ${1}-mediacenter-debug-osmc" >> files-debug/DEBIAN/control
	VERSION_DBG=$(grep Version ${out}/DEBIAN/control)
	VERSION_NUM=$(echo $VERSION_DBG | awk {'print $2'})
	echo $VERSION_DBG >> files-debug/DEBIAN/control
	echo "Depends: ${1}-mediacenter-osmc (=${VERSION_NUM})" >> files-debug/DEBIAN/control
	pushd src/xbmc-*
	install_patch "../../patches" "all"
	test "$1" == atv && install_patch "../../patches" "atv"
	test "$1" == pc && install_patch "../../patches" "pc"
	if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ]
	then
		install_patch "../../patches" "rbp"
	fi
	if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ] || [ "$1" == "vero" ] || [ "$1" == "vero2" ] || [ "$1" == "vero3" ]; then install_patch "../../patches" "arm"; fi

	test "$1" == vero && install_patch "../../patches" "vero"
	test "$1" == vero2 && install_patch "../../patches" "vero2"
	test "$1" == vero3 && install_patch "../../patches" "vero3"
	# Apple TV configuration
	test "$1" == atv && \
	COMPFLAGS="-O3 -fomit-frame-pointer -I/usr/include/libcrystalhd  -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
	export CFLAGS+=${COMPFLAGS} && \
	export CXXFLAGS+=${COMPFLAGS} && \
	export CPPFLAGS+=${COMPFLAGS} && \
	export LDFLAGS="" && \
	./configure \
		--prefix=/usr \
		--disable-vaapi \
		--disable-vdpau \
		--disable-pulse \
		--enable-x11 \
		--disable-openmax \
		--enable-optical-drive \
		--enable-libbluray \
                --disable-debug \
                --enable-libcec \
		--disable-optimizations \
		--enable-crystalhd
	# PC configuration
	test "$1" == pc && \
	COMPFLAGS="-O3 -fomit-frame-pointer -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
	export CFLAGS+=${COMPFLAGS} && \
	export CXXFLAGS+=${COMPFLAGS} && \
	export CPPFLAGS+=${COMPFLAGS} && \
	export LDFLAGS="" && \
	./configure \
		--prefix=/usr \
		--disable-vtbdecoder \
		--enable-vaapi \
		--disable-vdpau \
		--disable-pulse \
		--enable-x11 \
		--disable-openmax \
		--enable-optical-drive \
		--enable-libbluray \
		--enable-dvdcss \
		--disable-joystick \
		--disable-debug \
		--disable-optimizations
	# Raspberry Pi Configuration
	if [ "$1" == "rbp1" ]
	then
		CPU="arm1176jzf-s";
		COMPFLAGS="-O3 -fomit-frame-pointer "
	fi
	if [ "$1" == "rbp2" ]
	then
		CPU="cortex-a7"
		COMPFLAGS="-mcpu=cortex-a7 -mtune=cortex-a7 -mfloat-abi=hard -O3 -mfpu=neon-vfpv4 -fomit-frame-pointer "
	fi
	if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ]; then

	LIBRARY_PATH+=/opt/vc/lib && \
	COMPFLAGS+="-I/opt/vc/include -I/opt/vc/include/interface -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
	export CFLAGS+=${COMPFLAGS} && \
	export CXXFLAGS+=${COMPFLAGS} && \
	export CPPFLAGS+=${COMPFLAGS} && \
	export LDFLAGS="-L/opt/vc/lib" && \
          cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DCMAKE_PREFIX_PATH=/opt/vc \
            -DCMAKE_INCLUDE_PATH=/usr/osmc/include \
            -DCMAKE_LIBRARY_PATH=/usr/osmc/lib \
            -DASS_INCLUDE_DIR=/usr/osmc/lib \
	    -DENABLE_X11=0 \
            -DENABLE_OPENGLES=ON \
            -DENABLE_OPENGL=OFF \
            -DENABLE_OPTICAL=1 \
            -DENABLE_DVDCSS=1 \
            -DCORE_SYSTEM_NAME=rbpi \
            -DWITH_ARCH=arm \
            -DWITH_CPU=${CPU} \
	.
	fi
	if [ "$1" == "vero" ]; then
	LIBRARY_PATH+="/opt/vero/lib" && \
	COMPFLAGS="-I/opt/vero/include -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
	export CFLAGS+=${COMPFLAGS} && \
	export CXXFLAGS+=${COMPFLAGS} && \
	export CPPFLAGS+=${COMPFLAGS} && \
	export LDFLAGS="-L/opt/vero/lib" && \
	./configure \
		--prefix=/usr \
		--disable-x11 \
		--disable-openmax \
		--disable-vdpau \
		--disable-vaapi \
		--enable-gles \
		--enable-codec=imxvpu \
		--enable-libcec \
		--disable-debug \
		--disable-texturepacker \
		--enable-optical-drive \
		--enable-dvdcss \
		--enable-libbluray \
		--disable-joystick \
		--disable-vtbdecoder \
		--disable-pulse \
		--disable-optimizations \
		--with-platform=vero \
		--build=arm-linux
	fi
		if [ "$1" == "vero2" ]; then
		LIBRARY_PATH+="/opt/vero2/lib" && \
		COMPFLAGS="-I/opt/vero2/include -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
		export CFLAGS+=${COMPFLAGS} && \
		export CXXFLAGS+=${COMPFLAGS} && \
		export CPPFLAGS+=${COMPFLAGS} && \
		export LDFLAGS="-L/opt/vero2/lib" && \
	./configure \
                --prefix=/usr \
                --disable-x11 \
                --disable-openmax \
                --disable-vdpau \
                --disable-vaapi \
                --enable-gles \
                --enable-codec=amcodec \
		--enable-player=amplayer \
		--enable-alsa \
                --enable-libcec \
                --disable-debug \
                --disable-texturepacker \
                --enable-optical-drive \
                --enable-dvdcss \
                --enable-libbluray \
                --disable-joystick \
                --disable-vtbdecoder \
                --disable-pulse \
                --disable-optimizations \
                --with-platform=vero2 \
                --build=arm-linux
	 fi
         if [ "$1" == "vero3" ]; then
         LIBRARY_PATH+="/opt/vero3/lib" && \
         COMPFLAGS="-I/opt/vero3/include -Wl,-rpath=/usr/osmc/lib -L/usr/osmc/lib " && \
         export CFLAGS+=${COMPFLAGS} && \
         export CXXFLAGS+=${COMPFLAGS} && \
         export CPPFLAGS+=${COMPFLAGS} && \
         export LDFLAGS="-L/opt/vero3/lib" && \
           cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib \
            -DCMAKE_PREFIX_PATH=/opt/vero3 \
            -DCMAKE_INCLUDE_PATH=/opt/vero3/include \
            -DCMAKE_LIBRARY_PATH=/usr/osmc/lib \
            -DOPENGLES_gl_LIBRARY=/opt/vero3/lib \
            -DOPENGLES_egl_LIBRARY=/opt/vero3/lib \
            -DENABLE_X11=0 \
            -DENABLE_AML=ON \
	    -DASS_INCLUDE_DIR=/usr/osmc/lib \
            -DAML_INCLUDE_DIR=/opt/vero3/include \
            -DRapidJSON_INCLUDE_DIR=/opt/vero3/include \
	    -DENABLE_OPENGLES=ON \
            -DENABLE_OPENGL=OFF \
            -DENABLE_OPTICAL=1 \
            -DENABLE_DVDCSS=1 \
            -DWITH_ARCH=arm \
            -DWITH_CPU=${CPU} \
	    -DCORE_PLATFORM_NAME=aml \
            -DCORE_SYSTEM_NAME=linux \
        .
	fi
	if [ $? != 0 ]; then echo -e "Configure failed!" && umount /proc/ > /dev/null 2>&1 && exit 1; fi
	umount /proc/ > /dev/null 2>&1
	$BUILD
	if [ $? != 0 ]; then echo -e "Build failed!" && exit 1; fi
	make install DESTDIR=${out}
	pushd cmake/addons/
	mkdir build
	cd build
	#ADDONS_ADSP="adsp.basic adsp.biquad.filters adsp.freesurround"
 	ADDONS_AUDIO_DECODERS="audiodecoder.modplug audiodecoder.sidplay" #audiodecoder.nosefart audiodecoder.snesapu
	ADDONS_AUDIO_ENCODERS="audioencoder.flac audioencoder.lame audioencoder.vorbis audioencoder.wav"
	ADDONS_INPUTSTREAM="inputstream.adaptive inputstream.mpd inputstream.rtmp"
	ADDONS_PERIPHERAL="peripheral.joystick peripheral.xarcade"
	ADDONS_GAME="game.libretro.2048 game.libretro game.libretro.4do game.libretro.beetle-bsnes \
game.libretro.beetle-gba game.libretro.bsnes-mercury-accuracy game.libretro.handy game.libretro.hatari \
game.libretro.beetle-lynx game.libretro.beetle-pce-fast \
game.libretro.beetle-pcfx game.libretro.beetle-psx game.libretro.beetle-supergrafx game.libretro.beetle-vb \
game.libretro.beetle-wswan game.libretro.bnes \
game.libretro.bsnes-mercury-balanced game.libretro.bsnes-mercury-performance game.libretro.cap32 \
game.libretro.dosbox game.libretro.fbalpha2012 game.libretro.fceumm \
game.libretro.fuse game.libretro.picodrive \
game.libretro.gambatte game.libretro.gw game.libretro.prboom game.libretro.handy game.libretro.hatari \
game.libretro.lutro game.libretro.meteor game.libretro.mgba game.libretro.nestopia game.libretro.nx \
game.libretro.o2em game.libretro.pokemini game.libretro.prosystem game.libretro.quicknes \
game.libretro.snes9x game.libretro.snes9x2002 game.libretro.snes9x2010 \
game.libretro.stella game.libretro.tgbdual game.libretro.tyrquake game.libretro.vba-next \
game.libretro.vbam game.libretro.vecx game.libretro.virtualjaguar game.libretro.yabause game.libretro.dinothaw game.libretro.genplus"
	# game.moonlight "
	#Broken game.libretro.reicast game.libretro.pcem 	
	#game.libretro.mupen64plus 
	#game.libretro.scummvm 
	#game.libretro.fmsx
	# game.libretro.bluemsx game.libretro.beetle-ngp

	ADDONS_PVR="pvr.mythtv pvr.octonet pvr.dvbviewer pvr.iptvsimple pvr.mediaportal.tvserver pvr.argustv pvr.demo pvr.dvblink pvr.filmon pvr.hts pvr.nextpvr pvr.njoy pvr.pctv pvr.stalker pvr.vbox pvr.vuplus pvr.wmc pvr.vdr.vnsi" # vfs.rar
	ADDONS_SCREENSAVERS="screensaver.asteroids screensaver.biogenesis screensaver.greynetic screensaver.matrixtrails screensaver.pingpong screensaver.pyro screensavers.rsxs screensaver.stars"
	ADDONS_VISUALIZATIONS="visualization.fishbmc visualization.goom visualization.projectm visualization.shadertoy visualization.spectrum visualization.vsxu visualization.waveform"
	if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ]
	then
	   ADDONS_TO_BUILD="${ADDONS_GAME} ${ADDONS_ADSP} ${ADDONS_AUDIO_DECODERS} ${ADDONS_AUDIO_ENCODERS} ${ADDONS_INPUTSTREAM} ${ADDONS_PERIPHERAL} ${ADDONS_PVR} ${ADDONS_SCREENSAVERS} ${ADDONS_VISUALIZATIONS}"
	   PLATFORM="-DCMAKE_INCLUDE_PATH=/opt/vc/include:/opt/vc/include/interface:/opt/vc/include/interface/vcos/pthreads:/opt/vc/include/interface/vmcs_host/linux -DCMAKE_LIBRARY_PATH=/opt/vc/lib"
  	fi
	if [ "$1" == "vero" ]
	then
           ADDONS_TO_BUILD="${ADDONS_ADSP} ${ADDONS_AUDIO_DECODERS} ${ADDONS_AUDIO_ENCODERS} ${ADDONS_INPUTSTREAM} ${ADDONS_PERIPHERAL} ${ADDONS_PVR} ${ADDONS_SCREENSAVERS} ${ADDONS_VISUALIZATIONS}"
	   PLATFORM="-DCMAKE_INCLUDE_PATH=/opt/vero/lib -DCMAKE_LIBRARY_PATH=/opt/vero/include"
	fi
	if [ "$1" == "vero2" ]
	then
	   ADDONS_TO_BUILD="${ADDONS_ADSP} ${ADDONS_AUDIO_DECODERS} ${ADDONS_AUDIO_ENCODERS} ${ADDONS_INPUTSTREAM} ${ADDONS_PERIPHERAL} ${ADDONS_PVR} ${ADDONS_SCREENSAVERS} ${ADDONS_VISUALIZATIONS}"
  	   PLATFORM="-DCMAKE_INCLUDE_PATH=/opt/vero2/lib -DCMAKE_LIBRARY_PATH=/opt/vero2/include"
	fi
	if [ "$1" == "vero3" ]
 	then
 	   ADDONS_TO_BUILD="${ADDONS_GAME} ${ADDONS_AUDIO_DECODERS} ${ADDONS_AUDIO_ENCODERS} ${ADDONS_INPUTSTREAM} ${ADDONS_PERIPHERAL} ${ADDONS_PVR}" 
 	   PLATFORM="-DCMAKE_INCLUDE_PATH=/opt/vero3/include -DCMAKE_LIBRARY_PATH=/opt/vero3/lib"
 	fi
	if [ "$1" == "atv" ]
 	then
 	   ADDONS_TO_BUILD="${ADDONS_AUDIO_ENCODERS} ${ADDONS_INPUTSTREAM} ${ADDONS_PERIPHERAL} ${ADDONS_PVR} ${ADDONS_SCREENSAVERS}"
 	   PLATFORM=""
         fi	
	cmake -DOVERRIDE_PATHS=1 -DCMAKE_INSTALL_PREFIX=${out}/usr/ -DBUILD_DIR=$(pwd) -DADDONS_TO_BUILD="${ADDONS_TO_BUILD}" "$PLATFORM" ../
	if [ $? != 0 ]; then echo "Configuring binary addons failed" && exit 1; fi
	cd ../
	$BUILD kodiplatform_DIR=$(pwd) CMAKE_PREFIX_PATH=/usr/osmc -C build/
	if [ $? != 0 ]; then echo "Building binary addons failed" && exit 1; fi
	popd
        # Languages
        mkdir languages/
        pushd languages
        if [ "$API_VERSION" = "18" ]; then api_name="leia"; fi
        if [ "$API_VERSION" = "19" ]; then api_name="tbc"; fi
        base_url="http://mirror.us.leaseweb.net/xbmc/addons/${api_name}"
	handle_dep "wget" # We do not usually use wget in the build environment
        languages=$(wget ${base_url} -O- | grep resource.language. | sed -e 's/<a/\n<a/g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | sed '/tr/d' | sed 's/resource.language.//' | tr -d /)
        if [ $? != 0 ]; then echo "Can't get list of languages" && exit 1; fi
        for language in ${languages}
        do
            echo "Downloading language file for ${language}"
            language_file=$(wget ${base_url}/resource.language.${language} -O- | grep -o '<a .*href=.*>' | sed -e 's/<a/\n<a/g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | tail -n 1)
            if [ $? != 0 ]; then echo "Can't determine language file" && exit 1; fi
	    wget ${base_url}/resource.language.${language}/${language_file}
            if [ $? != 0 ]; then echo "Couldn't download language file ${language_file}" && exit 1; fi
	    unzip ${language_file}
	    rm ${language_file}
        done
        cp -ar resource.language.* ${out}/usr/share/kodi/addons
	popd
	popd
	rm -rf ${out}/usr/share/kodi/addons/service.*.versioncheck
	mkdir -p files-debug/usr/lib/kodi
	cp -ar ${out}/usr/lib/kodi/kodi.bin files-debug/usr/lib/kodi/kodi.bin
	strip -s ${out}/usr/lib/kodi/kodi.bin
	COMMON_DEPENDS="niceprioritypolicy-osmc, mediacenter-send-osmc, libssh-4, libavahi-client3, python, python-imaging, python-unidecode, libsmbclient, libtiff5, libjpeg62-turbo, libsqlite3-0, libtinyxml2.6.2, libogg0, libmad0, libmicrohttpd10, libjasper1, libyajl2, libmysqlclient18, libasound2, libxml2, liblzo2-2, libxslt1.1, libpng12-0, libsamplerate0, libtag1-vanilla, libfribidi0, libgif4, libcdio13, libpcrecpp0, libfreetype6, libvorbis0a, libvorbisenc2, libcurl3, libssl1.0.0, libplist2, avahi-daemon, policykit-1, mediacenter-addon-osmc (>= 3.0.39), mediacenter-skin-osmc, diskmount-osmc (>= 1.2.9)"
	test "$1" == atv && echo "Depends: ${COMMON_DEPENDS}, i386-libcec-osmc, i386-libnfs-osmc, i386-librtmp-osmc, i386-libshairplay-osmc, i386-libbluray-osmc, i386-libsqlite-osmc, libxrandr2, i386-libcrystalhd-osmc, xserver-xorg-core, xserver-xorg, xinit, xfonts-base, x11-xserver-utils, xauth, alsa-utils, xserver-xorg-video-nvidia-legacy-304xx, nvidia-xconfig, i386-libcrossguid-osmc, i386-libass-osmc" >> files/DEBIAN/control
	test "$1" == pc && echo "Depends: ${COMMON_DEPENDS}, amd64-libnfs-osmc, amd64-librtmp-osmc, amd64-libshairplay-osmc, amd64-libbluray-osmc, amd64-libsqlite-osmc, libxrandr2, xserver-xorg-core, xserver-xorg, xinit, xfonts-base, x11-xserver-utils, xauth, alsa-utils, amd64-libcrossguid-osmc, xserver-xorg-video-intel, amd64-libass-osmc" >> files/DEBIAN/control
  	test "$1" == rbp1 && echo "Depends: ${COMMON_DEPENDS}, rbp1-libcec-osmc (>=3.1.0-2), armv6l-libnfs-osmc, armv6l-librtmp-osmc, armv6l-libshairplay-osmc, armv6l-libbluray-osmc, armv6l-libsqlite-osmc, rbp-userland-osmc, armv6l-splash-osmc, armv6l-libcrossguid-osmc, armv6l-libass-osmc" >> files/DEBIAN/control
	test "$1" == rbp2 && echo "Depends: ${COMMON_DEPENDS}, rbp2-libcec-osmc (>=3.1.0-2), armv7-libnfs-osmc, armv7-librtmp-osmc, armv7-libshairplay-osmc, armv7-libbluray-osmc, armv7-libsqlite-osmc, rbp-userland-osmc, armv7-splash-osmc, armv7-libcrossguid-osmc, armv7-libass-osmc" >> files/DEBIAN/control
	test "$1" == vero && echo "Depends: ${COMMON_DEPENDS}, vero-libcec-osmc, armv7-libnfs-osmc, armv7-librtmp-osmc, armv7-libshairplay-osmc, armv7-libbluray-osmc, armv7-libsqlite-osmc, vero-userland-osmc, armv7-splash-osmc, armv7-libcrossguid-osmc, armv7-libass-osmc" >> files/DEBIAN/control
	test "$1" == vero2 && echo "Depends: ${COMMON_DEPENDS}, vero2-libcec-osmc, armv7-libnfs-osmc, armv7-librtmp-osmc, armv7-libshairplay-osmc, armv7-libbluray-osmc, armv7-libsqlite-osmc, vero2-userland-osmc, armv7-splash-osmc, armv7-libcrossguid-osmc, vero2-libamcodec-osmc, armv7-libass-osmc" >> files/DEBIAN/control
	test "$1" == vero3 && echo "Depends: ${COMMON_DEPENDS}, vero3-libcec-osmc, armv7-libnfs-osmc, armv7-librtmp-osmc, armv7-libshairplay-osmc, armv7-libbluray-osmc, armv7-libsqlite-osmc, vero3-userland-osmc, armv7-splash-osmc, armv7-libcrossguid-osmc, vero3-libamcodec-osmc, armv7-libass-osmc" >> files/DEBIAN/control
	cp patches/${1}-watchdog ${out}/usr/bin/mediacenter
	cp patches/${1}-advancedsettings.xml ${out}/usr/share/kodi/system/advancedsettings.xml
	chmod +x ${out}/usr/bin/mediacenter
	test "$1" == vero && cp patches/${1}-hdmi-trace ${out}/usr/bin/hdmi-trace && chmod +x ${out}/usr/bin/hdmi-trace
	fix_arch_ctl "files/DEBIAN/control"
	fix_arch_ctl "files-debug/DEBIAN/control"
	dpkg_build files/ ${1}-mediacenter-osmc.deb
	dpkg_build files-debug/ ${1}-mediacenter-debug-osmc.deb
	build_return=$?
fi
teardown_env "${1}"
exit $build_return
