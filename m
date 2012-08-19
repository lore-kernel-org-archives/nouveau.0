From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/10] drm/nouveau: fix off-by-one bugs related to
 command submission in IB mode
Date: Sun, 19 Aug 2012 23:02:00 +0200
Message-ID: <20120819210200.GA26902@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Commit "drm/nouveau: port all engines to new engine module format" changed
IB size calculation to be less wasteful, but didn't take into account already
existing off-by-one bugs :).

So:
- ib_max is the last entry, so we need to +1 when calculating number of
  free entries
- nv50_dma_wait already does +1 (for FIRE_RING), so we don't need another +1
  on nouveau_gem_ioctl_pushbuf side
- there are 512 allocated IB entries (and it needs to be round number), so we
  can accept at most 511 entries from userspace (we need one for FIRE_RING) -
  fortunately userspace already flushes at 511, so nr_push check change won't
  have any impact

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c  |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index fd15ebf..d0c0271 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -318,7 +318,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		chan->dma.ib_base =  0x10000 / 4;
 		chan->dma.ib_max  = (0x01000 / 8) - 1;
 		chan->dma.ib_put  = 0;
-		chan->dma.ib_free = chan->dma.ib_max - chan->dma.ib_put;
+		chan->dma.ib_free = chan->dma.ib_max - chan->dma.ib_put + 1;
 		chan->dma.max = chan->dma.ib_base;
 		break;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 40f91e1..e814fab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -128,7 +128,7 @@ nv50_dma_push_wait(struct nouveau_channel *chan, int count)
 
 		chan->dma.ib_free = get - chan->dma.ib_put;
 		if (chan->dma.ib_free <= 0)
-			chan->dma.ib_free += chan->dma.ib_max;
+			chan->dma.ib_free += chan->dma.ib_max + 1;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 6454370..d19c7aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -662,7 +662,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	if (unlikely(req->nr_push == 0))
 		goto out_next;
 
-	if (unlikely(req->nr_push > NOUVEAU_GEM_MAX_PUSH)) {
+	if (unlikely(req->nr_push >= NOUVEAU_GEM_MAX_PUSH)) {
 		NV_ERROR(drm, "pushbuf push count exceeds limit: %d max %d\n",
 			 req->nr_push, NOUVEAU_GEM_MAX_PUSH);
 		return nouveau_abi16_put(abi16, -EINVAL);
@@ -718,7 +718,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	}
 
 	if (chan->dma.ib_max) {
-		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
+		ret = nouveau_dma_wait(chan, req->nr_push, 16);
 		if (ret) {
 			NV_ERROR(drm, "nv50cal_space: %d\n", ret);
 			goto out;
-- 
1.7.8.6
