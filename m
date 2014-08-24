From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/3] subdev: add a pfuse subdev
Date: Sun, 24 Aug 2014 23:15:09 +0200
Message-ID: <1408914911-5022-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

We will use this subdev to disable temperature reading on cards that did not
get a sensor calibration in the factory.

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 configure.ac                   |  1 +
 drm/Kbuild                     |  4 ++
 drm/core/include/subdev/fuse.h |  1 +
 drm/core/subdev/fuse/base.c    |  1 +
 drm/core/subdev/fuse/g80.c     |  1 +
 drm/core/subdev/fuse/gf100.c   |  1 +
 drm/core/subdev/fuse/gm107.c   |  1 +
 drm/core/subdev/fuse/priv.h    |  1 +
 nvkm/engine/device/gm100.c     |  2 +
 nvkm/engine/device/nv50.c      | 15 ++++++++
 nvkm/engine/device/nvc0.c      | 10 +++++
 nvkm/engine/device/nve0.c      |  8 ++++
 nvkm/include/core/device.h     |  1 +
 nvkm/include/subdev/fuse.h     | 30 +++++++++++++++
 nvkm/subdev/Makefile.am        |  3 +-
 nvkm/subdev/fuse/Makefile.am   |  8 ++++
 nvkm/subdev/fuse/base.c        | 62 +++++++++++++++++++++++++++++++
 nvkm/subdev/fuse/g80.c         | 81 +++++++++++++++++++++++++++++++++++++++++
 nvkm/subdev/fuse/gf100.c       | 83 ++++++++++++++++++++++++++++++++++++++++++
 nvkm/subdev/fuse/gm107.c       | 66 +++++++++++++++++++++++++++++++++
 nvkm/subdev/fuse/priv.h        |  9 +++++
 21 files changed, 388 insertions(+), 1 deletion(-)
 create mode 120000 drm/core/include/subdev/fuse.h
 create mode 120000 drm/core/subdev/fuse/base.c
 create mode 120000 drm/core/subdev/fuse/g80.c
 create mode 120000 drm/core/subdev/fuse/gf100.c
 create mode 120000 drm/core/subdev/fuse/gm107.c
 create mode 120000 drm/core/subdev/fuse/priv.h
 create mode 100644 nvkm/include/subdev/fuse.h
 create mode 100644 nvkm/subdev/fuse/Makefile.am
 create mode 100644 nvkm/subdev/fuse/base.c
 create mode 100644 nvkm/subdev/fuse/g80.c
 create mode 100644 nvkm/subdev/fuse/gf100.c
 create mode 100644 nvkm/subdev/fuse/gm107.c
 create mode 100644 nvkm/subdev/fuse/priv.h

