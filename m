From: Aleksi Torhamo <aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>
Subject: [PATCH] drm/nvc0/fb: fix crash when different mutex is
	used to protect same list
Date: Wed,  9 Jan 2013 20:08:48 +0200
Message-ID: <1357754928-5357-1-git-send-email-aleksi@torhamo.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Fixes regression introduced in commit 861d2107
"drm/nouveau/fb: merge fb/vram and port to subdev interfaces"

nv50_fb_vram_{new,del} functions were changed to use
nouveau_subdev->mutex instead of the old nouveau_mm->mutex.
nvc0_fb_vram_new still uses the nouveau_mm->mutex, but nvc0 doesn't
have its own fb_vram_del function, using nv50_fb_vram_del instead.
Because of this, on nvc0 a different mutex ends up being used to protect
additions and deletions to the same list.

This patch is a -stable candidate for 3.7.

Signed-off-by: Aleksi Torhamo <aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>
Reported-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Tested-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
index 306bdf1..7606ed1 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
@@ -145,14 +145,14 @@ nvc0_fb_vram_new(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	mem->memtype = type;
 	mem->size = size;
 
-	mutex_lock(&mm->mutex);
+	mutex_lock(&pfb->base.mutex);
 	do {
 		if (back)
 			ret = nouveau_mm_tail(mm, 1, size, ncmin, align, &r);
 		else
 			ret = nouveau_mm_head(mm, 1, size, ncmin, align, &r);
 		if (ret) {
-			mutex_unlock(&mm->mutex);
+			mutex_unlock(&pfb->base.mutex);
 			pfb->ram.put(pfb, &mem);
 			return ret;
 		}
@@ -160,7 +160,7 @@ nvc0_fb_vram_new(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 		list_add_tail(&r->rl_entry, &mem->regions);
 		size -= r->length;
 	} while (size);
-	mutex_unlock(&mm->mutex);
+	mutex_unlock(&pfb->base.mutex);
 
 	r = list_first_entry(&mem->regions, struct nouveau_mm_node, rl_entry);
 	mem->offset = (u64)r->offset << 12;
-- 
1.7.8.6
