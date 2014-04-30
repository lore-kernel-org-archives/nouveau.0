From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nouveau: add ARB_buffer_storage support
Date: Wed, 30 Apr 2014 16:48:07 -0400
Message-ID: <1398890887-11414-2-git-send-email-imirkin@alum.mit.edu>
References: <1398890887-11414-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1398890887-11414-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Light testing with dolphin-emu on a G96, seems to mostly work. Saw one or two
glitches (for like 1 frame), but that could well have been a bug in the emu.

It's a little silly to have all this super-super-repetitive code, but short of
rearranging the drivers, no easy way around it.

 src/gallium/drivers/nouveau/nouveau_buffer.c     | 12 ++++++++++--
 src/gallium/drivers/nouveau/nv30/nv30_resource.c | 17 +++++++++++++++++
 src/gallium/drivers/nouveau/nv30/nv30_screen.c   |  2 +-
 src/gallium/drivers/nouveau/nv30/nv30_vbo.c      |  8 ++++++++
 src/gallium/drivers/nouveau/nv50/nv50_context.c  | 17 +++++++++++++++++
 src/gallium/drivers/nouveau/nv50/nv50_screen.c   |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_vbo.c      |  8 ++++++++
 src/gallium/drivers/nouveau/nvc0/nvc0_context.c  | 17 +++++++++++++++++
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c   |  2 +-
 src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c      |  8 ++++++++
 10 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index 904e2cc..49ff100 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -342,6 +342,8 @@ nouveau_buffer_should_discard(struct nv04_resource *buf, unsigned usage)
       return FALSE;
    if (unlikely(buf->base.bind & PIPE_BIND_SHARED))
       return FALSE;
+   if (unlikely(usage & PIPE_TRANSFER_PERSISTENT))
+      return FALSE;
    return buf->mm && nouveau_buffer_busy(buf, PIPE_TRANSFER_WRITE);
 }
 
@@ -402,6 +404,9 @@ nouveau_buffer_transfer_map(struct pipe_context *pipe,
        !util_ranges_intersect(&buf->valid_buffer_range, box->x, box->x + box->width))
       usage |= PIPE_TRANSFER_DISCARD_RANGE | PIPE_TRANSFER_UNSYNCHRONIZED;
 
