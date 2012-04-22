From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: remove unnecessary EAGAIN loops
Date: Mon, 23 Apr 2012 00:31:48 +0200
Message-ID: <20120422223148.GA8620@joi.lan>
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

drmCommandWrite / drmCommandWriteRead already loop on EAGAIN.
---
 nouveau/nouveau.c |    8 ++------
 nouveau/pushbuf.c |    7 ++-----
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
index 699b9b7..f0bc2c3 100644
--- a/nouveau/nouveau.c
+++ b/nouveau/nouveau.c
@@ -461,12 +461,8 @@ nouveau_bo_wait(struct nouveau_bo *bo, uint32_t access,
 	if (access & NOUVEAU_BO_NOBLOCK)
 		req.flags |= NOUVEAU_GEM_CPU_PREP_NOWAIT;
 
-	do {
-		ret = drmCommandWrite(bo->device->fd,
-				      DRM_NOUVEAU_GEM_CPU_PREP,
-				      &req, sizeof(req));
-	} while (ret == -EAGAIN);
-
+	ret = drmCommandWrite(bo->device->fd, DRM_NOUVEAU_GEM_CPU_PREP,
+			      &req, sizeof(req));
 	if (ret == 0)
 		nvbo->access = 0;
 	return ret;
diff --git a/nouveau/pushbuf.c b/nouveau/pushbuf.c
index 103737e..7b9dbaa 100644
--- a/nouveau/pushbuf.c
+++ b/nouveau/pushbuf.c
@@ -341,11 +341,8 @@ pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 			pushbuf_dump(krec, krec_id++, fifo->channel);
 
 #ifndef SIMULATE
-		do {
-			ret = drmCommandWriteRead(dev->fd,
-						  DRM_NOUVEAU_GEM_PUSHBUF,
-						  &req, sizeof(req));
-		} while (ret == -EAGAIN);
+		ret = drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_PUSHBUF,
+					  &req, sizeof(req));
 		nvpb->suffix0 = req.suffix0;
 		nvpb->suffix1 = req.suffix1;
 		dev->vram_limit = (req.vram_available * 80) / 100;
-- 
1.7.8.5
