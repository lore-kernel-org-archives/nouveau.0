From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/nouveau: enlarge GART aperture (v2)
Date: Tue,  9 Feb 2010 06:59:36 +0100
Message-ID: <1265695176-24383-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Changes in v2:
- Compute size based on ramin_rsvd_size

This patch enlarges the PCI GART aperture to 512 MB, or the space
covered by a DMA object filling half RAMIN.

The current 64MB aperture is too small and should be enlarged.
The optimal amound may be card/system-dependent, so a more sophisticated
approach may be preferable.

Could anyone with an nv04 test whether this doesn't break there?

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_sgdma.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 4c7f1e4..5a52006 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -227,11 +227,21 @@ nouveau_sgdma_init(struct drm_device *dev)
 	int i, ret;
 
 	if (dev_priv->card_type < NV_50) {
-		aper_size = (64 * 1024 * 1024);
+		/* TODO: can we safely raise this to 1GB, 2GB or 4GB? */
+		unsigned limit = 512 * 1024;
+
+		/* use up half ramin for the GART ctxdma object */
+		aper_size = dev_priv->ramin_rsvd_vram >> 1;
+		if(aper_size > limit)
+			aper_size = limit;
+		aper_size <<= 10; /* each 4KB page needs a 4 byte entry */
+
 		obj_size  = (aper_size >> NV_CTXDMA_PAGE_SHIFT) * 4;
 		obj_size += 8; /* ctxdma header */
 	} else {
-		/* 1 entire VM page table */
+		/* 1 entire VM page table
+		 * TODO: can we raise this so that it can potentially cover all system memory?
+		 */
 		aper_size = (512 * 1024 * 1024);
 		obj_size  = (aper_size >> NV_CTXDMA_PAGE_SHIFT) * 8;
 	}
-- 
1.6.6.1.476.g01ddb
