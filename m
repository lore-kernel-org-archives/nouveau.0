From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau: allow nv04/nv50/nvc0+ parts of the driver to be
 separated
Date: Sun, 23 Mar 2014 09:44:10 -0400
Message-ID: <1395582250-25000-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This will allow the nouveau module to only include support for
nv04-nv50, nv50-nvc0, nvc0+ cards individually (or in any combination).

Only compiling one of the card types at a time reduces the size of the
nouveau module, from 1.3M to 700-800K, depending on the type (including
symbols/etc). It should also yield a reduction in compile time as a lot
fewer files are compiled.

Here are the sizes from a sample compilation. I expect the nvc0 portion
to gain size as it contains ctx switching firmware for an increasing
amount of hardware. This could further be split off as necessary.

Nothing: 416118 bytes
   text    data     bss     dec     hex filename
 198669    9525      80  208274   32d92 drivers/gpu/drm/nouveau/nouveau.ko

NV04: 710270 bytes
   text    data     bss     dec     hex filename
 333755   35094     160  369009   5a171 drivers/gpu/drm/nouveau/nouveau.ko

NV50: 722079 bytes
   text    data     bss     dec     hex filename
 346476   34727     480  381683   5d2f3 drivers/gpu/drm/nouveau/nouveau.ko

NVC0: 878726 bytes
   text    data     bss     dec     hex filename
 360593  140327      80  501000   7a508 drivers/gpu/drm/nouveau/nouveau.ko

NV04 + NV50: 995817 bytes
   text    data     bss     dec     hex filename
 472244   59528     480  532252   81f1c drivers/gpu/drm/nouveau/nouveau.ko

NV04 + NVC0: 1167727 bytes
   text    data     bss     dec     hex filename
 493567  165704     160  659431   a0fe7 drivers/gpu/drm/nouveau/nouveau.ko

NV50 + NVC0: 1070110 bytes
   text    data     bss     dec     hex filename
 453459  159463     480  613402   95c1a drivers/gpu/drm/nouveau/nouveau.ko

NV04 + NV50 + NVC0: 1343482 bytes
   text    data     bss     dec     hex filename
 579171  184264     480  763915   ba80b drivers/gpu/drm/nouveau/nouveau.ko

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

From my earlier posting of an early version of this patch, there wasn't much
appetite for such a split. However I thought I'd send this out for
posterity. This patch is unlikely to apply to master anymore as some files
have been added, but it should be fairly easy to fix up should interest
develop in mainlining this.

 drivers/gpu/drm/nouveau/Kconfig                   |  44 ++-
 drivers/gpu/drm/nouveau/Makefile                  | 445 ++++++++++++----------
 drivers/gpu/drm/nouveau/core/engine/device/base.c |   6 +
 drivers/gpu/drm/nouveau/core/engine/graph/names.c |  72 ++++
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c  |  47 ---
 drivers/gpu/drm/nouveau/core/subdev/fb/mem.c      |  58 +++
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c  |  31 --
 drivers/gpu/drm/nouveau/dispnv04/disp.h           |   9 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c            |  15 +-
 drivers/gpu/drm/nouveau/nouveau_display.c         |   4 +
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  14 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.h           |  38 ++
 drivers/gpu/drm/nouveau/nv50_display.h            |   7 +
 13 files changed, 499 insertions(+), 291 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/graph/names.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/mem.c

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 7cf787d..a43247f 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -26,9 +26,47 @@ config DRM_NOUVEAU
 	help
 	  Choose this option for open-source nVidia support.
 
+if DRM_NOUVEAU
+
+config DRM_NOUVEAU_NV04
+	bool "NV04:NV50 (pre-G80)"
+	default y
+	help
+	  Builds support for all pre-NV50 cards:
+
+	  Riva TNT/TNT2
+	  GeForce 256
+	  GeForce2
+	  GeForce3
+	  GeForce4
+	  GeForce FX
+	  GeForce 6
+	  GeForce 7
+
+config DRM_NOUVEAU_NV50
+	bool "NV50:NVC0 (G80+, GT215+)"
+	default y
+	help
+	  Builds support for all Tesla cards:
+
+	  GeForce 8
+	  GeForce 9
+	  GeForce 200
+	  GeForce 300
+
+config DRM_NOUVEAU_NVC0
+	bool "NVC0+ (GF1xx, GK1xx, GK2xx)"
+	default y
+	help
+	  Builds support for all Fermi and Kepler cards:
+
+	  GeForce 400
+	  GeForce 500
+	  GeForce 600
+	  GeForce 700
+
 config NOUVEAU_DEBUG
 	int "Maximum debug level"
-	depends on DRM_NOUVEAU
 	range 0 7
 	default 5
 	help
@@ -48,7 +86,6 @@ config NOUVEAU_DEBUG
 
 config NOUVEAU_DEBUG_DEFAULT
 	int "Default debug level"
-	depends on DRM_NOUVEAU
 	range 0 7
 	default 3
 	help
@@ -56,8 +93,9 @@ config NOUVEAU_DEBUG_DEFAULT
 
 config DRM_NOUVEAU_BACKLIGHT
 	bool "Support for backlight control"
-	depends on DRM_NOUVEAU
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display
 	  (e.g. a laptop panel).
+
+endif
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index d310c19..8f40be9 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -24,8 +24,9 @@ nouveau-y += core/core/ramht.o
 nouveau-y += core/core/subdev.o
 
 nouveau-y += core/subdev/bar/base.o
