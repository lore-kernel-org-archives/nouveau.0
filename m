From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50,
	nvc0: adjust blit_3d handling of ms output textures
Date: Thu,  6 Mar 2014 15:08:32 -0500
Message-ID: <1394136512-30008-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, Christoph Bumiller <e0425955@student.tuwien.ac.at>
Cc: "10.0 10.1" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

This fixes some unwanted scaling when the output is multisampled. Also
increases nvc0 maximum supported texture size to be able to work with a
32k texture.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.0 10.1" <mesa-stable@lists.freedesktop.org>
---

Ran the EXT_framebuffer_multisample tests, they improve a lot. The remaining
failures are probably due to incorrect sampling rather than the image being
totally wrong.

 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 12 ++++++++----
 src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 12 ++++++++----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index dc6d628..6073deb 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -977,6 +977,7 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
    float x0, x1, y0, y1, z;
    float dz;
    float x_range, y_range;
+   float x_output, y_output;
 
    blit->mode = nv50_blit_select_mode(info);
    blit->color_mask = nv50_blit_derive_color_mask(info);
@@ -996,11 +997,14 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
    x_range = (float)info->src.box.width / (float)info->dst.box.width;
    y_range = (float)info->src.box.height / (float)info->dst.box.height;
 
+   x_output = 16384 << nv50_miptree(dst)->ms_x;
+   y_output = 16384 << nv50_miptree(dst)->ms_y;
+
    x0 = (float)info->src.box.x - x_range * (float)info->dst.box.x;
    y0 = (float)info->src.box.y - y_range * (float)info->dst.box.y;
 
-   x1 = x0 + 16384.0f * x_range;
-   y1 = y0 + 16384.0f * y_range;
+   x1 = x0 + x_output * x_range;
+   y1 = y0 + y_output * y_range;
 
    x0 *= (float)(1 << nv50_miptree(src)->ms_x);
    x1 *= (float)(1 << nv50_miptree(src)->ms_x);
@@ -1069,7 +1073,7 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
       PUSH_DATAf(push, y0);
       PUSH_DATAf(push, z);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_2F_X(0)), 2);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_x);
+      PUSH_DATAf(push, x_output);
       PUSH_DATAf(push, 0.0f);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_3F_X(1)), 3);
       PUSH_DATAf(push, x0);
@@ -1077,7 +1081,7 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
       PUSH_DATAf(push, z);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_2F_X(0)), 2);
       PUSH_DATAf(push, 0.0f);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_y);
+      PUSH_DATAf(push, y_output);
       BEGIN_NV04(push, NV50_3D(VERTEX_END_GL), 1);
       PUSH_DATA (push, 0);
    }
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
index 32d234e..0df5b69 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
@@ -855,6 +855,7 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
    float x0, x1, y0, y1, z;
    float dz;
    float x_range, y_range;
+   float x_output, y_output;
 
    blit->mode = nv50_blit_select_mode(info);
    blit->color_mask = nv50_blit_derive_color_mask(info);
@@ -877,8 +878,11 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
    x0 = (float)info->src.box.x - x_range * (float)info->dst.box.x;
    y0 = (float)info->src.box.y - y_range * (float)info->dst.box.y;
 
-   x1 = x0 + 16384.0f * x_range;
-   y1 = y0 + 16384.0f * y_range;
+   x_output = 65536 << nv50_miptree(dst)->ms_x;
+   y_output = 65536 << nv50_miptree(dst)->ms_y;
+
+   x1 = x0 + x_output * x_range;
+   y1 = y0 + y_output * y_range;
 
    x0 *= (float)(1 << nv50_miptree(src)->ms_x);
    x1 *= (float)(1 << nv50_miptree(src)->ms_x);
@@ -953,7 +957,7 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
       PUSH_DATAf(push, z);
       BEGIN_NVC0(push, NVC0_3D(VTX_ATTR_DEFINE), 3);
       PUSH_DATA (push, 0x74200);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_x);
+      PUSH_DATAf(push, x_output);
       PUSH_DATAf(push, 0.0f);
       BEGIN_NVC0(push, NVC0_3D(VTX_ATTR_DEFINE), 4);
       PUSH_DATA (push, 0x74301);
@@ -963,7 +967,7 @@ nvc0_blit_3d(struct nvc0_context *nvc0, const struct pipe_blit_info *info)
       BEGIN_NVC0(push, NVC0_3D(VTX_ATTR_DEFINE), 3);
       PUSH_DATA (push, 0x74200);
       PUSH_DATAf(push, 0.0f);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_y);
+      PUSH_DATAf(push, y_output);
 
       IMMED_NVC0(push, NVC0_3D(VERTEX_END_GL), 0);
    }
-- 
1.8.3.2
