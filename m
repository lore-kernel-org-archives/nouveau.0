From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 2/3] nouveau: Add kernel-docs for module
 parameters
Date: Tue,  6 Oct 2020 17:13:12 -0400
Message-ID: <20201006211313.49177-3-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
 <20201006211313.49177-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201006211313.49177-1-jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

In preparation for the nouveau kernel documentation page, add some
documentation for the supported module parameters. It would be ideal if
the value given to MODULE_PARM_DESC could be referenced in Sphinx to
auto-document these parameters for both readers of the kernel's Sphinx
project and users of modinfo, but that appears to require a bit of work
so for now this approach will do.

Signed-off-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 162 ++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22d246acc5e5..8d5f17326910 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -68,27 +68,189 @@
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 
+/**
+ * DOC: config (string)
+ *
+ * A configuration string used to adjust a variety of module behaviors. The
+ * value of this parameter should be a string of comma-separated key=value
+ * pairs.
+ *
+ * values marked as integers are parsed as hex when they include a leading 0x,
+ * octal when they include a leading 0, otherwise they are parsed as decimals.
+ *
+ * Supported key-value pairs include:
+ *
+ * * GP100MmuLayout (boolean): If false, the old pre-GP100 VMM backend is used;
+ *   defaults to true and is only valid on NV130-NV138 chips.
+ *
+ * * <engine-name> (boolean): disable the given engine; all engines are enabled
+ *   by default.
+ *
+ * * NvAcrWpr (integer): This configuration option is for debugging signed
+ *   firmware blobs and is not for end users; defaults to -1
+ *
+ * * NvAcrWprCompare (boolean): This configuration option is for debugging
+ *   signed firmware blobs and is not for end users; defaults to false.
+ *
+ * * NvAcrWprPrevAddr (integer): This configuration option is for debugging signed
+ *   firmware blobs and is not for end users; defaults to 0.
+ *
+ * * NvBar2Halve (boolean): Halve the BAR2 size; defaults to false.
+ *
+ * * NvFanPWM (boolean): Force PWM for the fan; default is to auto-detect.
+ *
+ * * NvForcePost (boolean): Force the device to perform a POST; defaults to false.
+ *
+ * * NvGrResetWar (boolean): Reset the GR for an extended period to work around
+ *   an issue where GR stops responding; defaults to true on certain Pascal
+ *   boards where it is a known problem.
+ *
+ * * NvGrUseFW (boolean): Load firmware for PGRAPH (valid on the NVC0, NVE0,
+ *   and NV110 families); defaults to false.
+ *
+ * * NvI2C (boolean): Use the nouveau-internal I2C bus driver rather than the
+ *   I2C bit-adapters; defaults to false.
+ *
+ * * NvMemExec (boolean): Perform memory reclocking; defaults to true.
+ *
+ * * NvMSI (boolean): Use MSI interrupts; defaults to true on chipsets that
+ *   support it..
+ *
+ * * NvMXMDCB (boolean): Sanitize DCB outputs from the VBIOS; defaults to true.
+ *
+ * * NvPCIE (boolean): Whether to use the PCI-E GART (valid on NV40 chips only);
+ *   defaults to true.
+ *
+ * * NvPmShowAll (boolean): Report all perfmon signals in queries; defaults to
+ *   false.
+ *
+ * * NvPmUnnamed (boolean): Use the raw signal number rather than the name in
+ *   perfmon queries; defaults to the value of NvPmShowAll.
+ *
+ * * NvPmEnableGating (boolean): Enable clockgating for chipsets that support
+ *   it; defaults to false.
+ *
+ * * War00C800_0 (boolean): Enables the PGOB work-around on all GK10[467]
+ *   boards; defaults to true.
+ *
+ * * MmuDebugBufferSize (integer): Size of the MUU debug buffers; defaults to
+ *   the framebuffer page size.
+ *
+ * * NvAGP (integer): Force a particular AGP mode (0 to disable).
+ *
+ * * NvChipset (integer): Override the detected chipset; useful for development.
+ *
+ * * NvFbBigPage (integer): Size of the framebuffer big page in bits
+ *   (e.g. 16 means 64KiB); default is chip-dependent.
+ *
+ * * NvBios (string): Specify the Video BIOS source; options include:
+ *
+ *   * "OpenFirmware"
+ *   * "PRAMIN"
+ *   * "PROM"
+ *   * "ACPI"
+ *   * "PCIROM"
+ *   * "PLATFORM"
+ *   * A file name passed on to request_firmware.
+ *
+ * * NvBoost (integer): Specify the Boost mode for Fermi and newer. Valid
+ *   options are:
+ *
+ *   * 0: base clocks (default)
+ *   * 1: boost clocks
+ *   * 2: max clocks
+ *
+ * * NvClkMode (string): Force a particular clock level on boot. This is
+ *   equivalent to passing both ``NvClkModeAC`` and ``NvClkModeDC``.
+ *
+ * * NvClkModeAC (string): Force a particular clock level when plugged in to a
+ *   power source.
+ *
+ * * NvClkModeDC (string): Force a particular clock level when running on
+ *   battery.
+ */
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
 