-nouveau-y += core/subdev/bar/nv50.o
-nouveau-y += core/subdev/bar/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/bar/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/bar/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/bar/nvc0.o
 nouveau-y += core/subdev/bios/base.o
 nouveau-y += core/subdev/bios/bit.o
 nouveau-y += core/subdev/bios/boost.o
@@ -50,112 +51,121 @@ nouveau-y += core/subdev/bios/volt.o
 nouveau-y += core/subdev/bios/xpio.o
 nouveau-y += core/subdev/bus/hwsq.o
 nouveau-y += core/subdev/bus/nv04.o
-nouveau-y += core/subdev/bus/nv31.o
-nouveau-y += core/subdev/bus/nv50.o
-nouveau-y += core/subdev/bus/nv94.o
-nouveau-y += core/subdev/bus/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/bus/nv31.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/bus/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/bus/nv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/bus/nvc0.o
 nouveau-y += core/subdev/clock/base.o
-nouveau-y += core/subdev/clock/nv04.o
-nouveau-y += core/subdev/clock/nv40.o
-nouveau-y += core/subdev/clock/nv50.o
-nouveau-y += core/subdev/clock/nv84.o
-nouveau-y += core/subdev/clock/nva3.o
-nouveau-y += core/subdev/clock/nvaa.o
-nouveau-y += core/subdev/clock/nvc0.o
-nouveau-y += core/subdev/clock/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/clock/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/clock/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/clock/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/clock/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/clock/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/clock/nvaa.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/clock/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/clock/nve0.o
 nouveau-y += core/subdev/clock/pllnv04.o
-nouveau-y += core/subdev/clock/pllnva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/clock/pllnva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/clock/pllnva3.o
 nouveau-y += core/subdev/devinit/base.o
-nouveau-y += core/subdev/devinit/nv04.o
-nouveau-y += core/subdev/devinit/nv05.o
-nouveau-y += core/subdev/devinit/nv10.o
-nouveau-y += core/subdev/devinit/nv1a.o
-nouveau-y += core/subdev/devinit/nv20.o
-nouveau-y += core/subdev/devinit/nv50.o
-nouveau-y += core/subdev/devinit/nv84.o
-nouveau-y += core/subdev/devinit/nv98.o
-nouveau-y += core/subdev/devinit/nva3.o
-nouveau-y += core/subdev/devinit/nvaf.o
-nouveau-y += core/subdev/devinit/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/devinit/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/devinit/nv05.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/devinit/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/devinit/nv1a.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/devinit/nv20.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/devinit/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/devinit/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/devinit/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/devinit/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/devinit/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/devinit/nvaf.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/devinit/nvc0.o
 nouveau-y += core/subdev/fb/base.o
-nouveau-y += core/subdev/fb/nv04.o
-nouveau-y += core/subdev/fb/nv10.o
-nouveau-y += core/subdev/fb/nv1a.o
-nouveau-y += core/subdev/fb/nv20.o
-nouveau-y += core/subdev/fb/nv25.o
-nouveau-y += core/subdev/fb/nv30.o
-nouveau-y += core/subdev/fb/nv35.o
-nouveau-y += core/subdev/fb/nv36.o
-nouveau-y += core/subdev/fb/nv40.o
-nouveau-y += core/subdev/fb/nv41.o
-nouveau-y += core/subdev/fb/nv44.o
-nouveau-y += core/subdev/fb/nv46.o
-nouveau-y += core/subdev/fb/nv47.o
-nouveau-y += core/subdev/fb/nv49.o
-nouveau-y += core/subdev/fb/nv4e.o
-nouveau-y += core/subdev/fb/nv50.o
-nouveau-y += core/subdev/fb/nv84.o
-nouveau-y += core/subdev/fb/nva3.o
-nouveau-y += core/subdev/fb/nvaa.o
-nouveau-y += core/subdev/fb/nvaf.o
-nouveau-y += core/subdev/fb/nvc0.o
-nouveau-y += core/subdev/fb/nve0.o
-nouveau-y += core/subdev/fb/ramnv04.o
-nouveau-y += core/subdev/fb/ramnv10.o
-nouveau-y += core/subdev/fb/ramnv1a.o
-nouveau-y += core/subdev/fb/ramnv20.o
-nouveau-y += core/subdev/fb/ramnv40.o
-nouveau-y += core/subdev/fb/ramnv41.o
-nouveau-y += core/subdev/fb/ramnv44.o
-nouveau-y += core/subdev/fb/ramnv49.o
-nouveau-y += core/subdev/fb/ramnv4e.o
-nouveau-y += core/subdev/fb/ramnv50.o
-nouveau-y += core/subdev/fb/ramnva3.o
-nouveau-y += core/subdev/fb/ramnvaa.o
-nouveau-y += core/subdev/fb/ramnvc0.o
-nouveau-y += core/subdev/fb/ramnve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/mem.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/mem.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv1a.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv20.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv25.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv30.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv35.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv36.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv41.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv44.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv46.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv47.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv49.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/nv4e.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/nvaa.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/nvaf.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv1a.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv20.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv41.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv44.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv49.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/fb/ramnv4e.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/ramnv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/ramnva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/fb/ramnvaa.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/ramnvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/ramnve0.o
 nouveau-y += core/subdev/fb/sddr3.o
 nouveau-y += core/subdev/fb/gddr5.o
 nouveau-y += core/subdev/gpio/base.o
