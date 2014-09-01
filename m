From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/3] nv50: mt address may not be the underlying
	bo's start address
Date: Mon,  1 Sep 2014 13:23:40 -0400
Message-ID: <1409592221-521-2-git-send-email-imirkin@alum.mit.edu>
References: <1409592221-521-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409592221-521-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

With VP2, nv50_miptree is faked because the underlying bo's have to be
laid out in a certain way. This is done by adjusting the address. Make
sure that blits (and everything else for consistency) use the mt address
rather than the bo address as a base.

This fixes retrieving chroma plane with VDPAU.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=82255
Tested-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c |  4 ++--
 src/gallium/drivers/nouveau/nv50/nv50_surface.c        | 16 ++++++++--------
 src/gallium/drivers/nouveau/nv50/nv50_transfer.c       |  2 ++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 1dcb961..519de15 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -54,8 +54,8 @@ nv50_validate_fb(struct nv50_context *nv50)
       assert(mt->layout_3d || !array_mode || array_size == 1);
 
       BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(i)), 5);
-      PUSH_DATAh(push, bo->offset + sf->offset);
-      PUSH_DATA (push, bo->offset + sf->offset);
+      PUSH_DATAh(push, mt->base.address + sf->offset);
+      PUSH_DATA (push, mt->base.address + sf->offset);
       PUSH_DATA (push, nv50_format_table[sf->base.format].rt);
       if (likely(nouveau_bo_memtype(bo))) {
          PUSH_DATA (push, mt->level[sf->base.u.tex.level].tile_mode);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index 600f4f9..8ec4a5f 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -114,8 +114,8 @@ nv50_2d_texture_set(struct nouveau_pushbuf *push, int dst,
       PUSH_DATA (push, mt->level[level].pitch);
       PUSH_DATA (push, width);
       PUSH_DATA (push, height);
-      PUSH_DATAh(push, bo->offset + offset);
-      PUSH_DATA (push, bo->offset + offset);
+      PUSH_DATAh(push, mt->base.address + offset);
+      PUSH_DATA (push, mt->base.address + offset);
    } else {
       BEGIN_NV04(push, SUBC_2D(mthd), 5);
       PUSH_DATA (push, format);
@@ -126,8 +126,8 @@ nv50_2d_texture_set(struct nouveau_pushbuf *push, int dst,
       BEGIN_NV04(push, SUBC_2D(mthd + 0x18), 4);
       PUSH_DATA (push, width);
       PUSH_DATA (push, height);
-      PUSH_DATAh(push, bo->offset + offset);
-      PUSH_DATA (push, bo->offset + offset);
+      PUSH_DATAh(push, mt->base.address + offset);
+      PUSH_DATA (push, mt->base.address + offset);
    }
 
 #if 0
@@ -299,8 +299,8 @@ nv50_clear_render_target(struct pipe_context *pipe,
    BEGIN_NV04(push, NV50_3D(RT_CONTROL), 1);
    PUSH_DATA (push, 1);
    BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(0)), 5);
-   PUSH_DATAh(push, bo->offset + sf->offset);
-   PUSH_DATA (push, bo->offset + sf->offset);
+   PUSH_DATAh(push, mt->base.address + sf->offset);
+   PUSH_DATA (push, mt->base.address + sf->offset);
    PUSH_DATA (push, nv50_format_table[dst->format].rt);
    PUSH_DATA (push, mt->level[sf->base.u.tex.level].tile_mode);
    PUSH_DATA (push, mt->layer_stride >> 2);
@@ -381,8 +381,8 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
    nv50->scissors_dirty |= 1;
 
    BEGIN_NV04(push, NV50_3D(ZETA_ADDRESS_HIGH), 5);
-   PUSH_DATAh(push, bo->offset + sf->offset);
-   PUSH_DATA (push, bo->offset + sf->offset);
+   PUSH_DATAh(push, mt->base.address + sf->offset);
+   PUSH_DATA (push, mt->base.address + sf->offset);
    PUSH_DATA (push, nv50_format_table[dst->format].rt);
    PUSH_DATA (push, mt->level[sf->base.u.tex.level].tile_mode);
    PUSH_DATA (push, mt->layer_stride >> 2);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_transfer.c b/src/gallium/drivers/nouveau/nv50/nv50_transfer.c
index f716052..fc6b24a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_transfer.c
@@ -24,6 +24,8 @@ nv50_m2mf_rect_setup(struct nv50_m2mf_rect *rect,
    rect->bo = mt->base.bo;
    rect->domain = mt->base.domain;
    rect->base = mt->level[l].offset;
+   if (mt->base.bo->offset != mt->base.address)
+      rect->base += mt->base.address - mt->base.bo->offset;
    rect->pitch = mt->level[l].pitch;
    if (util_format_is_plain(res->format)) {
       rect->width = w << mt->ms_x;
-- 
1.8.5.5