+/**
+ * DOC: debug (string)
+ *
+ * Like the "config" parameter, this is a string of comma-separated key=values.
+ * Valid keys include:
+ *
+ * * CLIENT
+ * * <subdevice>
+ *
+ * The list of current sub-device and engine names is in the %nvkm_subdev_name
+ * array and is enumerated in &enum nvkm_devidx.
+ *
+ * Valid values are log levels to use for messages from the given key:
+ *
+ * * fatal
+ * * error
+ * * warn
+ * * info
+ * * debug
+ * * trace
+ * * paranoia
+ * * spam
+ */
+
 MODULE_PARM_DESC(debug, "debug string to pass to driver core");
 static char *nouveau_debug;
 module_param_named(debug, nouveau_debug, charp, 0400);
 
+/**
+ * DOC: noaccel (boolean)
+ *
+ * Set to ``1`` to disable kernel/abi16 acceleration; defaults to ``0``
+ * (false).
+ */
 MODULE_PARM_DESC(noaccel, "disable kernel/abi16 acceleration");
 static int nouveau_noaccel = 0;
 module_param_named(noaccel, nouveau_noaccel, int, 0400);
 
+/**
+ * DOC: modeset (integer)
+ *
+ * Whether to enable the driver; defaults to automatically detecting whether it
+ * should be enabled. Valid values are:
+ *
+ * * ``0`` - The driver is disabled
+ * * ``1`` - The driver is enabled
+ * * ``2`` - The driver runs in headless mode.
+ */
 MODULE_PARM_DESC(modeset, "enable driver (default: auto, "
 		          "0 = disabled, 1 = enabled, 2 = headless)");
 int nouveau_modeset = -1;
 module_param_named(modeset, nouveau_modeset, int, 0400);
 
+/**
+ * DOC: atomic (boolean)
+ *
+ * Set to ``1`` to enable atomic modesetting support; defaults to ``0``
+ * (false).
+ */
 MODULE_PARM_DESC(atomic, "Expose atomic ioctl (default: disabled)");
 static int nouveau_atomic = 0;
 module_param_named(atomic, nouveau_atomic, int, 0400);
 
+/**
+ * DOC: runpm (integer)
+ *
+ * Control whether or not runtime power management is used. Valid values are:
+ *
+ * * ``0`` - Disables runtime power management
+ * * ``1`` - Forces runtime power management to be enabled
+ * * ``-1`` - Enables runtime power management for Optimus-enabled hardware
+ *   (default).
+ *
+ * .. warning:: Power management is a very experimental feature and is not
+ *	expected to work. If you decided to up-clock your GPU, please
+ *	be aware that your card may overheat. Check the temperature of your GPU
+ *	at all times!
+ */
 MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1)");
 static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
-- 
2.28.0