-nouveau-y += core/subdev/gpio/nv10.o
-nouveau-y += core/subdev/gpio/nv50.o
-nouveau-y += core/subdev/gpio/nvd0.o
-nouveau-y += core/subdev/gpio/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/gpio/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/gpio/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/gpio/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/gpio/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/gpio/nve0.o
 nouveau-y += core/subdev/i2c/base.o
 nouveau-y += core/subdev/i2c/anx9805.o
 nouveau-y += core/subdev/i2c/aux.o
 nouveau-y += core/subdev/i2c/bit.o
-nouveau-y += core/subdev/i2c/nv04.o
-nouveau-y += core/subdev/i2c/nv4e.o
-nouveau-y += core/subdev/i2c/nv50.o
-nouveau-y += core/subdev/i2c/nv94.o
-nouveau-y += core/subdev/i2c/nvd0.o
-nouveau-y += core/subdev/ibus/nvc0.o
-nouveau-y += core/subdev/ibus/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/i2c/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/i2c/nv4e.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/i2c/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/i2c/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/i2c/nv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/i2c/nv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/i2c/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ibus/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ibus/nve0.o
 nouveau-y += core/subdev/instmem/base.o
-nouveau-y += core/subdev/instmem/nv04.o
-nouveau-y += core/subdev/instmem/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/instmem/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/instmem/nv40.o
 nouveau-y += core/subdev/instmem/nv50.o
-nouveau-y += core/subdev/ltcg/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ltcg/nvc0.o
 nouveau-y += core/subdev/mc/base.o
 nouveau-y += core/subdev/mc/nv04.o
 nouveau-y += core/subdev/mc/nv40.o
-nouveau-y += core/subdev/mc/nv44.o
-nouveau-y += core/subdev/mc/nv4c.o
-nouveau-y += core/subdev/mc/nv50.o
-nouveau-y += core/subdev/mc/nv94.o
-nouveau-y += core/subdev/mc/nv98.o
-nouveau-y += core/subdev/mc/nvc0.o
-nouveau-y += core/subdev/mc/nvc3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/mc/nv44.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/mc/nv4c.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/mc/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mc/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/mc/nv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/mc/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mc/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mc/nvc3.o
 nouveau-y += core/subdev/mxm/base.o
 nouveau-y += core/subdev/mxm/mxms.o
-nouveau-y += core/subdev/mxm/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/mxm/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mxm/nv50.o
 nouveau-y += core/subdev/pwr/base.o
 nouveau-y += core/subdev/pwr/memx.o
-nouveau-y += core/subdev/pwr/nva3.o
-nouveau-y += core/subdev/pwr/nvc0.o
-nouveau-y += core/subdev/pwr/nvd0.o
-nouveau-y += core/subdev/pwr/nv108.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/pwr/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nv108.o
 nouveau-y += core/subdev/therm/base.o
 nouveau-y += core/subdev/therm/fan.o
 nouveau-y += core/subdev/therm/fannil.o
@@ -164,153 +174,178 @@ nouveau-y += core/subdev/therm/fantog.o
 nouveau-y += core/subdev/therm/ic.o
 nouveau-y += core/subdev/therm/temp.o
 nouveau-y += core/subdev/therm/nv40.o
-nouveau-y += core/subdev/therm/nv50.o
-nouveau-y += core/subdev/therm/nv84.o
-nouveau-y += core/subdev/therm/nva3.o
-nouveau-y += core/subdev/therm/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/therm/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/therm/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/therm/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/therm/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/therm/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/therm/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/therm/nvd0.o
 nouveau-y += core/subdev/timer/base.o
 nouveau-y += core/subdev/timer/nv04.o
 nouveau-y += core/subdev/vm/base.o
-nouveau-y += core/subdev/vm/nv04.o
-nouveau-y += core/subdev/vm/nv41.o
-nouveau-y += core/subdev/vm/nv44.o
-nouveau-y += core/subdev/vm/nv50.o
-nouveau-y += core/subdev/vm/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/vm/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/vm/nv41.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/subdev/vm/nv44.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/subdev/vm/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/vm/nvc0.o
 nouveau-y += core/subdev/volt/base.o
 nouveau-y += core/subdev/volt/gpio.o
 nouveau-y += core/subdev/volt/nv40.o
 
-nouveau-y += core/engine/falcon.o
-nouveau-y += core/engine/xtensa.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/falcon.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/falcon.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/xtensa.o
 nouveau-y += core/engine/dmaobj/base.o
-nouveau-y += core/engine/dmaobj/nv04.o
-nouveau-y += core/engine/dmaobj/nv50.o
-nouveau-y += core/engine/dmaobj/nvc0.o
-nouveau-y += core/engine/dmaobj/nvd0.o
-nouveau-y += core/engine/bsp/nv84.o
-nouveau-y += core/engine/bsp/nv98.o
-nouveau-y += core/engine/bsp/nvc0.o
-nouveau-y += core/engine/bsp/nve0.o
-nouveau-y += core/engine/copy/nva3.o
-nouveau-y += core/engine/copy/nvc0.o
-nouveau-y += core/engine/copy/nve0.o
-nouveau-y += core/engine/crypt/nv84.o
-nouveau-y += core/engine/crypt/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/dmaobj/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/dmaobj/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/dmaobj/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/dmaobj/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/bsp/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/bsp/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/bsp/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/bsp/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/copy/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/copy/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/copy/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/copy/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/crypt/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/crypt/nv98.o
 nouveau-y += core/engine/device/base.o
 nouveau-y += core/engine/device/ctrl.o
