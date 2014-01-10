From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/3] drm/nv50/devinit: set the disable mask based on the
	hwunits registers
Date: Thu,  9 Jan 2014 21:19:12 -0500
Message-ID: <1389320353-21375-2-git-send-email-imirkin@alum.mit.edu>
References: <1389320353-21375-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1389320353-21375-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This will turn off PDISPLAY/PCRYPT/PCOPY0/video engines on cards where
they are marked as disabled either by the hardware of VBIOS.

See https://bugs.freedesktop.org/show_bug.cgi?id=58378

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

An earlier version of this patch was tested. I added the DISP disable since
then, and rejiggered the way the function was called (turns out that nv50_init
function is called by nvc0 as well).

 drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c | 72 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/devinit/priv.h |  2 +
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c
index 6df7224..f4d32c6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c
@@ -74,6 +74,74 @@ nv50_devinit_pll_set(struct nouveau_devinit *devinit, u32 type, u32 freq)
 	return 0;
 }
 
+static void
+nv50_disable_engines(struct nouveau_object *object)
+{
+	struct nouveau_device *device = nv_device(object);
+	bool vdec;
+	u32 r154c;
+
+	/* check for disabled engines */
+	vdec = nv_rd32(device, 0x1540) & 0x40000000;
+	if (device->chipset > 0x50)
+		r154c = nv_rd32(device, 0x154c);
+	else
+		r154c = ~0U;
+
+	if (!(r154c & 0x4))
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_DISP;
+
+	switch (device->chipset) {
+	case 0x50:
+		if (!vdec)
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_MPEG;
+		break;
+	case 0x84:
+	case 0x86:
+	case 0x92:
+	case 0x94:
+	case 0x96:
+	case 0xa0:
+		if (!vdec) {
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_MPEG;
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_VP;
+		}
+		if (!vdec || !(r154c & 0x20))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_BSP;
+		if (!vdec || !(r154c & 0x40))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_CRYPT;
+		break;
+	case 0x98:
+	case 0xaa:
+	case 0xac:
+		if (!vdec) {
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_VP;
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_PPP;
+		}
+		if (!vdec || !(r154c & 0x20))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_BSP;
+		if (!(r154c & 0x40))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_CRYPT;
+		break;
+	case 0xaf:
+		if (!(r154c & 0x40))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_VIC;
+		/* fallthrough */
+	case 0xa3:
+	case 0xa5:
+	case 0xa8:
+		if (!vdec) {
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_VP;
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_PPP;
+		}
+		if (!(r154c & 0x20))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_BSP;
+		if (!(r154c & 0x200))
+			device->disable_mask |= 1ULL << NVDEV_ENGINE_COPY0;
+		break;
+	}
+}
+
 int
 nv50_devinit_init(struct nouveau_object *object)
 {
@@ -117,6 +185,9 @@ nv50_devinit_init(struct nouveau_object *object)
 		i++;
 	}
 
+	if (priv->disable_engines)
+		priv->disable_engines(object);
+
 	return 0;
 }
 
@@ -134,6 +205,7 @@ nv50_devinit_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	priv->base.pll_set = nv50_devinit_pll_set;
+	priv->disable_engines = nv50_disable_engines;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/devinit/priv.h b/drivers/gpu/drm/nouveau/core/subdev/devinit/priv.h
index 7d622e2..f17a368 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/devinit/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/devinit/priv.h
@@ -18,6 +18,8 @@ void setPLL_double_lowregs(struct nouveau_devinit *, u32, struct nouveau_pll_val
 
 struct nv50_devinit_priv {
 	struct nouveau_devinit base;
+
+	void (*disable_engines)(struct nouveau_object *);
 };
 
 int  nv50_devinit_init(struct nouveau_object *);
-- 
1.8.3.2
