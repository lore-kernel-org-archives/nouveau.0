From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [libdrm PATCH 1/3] nouveau: Only export public functions.
Date: Thu, 31 Jul 2014 15:44:22 +0200
Message-ID: <53DA4836.2000108@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This hides all the abi16_* functions and the nouveau_debug variable,
they should have been private to begin with.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 nouveau/Makefile.am |  1 +
 nouveau/bufctx.c    | 10 +++++-----
 nouveau/nouveau.c   | 40 ++++++++++++++++++++--------------------
 nouveau/private.h   |  1 +
 nouveau/pushbuf.c   | 20 ++++++++++----------
 5 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
index 206e892..73cff9f 100644
--- a/nouveau/Makefile.am
+++ b/nouveau/Makefile.am
@@ -1,5 +1,6 @@
 AM_CFLAGS = \
 	$(WARN_CFLAGS) \
+	$(VISIBILITY_CFLAGS) \
 	-I$(top_srcdir) \
 	-I$(top_srcdir)/nouveau \
 	$(PTHREADSTUBS_CFLAGS) \
diff --git a/nouveau/bufctx.c b/nouveau/bufctx.c
index 23d6f09..fdd3164 100644
--- a/nouveau/bufctx.c
+++ b/nouveau/bufctx.c
@@ -68,7 +68,7 @@ nouveau_bufctx(struct nouveau_bufctx *bctx)
 	return (struct nouveau_bufctx_priv *)bctx;
 }
 
-int
+drm_public int
 nouveau_bufctx_new(struct nouveau_client *client, int bins,
 		   struct nouveau_bufctx **pbctx)
 {
@@ -88,7 +88,7 @@ nouveau_bufctx_new(struct nouveau_client *client, int bins,
 	return -ENOMEM;
 }
 
-void
+drm_public void
 nouveau_bufctx_del(struct nouveau_bufctx **pbctx)
 {
 	struct nouveau_bufctx_priv *pctx = nouveau_bufctx(*pbctx);
@@ -105,7 +105,7 @@ nouveau_bufctx_del(struct nouveau_bufctx **pbctx)
 	}
 }
 
-void
+drm_public void
 nouveau_bufctx_reset(struct nouveau_bufctx *bctx, int bin)
 {
 	struct nouveau_bufctx_priv *pctx = nouveau_bufctx(bctx);
@@ -123,7 +123,7 @@ nouveau_bufctx_reset(struct nouveau_bufctx *bctx, int bin)
 	pbin->relocs  = 0;
 }
 
-struct nouveau_bufref *
+drm_public struct nouveau_bufref *
 nouveau_bufctx_refn(struct nouveau_bufctx *bctx, int bin,
 		    struct nouveau_bo *bo, uint32_t flags)
 {
@@ -150,7 +150,7 @@ nouveau_bufctx_refn(struct nouveau_bufctx *bctx, int bin,
 	return &pref->base;
 }
 
-struct nouveau_bufref *
+drm_public struct nouveau_bufref *
 nouveau_bufctx_mthd(struct nouveau_bufctx *bctx, int bin, uint32_t packet,
 		    struct nouveau_bo *bo, uint64_t data, uint32_t flags,
 		    uint32_t vor, uint32_t tor)
diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
index 1bede84..43f0d3c 100644
--- a/nouveau/nouveau.c
+++ b/nouveau/nouveau.c
@@ -62,14 +62,14 @@ debug_init(char *args)
  * is kept here to prevent AIGLX from crashing if the DDX is linked against
  * the new libdrm, but the DRI driver against the old
  */
-int
+drm_public int
 nouveau_device_open_existing(struct nouveau_device **pdev, int close, int fd,
 			     drm_context_t ctx)
 {
 	return -EACCES;
 }
 
-int
+drm_public int
 nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
 {
 	struct nouveau_device_priv *nvdev = calloc(1, sizeof(*nvdev));
@@ -147,7 +147,7 @@ nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
 	return 0;
 }
 
-int
+drm_public int
 nouveau_device_open(const char *busid, struct nouveau_device **pdev)
 {
 	int ret = -ENODEV, fd = drmOpen("nouveau", busid);
@@ -159,7 +159,7 @@ nouveau_device_open(const char *busid, struct nouveau_device **pdev)
 	return ret;
 }
 
-void
+drm_public void
 nouveau_device_del(struct nouveau_device **pdev)
 {
 	struct nouveau_device_priv *nvdev = nouveau_device(*pdev);
@@ -173,7 +173,7 @@ nouveau_device_del(struct nouveau_device **pdev)
 	}
 }
 
