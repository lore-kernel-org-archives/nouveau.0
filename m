From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50,
	nvc0: choose storage type after ms has been initialized
Date: Wed,  5 Mar 2014 05:37:48 -0500
Message-ID: <1394015868-7508-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Noticed by inspection, untested. Would be interesting to see if this fixes
anything.

 src/gallium/drivers/nouveau/nv50/nv50_miptree.c | 4 ++--
 src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
index 513d8f9..6c6ef4e 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
@@ -329,13 +329,13 @@ nv50_miptree_create(struct pipe_screen *pscreen,
    if (pt->bind & PIPE_BIND_LINEAR)
       pt->flags |= NOUVEAU_RESOURCE_FLAG_LINEAR;
 
-   bo_config.nv50.memtype = nv50_mt_choose_storage_type(mt, TRUE);
-
    if (!nv50_miptree_init_ms_mode(mt)) {
       FREE(mt);
       return NULL;
    }
 
+   bo_config.nv50.memtype = nv50_mt_choose_storage_type(mt, TRUE);
+
    if (unlikely(pt->flags & NV50_RESOURCE_FLAG_VIDEO)) {
       nv50_miptree_init_layout_video(mt);
       if (pt->flags & NV50_RESOURCE_FLAG_NOALLOC) {
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
index 79c9390..59b9028 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
@@ -277,13 +277,13 @@ nvc0_miptree_create(struct pipe_screen *pscreen,
    if (pt->bind & PIPE_BIND_LINEAR)
       pt->flags |= NOUVEAU_RESOURCE_FLAG_LINEAR;
 
-   bo_config.nvc0.memtype = nvc0_mt_choose_storage_type(mt, compressed);
-
    if (!nvc0_miptree_init_ms_mode(mt)) {
       FREE(mt);
       return NULL;
    }
 
+   bo_config.nvc0.memtype = nvc0_mt_choose_storage_type(mt, compressed);
+
    if (unlikely(pt->flags & NVC0_RESOURCE_FLAG_VIDEO)) {
       nvc0_miptree_init_layout_video(mt);
    } else
-- 
1.8.3.2
