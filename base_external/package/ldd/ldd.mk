
##############################################################
#
# LDD
#
##############################################################

#PSK-DONE: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = '524c8dd'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-psk73.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
#endef
LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

# 
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/assign7
	$(INSTALL) -d 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/etc/assign7
	$(INSTALL) -d 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/assign7
	$(INSTALL) -d 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/assign7
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/etc/assign7
	$(INSTALL) -d 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/assign7
	$(INSTALL) -d 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/assign7
	$(INSTALL) -m 0755 $(@D)/initscript/ldd-start-stop $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(kernel-module))
$(eval $(generic-package))
