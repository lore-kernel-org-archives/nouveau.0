From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [MESA PATCH] Fix nv40_miptree_layout pitch
Date: Sat, 26 Dec 2009 01:59:30 +0100
Message-ID: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

This patch fixes two issues in nv40_miptree_layout.

First, pt->width0 is used, which is the size of the whole texture,
while width, which is the size of the mipmap level, should be used.

Second, the current code does not 64-byte align the pitch of swizzled
textures. However, on my NV40 this causes a pgraph error regarding the
pitch register (and sometimes a system lockup too), which is fixed by
this patch.
I'm not sure how small mipmaps could have worked with the previous code.

Also the offset code below may need some review.
And furthermore, wide_pitch is set for any kind of texture usage, so
maybe it should be made unconditional (what's the point of allocating
a texture that the GPU can't use in any way?).

diff --git a/src/gallium/drivers/nv40/nv40_miptree.c
b/src/gallium/drivers/nv40/nv40_miptree.c
index b974e68..9f54187 100644
--- a/src/gallium/drivers/nv40/nv40_miptree.c
+++ b/src/gallium/drivers/nv40/nv40_miptree.c
@@ -31,8 +31,8 @@ nv40_miptree_layout(struct nv40_miptree *mt)
 	}

 	for (l = 0; l <= pt->last_level; l++) {
-		if (wide_pitch && (pt->tex_usage & NOUVEAU_TEXTURE_USAGE_LINEAR))
-			mt->level[l].pitch = align(util_format_get_stride(pt->format,
pt->width0), 64);
+		if (wide_pitch)
+			mt->level[l].pitch = align(util_format_get_stride(pt->format, width), 64);
 		else
 			mt->level[l].pitch = util_format_get_stride(pt->format, width);