diff --git a/configure.ac b/configure.ac
index de27156..b4404a5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -74,6 +74,7 @@ AC_OUTPUT( Makefile \
 	   nvkm/subdev/clock/Makefile \
 	   nvkm/subdev/devinit/Makefile \
 	   nvkm/subdev/fb/Makefile \
+	   nvkm/subdev/fuse/Makefile \
 	   nvkm/subdev/gpio/Makefile \
 	   nvkm/subdev/i2c/Makefile \
 	   nvkm/subdev/ibus/Makefile \
diff --git a/drm/Kbuild b/drm/Kbuild
index c663181..37ab09b 100644
--- a/drm/Kbuild
+++ b/drm/Kbuild
@@ -127,6 +127,10 @@ nouveau-y += core/subdev/fb/ramgk20a.o
 nouveau-y += core/subdev/fb/ramgm107.o
 nouveau-y += core/subdev/fb/sddr3.o
 nouveau-y += core/subdev/fb/gddr5.o
+nouveau-y += core/subdev/fuse/base.o
+nouveau-y += core/subdev/fuse/g80.o
+nouveau-y += core/subdev/fuse/gf100.o
+nouveau-y += core/subdev/fuse/gm107.o
 nouveau-y += core/subdev/gpio/base.o
 nouveau-y += core/subdev/gpio/nv10.o
 nouveau-y += core/subdev/gpio/nv50.o
diff --git a/drm/core/include/subdev/fuse.h b/drm/core/include/subdev/fuse.h
new file mode 120000
index 0000000..421fdd7
--- /dev/null
+++ b/drm/core/include/subdev/fuse.h
@@ -0,0 +1 @@
+../../../../nvkm/include/subdev/fuse.h
\ No newline at end of file
diff --git a/drm/core/subdev/fuse/base.c b/drm/core/subdev/fuse/base.c
new file mode 120000
index 0000000..b218313
--- /dev/null
+++ b/drm/core/subdev/fuse/base.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/fuse/base.c
\ No newline at end of file
diff --git a/drm/core/subdev/fuse/g80.c b/drm/core/subdev/fuse/g80.c
new file mode 120000
index 0000000..c805b0d
--- /dev/null
+++ b/drm/core/subdev/fuse/g80.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/fuse/g80.c
\ No newline at end of file
diff --git a/drm/core/subdev/fuse/gf100.c b/drm/core/subdev/fuse/gf100.c
new file mode 120000
index 0000000..ad9411b
--- /dev/null
+++ b/drm/core/subdev/fuse/gf100.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/fuse/gf100.c
\ No newline at end of file
diff --git a/drm/core/subdev/fuse/gm107.c b/drm/core/subdev/fuse/gm107.c
new file mode 120000
index 0000000..947b11c
--- /dev/null
+++ b/drm/core/subdev/fuse/gm107.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/fuse/gm107.c
\ No newline at end of file
diff --git a/drm/core/subdev/fuse/priv.h b/drm/core/subdev/fuse/priv.h
new file mode 120000
index 0000000..b6dedaa
--- /dev/null
+++ b/drm/core/subdev/fuse/priv.h
@@ -0,0 +1 @@
+../../../../nvkm/subdev/fuse/priv.h
\ No newline at end of file
diff --git a/nvkm/engine/device/gm100.c b/nvkm/engine/device/gm100.c
index 9e9f567..6295668 100644
--- a/nvkm/engine/device/gm100.c
+++ b/nvkm/engine/device/gm100.c
@@ -26,6 +26,7 @@
 #include <subdev/bus.h>
 #include <subdev/gpio.h>
 #include <subdev/i2c.h>
+#include <subdev/fuse.h>
 #include <subdev/clock.h>
 #include <subdev/therm.h>
 #include <subdev/mxm.h>
@@ -62,6 +63,7 @@ gm100_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nvd0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gm107_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &gm107_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
diff --git a/nvkm/engine/device/nv50.c b/nvkm/engine/device/nv50.c
index 932f84f..ca265fe 100644
--- a/nvkm/engine/device/nv50.c
+++ b/nvkm/engine/device/nv50.c
@@ -26,6 +26,7 @@
 #include <subdev/bus.h>
 #include <subdev/gpio.h>
 #include <subdev/i2c.h>
+#include <subdev/fuse.h>
 #include <subdev/clock.h>
 #include <subdev/therm.h>
 #include <subdev/mxm.h>
@@ -62,6 +63,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv50_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv50_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -87,6 +89,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -115,6 +118,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -143,6 +147,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -171,6 +176,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -199,6 +205,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -227,6 +234,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -255,6 +263,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -283,6 +292,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -311,6 +321,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nv84_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -339,6 +350,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -369,6 +381,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -398,6 +411,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -427,6 +441,7 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
diff --git a/nvkm/engine/device/nvc0.c b/nvkm/engine/device/nvc0.c
index b4a2917..89b9fd4 100644
--- a/nvkm/engine/device/nvc0.c
+++ b/nvkm/engine/device/nvc0.c
@@ -26,6 +26,7 @@
 #include <subdev/bus.h>
 #include <subdev/gpio.h>
 #include <subdev/i2c.h>
+#include <subdev/fuse.h>
 #include <subdev/clock.h>
 #include <subdev/therm.h>
 #include <subdev/mxm.h>
@@ -62,6 +63,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -94,6 +96,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -126,6 +129,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -157,6 +161,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -189,6 +194,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -221,6 +227,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -252,6 +259,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -284,6 +292,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nvd0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nvd0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -315,6 +324,7 @@ nvc0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nvd0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  gf117_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
diff --git a/nvkm/engine/device/nve0.c b/nvkm/engine/device/nve0.c
index cdf9147..b1b2e48 100644
--- a/nvkm/engine/device/nve0.c
+++ b/nvkm/engine/device/nve0.c
@@ -26,6 +26,7 @@
 #include <subdev/bus.h>
 #include <subdev/gpio.h>
 #include <subdev/i2c.h>
+#include <subdev/fuse.h>
 #include <subdev/clock.h>
 #include <subdev/therm.h>
 #include <subdev/mxm.h>
@@ -62,6 +63,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nve0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -95,6 +97,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nve0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -128,6 +131,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nve0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -161,6 +165,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &gk20a_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_MC     ] =  gk20a_mc_oclass;
 		device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_TIMER  ] = &gk20a_timer_oclass;
 		device->oclass[NVDEV_SUBDEV_FB     ] =  gk20a_fb_oclass;
 		device->oclass[NVDEV_SUBDEV_LTC    ] =  gk104_ltc_oclass;
