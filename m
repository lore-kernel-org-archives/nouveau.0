From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 5/7] drm/nv3x/mpeg: fix bits being masked to
	indicate vram/agp access
Date: Thu,  5 Sep 2013 04:45:04 -0400
Message-ID: <1378370706-18599-5-git-send-email-imirkin@alum.mit.edu>
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

In the process, fixes the VRAM check for DMA_IMAGE.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index c190043..30dc047 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -82,6 +82,8 @@ nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
 	u32 dma2 = nv_ro32(imem, inst + 8);
 	u32 base = (dma2 & 0xfffff000) | (dma0 >> 20);
 	u32 size = dma1 + 1;
+	u32 mem_target = dma0 & 0x00030000;
+	bool nv3x = nv_device(priv)->chipset < 0x40;
 
 	/* only allow linear DMA objects */
 	if (!(dma0 & 0x00002000))
@@ -89,18 +91,24 @@ nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
 
 	if (mthd == 0x0190) {
 		/* DMA_CMD */
-		nv_mask(priv, 0x00b300, 0x00030000, (dma0 & 0x00030000));
+		if (nv3x)
+			nv_mask(priv, 0x00b300, 0x00010000, mem_target ? 0x00010000 : 0);
+		else
+			nv_mask(priv, 0x00b300, 0x00030000, mem_target);
 		nv_wr32(priv, 0x00b334, base);
 		nv_wr32(priv, 0x00b324, size);
 	} else
 	if (mthd == 0x01a0) {
 		/* DMA_DATA */
-		nv_mask(priv, 0x00b300, 0x000c0000, (dma0 & 0x00030000) << 2);
+		if (nv3x)
+			nv_mask(priv, 0x00b300, 0x00020000, mem_target ? 0x00020000 : 0);
+		else
+			nv_mask(priv, 0x00b300, 0x000c0000, mem_target << 2);
 		nv_wr32(priv, 0x00b360, base);
 		nv_wr32(priv, 0x00b364, size);
 	} else {
 		/* DMA_IMAGE, VRAM only */
-		if (dma0 & 0x000c0000)
+		if (mem_target)
 			return -EINVAL;
 
 		nv_wr32(priv, 0x00b370, base);
-- 
1.8.1.5
