From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/7] drm/nv10: introduce a new NV_11 card type
Date: Thu,  5 Sep 2013 04:45:02 -0400
Message-ID: <1378370706-18599-3-git-send-email-imirkin@alum.mit.edu>
References: <1378370706-18599-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378370706-18599-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

NV11/17/1F/18 come after NV10/15/16/1A. In order to facilitate using
numerical comparisons, split up the two sets into different card types.

This change should be a no-op except that the relevant cards will see
NV11 printed instead of NV10 for the family.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Only tested on a NV18, but it seems to work. That means that I got at
least most of the relevant NV_10 checks. Did grepping to find them all.

 drivers/gpu/drm/nouveau/core/engine/device/base.c  | 11 +++++++++--
 drivers/gpu/drm/nouveau/core/include/core/device.h |  1 +
 drivers/gpu/drm/nouveau/core/subdev/bios/pll.c     |  1 +
 drivers/gpu/drm/nouveau/dispnv04/hw.c              |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  7 ++++---
 7 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
index 4c72571..652cc3b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
@@ -161,7 +161,13 @@ nouveau_devobj_ctor(struct nouveau_object *parent,
 		if ((boot0 & 0x0f000000) > 0) {
 			device->chipset = (boot0 & 0xff00000) >> 20;
 			switch (device->chipset & 0xf0) {
-			case 0x10: device->card_type = NV_10; break;
+			case 0x10: {
+				if (0x461 & (1 << (device->chipset & 0xf)))
+					device->card_type = NV_10;
+				else
+					device->card_type = NV_11;
+				break;
+			}
 			case 0x20: device->card_type = NV_20; break;
 			case 0x30: device->card_type = NV_30; break;
 			case 0x40:
@@ -188,7 +194,8 @@ nouveau_devobj_ctor(struct nouveau_object *parent,
 
 		switch (device->card_type) {
 		case NV_04: ret = nv04_identify(device); break;
-		case NV_10: ret = nv10_identify(device); break;
+		case NV_10:
+		case NV_11: ret = nv10_identify(device); break;
 		case NV_20: ret = nv20_identify(device); break;
 		case NV_30: ret = nv30_identify(device); break;
 		case NV_40: ret = nv40_identify(device); break;
diff --git a/drivers/gpu/drm/nouveau/core/include/core/device.h b/drivers/gpu/drm/nouveau/core/include/core/device.h
index 99b6600..8601dea 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/device.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/device.h
@@ -72,6 +72,7 @@ struct nouveau_device {
 	enum {
 		NV_04    = 0x04,
 		NV_10    = 0x10,
+		NV_11    = 0x11,
 		NV_20    = 0x20,
 		NV_30    = 0x30,
 		NV_40    = 0x40,
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/core/subdev/bios/pll.c
index f835501..1f76de5 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/pll.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/pll.c
@@ -114,6 +114,7 @@ pll_map(struct nouveau_bios *bios)
 	switch (nv_device(bios)->card_type) {
 	case NV_04:
 	case NV_10:
+	case NV_11:
 	case NV_20:
 	case NV_30:
 		return nv04_pll_mapping;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index 973056b..ffd2641 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -740,7 +740,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	}
 	/* NV11 and NV20 stop at 0x52. */
 	if (nv_gf4_disp_arch(dev)) {
-		if (nv_device(drm->device)->card_type == NV_10) {
+		if (nv_device(drm->device)->card_type < NV_20) {
 			/* Not waiting for vertical retrace before modifying
 			   CRE_53/CRE_54 causes lockups. */
 			nouveau_timer_wait_eq(ptimer, 650000000, NV_PRMCIO_INP0__COLOR, 0x8, 0x8);
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 8f467e7..028e370 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -87,6 +87,7 @@ nouveau_abi16_swclass(struct nouveau_drm *drm)
 	case NV_04:
 		return 0x006e;
 	case NV_10:
+	case NV_11:
 	case NV_20:
 	case NV_30:
 	case NV_40:
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 191145d..c735467 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -269,7 +269,8 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t type)
 	struct nouveau_fb *pfb = nouveau_fb(drm->device);
 	u32 vram_pages = pfb->ram->size >> PAGE_SHIFT;
 
-	if (nv_device(drm->device)->card_type == NV_10 &&
+	if ((nv_device(drm->device)->card_type == NV_10 ||
+	     nv_device(drm->device)->card_type == NV_11) &&
 	    nvbo->tile_mode && (type & TTM_PL_FLAG_VRAM) &&
 	    nvbo->bo.mem.num_pages < vram_pages / 4) {
 		/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 4da776f..a6dedfa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -212,9 +212,10 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 	} else {
 		connector->doublescan_allowed = true;
 		if (nv_device(drm->device)->card_type == NV_20 ||
-		   (nv_device(drm->device)->card_type == NV_10 &&
-		    (dev->pci_device & 0x0ff0) != 0x0100 &&
-		    (dev->pci_device & 0x0ff0) != 0x0150))
+		    ((nv_device(drm->device)->card_type == NV_10 ||
+		      nv_device(drm->device)->card_type == NV_11) &&
+		     (dev->pci_device & 0x0ff0) != 0x0100 &&
+		     (dev->pci_device & 0x0ff0) != 0x0150))
 			/* HW is broken */
 			connector->interlace_allowed = false;
 		else
-- 
1.8.1.5
