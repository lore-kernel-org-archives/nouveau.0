From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH V3] nvc0: implement clear_buffer
Date: Tue, 27 May 2014 02:19:01 +0200
Message-ID: <1401149941-26705-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, imirkin@alum.mit.edu
List-Id: nouveau.vger.kernel.org

v2:
 - change patch name to "nvc0: implement clear_buffer"
 - rename nvc0_clear_buffer_rgb32 -> nvc0_clear_buffer_cpu and make it work for
   all formats
 - remove superfluous fenciing in nvc0_clear_buffer_cpu
 - coding style fixes
v3:
 - more coding style fixes
 - nvc0_clear_buffer() - don't mark the framebuffer dirty for if we don't touch
   the GPU
   
Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 151 ++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index 6b7c30c..3572193 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -345,6 +345,156 @@ nvc0_clear_render_target(struct pipe_context *pipe,
 }
 
 static void
+nvc0_clear_buffer_cpu(struct pipe_context *pipe,
+                      struct pipe_resource *res,
+                      unsigned offset, unsigned size,
+                      const void *data, int data_size)
+{
+   struct nv04_resource *buf = nv04_resource(res);
+   struct pipe_transfer *pt;
+   struct pipe_box box;
+   unsigned elements, i;
+
+   elements = size / data_size;
+
+   u_box_1d(0, size, &box);
+
+   uint8_t *map = buf->vtbl->transfer_map(pipe, res, 0, PIPE_TRANSFER_WRITE,
+                                          &box, &pt);
+
+   for (i = 0; i < elements; ++i)
+      memcpy(&map[i*data_size], data, data_size);
+
+   buf->vtbl->transfer_unmap(pipe, pt);
+}
+
+static void
+nvc0_clear_buffer(struct pipe_context *pipe,
+                  struct pipe_resource *res,
+                  unsigned offset, unsigned size,
+                  const void *data, int data_size)
+{
+   struct nvc0_context *nvc0 = nvc0_context(pipe);
+   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
+   struct nv04_resource *buf = nv04_resource(res);
+   union pipe_color_union color;
+   enum pipe_format dst_fmt;
+   unsigned width, height, elements;
+
+   assert(res->target == PIPE_BUFFER);
+   assert(nouveau_bo_memtype(buf->bo) == 0);
+
+   switch (data_size) {
+   case 16:
+      dst_fmt = PIPE_FORMAT_R32G32B32A32_UINT;
+      memcpy(&color.ui, data, 16);
+      break;
+   case 12:
+      /*
+       * dst_fmt = PIPE_FORMAT_R32G32B32_UINT;
+       * memcpy(&color.ui, data, 12);
+       * memset(&color.ui[3], 0, 4);
+       * break;
+       */
+   case 8:
+      dst_fmt = PIPE_FORMAT_R32G32_UINT;
+      memcpy(&color.ui, data, 8);
+      memset(&color.ui[2], 0, 8);
+      break;
+   case 4:
+      dst_fmt = PIPE_FORMAT_R32_UINT;
+      memcpy(&color.ui, data, 4);
+      memset(&color.ui[1], 0, 12);
+      break;
+   case 2:
+      dst_fmt = PIPE_FORMAT_R16_UINT;
+      color.ui[0] = util_cpu_to_le32(
+            util_le16_to_cpu(*(unsigned short *)data));
+      memset(&color.ui[1], 0, 12);
+      break;
+   case 1:
+      dst_fmt = PIPE_FORMAT_R8_UINT;
+      color.ui[0] = util_cpu_to_le32(*(unsigned char *)data);
+      memset(&color.ui[1], 0, 12);
+      break;
+   default:
+      assert(!"Unsupported element size");
+      return;
+   }
+
+   assert(size % data_size == 0);
+
+   if (data_size == 12) {
+      /* TODO: Find a way to do this with the GPU! */
+      nvc0_clear_buffer_cpu(pipe, res, offset, size, data, data_size);
+      return;
+   }
+
+   elements = size / data_size;
+
+   height = (elements + 16383) / 16384;
+
+   width = elements / height;
+
+   if (!PUSH_SPACE(push, 40))
+      return;
+
+   PUSH_REFN (push, buf->bo, buf->domain | NOUVEAU_BO_WR);
+
+   BEGIN_NVC0(push, NVC0_3D(CLEAR_COLOR(0)), 4);
+   PUSH_DATAf(push, color.f[0]);
+   PUSH_DATAf(push, color.f[1]);
+   PUSH_DATAf(push, color.f[2]);
+   PUSH_DATAf(push, color.f[3]);
+   BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
+   PUSH_DATA (push, width << 16);
+   PUSH_DATA (push, height << 16);
+
+   IMMED_NVC0(push, NVC0_3D(RT_CONTROL), 1);
+
+   BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(0)), 9);
+   PUSH_DATAh(push, buf->address + offset);
+   PUSH_DATA (push, buf->address + offset);
+
+   PUSH_DATA (push, width * data_size);
+   PUSH_DATA (push, height);
+
+   PUSH_DATA (push, nvc0_format_table[dst_fmt].rt);
+   PUSH_DATA (push, 1 << 12);
+   PUSH_DATA (push, 1);
+   PUSH_DATA (push, 0);
+   PUSH_DATA (push, 0);
+
+   IMMED_NVC0(push, NVC0_3D(ZETA_ENABLE), 0);
+
+   IMMED_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 0x3c);
+
+   if (width * height != elements) {
+      offset += width * height * data_size;
+      width = elements - width * height;
+      height = 1;
+
+      BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
+      PUSH_DATA (push, width << 16);
+      PUSH_DATA (push, height << 16);
+
+      BEGIN_NVC0(push, NVC0_3D(RT_ADDRESS_HIGH(0)), 2);
+      PUSH_DATAh(push, buf->address + offset);
+      PUSH_DATA (push, buf->address + offset);
+
+      BEGIN_NVC0(push, NVC0_3D(RT_HORIZ(0)), 2);
+      PUSH_DATA (push, width * data_size);
+      PUSH_DATA (push, height);
+
+      IMMED_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 0x3c);
+   }
+
+   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence);
+   nouveau_fence_ref(nvc0->screen->base.fence.current, &buf->fence_wr);
+   nvc0->dirty |= NVC0_NEW_FRAMEBUFFER;
+}
+
+static void
 nvc0_clear_depth_stencil(struct pipe_context *pipe,
                          struct pipe_surface *dst,
                          unsigned clear_flags,
@@ -1363,4 +1513,5 @@ nvc0_init_surface_functions(struct nvc0_context *nvc0)
    pipe->flush_resource = nvc0_flush_resource;
    pipe->clear_render_target = nvc0_clear_render_target;
    pipe->clear_depth_stencil = nvc0_clear_depth_stencil;
+   pipe->clear_buffer = nvc0_clear_buffer;
 }
-- 
1.8.4.5
