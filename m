From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 3/3] nv50: attach the buffer bo to the miptree
	structures
Date: Mon,  1 Sep 2014 13:23:41 -0400
Message-ID: <1409592221-521-3-git-send-email-imirkin@alum.mit.edu>
References: <1409592221-521-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1409592221-521-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

The current code... makes no sense. Use nouveau_bo_ref to attach the bo
to the exposed resource so as to have the proper lifetime guarantees.

Tested-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/nv50/nv84_video.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv84_video.c b/src/gallium/drivers/nouveau/nv50/nv84_video.c
index b26e1ee..b42de20 100644
--- a/src/gallium/drivers/nouveau/nv50/nv84_video.c
+++ b/src/gallium/drivers/nouveau/nv50/nv84_video.c
@@ -685,17 +685,14 @@ nv84_video_buffer_create(struct pipe_context *pipe,
                       bo_size, &cfg, &buffer->full))
       goto error;
 
-   mt0->base.bo = buffer->interlaced;
+   nouveau_bo_ref(buffer->interlaced, &mt0->base.bo);
    mt0->base.domain = NOUVEAU_BO_VRAM;
-   mt0->base.offset = 0;
-   mt0->base.address = buffer->interlaced->offset + mt0->base.offset;
-   nouveau_bo_ref(buffer->interlaced, &empty);
+   mt0->base.address = buffer->interlaced->offset;
 
-   mt1->base.bo = buffer->interlaced;
+   nouveau_bo_ref(buffer->interlaced, &mt1->base.bo);
    mt1->base.domain = NOUVEAU_BO_VRAM;
-   mt1->base.offset = mt0->layer_stride * 2;
-   mt1->base.address = buffer->interlaced->offset + mt1->base.offset;
-   nouveau_bo_ref(buffer->interlaced, &empty);
+   mt1->base.offset = mt0->total_size;
+   mt1->base.address = buffer->interlaced->offset + mt0->total_size;
 
    memset(&sv_templ, 0, sizeof(sv_templ));
    for (component = 0, i = 0; i < 2; ++i ) {
-- 
1.8.5.5
