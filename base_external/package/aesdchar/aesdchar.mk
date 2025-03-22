#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_VERSION = '94d6df6fb5439f56f8b755008948c34c6ee8d389'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Sriramz2002.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver


AESDCHAR_MODULE_MAKE_OPTS = \
    ARCH=$(KERNEL_ARCH) \
    KERNELDIR=$(LINUX_DIR) \
    KVERSION=$(LINUX_VERSION_PROBED) \
    EXTRA_CFLAGS="-I$(@D)/include"


# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESDCHAR_INSTALL_TARGET_CMDS

	$(INSTALL) -m 755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	
	
	$(INSTALL) -m 755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	
	
	$(INSTALL) -m 755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/usr/bin/
	
	
	$(INSTALL) -m 755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/etc/init.d/	
	
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
	
endef

$(eval $(kernel-module))
$(eval $(generic-package))


