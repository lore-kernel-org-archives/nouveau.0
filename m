From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50: use 2d blit when src/dst have same number
	of samples
Date: Fri, 18 Apr 2014 00:07:29 -0400
Message-ID: <1397794049-20255-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

The 2D engine should be usable in more cases, but this fixes MS blits
between textures with the same MS settings. Otherwise a single sample is
selected to be the target texel value.

This allows other tests to work that render to a RB and then blit that
to a texture for input into a shader that uses sampler2DMS to verify it.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index c28abe0..9a3548a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -1299,8 +1299,8 @@ nv50_blit_eng2d(struct nv50_context *nv50, const struct pipe_blit_info *info)
 
    if (src->base.base.nr_samples > dst->base.base.nr_samples) {
       /* center src coorinates for proper MS resolve filtering */
-      srcx += (int64_t)src->ms_x << 32;
-      srcy += (int64_t)src->ms_y << 32;
+      srcx += (int64_t)1 << (src->ms_x + 31);
+      srcy += (int64_t)1 << (src->ms_y + 31);
    }
 
    dstx = info->dst.box.x << dst->ms_x;
@@ -1438,8 +1438,8 @@ nv50_blit(struct pipe_context *pipe, const struct pipe_blit_info *info)
       eng3d = TRUE;
 
    /* FIXME: can't make this work with eng2d anymore */
-   if (info->src.resource->nr_samples > 1 ||
-       info->dst.resource->nr_samples > 1)
+   if ((info->src.resource->nr_samples | 1) !=
+       (info->dst.resource->nr_samples | 1))
       eng3d = TRUE;
 
    /* FIXME: find correct src coordinate adjustments */
-- 
1.8.3.2
