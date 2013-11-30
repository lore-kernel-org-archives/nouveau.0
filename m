From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] nv50: wait on the buf's fence before
	sticking it into pushbuf
Date: Fri, 29 Nov 2013 23:33:43 -0500
Message-ID: <1385786023-24566-2-git-send-email-imirkin@alum.mit.edu>
References: <1385786023-24566-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1385786023-24566-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Cc: nouveau@lists.freedesktop.org, "9.2 10.0" <mesa-stable@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This resolves some rendering issues in source games.
See https://bugs.freedesktop.org/show_bug.cgi?id=64323

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "9.2 10.0" <mesa-stable@lists.freedesktop.org>
---

Doing a nouveau_bo_wait works as well, but I got a slightly higher framerate
from glretrace doing it this way. I tried to get an actual source game running,
but was unsuccessful... (something about a missing filesystem_steam.so which
indeed was absent)

This is clearly not optimal, but neither is having broken source games. The
other workaround simply went the other path which would have to do a wait and
a double-copy (vram -> pushbuf, pushbuf xfer from gart), which is worse than
just the wait.

 src/gallium/drivers/nouveau/nouveau_buffer.c | 3 +++
 src/gallium/drivers/nouveau/nv50/nv50_vbo.c  | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nouveau_buffer.c b/src/gallium/drivers/nouveau/nouveau_buffer.c
index 3e04049..95905a8 100644
--- a/src/gallium/drivers/nouveau/nouveau_buffer.c
+++ b/src/gallium/drivers/nouveau/nouveau_buffer.c
@@ -205,6 +205,9 @@ nouveau_transfer_write(struct nouveau_context *nv, struct nouveau_transfer *tx,
                   base, size / 4, (const uint32_t *)data);
    else
       nv->push_data(nv, buf->bo, buf->offset + base, buf->domain, size, data);
+
+   nouveau_fence_ref(nv->screen->fence.current, &buf->fence);
+   nouveau_fence_ref(nv->screen->fence.current, &buf->fence_wr);
 }
 
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index c6162b5..947c67d 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -597,6 +597,15 @@ nv50_draw_elements(struct nv50_context *nv50, boolean shorten,
 
       assert(nouveau_resource_mapped_by_gpu(nv50->idxbuf.buffer));
 
+      /* This shouldn't have to be here. The going theory is that the buffer
+       * is being filled in by PGRAPH, and it's not done yet by the time it
+       * gets submitted to PFIFO, which in turn starts immediately prefetching
+       * the not-yet-written data. Ideally this wait would only happen on
+       * pushbuf submit, but it's probably not a big performance difference.
+       */
+      if (buf->fence_wr && !nouveau_fence_signalled(buf->fence_wr))
+         nouveau_fence_wait(buf->fence_wr);
+
       while (instance_count--) {
          BEGIN_NV04(push, NV50_3D(VERTEX_BEGIN_GL), 1);
          PUSH_DATA (push, prim);
-- 
1.8.3.2