-nouveau-y += core/engine/device/nv04.o
-nouveau-y += core/engine/device/nv10.o
-nouveau-y += core/engine/device/nv20.o
-nouveau-y += core/engine/device/nv30.o
-nouveau-y += core/engine/device/nv40.o
-nouveau-y += core/engine/device/nv50.o
-nouveau-y += core/engine/device/nvc0.o
-nouveau-y += core/engine/device/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/device/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/device/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/device/nv20.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/device/nv30.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/device/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/device/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/device/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/device/nve0.o
 nouveau-y += core/engine/disp/base.o
-nouveau-y += core/engine/disp/nv04.o
-nouveau-y += core/engine/disp/nv50.o
-nouveau-y += core/engine/disp/nv84.o
-nouveau-y += core/engine/disp/nv94.o
-nouveau-y += core/engine/disp/nva0.o
-nouveau-y += core/engine/disp/nva3.o
-nouveau-y += core/engine/disp/nvd0.o
-nouveau-y += core/engine/disp/nve0.o
-nouveau-y += core/engine/disp/nvf0.o
-nouveau-y += core/engine/disp/dacnv50.o
-nouveau-y += core/engine/disp/dport.o
-nouveau-y += core/engine/disp/hdanva3.o
-nouveau-y += core/engine/disp/hdanvd0.o
-nouveau-y += core/engine/disp/hdminv84.o
-nouveau-y += core/engine/disp/hdminva3.o
-nouveau-y += core/engine/disp/hdminvd0.o
-nouveau-y += core/engine/disp/piornv50.o
-nouveau-y += core/engine/disp/sornv50.o
-nouveau-y += core/engine/disp/sornv94.o
-nouveau-y += core/engine/disp/sornvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/disp/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/nv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/nva0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nvf0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/dacnv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/dacnv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/dport.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/dport.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/hdanva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdanva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdanvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/hdminv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/hdminva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdminva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdminvd0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/piornv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/piornv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/sornv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/sornv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/disp/sornv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/sornv94.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/sornvd0.o
 nouveau-y += core/engine/disp/vga.o
 nouveau-y += core/engine/fifo/base.o
-nouveau-y += core/engine/fifo/nv04.o
-nouveau-y += core/engine/fifo/nv10.o
-nouveau-y += core/engine/fifo/nv17.o
-nouveau-y += core/engine/fifo/nv40.o
-nouveau-y += core/engine/fifo/nv50.o
-nouveau-y += core/engine/fifo/nv84.o
-nouveau-y += core/engine/fifo/nvc0.o
-nouveau-y += core/engine/fifo/nve0.o
-nouveau-y += core/engine/fifo/nv108.o
-nouveau-y += core/engine/graph/ctxnv40.o
-nouveau-y += core/engine/graph/ctxnv50.o
-nouveau-y += core/engine/graph/ctxnvc0.o
-nouveau-y += core/engine/graph/ctxnvc1.o
-nouveau-y += core/engine/graph/ctxnvc3.o
-nouveau-y += core/engine/graph/ctxnvc8.o
-nouveau-y += core/engine/graph/ctxnvd7.o
-nouveau-y += core/engine/graph/ctxnvd9.o
-nouveau-y += core/engine/graph/ctxnve4.o
-nouveau-y += core/engine/graph/ctxnvf0.o
-nouveau-y += core/engine/graph/ctxnv108.o
-nouveau-y += core/engine/graph/nv04.o
-nouveau-y += core/engine/graph/nv10.o
-nouveau-y += core/engine/graph/nv20.o
-nouveau-y += core/engine/graph/nv25.o
-nouveau-y += core/engine/graph/nv2a.o
-nouveau-y += core/engine/graph/nv30.o
-nouveau-y += core/engine/graph/nv34.o
-nouveau-y += core/engine/graph/nv35.o
-nouveau-y += core/engine/graph/nv40.o
-nouveau-y += core/engine/graph/nv50.o
-nouveau-y += core/engine/graph/nvc0.o
-nouveau-y += core/engine/graph/nvc1.o
-nouveau-y += core/engine/graph/nvc3.o
-nouveau-y += core/engine/graph/nvc8.o
-nouveau-y += core/engine/graph/nvd7.o
-nouveau-y += core/engine/graph/nvd9.o
-nouveau-y += core/engine/graph/nve4.o
-nouveau-y += core/engine/graph/nvf0.o
-nouveau-y += core/engine/graph/nv108.o
-nouveau-y += core/engine/mpeg/nv31.o
-nouveau-y += core/engine/mpeg/nv40.o
-nouveau-y += core/engine/mpeg/nv44.o
-nouveau-y += core/engine/mpeg/nv50.o
-nouveau-y += core/engine/mpeg/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/fifo/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/fifo/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/fifo/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/fifo/nv17.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/fifo/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/fifo/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/fifo/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nv108.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/graph/names.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/names.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/ctxnv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/graph/ctxnv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc1.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc8.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvd7.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvd9.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnve4.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvf0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnv108.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv04.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv20.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv25.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv2a.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv30.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv34.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv35.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/graph/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/graph/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc1.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc8.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvd7.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvd9.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nve4.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvf0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nv108.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/mpeg/nv31.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/mpeg/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/mpeg/nv44.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/mpeg/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/mpeg/nv84.o
 nouveau-y += core/engine/perfmon/base.o
 nouveau-y += core/engine/perfmon/daemon.o
