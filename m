From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 13/37] drm/nouveau: protect evo_wait/evo_kick sections with a
	channel mutex
Date: Wed, 12 Dec 2012 14:06:53 +0100
Message-ID: <1355317637-16742-14-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

With per-crtc locks modeset operations can run in parallel, and the
cursor code uses the device-global evo master channel for hw frobbing.
But the pageflip code can also sync with the master under some
circumstances. Hence just wrap things up in a mutex to ensure that
pushbuf access doesn't intermingle.

The approach here is a bit overkill since the per-crtc channels used
to schedule the pageflips could probably be used without this pushbuf
locking, but I'm not familiar enough with the nouveau codebase to be
sure of that.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_display.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 3587408..5751d63 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -128,6 +128,11 @@ struct nv50_dmac {
 	struct nv50_chan base;
 	dma_addr_t handle;
 	u32 *ptr;
+
+	/* Protects against concurrent pushbuf access to this channel, lock is
+	 * grabbed by evo_wait (if the pushbuf reservation is successful) and
+	 * dropped again by evo_kick. */
+	struct mutex lock;
 };
 
 static void
@@ -395,11 +400,13 @@ evo_wait(void *evoc, int nr)
 	struct nv50_dmac *dmac = evoc;
 	u32 put = nv_ro32(dmac->base.user, 0x0000) / 4;
 
+	mutex_lock(&dmac->lock);
 	if (put + nr >= (PAGE_SIZE / 4) - 8) {
 		dmac->ptr[put] = 0x20000000;
 
 		nv_wo32(dmac->base.user, 0x0000, 0x00000000);
 		if (!nv_wait(dmac->base.user, 0x0004, ~0, 0x00000000)) {
+			mutex_unlock(&dmac->lock);
 			NV_ERROR(dmac->base.user, "channel stalled\n");
 			return NULL;
 		}
@@ -415,6 +422,7 @@ evo_kick(u32 *push, void *evoc)
 {
 	struct nv50_dmac *dmac = evoc;
 	nv_wo32(dmac->base.user, 0x0000, (push - dmac->ptr) << 2);
+	mutex_unlock(&dmac->lock);
 }
 
 #define evo_mthd(p,m,s) *((p)++) = (((s) << 18) | (m))
-- 
1.7.10.4
