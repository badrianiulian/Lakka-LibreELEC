PKG_NAME="mk_arcade_joystick_rpi"
PKG_VERSION="10526d2"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Turro75/mk_arcade_joystick_rpi"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Generic GPIO rpi joystick driver"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  cd ${PKG_BUILD}
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KERNELDIR=$(kernel_path) \
       CROSS_COMPILE=${TARGET_PREFIX} \
       CONFIG_POWER_SAVING=n \
       -f Makefile.cross
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
  cp ${PKG_BUILD}/*.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}