-int
+drm_public int
 nouveau_getparam(struct nouveau_device *dev, uint64_t param, uint64_t *value)
 {
 	struct drm_nouveau_getparam r = { param, 0 };
@@ -183,14 +183,14 @@ nouveau_getparam(struct nouveau_device *dev, uint64_t param, uint64_t *value)
 	return ret;
 }
 
-int
+drm_public int
 nouveau_setparam(struct nouveau_device *dev, uint64_t param, uint64_t value)
 {
 	struct drm_nouveau_setparam r = { param, value };
 	return drmCommandWrite(dev->fd, DRM_NOUVEAU_SETPARAM, &r, sizeof(r));
 }
 
-int
+drm_public int
 nouveau_client_new(struct nouveau_device *dev, struct nouveau_client **pclient)
 {
 	struct nouveau_device_priv *nvdev = nouveau_device(dev);
@@ -229,7 +229,7 @@ unlock:
 	return ret;
 }
 
-void
+drm_public void
 nouveau_client_del(struct nouveau_client **pclient)
 {
 	struct nouveau_client_priv *pcli = nouveau_client(*pclient);
@@ -245,7 +245,7 @@ nouveau_client_del(struct nouveau_client **pclient)
 	}
 }
 
-int
+drm_public int
 nouveau_object_new(struct nouveau_object *parent, uint64_t handle,
 		   uint32_t oclass, void *data, uint32_t length,
 		   struct nouveau_object **pobj)
@@ -307,7 +307,7 @@ nouveau_object_new(struct nouveau_object *parent, uint64_t handle,
 	return 0;
 }
 
-void
+drm_public void
 nouveau_object_del(struct nouveau_object **pobj)
 {
 	struct nouveau_object *obj = *pobj;
@@ -331,7 +331,7 @@ nouveau_object_del(struct nouveau_object **pobj)
 	*pobj = NULL;
 }
 
-void *
+drm_public void *
 nouveau_object_find(struct nouveau_object *obj, uint32_t pclass)
 {
 	while (obj && obj->oclass != pclass) {
@@ -385,7 +385,7 @@ nouveau_bo_del(struct nouveau_bo *bo)
 	free(nvbo);
 }
 
-int
+drm_public int
 nouveau_bo_new(struct nouveau_device *dev, uint32_t flags, uint32_t align,
 	       uint64_t size, union nouveau_bo_config *config,
 	       struct nouveau_bo **pbo)
@@ -451,7 +451,7 @@ nouveau_bo_wrap_locked(struct nouveau_device *dev, uint32_t handle,
 	return -ENOMEM;
 }
 
-int
+drm_public int
 nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
 		struct nouveau_bo **pbo)
 {
@@ -463,7 +463,7 @@ nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
 	return ret;
 }
 
