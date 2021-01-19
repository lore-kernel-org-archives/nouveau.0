From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] drm/nouveau/kms/nv50-: Check vbl count after
 CRC context flip
Date: Mon, 18 Jan 2021 20:48:46 -0500
Message-ID: <20210119014849.2509965-3-lyude@redhat.com>
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

While I haven't seen us take too long in nv50_crc_ctx_flip_work() outside of
users with kernel logging on a serial port, it probably would be a good idea to
check how long we take just in case we need to go faster in the future.

Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 3c50b29a37ff..ef942248345c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -86,6 +86,8 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct drm_crtc *crtc = &head->base.base;
 	struct drm_device *dev = crtc->dev;
 	struct nv50_disp *disp = nv50_disp(dev);
+	const uint64_t start_vbl = drm_crtc_vblank_count(crtc);
+	uint64_t end_vbl;
 	u8 new_idx = crc->ctx_idx ^ 1;
 
 	/*
@@ -94,9 +96,7 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	 */
 	if (!mutex_trylock(&disp->mutex)) {
 		drm_dbg_kms(dev, "Lock contended, delaying CRC ctx flip for %s\n", crtc->name);
-		drm_vblank_work_schedule(work,
-					 drm_crtc_vblank_count(crtc) + 1,
-					 true);
+		drm_vblank_work_schedule(work, start_vbl + 1, true);
 		return;
 	}
 
@@ -107,6 +107,12 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	nv50_crc_program_ctx(head, &crc->ctx[new_idx]);
 	mutex_unlock(&disp->mutex);
 
+	end_vbl = drm_crtc_vblank_count(crtc);
+	if (unlikely(end_vbl != start_vbl))
+		NV_ERROR(nouveau_drm(dev),
+			 "Failed to flip CRC context on %s on time (%llu > %llu)\n",
+			 crtc->name, end_vbl, start_vbl);
+
 	spin_lock_irq(&crc->lock);
 	crc->ctx_changed = true;
 	spin_unlock_irq(&crc->lock);
-- 
2.29.2
