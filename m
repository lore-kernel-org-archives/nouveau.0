From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] gallium/xorg st/nv50/i915: add PIPE_BIND_CURSOR
Date: Sun, 1 May 2011 23:59:40 +0200
Message-ID: <20110501215940.GD6742@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

We need to distinguish surfaces for mouse cursors from scanouts, because nv50
hardware display engine ignores tiling flags.
i915 seems to have similar needs, so fix it too.
---
 src/gallium/drivers/i915/i915_resource_texture.c |    6 +-----
 src/gallium/drivers/nv50/nv50_miptree.c          |   11 +++++++++--
 src/gallium/include/pipe/p_defines.h             |    1 +
 src/gallium/state_trackers/xorg/xorg_crtc.c      |    1 +
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/i915/i915_resource_texture.c b/src/gallium/drivers/i915/i915_resource_texture.c
index 7816925..7ad191b 100644
--- a/src/gallium/drivers/i915/i915_resource_texture.c
+++ b/src/gallium/drivers/i915/i915_resource_texture.c
@@ -826,11 +826,7 @@ i915_texture_create(struct pipe_screen *screen,
    }
 
    /* for scanouts and cursors, cursors arn't scanouts */
-
-   /* XXX: use a custom flag for cursors, don't rely on magically
-    * guessing that this is Xorg asking for a cursor
-    */
-   if ((template->bind & PIPE_BIND_SCANOUT) && template->width0 != 64)
+   if ((template->bind & PIPE_BIND_SCANOUT) && !(template->bind & PIPE_BIND_CURSOR))
       buf_usage = I915_NEW_SCANOUT;
    else
       buf_usage = I915_NEW_TEXTURE;
diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 9eeca05..d632e21 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -158,7 +158,9 @@ nv50_miptree_create(struct pipe_screen *pscreen,
       tile_flags = 0x6000;
       break;
    default:
-      if ((pt->bind & PIPE_BIND_SCANOUT) &&
+      if (pt->bind & PIPE_BIND_CURSOR)
+         tile_flags = 0; /* PDISPLAY does not support tiling */
+      else if ((pt->bind & PIPE_BIND_SCANOUT) &&
           util_format_get_blocksizebits(pt->format) == 32)
          tile_flags = 0x7a00;
       else
@@ -176,7 +178,12 @@ nv50_miptree_create(struct pipe_screen *pscreen,
       unsigned blocksize = util_format_get_blocksize(pt->format);
 
       lvl->offset = mt->total_size;
-      lvl->tile_mode = get_tile_dims(nbx, nby, d);
+
+      if (tile_flags == 0)
+         lvl->tile_mode = 0;
+      else
+         lvl->tile_mode = get_tile_dims(nbx, nby, d);
+
       lvl->pitch = align(nbx * blocksize, NV50_TILE_PITCH(lvl->tile_mode));
 
       mt->total_size += lvl->pitch *
diff --git a/src/gallium/include/pipe/p_defines.h b/src/gallium/include/pipe/p_defines.h
index 431a7fb..ae82baa 100644
--- a/src/gallium/include/pipe/p_defines.h
+++ b/src/gallium/include/pipe/p_defines.h
@@ -301,6 +301,7 @@ enum pipe_transfer_usage {
 #define PIPE_BIND_TRANSFER_READ        (1 << 10) /* get_transfer */
 #define PIPE_BIND_STREAM_OUTPUT        (1 << 11) /* set_stream_output_buffers */
 #define PIPE_BIND_CUSTOM               (1 << 16) /* state-tracker/winsys usages */
+#define PIPE_BIND_CURSOR               (1 << 17) /* mouse cursor */
 
 /* The first two flags above were previously part of the amorphous
  * TEXTURE_USAGE, most of which are now descriptions of the ways a
diff --git a/src/gallium/state_trackers/xorg/xorg_crtc.c b/src/gallium/state_trackers/xorg/xorg_crtc.c
index d751ac1..8eaf414 100644
--- a/src/gallium/state_trackers/xorg/xorg_crtc.c
+++ b/src/gallium/state_trackers/xorg/xorg_crtc.c
@@ -218,6 +218,7 @@ crtc_load_cursor_argb_ga3d(xf86CrtcPtr crtc, CARD32 * image)
 	memset(&templat, 0, sizeof(templat));
 	templat.bind |= PIPE_BIND_RENDER_TARGET;
 	templat.bind |= PIPE_BIND_SCANOUT;
+	templat.bind |= PIPE_BIND_CURSOR;
 	templat.target = PIPE_TEXTURE_2D;
 	templat.last_level = 0;
 	templat.depth0 = 1;
-- 
1.7.4.1