-int
+drm_public int
 nouveau_bo_name_ref(struct nouveau_device *dev, uint32_t name,
 		    struct nouveau_bo **pbo)
 {
@@ -492,7 +492,7 @@ nouveau_bo_name_ref(struct nouveau_device *dev, uint32_t name,
 	return ret;
 }
 
-int
+drm_public int
 nouveau_bo_name_get(struct nouveau_bo *bo, uint32_t *name)
 {
 	struct drm_gem_flink req = { .handle = bo->handle };
@@ -510,7 +510,7 @@ nouveau_bo_name_get(struct nouveau_bo *bo, uint32_t *name)
 	return 0;
 }
 
-void
+drm_public void
 nouveau_bo_ref(struct nouveau_bo *bo, struct nouveau_bo **pref)
 {
 	struct nouveau_bo *ref = *pref;
@@ -524,7 +524,7 @@ nouveau_bo_ref(struct nouveau_bo *bo, struct nouveau_bo **pref)
 	*pref = bo;
 }
 
-int
+drm_public int
 nouveau_bo_prime_handle_ref(struct nouveau_device *dev, int prime_fd,
 			    struct nouveau_bo **bo)
 {
@@ -553,7 +553,7 @@ nouveau_bo_prime_handle_ref(struct nouveau_device *dev, int prime_fd,
 	return ret;
 }
 
-int
+drm_public int
 nouveau_bo_set_prime(struct nouveau_bo *bo, int *prime_fd)
 {
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
@@ -567,7 +567,7 @@ nouveau_bo_set_prime(struct nouveau_bo *bo, int *prime_fd)
 	return 0;
 }
 
-int
+drm_public int
 nouveau_bo_wait(struct nouveau_bo *bo, uint32_t access,
 		struct nouveau_client *client)
 {
@@ -601,7 +601,7 @@ nouveau_bo_wait(struct nouveau_bo *bo, uint32_t access,
 	return ret;
 }
 
-int
+drm_public int
 nouveau_bo_map(struct nouveau_bo *bo, uint32_t access,
 	       struct nouveau_client *client)
 {
diff --git a/nouveau/private.h b/nouveau/private.h
index 4f337ad..bf9db04 100644
--- a/nouveau/private.h
+++ b/nouveau/private.h
@@ -1,6 +1,7 @@
 #ifndef __NOUVEAU_LIBDRM_PRIVATE_H__
 #define __NOUVEAU_LIBDRM_PRIVATE_H__
 
+#include <libdrm.h>
 #include <xf86drm.h>
 #include <xf86atomic.h>
 #include <pthread.h>
diff --git a/nouveau/pushbuf.c b/nouveau/pushbuf.c
index 4f77881..6e703a4 100644
--- a/nouveau/pushbuf.c
+++ b/nouveau/pushbuf.c
@@ -529,7 +529,7 @@ pushbuf_validate(struct nouveau_pushbuf *push, bool retry)
 	return ret;
 }
 
-int
+drm_public int
 nouveau_pushbuf_new(struct nouveau_client *client, struct nouveau_object *chan,
 		    int nr, uint32_t size, bool immediate,
 		    struct nouveau_pushbuf **ppush)
@@ -600,7 +600,7 @@ nouveau_pushbuf_new(struct nouveau_client *client, struct nouveau_object *chan,
 	return 0;
 }
 
-void
+drm_public void
 nouveau_pushbuf_del(struct nouveau_pushbuf **ppush)
 {
 	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(*ppush);
@@ -626,7 +626,7 @@ nouveau_pushbuf_del(struct nouveau_pushbuf **ppush)
 	*ppush = NULL;
 }
 
-struct nouveau_bufctx *
+drm_public struct nouveau_bufctx *
 nouveau_pushbuf_bufctx(struct nouveau_pushbuf *push, struct nouveau_bufctx *ctx)
 {
 	struct nouveau_bufctx *prev = push->bufctx;
@@ -634,7 +634,7 @@ nouveau_pushbuf_bufctx(struct nouveau_pushbuf *push, struct nouveau_bufctx *ctx)
 	return prev;
 }
 
-int
+drm_public int
 nouveau_pushbuf_space(struct nouveau_pushbuf *push,
 		      uint32_t dwords, uint32_t relocs, uint32_t pushes)
 {
@@ -698,7 +698,7 @@ nouveau_pushbuf_space(struct nouveau_pushbuf *push,
 	return flushed ? pushbuf_validate(push, false) : 0;
 }
 
-void
+drm_public void
 nouveau_pushbuf_data(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
 		     uint64_t offset, uint64_t length)
 {
@@ -728,14 +728,14 @@ nouveau_pushbuf_data(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
 	}
 }
 
-int
+drm_public int
 nouveau_pushbuf_refn(struct nouveau_pushbuf *push,
 		     struct nouveau_pushbuf_refn *refs, int nr)
 {
 	return pushbuf_refn(push, true, refs, nr);
 }
 
-void
+drm_public void
 nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
 		      uint32_t data, uint32_t flags, uint32_t vor, uint32_t tor)
 {
@@ -743,13 +743,13 @@ nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
 	push->cur++;
 }
 
-int
+drm_public int
 nouveau_pushbuf_validate(struct nouveau_pushbuf *push)
 {
 	return pushbuf_validate(push, true);
 }
 
-uint32_t
+drm_public uint32_t
 nouveau_pushbuf_refd(struct nouveau_pushbuf *push, struct nouveau_bo *bo)
 {
 	struct drm_nouveau_gem_pushbuf_bo *kref;
@@ -766,7 +766,7 @@ nouveau_pushbuf_refd(struct nouveau_pushbuf *push, struct nouveau_bo *bo)
 	return flags;
 }
 
-int
+drm_public int
 nouveau_pushbuf_kick(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 {
 	if (!push->channel)
-- 
2.0.0
