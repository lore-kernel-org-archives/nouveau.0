From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] nv50,
	nvc0: fix 3d blit logic for odd depth/stencil formats
Date: Fri, 19 Sep 2014 00:19:44 -0400
Message-ID: <1411100384-22547-3-git-send-email-imirkin@alum.mit.edu>
References: <1411100384-22547-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1411100384-22547-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Cc: David Heidelberger <david.heidelberger@ixit.cz>
List-Id: nouveau.vger.kernel.org

Reported-by: David Heidelberger <david.heidelberger@ixit.cz>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/nv50/nv50_blit.h    | 21 ++++++++++++++-------
 src/gallium/drivers/nouveau/nv50/nv50_surface.c |  4 ++++
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_blit.h b/src/gallium/drivers/nouveau/nv50/nv50_blit.h
index bdd6a63..756c4c1 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_blit.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_blit.h
@@ -111,10 +111,14 @@ nv50_blit_zeta_to_colour_format(enum pipe_format format)
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
    case PIPE_FORMAT_Z24X8_UNORM:
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_X24S8_UINT:
+   case PIPE_FORMAT_S8X24_UINT:
       return PIPE_FORMAT_R8G8B8A8_UNORM;
    case PIPE_FORMAT_Z32_FLOAT:
       return PIPE_FORMAT_R32_FLOAT;
    case PIPE_FORMAT_Z32_FLOAT_S8X24_UINT:
+   case PIPE_FORMAT_X32_S8X24_UINT:
       return PIPE_FORMAT_R32G32_FLOAT;
    default:
       assert(0);
@@ -131,19 +135,21 @@ nv50_blit_derive_color_mask(const struct pipe_blit_info *info)
    uint16_t color_mask = 0;
 
    switch (info->dst.format) {
+   case PIPE_FORMAT_Z24X8_UNORM:
+   case PIPE_FORMAT_X24S8_UINT:
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
       if (mask & PIPE_MASK_S)
          color_mask |= 0x1000;
-      /* fall through */
-   case PIPE_FORMAT_Z24X8_UNORM:
       if (mask & PIPE_MASK_Z)
          color_mask |= 0x0111;
       break;
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_S8X24_UINT:
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
-      if (mask & PIPE_MASK_Z)
-         color_mask |= 0x1110;
       if (mask & PIPE_MASK_S)
          color_mask |= 0x0001;
+      if (mask & PIPE_MASK_Z)
+         color_mask |= 0x1110;
       break;
    default:
       if (mask & (PIPE_MASK_R | PIPE_MASK_Z)) color_mask |= 0x0001;
@@ -162,17 +168,18 @@ nv50_blit_eng2d_get_mask(const struct pipe_blit_info *info)
    uint32_t mask = 0;
 
    switch (info->dst.format) {
+   case PIPE_FORMAT_Z24X8_UNORM:
+   case PIPE_FORMAT_X24S8_UINT:
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
       if (info->mask & PIPE_MASK_Z) mask |= 0x00ffffff;
       if (info->mask & PIPE_MASK_S) mask |= 0xff000000;
       break;
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_S8X24_UINT:
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
       if (info->mask & PIPE_MASK_Z) mask |= 0xffffff00;
       if (info->mask & PIPE_MASK_S) mask |= 0x000000ff;
       break;
-   case PIPE_FORMAT_X8Z24_UNORM:
-      if (info->mask & PIPE_MASK_Z) mask = 0x00ffffff;
-      break;
    default:
       mask = 0xffffffff;
       break;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index 8ec4a5f..e1dd6e0 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -827,6 +827,7 @@ nv50_blit_select_mode(const struct pipe_blit_info *info)
    switch (info->dst.resource->format) {
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
    case PIPE_FORMAT_Z24X8_UNORM:
+   case PIPE_FORMAT_X24S8_UINT:
       switch (mask & PIPE_MASK_ZS) {
       case PIPE_MASK_ZS: return NV50_BLIT_MODE_Z24S8;
       case PIPE_MASK_Z:  return NV50_BLIT_MODE_Z24X8;
@@ -834,6 +835,8 @@ nv50_blit_select_mode(const struct pipe_blit_info *info)
          return NV50_BLIT_MODE_X24S8;
       }
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_S8X24_UINT:
       switch (mask & PIPE_MASK_ZS) {
       case PIPE_MASK_ZS: return NV50_BLIT_MODE_S8Z24;
       case PIPE_MASK_Z:  return NV50_BLIT_MODE_X8Z24;
@@ -842,6 +845,7 @@ nv50_blit_select_mode(const struct pipe_blit_info *info)
       }
    case PIPE_FORMAT_Z32_FLOAT:
    case PIPE_FORMAT_Z32_FLOAT_S8X24_UINT:
+   case PIPE_FORMAT_X32_S8X24_UINT:
       switch (mask & PIPE_MASK_ZS) {
       case PIPE_MASK_ZS: return NV50_BLIT_MODE_ZS;
       case PIPE_MASK_Z:  return NV50_BLIT_MODE_PASS;
-- 
1.8.5.5