+   if (usage & PIPE_TRANSFER_PERSISTENT)
+      usage |= PIPE_TRANSFER_UNSYNCHRONIZED;
+
    if (buf->domain == NOUVEAU_BO_VRAM) {
       if (usage & NOUVEAU_TRANSFER_DISCARD) {
          /* Set up a staging area for the user to write to. It will be copied
@@ -645,8 +650,11 @@ nouveau_buffer_create(struct pipe_screen *pscreen,
    pipe_reference_init(&buffer->base.reference, 1);
    buffer->base.screen = pscreen;
 
-   if (buffer->base.bind &
-       (screen->vidmem_bindings & screen->sysmem_bindings)) {
+   if (buffer->base.flags & (PIPE_RESOURCE_FLAG_MAP_PERSISTENT |
+                             PIPE_RESOURCE_FLAG_MAP_COHERENT)) {
+      buffer->domain = NOUVEAU_BO_GART;
+   } else if (buffer->base.bind &
+              (screen->vidmem_bindings & screen->sysmem_bindings)) {
       switch (buffer->base.usage) {
       case PIPE_USAGE_DEFAULT:
       case PIPE_USAGE_IMMUTABLE:
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_resource.c b/src/gallium/drivers/nouveau/nv30/nv30_resource.c
index f56ca31..b7a29b9 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_resource.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_resource.c
@@ -31,6 +31,22 @@
 #include "nv30/nv30_resource.h"
 #include "nv30/nv30_transfer.h"
 
+static void
+nv30_memory_barrier(struct pipe_context *pipe, unsigned flags)
+{
+   struct nv30_context *nv30 = nv30_context(pipe);
+   int i;
+
+   if (flags & PIPE_BARRIER_MAPPED_BUFFER) {
+      for (i = 0; i < nv30->num_vtxbufs; ++i) {
+         if (!nv30->vtxbuf[i].buffer)
+            continue;
+         if (nv30->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+            nv30->base.vbo_dirty = TRUE;
+      }
+   }
+}
+
 static struct pipe_resource *
 nv30_resource_create(struct pipe_screen *pscreen,
                      const struct pipe_resource *tmpl)
@@ -75,4 +91,5 @@ nv30_resource_init(struct pipe_context *pipe)
    pipe->resource_copy_region = nv30_resource_copy_region;
    pipe->blit = nv30_blit;
    pipe->flush_resource = nv30_flush_resource;
+   pipe->memory_barrier = nv30_memory_barrier;
 }
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index 8fe3ebf..7157e0c 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -79,6 +79,7 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TGSI_TEXCOORD:
    case PIPE_CAP_USER_CONSTANT_BUFFERS:
    case PIPE_CAP_USER_INDEX_BUFFERS:
+   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
       return 1;
    case PIPE_CAP_USER_VERTEX_BUFFERS:
       return 0;
@@ -132,7 +133,6 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TGSI_VS_LAYER:
    case PIPE_CAP_MAX_TEXTURE_GATHER_COMPONENTS:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
-   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
    case PIPE_CAP_FAKE_SW_MSAA:
    case PIPE_CAP_TEXTURE_QUERY_LOD:
    case PIPE_CAP_SAMPLE_SHADING:
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_vbo.c b/src/gallium/drivers/nouveau/nv30/nv30_vbo.c
index d9b3c3e..a4f8085 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_vbo.c
@@ -545,6 +545,7 @@ nv30_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
    struct nv30_context *nv30 = nv30_context(pipe);
    struct nouveau_pushbuf *push = nv30->base.pushbuf;
+   int i;
 
    /* For picking only a few vertices from a large user buffer, push is better,
     * if index count is larger and we expect repeated vertices, suggest upload.
@@ -573,6 +574,13 @@ nv30_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
       return;
    }
 
+   for (i = 0; i < nv30->num_vtxbufs && !nv30->base.vbo_dirty; ++i) {
+      if (!nv30->vtxbuf[i].buffer)
+         continue;
+      if (nv30->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_COHERENT)
+         nv30->base.vbo_dirty = TRUE;
+   }
+
    if (nv30->base.vbo_dirty) {
       BEGIN_NV04(push, NV30_3D(VTX_CACHE_INVALIDATE_1710), 1);
       PUSH_DATA (push, 0);
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index ae1fcc5..6aa360e 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -57,6 +57,22 @@ nv50_texture_barrier(struct pipe_context *pipe)
    PUSH_DATA (push, 0x20);
 }
 
+static void
+nv50_memory_barrier(struct pipe_context *pipe, unsigned flags)
+{
+   struct nv50_context *nv50 = nv50_context(pipe);
+   int i;
+
+   if (flags & PIPE_BARRIER_MAPPED_BUFFER) {
+      for (i = 0; i < nv50->num_vtxbufs; ++i) {
+         if (!nv50->vtxbuf[i].buffer)
+            continue;
+         if (nv50->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+            nv50->base.vbo_dirty = TRUE;
+      }
+   }
+}
+
 void
 nv50_default_kick_notify(struct nouveau_pushbuf *push)
 {
@@ -249,6 +265,7 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
 
    pipe->flush = nv50_flush;
    pipe->texture_barrier = nv50_texture_barrier;
+   pipe->memory_barrier = nv50_memory_barrier;
    pipe->get_sample_position = nv50_context_get_sample_position;
 
    if (!screen->cur_ctx) {
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 0a57cb5..fcac3c1 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -106,6 +106,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_MIXED_FRAMEBUFFER_SIZES:
    case PIPE_CAP_ANISOTROPIC_FILTER:
    case PIPE_CAP_TEXTURE_BUFFER_OBJECTS:
+   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
       return 1;
    case PIPE_CAP_MAX_TEXTURE_BUFFER_SIZE:
       return 65536;
@@ -196,7 +197,6 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
-   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
    case PIPE_CAP_FAKE_SW_MSAA:
    case PIPE_CAP_TEXTURE_GATHER_OFFSETS:
       return 0;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 208c116..eb1d6bf 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -747,6 +747,7 @@ nv50_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
    struct nv50_context *nv50 = nv50_context(pipe);
    struct nouveau_pushbuf *push = nv50->base.pushbuf;
+   int i;
 
    /* NOTE: caller must ensure that (min_index + index_bias) is >= 0 */
    nv50->vb_elt_first = info->min_index + info->index_bias;
@@ -789,6 +790,13 @@ nv50_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
       PUSH_DATA (push, info->start_instance);
    }
 
+   for (i = 0; i < nv50->num_vtxbufs && !nv50->base.vbo_dirty; ++i) {
+      if (!nv50->vtxbuf[i].buffer)
+         continue;
+      if (nv50->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_COHERENT)
+         nv50->base.vbo_dirty = TRUE;
+   }
+
    if (nv50->base.vbo_dirty) {
       BEGIN_NV04(push, NV50_3D(VERTEX_ARRAY_FLUSH), 1);
       PUSH_DATA (push, 0);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
index e0c2b74..7d25c61 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.c
@@ -57,6 +57,22 @@ nvc0_texture_barrier(struct pipe_context *pipe)
 }
 
 static void
+nvc0_memory_barrier(struct pipe_context *pipe, unsigned flags)
+{
+   struct nvc0_context *nvc0 = nvc0_context(pipe);
+   int i;
+
+   if (flags & PIPE_BARRIER_MAPPED_BUFFER) {
+      for (i = 0; i < nvc0->num_vtxbufs; ++i) {
+         if (!nvc0->vtxbuf[i].buffer)
+            continue;
+         if (nvc0->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_PERSISTENT)
+            nvc0->base.vbo_dirty = TRUE;
+      }
+   }
+}
+
+static void
 nvc0_context_unreference_resources(struct nvc0_context *nvc0)
 {
    unsigned s, i;
@@ -264,6 +280,7 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
 
    pipe->flush = nvc0_flush;
    pipe->texture_barrier = nvc0_texture_barrier;
+   pipe->memory_barrier = nvc0_memory_barrier;
    pipe->get_sample_position = nvc0_context_get_sample_position;
 
    if (!screen->cur_ctx) {
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index e7b387c..2166788 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -152,6 +152,7 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_TEXTURE_BARRIER:
    case PIPE_CAP_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION:
    case PIPE_CAP_START_INSTANCE:
+   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
       return 1;
    case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
       return 0; /* state trackers will know better */
@@ -179,7 +180,6 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
    case PIPE_CAP_TEXTURE_GATHER_SM5:
-   case PIPE_CAP_BUFFER_MAP_PERSISTENT_COHERENT:
    case PIPE_CAP_FAKE_SW_MSAA:
       return 0;
    case PIPE_CAP_MAX_VIEWPORTS:
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
index 490d16e..77c40dd 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_vbo.c
@@ -797,6 +797,7 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 {
    struct nvc0_context *nvc0 = nvc0_context(pipe);
    struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   int i;
 
    /* NOTE: caller must ensure that (min_index + index_bias) is >= 0 */
    nvc0->vb_elt_first = info->min_index + info->index_bias;
@@ -846,6 +847,13 @@ nvc0_draw_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
       PUSH_DATA (push, info->start_instance);
    }
 
+   for (i = 0; i < nvc0->num_vtxbufs && !nvc0->base.vbo_dirty; ++i) {
+      if (!nvc0->vtxbuf[i].buffer)
+         continue;
+      if (nvc0->vtxbuf[i].buffer->flags & PIPE_RESOURCE_FLAG_MAP_COHERENT)
+         nvc0->base.vbo_dirty = TRUE;
+   }
+
    if (nvc0->base.vbo_dirty) {
       IMMED_NVC0(push, NVC0_3D(VERTEX_ARRAY_FLUSH), 0);
       nvc0->base.vbo_dirty = FALSE;
-- 
1.8.3.2