-nouveau-y += core/engine/perfmon/nv40.o
-nouveau-y += core/engine/perfmon/nv50.o
-nouveau-y += core/engine/perfmon/nv84.o
-nouveau-y += core/engine/perfmon/nva3.o
-nouveau-y += core/engine/perfmon/nvc0.o
-nouveau-y += core/engine/perfmon/nve0.o
-nouveau-y += core/engine/perfmon/nvf0.o
-nouveau-y += core/engine/ppp/nv98.o
-nouveau-y += core/engine/ppp/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/perfmon/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/perfmon/nv40.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/perfmon/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/perfmon/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/perfmon/nva3.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nvf0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/ppp/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/ppp/nvc0.o
 nouveau-y += core/engine/software/nv04.o
-nouveau-y += core/engine/software/nv10.o
-nouveau-y += core/engine/software/nv50.o
-nouveau-y += core/engine/software/nvc0.o
-nouveau-y += core/engine/vp/nv84.o
-nouveau-y += core/engine/vp/nv98.o
-nouveau-y += core/engine/vp/nvc0.o
-nouveau-y += core/engine/vp/nve0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += core/engine/software/nv10.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/software/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/software/nv50.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/software/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/vp/nv84.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += core/engine/vp/nv98.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/vp/nvc0.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/vp/nve0.o
 
 # drm/core
 nouveau-y += nouveau_drm.o nouveau_chan.o nouveau_dma.o nouveau_fence.o
 nouveau-y += nouveau_vga.o nouveau_agp.o
 nouveau-y += nouveau_ttm.o nouveau_sgdma.o nouveau_bo.o nouveau_gem.o
 nouveau-y += nouveau_prime.o nouveau_abi16.o
-nouveau-y += nv04_fence.o nv10_fence.o nv17_fence.o
-nouveau-y += nv50_fence.o nv84_fence.o nvc0_fence.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += nv04_fence.o nv10_fence.o nv17_fence.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += nv10_fence.o nv17_fence.o nv50_fence.o nv84_fence.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += nvc0_fence.o nv84_fence.o
 
 # drm/kms
 nouveau-y += nouveau_bios.o nouveau_fbcon.o nouveau_display.o
 nouveau-y += nouveau_connector.o nouveau_dp.o
-nouveau-y += nv04_fbcon.o nv50_fbcon.o nvc0_fbcon.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV04) += nv04_fbcon.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += nv50_fbcon.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += nvc0_fbcon.o
 
+ifdef CONFIG_DRM_NOUVEAU_NV04
 # drm/kms/nv04:nv50
 include $(src)/dispnv04/Makefile
+endif
 
 # drm/kms/nv50-
-nouveau-y += nv50_display.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NV50) += nv50_display.o
+nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += nv50_display.o
 
 # drm/pm
 nouveau-y += nouveau_hwmon.o nouveau_sysfs.o
@@ -323,4 +358,4 @@ endif
 nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
 nouveau-$(CONFIG_DEBUG_FS) += nouveau_debugfs.o
 
-obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
+obj-$(CONFIG_DRM_NOUVEAU) += nouveau.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
index dd01c6c..7ddd9b5 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
@@ -198,16 +198,22 @@ nouveau_devobj_ctor(struct nouveau_object *parent,
 		}
 
 		switch (device->card_type) {
+#ifdef CONFIG_DRM_NOUVEAU_NV04
 		case NV_04: ret = nv04_identify(device); break;
 		case NV_10:
 		case NV_11: ret = nv10_identify(device); break;
 		case NV_20: ret = nv20_identify(device); break;
 		case NV_30: ret = nv30_identify(device); break;
 		case NV_40: ret = nv40_identify(device); break;
+#endif
+#ifdef CONFIG_DRM_NOUVEAU_NV50
 		case NV_50: ret = nv50_identify(device); break;
+#endif
+#ifdef CONFIG_DRM_NOUVEAU_NVC0
 		case NV_C0:
 		case NV_D0: ret = nvc0_identify(device); break;
 		case NV_E0: ret = nve0_identify(device); break;
+#endif
 		default:
 			ret = -EINVAL;
 			break;
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/names.c b/drivers/gpu/drm/nouveau/core/engine/graph/names.c
new file mode 100644
index 0000000..abf6fd0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/names.c
@@ -0,0 +1,72 @@
+/*
+ * Copyright 2012 Red Hat Inc.
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
+ * Authors: Ben Skeggs
+ */
+
+#include <engine/graph.h>
+
+/* There must be a *lot* of these. Will take some time to gather them up. */
+const struct nouveau_enum nv50_data_error_names[] = {
+	{ 0x00000003, "INVALID_OPERATION", NULL },
+	{ 0x00000004, "INVALID_VALUE", NULL },
+	{ 0x00000005, "INVALID_ENUM", NULL },
+	{ 0x00000008, "INVALID_OBJECT", NULL },
+	{ 0x00000009, "READ_ONLY_OBJECT", NULL },
+	{ 0x0000000a, "SUPERVISOR_OBJECT", NULL },
+	{ 0x0000000b, "INVALID_ADDRESS_ALIGNMENT", NULL },
+	{ 0x0000000c, "INVALID_BITFIELD", NULL },
+	{ 0x0000000d, "BEGIN_END_ACTIVE", NULL },
+	{ 0x0000000e, "SEMANTIC_COLOR_BACK_OVER_LIMIT", NULL },
+	{ 0x0000000f, "VIEWPORT_ID_NEEDS_GP", NULL },
+	{ 0x00000010, "RT_DOUBLE_BIND", NULL },
+	{ 0x00000011, "RT_TYPES_MISMATCH", NULL },
+	{ 0x00000012, "RT_LINEAR_WITH_ZETA", NULL },
+	{ 0x00000015, "FP_TOO_FEW_REGS", NULL },
+	{ 0x00000016, "ZETA_FORMAT_CSAA_MISMATCH", NULL },
+	{ 0x00000017, "RT_LINEAR_WITH_MSAA", NULL },
+	{ 0x00000018, "FP_INTERPOLANT_START_OVER_LIMIT", NULL },
+	{ 0x00000019, "SEMANTIC_LAYER_OVER_LIMIT", NULL },
+	{ 0x0000001a, "RT_INVALID_ALIGNMENT", NULL },
+	{ 0x0000001b, "SAMPLER_OVER_LIMIT", NULL },
+	{ 0x0000001c, "TEXTURE_OVER_LIMIT", NULL },
+	{ 0x0000001e, "GP_TOO_MANY_OUTPUTS", NULL },
+	{ 0x0000001f, "RT_BPP128_WITH_MS8", NULL },
+	{ 0x00000021, "Z_OUT_OF_BOUNDS", NULL },
+	{ 0x00000023, "XY_OUT_OF_BOUNDS", NULL },
+	{ 0x00000024, "VP_ZERO_INPUTS", NULL },
+	{ 0x00000027, "CP_MORE_PARAMS_THAN_SHARED", NULL },
+	{ 0x00000028, "CP_NO_REG_SPACE_STRIPED", NULL },
+	{ 0x00000029, "CP_NO_REG_SPACE_PACKED", NULL },
+	{ 0x0000002a, "CP_NOT_ENOUGH_WARPS", NULL },
+	{ 0x0000002b, "CP_BLOCK_SIZE_MISMATCH", NULL },
+	{ 0x0000002c, "CP_NOT_ENOUGH_LOCAL_WARPS", NULL },
+	{ 0x0000002d, "CP_NOT_ENOUGH_STACK_WARPS", NULL },
+	{ 0x0000002e, "CP_NO_BLOCKDIM_LATCH", NULL },
+	{ 0x00000031, "ENG2D_FORMAT_MISMATCH", NULL },
+	{ 0x0000003f, "PRIMITIVE_ID_NEEDS_GP", NULL },
+	{ 0x00000044, "SEMANTIC_VIEWPORT_OVER_LIMIT", NULL },
+	{ 0x00000045, "SEMANTIC_COLOR_FRONT_OVER_LIMIT", NULL },
+	{ 0x00000046, "LAYER_ID_NEEDS_GP", NULL },
+	{ 0x00000047, "SEMANTIC_CLIP_OVER_LIMIT", NULL },
+	{ 0x00000048, "SEMANTIC_PTSZ_OVER_LIMIT", NULL },
+	{}
+};
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 2c7809e..6ef91cc 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -361,53 +361,6 @@ static const struct nouveau_bitfield nv50_graph_trap_ccache[] = {
 	{}
 };
 
-/* There must be a *lot* of these. Will take some time to gather them up. */
-const struct nouveau_enum nv50_data_error_names[] = {
-	{ 0x00000003, "INVALID_OPERATION", NULL },
-	{ 0x00000004, "INVALID_VALUE", NULL },
-	{ 0x00000005, "INVALID_ENUM", NULL },
-	{ 0x00000008, "INVALID_OBJECT", NULL },
-	{ 0x00000009, "READ_ONLY_OBJECT", NULL },
-	{ 0x0000000a, "SUPERVISOR_OBJECT", NULL },
-	{ 0x0000000b, "INVALID_ADDRESS_ALIGNMENT", NULL },
-	{ 0x0000000c, "INVALID_BITFIELD", NULL },
-	{ 0x0000000d, "BEGIN_END_ACTIVE", NULL },
-	{ 0x0000000e, "SEMANTIC_COLOR_BACK_OVER_LIMIT", NULL },
-	{ 0x0000000f, "VIEWPORT_ID_NEEDS_GP", NULL },
-	{ 0x00000010, "RT_DOUBLE_BIND", NULL },
-	{ 0x00000011, "RT_TYPES_MISMATCH", NULL },
-	{ 0x00000012, "RT_LINEAR_WITH_ZETA", NULL },
-	{ 0x00000015, "FP_TOO_FEW_REGS", NULL },
-	{ 0x00000016, "ZETA_FORMAT_CSAA_MISMATCH", NULL },
-	{ 0x00000017, "RT_LINEAR_WITH_MSAA", NULL },
-	{ 0x00000018, "FP_INTERPOLANT_START_OVER_LIMIT", NULL },
-	{ 0x00000019, "SEMANTIC_LAYER_OVER_LIMIT", NULL },
-	{ 0x0000001a, "RT_INVALID_ALIGNMENT", NULL },
-	{ 0x0000001b, "SAMPLER_OVER_LIMIT", NULL },
-	{ 0x0000001c, "TEXTURE_OVER_LIMIT", NULL },
-	{ 0x0000001e, "GP_TOO_MANY_OUTPUTS", NULL },
-	{ 0x0000001f, "RT_BPP128_WITH_MS8", NULL },
-	{ 0x00000021, "Z_OUT_OF_BOUNDS", NULL },
-	{ 0x00000023, "XY_OUT_OF_BOUNDS", NULL },
-	{ 0x00000024, "VP_ZERO_INPUTS", NULL },
-	{ 0x00000027, "CP_MORE_PARAMS_THAN_SHARED", NULL },
-	{ 0x00000028, "CP_NO_REG_SPACE_STRIPED", NULL },
-	{ 0x00000029, "CP_NO_REG_SPACE_PACKED", NULL },
-	{ 0x0000002a, "CP_NOT_ENOUGH_WARPS", NULL },
-	{ 0x0000002b, "CP_BLOCK_SIZE_MISMATCH", NULL },
-	{ 0x0000002c, "CP_NOT_ENOUGH_LOCAL_WARPS", NULL },
-	{ 0x0000002d, "CP_NOT_ENOUGH_STACK_WARPS", NULL },
-	{ 0x0000002e, "CP_NO_BLOCKDIM_LATCH", NULL },
-	{ 0x00000031, "ENG2D_FORMAT_MISMATCH", NULL },
-	{ 0x0000003f, "PRIMITIVE_ID_NEEDS_GP", NULL },
-	{ 0x00000044, "SEMANTIC_VIEWPORT_OVER_LIMIT", NULL },
-	{ 0x00000045, "SEMANTIC_COLOR_FRONT_OVER_LIMIT", NULL },
-	{ 0x00000046, "LAYER_ID_NEEDS_GP", NULL },
-	{ 0x00000047, "SEMANTIC_CLIP_OVER_LIMIT", NULL },
-	{ 0x00000048, "SEMANTIC_PTSZ_OVER_LIMIT", NULL },
-	{}
-};
-
 static const struct nouveau_bitfield nv50_graph_intr_name[] = {
 	{ 0x00000001, "NOTIFY" },
 	{ 0x00000002, "COMPUTE_QUERY" },
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/mem.c b/drivers/gpu/drm/nouveau/core/subdev/fb/mem.c
new file mode 100644
index 0000000..767e653
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/mem.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2013 Red Hat Inc.
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
+ * Authors: Ben Skeggs
+ */
+
+#include <subdev/fb.h>
+
+#include <core/mm.h>
+
+void
+__nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem *mem)
+{
+	struct nouveau_mm_node *this;
+
+	while (!list_empty(&mem->regions)) {
+		this = list_first_entry(&mem->regions, typeof(*this), rl_entry);
+
+		list_del(&this->rl_entry);
+		nouveau_mm_free(&pfb->vram, &this);
+	}
+
+	nouveau_mm_free(&pfb->tags, &mem->tag);
+}
+
+void
+nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
+{
+	struct nouveau_mem *mem = *pmem;
+
+	*pmem = NULL;
+	if (unlikely(mem == NULL))
+		return;
+
+	mutex_lock(&pfb->base.mutex);
+	__nv50_ram_put(pfb, mem);
+	mutex_unlock(&pfb->base.mutex);
+
+	kfree(mem);
+}
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
index c7fdb3a..6ce518d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c
@@ -223,37 +223,6 @@ nv50_ram_tidy(struct nouveau_fb *pfb)
 	ram_exec(hwsq, false);
 }
 
