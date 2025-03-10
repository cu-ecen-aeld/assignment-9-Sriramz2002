
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################


LDD_VERSION = d516c63744d5b7e8cb3498068c81c4798991297b
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Sriramz2002.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES


LDD_MODULE_SUBDIRS = misc-modules scull

LDD_MODULE_MAKE_OPTS = \
    ARCH=$(KERNEL_ARCH) \
    KERNELDIR=$(LINUX_DIR) \
    KVERSION=$(LINUX_VERSION_PROBED) \
    EXTRA_CFLAGS="-I$(@D)/include"


define LDD_INSTALL_TARGET_CMDS
$(INSTALL) -m 755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin

	
	
	$(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/usr/bin/scull.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/usr/bin/faulty.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/usr/bin/hello.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/etc/init.d/faulty.ko
        $(INSTALL) -m 755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/etc/init.d/hello.ko
	$(INSTALL) -m 755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 $(@D)/scull/scull.ko $(TARGET_DIR)/etc/init.d/scull.ko

endef

$(eval $(kernel-module))
$(eval $(generic-package))

