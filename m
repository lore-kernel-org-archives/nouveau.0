From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH RFC] nouveau: zero structs passed to ioctl
Date: Tue, 12 Jan 2010 15:37:02 +0100
Message-ID: <20100112143702.GC2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: zero structs passed to ioctl

---
 nouveau/nouveau_bo.c      |    4 ++++
 nouveau/nouveau_device.c  |    1 +
 nouveau/nouveau_pushbuf.c |    2 ++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 10cc8a6..563752d 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -103,6 +103,7 @@ nouveau_bo_kfree(struct nouveau_bo_priv *nvbo)
 		nvbo->map = NULL;
 	}
 
+	memset(&req, 0, sizeof(req));
 	req.handle = nvbo->handle;
 	nvbo->handle = 0;
 	drmIoctl(nvdev->fd, DRM_IOCTL_GEM_CLOSE, &req);
@@ -119,6 +120,7 @@ nouveau_bo_kalloc(struct nouveau_bo_priv *nvbo, struct nouveau_channel *chan)
 	if (nvbo->handle)
 		return 0;
 
+	memset(&req, 0, sizeof(req));
 	req.channel_hint = chan ? chan->id : 0;
 	req.align = nvbo->align;
 
@@ -262,6 +264,7 @@ nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
 		return ret;
 	nvbo = nouveau_bo(*bo);
 
+	memset(&req, 0, sizeof(req));
 	req.handle = handle;
 	ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_GEM_INFO,
 				  &req, sizeof(req));
@@ -315,6 +318,7 @@ nouveau_bo_handle_ref(struct nouveau_device *dev, uint32_t handle,
 	struct drm_gem_open req;
 	int ret;
 
+	memset(&req, 0, sizeof(req));
 	req.name = handle;
 	ret = drmIoctl(nvdev->fd, DRM_IOCTL_GEM_OPEN, &req);
 	if (ret) {
diff --git a/nouveau/nouveau_device.c b/nouveau/nouveau_device.c
index 0982d3b..5ed2dfa 100644
--- a/nouveau/nouveau_device.c
+++ b/nouveau/nouveau_device.c
@@ -161,6 +161,7 @@ nouveau_device_get_param(struct nouveau_device *dev,
 	if (!nvdev || !value)
 		return -EINVAL;
 
+	memset(&g, 0, sizeof(g));
 	g.param = param;
 	ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_GETPARAM,
 				  &g, sizeof(g));
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 7da3a47..7ea17b0 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -112,6 +112,7 @@ nouveau_pushbuf_init_call(struct nouveau_channel *chan)
 	struct nouveau_device *dev = chan->device;
 	int i, ret;
 
+	memset(&req, 0, sizeof(req));
 	req.channel = chan->id;
 	req.handle = 0;
 	ret = drmCommandWriteRead(nouveau_device(dev)->fd,
@@ -201,6 +202,7 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 			nvpb->base.remaining -= 2;
 
 restart_cal:
+		memset(&req, 0, sizeof(req));
 		req.channel = chan->id;
 		req.handle = nvpb->buffer[nvpb->current]->handle;
 		req.offset = nvpb->current_offset * 4;
-- 
1.6.6.rc3
