From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50, nvc0: don't crash on a null cbuf
Date: Wed, 15 Jan 2014 02:30:40 -0500
Message-ID: <1389771040-29447-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is needed since commit 9baa45f78b (st/mesa: bind NULL colorbuffers
as specified by glDrawBuffers).

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not sure whether something needs to be done to clear out the old RT_* settings
for that index buffer, or if things are cleared out implicitly. Perhaps
instead of skipping indices, RT_CONTROL needs to be adjusted with the
appropriate indices?

 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c | 14 +++++++++++---
 src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 86b9a23..7d330c9 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -20,9 +20,17 @@ nv50_validate_fb(struct nv50_context *nv50)
    PUSH_DATA (push, fb->height << 16);
 
    for (i = 0; i < fb->nr_cbufs; ++i) {
-      struct nv50_miptree *mt = nv50_miptree(fb->cbufs[i]->texture);
-      struct nv50_surface *sf = nv50_surface(fb->cbufs[i]);
-      struct nouveau_bo *bo = mt->base.bo;
+      struct nv50_miptree *mt;
+      struct nv50_surface *sf;
+      struct nouveau_bo *bo;
+
+      /* Do we need to clear the old RT settings? */
+      if (!fb->cbufs[i])
+         continue;
+
+      mt = nv50_miptree(fb->cbufs[i]->texture);
+      sf = nv50_surface(fb->cbufs[i]);
+      bo = mt->base.bo;
 
       array_size = MIN2(array_size, sf->depth);
       if (mt->layout_3d)
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
index 0ba4bad..9059d76 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
@@ -72,9 +72,17 @@ nvc0_validate_fb(struct nvc0_context *nvc0)
     PUSH_DATA (push, fb->height << 16);
 
     for (i = 0; i < fb->nr_cbufs; ++i) {
-        struct nv50_surface *sf = nv50_surface(fb->cbufs[i]);
-        struct nv04_resource *res = nv04_resource(sf->base.texture);
-        struct nouveau_bo *bo = res->bo;
+        struct nv50_surface *sf;
+        struct nv04_resource *res;
+        struct nouveau_bo *bo;
+
+        /* Do we need to clear the old RT settings? */
+        if (!fb->cbufs[i])
+           continue;
+
+        sf = nv50_surface(fb->cbufs[i]);
+        res = nv04_resource(sf->base.texture);
+        bo = res->bo;
 
         BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(i)), 9);
         PUSH_DATAh(push, res->address + sf->offset);
-- 
1.8.3.2