@@ -180,6 +185,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nve0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -213,6 +219,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nvd0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
@@ -246,6 +253,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nve0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
diff --git a/nvkm/include/core/device.h b/nvkm/include/core/device.h
index 8743766..1d9d893 100644
--- a/nvkm/include/core/device.h
+++ b/nvkm/include/core/device.h
@@ -24,6 +24,7 @@ enum nv_subdev_type {
 	 * been created, and are allowed to assume any subdevs in the
 	 * list above them exist and have been initialised.
 	 */
+	NVDEV_SUBDEV_FUSE,
 	NVDEV_SUBDEV_MXM,
 	NVDEV_SUBDEV_MC,
 	NVDEV_SUBDEV_BUS,
diff --git a/nvkm/include/subdev/fuse.h b/nvkm/include/subdev/fuse.h
new file mode 100644
index 0000000..2b1ddb2
--- /dev/null
+++ b/nvkm/include/subdev/fuse.h
@@ -0,0 +1,30 @@
+#ifndef __NOUVEAU_FUSE_H__
+#define __NOUVEAU_FUSE_H__
+
+#include <core/subdev.h>
+#include <core/device.h>
+
+struct nouveau_fuse {
+	struct nouveau_subdev base;
+};
+
+static inline struct nouveau_fuse *
+nouveau_fuse(void *obj)
+{
+	return (void *)nv_device(obj)->subdev[NVDEV_SUBDEV_FUSE];
+}
+
+#define nouveau_fuse_create(p, e, o, d)                                        \
+	nouveau_fuse_create_((p), (e), (o), sizeof(**d), (void **)d)
+
+int  nouveau_fuse_create_(struct nouveau_object *, struct nouveau_object *,
+			  struct nouveau_oclass *, int, void **);
+void _nouveau_fuse_dtor(struct nouveau_object *);
+int  _nouveau_fuse_init(struct nouveau_object *);
+#define _nouveau_fuse_fini _nouveau_subdev_fini
+
+extern struct nouveau_oclass g80_fuse_oclass;
+extern struct nouveau_oclass gf100_fuse_oclass;
+extern struct nouveau_oclass gm107_fuse_oclass;
+
+#endif
diff --git a/nvkm/subdev/Makefile.am b/nvkm/subdev/Makefile.am
index c8eb147..5a48ddb 100644
--- a/nvkm/subdev/Makefile.am
+++ b/nvkm/subdev/Makefile.am
@@ -1,4 +1,4 @@
-SUBDIRS = bar bus bios clock devinit fb gpio i2c ibus instmem \
+SUBDIRS = bar bus bios clock devinit fb fuse gpio i2c ibus instmem \
 	  ltc mc mxm pwr therm timer vm volt
 
 noinst_LTLIBRARIES = libsubdev.la
@@ -10,6 +10,7 @@ libsubdev_la_LIBADD   = bar/libbar.la \
 			clock/libclock.la \
 			devinit/libdevinit.la \
 			fb/libfb.la \
+			fuse/libfuse.la \
 			gpio/libgpio.la \
 			i2c/libi2c.la \
 			ibus/libibus.la \
diff --git a/nvkm/subdev/fuse/Makefile.am b/nvkm/subdev/fuse/Makefile.am
new file mode 100644
index 0000000..5596d2c
--- /dev/null
+++ b/nvkm/subdev/fuse/Makefile.am
@@ -0,0 +1,8 @@
+noinst_LTLIBRARIES = libfuse.la
+
+libfuse_la_SOURCES = base.c \
+		    g80.c \
+		    gf100.c \
+		    gm107.c
+
+include $(srcdir)/../Makefile.subdev
diff --git a/nvkm/subdev/fuse/base.c b/nvkm/subdev/fuse/base.c
new file mode 100644
index 0000000..d249f2b
--- /dev/null
+++ b/nvkm/subdev/fuse/base.c
@@ -0,0 +1,62 @@
+/*
+ * Copyright 2014 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Martin Peres
+ */
+
+#include <subdev/fuse.h>
+
+int
+_nouveau_fuse_init(struct nouveau_object *object)
+{
+	struct nouveau_fuse *fuse = (void *)object;
+	int ret;
+
+	ret = nouveau_subdev_init(&fuse->base);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void
+_nouveau_fuse_dtor(struct nouveau_object *object)
+{
+	struct nouveau_fuse *fuse = (void *)object;
+	nouveau_subdev_destroy(&fuse->base);
+}
+
+int
+nouveau_fuse_create_(struct nouveau_object *parent,
+		     struct nouveau_object *engine,
+		     struct nouveau_oclass *oclass, int length, void **pobject)
+{
+	struct nouveau_fuse *fuse;
+	int ret;
+
+	ret = nouveau_subdev_create_(parent, engine, oclass, 0, "FUSE",
+				     "fuse", length, pobject);
+	fuse = *pobject;
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/nvkm/subdev/fuse/g80.c b/nvkm/subdev/fuse/g80.c
new file mode 100644
index 0000000..31ab5c7
--- /dev/null
+++ b/nvkm/subdev/fuse/g80.c
@@ -0,0 +1,81 @@
+/*
+ * Copyright 2014 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Martin Peres
+ */
+
+#include "priv.h"
+
+struct g80_fuse_priv {
+	struct nouveau_fuse base;
+
+	spinlock_t fuse_enable_lock;
+};
+
+static u32
+nouveau_fuse_rd32(struct nouveau_object *object, u64 addr)
+{
+	struct g80_fuse_priv *priv = (void *)object;
+	unsigned long flags;
+	u32 fuse_enable, val;
+
+	spin_lock_irqsave(&priv->fuse_enable_lock, flags);
+
+	/* racy if another part of nouveau start writing to this reg */
+	fuse_enable = nv_mask(priv, 0x1084, 0x800, 0x800);
+	val = nv_rd32(priv, 0x21000 + addr);
+	nv_wr32(priv, 0x1084, fuse_enable);
+
+	spin_unlock_irqrestore(&priv->fuse_enable_lock, flags);
+
+	return val;
+}
+
+
+static int
+g80_fuse_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	       struct nouveau_oclass *oclass, void *data, u32 size,
+	       struct nouveau_object **pobject)
+{
+	struct g80_fuse_priv *priv;
+	int ret;
+
+	ret = nouveau_fuse_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&priv->fuse_enable_lock);
+
+	return 0;
+}
+
+struct nouveau_oclass
+g80_fuse_oclass = {
+	.handle = NV_SUBDEV(FUSE, 0x50),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = g80_fuse_ctor,
+		.dtor = _nouveau_fuse_dtor,
+		.init = _nouveau_fuse_init,
+		.fini = _nouveau_fuse_fini,
+		.rd32 = nouveau_fuse_rd32,
+	},
+};
diff --git a/nvkm/subdev/fuse/gf100.c b/nvkm/subdev/fuse/gf100.c
new file mode 100644
index 0000000..8407453
--- /dev/null
+++ b/nvkm/subdev/fuse/gf100.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright 2014 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Martin Peres
+ */
+
+#include "priv.h"
+
+struct gf100_fuse_priv {
+	struct nouveau_fuse base;
+
+	spinlock_t fuse_enable_lock;
+};
+
+static u32
+nouveau_fuse_rd32(struct nouveau_object *object, u64 addr)
+{
+	struct gf100_fuse_priv *priv = (void *)object;
+	unsigned long flags;
+	u32 fuse_enable, unk, val;
+
+	spin_lock_irqsave(&priv->fuse_enable_lock, flags);
+
+	/* racy if another part of nouveau start writing to these regs */
+	fuse_enable = nv_mask(priv, 0x22400, 0x800, 0x800);
+	unk = nv_mask(priv, 0x21000, 0x1, 0x1);
+	val = nv_rd32(priv, 0x21100 + addr);
+	nv_wr32(priv, 0x21000, unk);
+	nv_wr32(priv, 0x22400, fuse_enable);
+
+	spin_unlock_irqrestore(&priv->fuse_enable_lock, flags);
+
+	return val;
+}
+
+
+static int
+gf100_fuse_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	       struct nouveau_oclass *oclass, void *data, u32 size,
+	       struct nouveau_object **pobject)
+{
+	struct gf100_fuse_priv *priv;
+	int ret;
+
+	ret = nouveau_fuse_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&priv->fuse_enable_lock);
+
+	return 0;
+}
+
+struct nouveau_oclass
+gf100_fuse_oclass = {
+	.handle = NV_SUBDEV(FUSE, 0xC0),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = gf100_fuse_ctor,
+		.dtor = _nouveau_fuse_dtor,
+		.init = _nouveau_fuse_init,
+		.fini = _nouveau_fuse_fini,
+		.rd32 = nouveau_fuse_rd32,
+	},
+};
diff --git a/nvkm/subdev/fuse/gm107.c b/nvkm/subdev/fuse/gm107.c
new file mode 100644
index 0000000..4ade700
--- /dev/null
+++ b/nvkm/subdev/fuse/gm107.c
@@ -0,0 +1,66 @@
+/*
+ * Copyright 2014 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Martin Peres
+ */
+
+#include "priv.h"
+
+struct gm107_fuse_priv {
+	struct nouveau_fuse base;
+};
+
+static u32
+nouveau_fuse_rd32(struct nouveau_object *object, u64 addr)
+{
+	struct gf100_fuse_priv *priv = (void *)object;
+
+	return nv_rd32(priv, 0x21100 + addr);
+}
+
+
+static int
+gm107_fuse_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	       struct nouveau_oclass *oclass, void *data, u32 size,
+	       struct nouveau_object **pobject)
+{
+	struct gm107_fuse_priv *priv;
+	int ret;
+
+	ret = nouveau_fuse_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+struct nouveau_oclass
+gm107_fuse_oclass = {
+	.handle = NV_SUBDEV(FUSE, 0x117),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = gm107_fuse_ctor,
+		.dtor = _nouveau_fuse_dtor,
+		.init = _nouveau_fuse_init,
+		.fini = _nouveau_fuse_fini,
+		.rd32 = nouveau_fuse_rd32,
+	},
+};
diff --git a/nvkm/subdev/fuse/priv.h b/nvkm/subdev/fuse/priv.h
new file mode 100644
index 0000000..d208541
--- /dev/null
+++ b/nvkm/subdev/fuse/priv.h
@@ -0,0 +1,9 @@
+#ifndef __NVKM_FUSE_PRIV_H__
+#define __NVKM_FUSE_PRIV_H__
+
+#include <subdev/fuse.h>
+
+int _nouveau_fuse_init(struct nouveau_object *object);
+void _nouveau_fuse_dtor(struct nouveau_object *object);
+
+#endif
-- 
2.0.0
