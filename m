From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gallium/nouveau: use pre-calculated stride for
 resource_get_handle
Date: Thu, 4 Oct 2012 13:29:11 +0200
Message-ID: <20121004112911.GA4979@joi.lan>
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

Fixes FDO#55294.
---
 src/gallium/drivers/nv30/nv30_miptree.c | 3 +--
 src/gallium/drivers/nv50/nv50_miptree.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_miptree.c b/src/gallium/drivers/nv30/nv30_miptree.c
index 5a9a63b..9700fa8 100644
--- a/src/gallium/drivers/nv30/nv30_miptree.c
+++ b/src/gallium/drivers/nv30/nv30_miptree.c
@@ -56,8 +56,7 @@ nv30_miptree_get_handle(struct pipe_screen *pscreen,
    if (!mt || !mt->base.bo)
       return FALSE;
 
-   stride = util_format_get_stride(mt->base.base.format,
-                                   mt->base.base.width0);
+   stride = mt->level[0].pitch;
 
    return nouveau_screen_bo_get_handle(pscreen, mt->base.bo, stride, handle);
 }
diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 7b8dfb8..70e8c77 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -133,8 +133,7 @@ nv50_miptree_get_handle(struct pipe_screen *pscreen,
    if (!mt || !mt->base.bo)
       return FALSE;
 
-   stride = util_format_get_stride(mt->base.base.format,
-                                   mt->base.base.width0);
+   stride = mt->level[0].pitch;
 
    return nouveau_screen_bo_get_handle(pscreen,
                                        mt->base.bo,
-- 
1.7.12
