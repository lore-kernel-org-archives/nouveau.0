From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50,nvc0: fix 3d blits with mipmap levels
Date: Sun, 18 May 2014 00:23:05 -0400
Message-ID: <1400386985-30852-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, "10.2" <mesa-stable@lists.freedesktop.org>, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Make sure to normalize the z coordinates as well as the x/y ones when
there are mipmaps present. Fixes 3d mipmap generation, which now uses
the blit path.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
---

Did a full piglit run on nva8 and nve7 without regressions. The cubemap array
mipmap generation test still fails, but that will require more careful
investigation -- the output image seems identical to that which passes on my
snb.

 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 16 ++++++++++------
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 14 +++++++++-----
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index d02f5fe..1f37527 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -1142,6 +1142,12 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
    y0 *= (float)(1 << nv50_miptree(src)->ms_y);
    y1 *= (float)(1 << nv50_miptree(src)->ms_y);
 
+   /* XXX: multiply by 6 for cube arrays ? */
+   dz = (float)info->src.box.depth / (float)info->dst.box.depth;
+   z = (float)info->src.box.z;
+   if (nv50_miptree(src)->layout_3d)
+      z += 0.5f * dz;
+
    if (src->last_level > 0) {
       /* If there are mip maps, GPU always assumes normalized coordinates. */
       const unsigned l = info->src.level;
@@ -1151,14 +1157,12 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
       x1 /= fh;
       y0 /= fv;
       y1 /= fv;
+      if (nv50_miptree(src)->layout_3d) {
+         z /= u_minify(src->depth0, l);
+         dz /= u_minify(src->depth0, l);
+      }
    }
 
-   /* XXX: multiply by 6 for cube arrays ? */
-   dz = (float)info->src.box.depth / (float)info->dst.box.depth;
-   z = (float)info->src.box.z;
-   if (nv50_miptree(src)->layout_3d)
-      z += 0.5f * dz;
-
    BEGIN_NV04(push, NV50_3D(VIEWPORT_TRANSFORM_EN), 1);
    PUSH_DATA (push, 0);
    BEGIN_NV04(push, NV50_3D(VIEW_VOLUME_CLIP_CTRL), 1);
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index d11dbb2..6b7c30c 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -913,6 +913,11 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
    y0 *= (float)(1 << nv50_miptree(src)->ms_y);
    y1 *= (float)(1 << nv50_miptree(src)->ms_y);
 
+   dz = (float)info->src.box.depth / (float)info->dst.box.depth;
+   z = (float)info->src.box.z;
+   if (nv50_miptree(src)->layout_3d)
+      z += 0.5f * dz;
+
    if (src->last_level > 0) {
       /* If there are mip maps, GPU always assumes normalized coordinates. */
       const unsigned l = info->src.level;
@@ -922,13 +927,12 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
       x1 /= fh;
       y0 /= fv;
       y1 /= fv;
+      if (nv50_miptree(src)->layout_3d) {
+         z /= u_minify(src->depth0, l);
+         dz /= u_minify(src->depth0, l);
+      }
    }
 
-   dz = (float)info->src.box.depth / (float)info->dst.box.depth;
-   z = (float)info->src.box.z;
-   if (nv50_miptree(src)->layout_3d)
-      z += 0.5f * dz;
-
    IMMED_NVC0(push, NVC0_3D(VIEWPORT_TRANSFORM_EN), 0);
    IMMED_NVC0(push, NVC0_3D(VIEW_VOLUME_CLIP_CTRL), 0x2 |
               NVC0_3D_VIEW_VOLUME_CLIP_CTRL_DEPTH_RANGE_0_1);
-- 
1.8.5.5
