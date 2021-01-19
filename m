From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] drm/nouveau/kms/nv50-: Use drm_dbg_kms() in
 crc.c
Date: Mon, 18 Jan 2021 20:48:45 -0500
Message-ID: <20210119014849.2509965-2-lyude@redhat.com>
References: <20210119014849.2509965-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210119014849.2509965-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index b8c31b697797..3c50b29a37ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -84,7 +84,8 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct nv50_crc *crc = container_of(work, struct nv50_crc, flip_work);
 	struct nv50_head *head = container_of(crc, struct nv50_head, crc);
 	struct drm_crtc *crtc = &head->base.base;
-	struct nv50_disp *disp = nv50_disp(crtc->dev);
+	struct drm_device *dev = crtc->dev;
+	struct nv50_disp *disp = nv50_disp(dev);
 	u8 new_idx = crc->ctx_idx ^ 1;
 
 	/*
@@ -92,18 +93,15 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	 * try again for the next vblank if we don't grab the lock
 	 */
 	if (!mutex_trylock(&disp->mutex)) {
-		DRM_DEV_DEBUG_KMS(crtc->dev->dev,
-				  "Lock contended, delaying CRC ctx flip for head-%d\n",
-				  head->base.index);
+		drm_dbg_kms(dev, "Lock contended, delaying CRC ctx flip for %s\n", crtc->name);
 		drm_vblank_work_schedule(work,
 					 drm_crtc_vblank_count(crtc) + 1,
 					 true);
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev,
-			  "Flipping notifier ctx for head %d (%d -> %d)\n",
-			  drm_crtc_index(crtc), crc->ctx_idx, new_idx);
+	drm_dbg_kms(dev, "Flipping notifier ctx for %s (%d -> %d)\n",
+		    crtc->name, crc->ctx_idx, new_idx);
 
 	nv50_crc_program_ctx(head, NULL);
 	nv50_crc_program_ctx(head, &crc->ctx[new_idx]);
@@ -189,9 +187,9 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 		 * updates back-to-back without waiting, we'll just be
 		 * optimistic and assume we always miss exactly one frame.
 		 */
-		DRM_DEV_DEBUG_KMS(head->base.base.dev->dev,
-				  "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
-				  head->base.index, crc->frame);
+		drm_dbg_kms(head->base.base.dev,
+			    "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
+			    head->base.index, crc->frame);
 		crc->frame++;
 
 		nv50_crc_reset_ctx(ctx);
-- 
2.29.2
