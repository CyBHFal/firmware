################################################################################
#
# ingenic-opensdk
#
################################################################################

INGENIC_OPENSDK_LICENSE = GPL-3.0
INGENIC_OPENSDK_LICENSE_FILES = LICENSE
INGENIC_OPENSDK_SITE = $(BR2_EXTERNAL_INGENIC_PATH)/package/ingenic-opensdk/src/kernel
INGENIC_OPENSDK_SITE_METHOD = local

FAMILY = $(shell grep "/board/" $(BR2_CONFIG) | head -1 | cut -d "/" -f 3)

INGENIC_OPENSDK_MODULE_SUBDIRS += sensor_info gpio_claimer

INGENIC_OPENSDK_MODULE_MAKE_OPTS = \
	CONFIG_GPIO=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR) \
	INSTALL_MOD_DIR=ingenic

$(eval $(kernel-module))
$(eval $(generic-package))