-void
-__nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem *mem)
-{
-	struct nouveau_mm_node *this;
-
-	while (!list_empty(&mem->regions)) {
-		this = list_first_entry(&mem->regions, typeof(*this), rl_entry);
-
-		list_del(&this->rl_entry);
-		nouveau_mm_free(&pfb->vram, &this);
-	}
-
-	nouveau_mm_free(&pfb->tags, &mem->tag);
-}
-
-void
-nv50_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
-{
-	struct nouveau_mem *mem = *pmem;
-
-	*pmem = NULL;
-	if (unlikely(mem == NULL))
-		return;
-
-	mutex_lock(&pfb->base.mutex);
-	__nv50_ram_put(pfb, mem);
-	mutex_unlock(&pfb->base.mutex);
-
-	kfree(mem);
-}
-
 int
 nv50_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	     u32 memtype, struct nouveau_mem **pmem)
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 4245fc3..80de113 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -92,10 +92,17 @@ nv04_display(struct drm_device *dev)
 /* nv04_display.c */
 int nv04_display_early_init(struct drm_device *);
 void nv04_display_late_takedown(struct drm_device *);
-int nv04_display_create(struct drm_device *);
 void nv04_display_destroy(struct drm_device *);
 int nv04_display_init(struct drm_device *);
 void nv04_display_fini(struct drm_device *);
+#ifdef CONFIG_DRM_NOUVEAU_NV04
+int nv04_display_create(struct drm_device *);
+#else
+static inline int nv04_display_create(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+#endif
 
 /* nv04_crtc.c */
 int nv04_crtc_create(struct drm_device *, int index);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 4c3feaa..5ad11d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -67,6 +67,8 @@ static bool nv_cksum(const uint8_t *data, unsigned int length)
 	return false;
 }
 
