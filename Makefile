# SPDX-License-Identifier: GPL-2.0-only

# auto-detect subdirs
ifeq ($(CONFIG_DISP_QCOM_REFERENCE_PLATFORMS),y)
ifeq ($(CONFIG_ARCH_KONA), y)
include $(srctree)/techpack/display/config/konadisp.conf
endif

ifeq ($(CONFIG_ARCH_KONA), y)
LINUXINCLUDE    += -include $(srctree)/techpack/display/config/konadispconf.h
endif

ifeq ($(CONFIG_ARCH_LITO), y)
include $(srctree)/techpack/display/config/saipdisp.conf
endif

ifeq ($(CONFIG_ARCH_LITO), y)
LINUXINCLUDE    += -include $(srctree)/techpack/display/config/saipdispconf.h
endif

ifeq ($(CONFIG_ARCH_BENGAL), y)
include $(srctree)/techpack/display/config/bengaldisp.conf
endif

ifeq ($(CONFIG_ARCH_BENGAL), y)
LINUXINCLUDE    += -include $(srctree)/techpack/display/config/bengaldispconf.h
endif
endif # CONFIG_DISP_QCOM_REFERENCE_PLATFORMS


ifneq ($(CONFIG_DISP_TARGET_NO_DISPLAY), y)
 include $(srctree)/techpack/display/config/sony/disp_common.conf
 LINUXINCLUDE	+= -include $(srctree)/techpack/display/config/sony/disp_common.h

 ifneq ($(CONFIG_DISP_TARGET_DISABLE_DISPLAYPORT), y)
  include $(srctree)/techpack/display/config/sony/disp_displayport.conf
  LINUXINCLUDE	+= -include $(srctree)/techpack/display/config/sony/disp_displayport.h
 endif

endif # !CONFIG_DISP_TARGET_NO_DISPLAY

obj-$(CONFIG_DRM_MSM) += msm/
obj-$(CONFIG_MSM_SDE_ROTATOR) += rotator/
obj-$(CONFIG_QCOM_MDSS_PLL) += pll/
obj-$(CONFIG_DRM_MSM_DSI_SOMC_PANEL) += somc_panel/
