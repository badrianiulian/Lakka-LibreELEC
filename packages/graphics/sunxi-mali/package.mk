################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="sunxi-mali"
PKG_VERSION="d343311"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/linux-sunxi/sunxi-mali"
PKG_URL="$PKG_SITE.git"
PKG_BUILD_DEPENDS_TARGET="toolchain"
PKG_DEPENDS_TARGET="libump"
PKG_PRIORITY="optional"
PKG_SECTION="graphics"
PKG_SHORTDESC="Sunxi Mali-400 support libraries."
PKG_LONGDESC="Sunxi Mali-400 support libraries."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$LINUX" == "linux-sun8i" ]; then
    make ABI=armhf VERSION=r4p0-00rel0 EGL_TYPE=framebuffer
  else
    make ABI=armhf VERSION=r3p0 EGL_TYPE=framebuffer
  fi
}

pre_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
}

post_makeinstall_target() {

#overwrite outdated GL headers

rm -f $SYSROOT_PREFIX/usr/include/EGL/*
rm -f $SYSROOT_PREFIX/usr/include/GLES/*
rm -f $SYSROOT_PREFIX/usr/include/GLES2/*
rm -f $SYSROOT_PREFIX/usr/include/KHR/*

wget -P $SYSROOT_PREFIX/usr/include/EGL https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/EGL/egl.h
wget -P $SYSROOT_PREFIX/usr/include/EGL https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/EGL/eglext.h
wget -P $SYSROOT_PREFIX/usr/include/EGL https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/EGL/eglplatform.h
wget -P $SYSROOT_PREFIX/usr/include/EGL https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/EGL/fbdev_window.h

wget -P $SYSROOT_PREFIX/usr/include/GLES https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES/gl.h
wget -P $SYSROOT_PREFIX/usr/include/GLES https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES/glext.h
wget -P $SYSROOT_PREFIX/usr/include/GLES https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES/glplatform.h

wget -P $SYSROOT_PREFIX/usr/include/GLES2 https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES2/gl2.h
wget -P $SYSROOT_PREFIX/usr/include/GLES2 https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES2/gl2ext.h
wget -P $SYSROOT_PREFIX/usr/include/GLES2 https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/GLES2/gl2platform.h

wget -P $SYSROOT_PREFIX/usr/include/KHR https://raw.githubusercontent.com/bootlin/mali-blobs/master/include/fbdev/KHR/khrplatform.h
}