+#ifdef CONFIG_DRM_NOUVEAU_NV04
+
 static uint16_t clkcmptable(struct nvbios *bios, uint16_t clktable, int pxclk)
 {
 	int compare_record_len, i = 0;
@@ -257,6 +259,8 @@ int call_lvds_script(struct drm_device *dev, struct dcb_output *dcbent, int head
 	return ret;
 }
 
+#endif
+
 struct lvdstableheader {
 	uint8_t lvds_ver, headerlen, recordlen;
 };
@@ -624,6 +628,8 @@ int nouveau_bios_parse_lvds_table(struct drm_device *dev, int pxclk, bool *dl, b
 	return 0;
 }
 
+#ifdef CONFIG_DRM_NOUVEAU_NV04
+
 int run_tmds_table(struct drm_device *dev, struct dcb_output *dcbent, int head, int pxclk)
 {
 	/*
@@ -678,6 +684,8 @@ int run_tmds_table(struct drm_device *dev, struct dcb_output *dcbent, int head,
 	return 0;
 }
 
+#endif
+
 static void parse_script_table_pointers(struct nvbios *bios, uint16_t offset)
 {
 	/*
@@ -1756,13 +1764,16 @@ fabricate_dcb_encoder_table(struct drm_device *dev, struct nvbios *bios)
 	fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG,
 			     bios->legacy.i2c_indices.crt, 1, 1);
 
+#ifdef CONFIG_DRM_NOUVEAU_NV04
 	if (nv04_tv_identify(dev, bios->legacy.i2c_indices.tv) >= 0)
 		fabricate_dcb_output(dcb, DCB_OUTPUT_TV,
 				     bios->legacy.i2c_indices.tv,
 				     all_heads, 0);
 
-	else if (bios->tmds.output0_script_ptr ||
-		 bios->tmds.output1_script_ptr)
+	else
+#endif
+	if (bios->tmds.output0_script_ptr ||
+	    bios->tmds.output1_script_ptr)
 		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS,
 				     bios->legacy.i2c_indices.panel,
 				     all_heads, 1);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 85dcb6a..f8245d7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -782,7 +782,11 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 	/* Emit a page flip */
 	if (nv_device(drm->device)->card_type >= NV_50) {
+#if defined(CONFIG_DRM_NOUVEAU_NV50) || defined(CONFIG_DRM_NOUVEAU_NVC0)
 		ret = nv50_display_flip_next(crtc, fb, chan, swap_interval);
+#else
+		ret = -ENODEV;
+#endif
 		if (ret)
 			goto fail_unreserve;
 	} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9c9ce4d..e4b104c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -144,13 +144,23 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		return;
 
 	/* initialise synchronisation routines */
+#ifdef CONFIG_DRM_NOUVEAU_NV04
 	if      (device->card_type < NV_10) ret = nv04_fence_create(drm);
 	else if (device->card_type < NV_11 ||
 		 device->chipset   <  0x17) ret = nv10_fence_create(drm);
 	else if (device->card_type < NV_50) ret = nv17_fence_create(drm);
-	else if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
+	else
+#endif
+#ifdef CONFIG_DRM_NOUVEAU_NV50
+	if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
 	else if (device->card_type < NV_C0) ret = nv84_fence_create(drm);
-	else                                ret = nvc0_fence_create(drm);
+	else
+#endif
+#ifdef CONFIG_DRM_NOUVEAU_NVC0
+	ret = nvc0_fence_create(drm);
+#else
+	ret = -ENODEV;
+#endif
 	if (ret) {
 		NV_ERROR(drm, "failed to initialise sync subsystem, %d\n", ret);
 		nouveau_accel_fini(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.h b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
index fdfc0c9..5365332 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
@@ -41,20 +41,58 @@ struct nouveau_fbdev {
 
 void nouveau_fbcon_restore(void);
 
+#define _STUB(name, type) \
+static inline int name(struct fb_info *info, const struct type *t) \
+{ \
+	return -ENODEV; \
+}
+
+#ifdef CONFIG_DRM_NOUVEAU_NV04
 int nv04_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region);
 int nv04_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 int nv04_fbcon_imageblit(struct fb_info *info, const struct fb_image *image);
 int nv04_fbcon_accel_init(struct fb_info *info);
+#else
+_STUB(nv04_fbcon_fillrect, fb_fillrect)
+_STUB(nv04_fbcon_copyarea, fb_copyarea)
+_STUB(nv04_fbcon_imageblit, fb_image)
+static inline int nv04_fbcon_accel_init(struct fb_info *info)
+{
+	return -ENODEV;
+}
+#endif
 
+#ifdef CONFIG_DRM_NOUVEAU_NV50
 int nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 int nv50_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region);
 int nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image);
 int nv50_fbcon_accel_init(struct fb_info *info);
+#else
+_STUB(nv50_fbcon_fillrect, fb_fillrect)
+_STUB(nv50_fbcon_copyarea, fb_copyarea)
+_STUB(nv50_fbcon_imageblit, fb_image)
+static inline int nv50_fbcon_accel_init(struct fb_info *info)
+{
+	return -ENODEV;
+}
+#endif
 
+#ifdef CONFIG_DRM_NOUVEAU_NVC0
 int nvc0_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 int nvc0_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region);
 int nvc0_fbcon_imageblit(struct fb_info *info, const struct fb_image *image);
 int nvc0_fbcon_accel_init(struct fb_info *info);
+#else
+_STUB(nvc0_fbcon_fillrect, fb_fillrect)
+_STUB(nvc0_fbcon_copyarea, fb_copyarea)
+_STUB(nvc0_fbcon_imageblit, fb_image)
+static inline int nvc0_fbcon_accel_init(struct fb_info *info)
+{
+	return -ENODEV;
+}
+#endif
+
+#undef _STUB
 
 void nouveau_fbcon_gpu_lockup(struct fb_info *info);
 
diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index 70da347..56e4518 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.h
+++ b/drivers/gpu/drm/nouveau/nv50_display.h
@@ -31,7 +31,14 @@
 #include "nouveau_crtc.h"
 #include "nouveau_reg.h"
 
+#if defined(CONFIG_DRM_NOUVEAU_NV50) || defined(CONFIG_DRM_NOUVEAU_NVC0)
 int  nv50_display_create(struct drm_device *);
+#else
+static inline int nv50_display_create(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+#endif
 void nv50_display_destroy(struct drm_device *);
 int  nv50_display_init(struct drm_device *);
 void nv50_display_fini(struct drm_device *);
-- 
1.8.3.2
