
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################


LDD_VERSION = cc29c9ac15893e95c2c3ca7fb01607a5170b5276
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Sriramz2002.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_DEPENDENCIES = linux

LDD_MODULE_SUBDIRS = misc-modules scull

LDD_MODULE_MAKE_OPTS = \
    ARCH=$(KERNEL_ARCH) \
    KERNELDIR=$(LINUX_DIR) \
    KVERSION=$(LINUX_VERSION_PROBED) \
    EXTRA_CFLAGS="-I$(@D)/include"

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules
#        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
#endef

define LDD_INSTALL_TARGET_CMDS
    # Install kernel modules in the correct location
    mkdir -p $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/extra/
    $(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/extra/
    $(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/extra/
    $(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/extra/

    # Install helper scripts for loading/unloading modules
    mkdir -p $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))

