From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nv50,
	nvc0: add missing depth/stencil formats to tile flag selection
Date: Fri, 19 Sep 2014 00:19:43 -0400
Message-ID: <1411100384-22547-2-git-send-email-imirkin@alum.mit.edu>
References: <1411100384-22547-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1411100384-22547-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Heidelberger <david.heidelberger-W22tF5X+A20@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Reported-by: David Heidelberger <david.heidelberger-W22tF5X+A20@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_miptree.c | 4 ++++
 src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
index 14e5a0d..1aacaec 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_miptree.c
@@ -78,9 +78,12 @@ nv50_mt_choose_storage_type(struct nv50_miptree *mt, boolean compressed)
    case PIPE_FORMAT_Z16_UNORM:
       tile_flags = 0x6c + ms;
       break;
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_S8X24_UINT:
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
       tile_flags = 0x18 + ms;
       break;
+   case PIPE_FORMAT_X24S8_UINT:
    case PIPE_FORMAT_Z24X8_UNORM:
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
       tile_flags = 0x128 + ms;
@@ -88,6 +91,7 @@ nv50_mt_choose_storage_type(struct nv50_miptree *mt, boolean compressed)
    case PIPE_FORMAT_Z32_FLOAT:
       tile_flags = 0x40 + ms;
       break;
+   case PIPE_FORMAT_X32_S8X24_UINT:
    case PIPE_FORMAT_Z32_FLOAT_S8X24_UINT:
       tile_flags = 0x60 + ms;
       break;
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
index 3baa752..1beda7d 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_miptree.c
@@ -53,12 +53,15 @@ nvc0_mt_choose_storage_type(struct nv50_miptree *mt, boolean compressed)
       else
          tile_flags = 0x01;
       break;
+   case PIPE_FORMAT_X8Z24_UNORM:
+   case PIPE_FORMAT_S8X24_UINT:
    case PIPE_FORMAT_S8_UINT_Z24_UNORM:
       if (compressed)
          tile_flags = 0x51 + ms;
       else
          tile_flags = 0x46;
       break;
+   case PIPE_FORMAT_X24S8_UINT:
    case PIPE_FORMAT_Z24X8_UNORM:
    case PIPE_FORMAT_Z24_UNORM_S8_UINT:
       if (compressed)
@@ -72,6 +75,7 @@ nvc0_mt_choose_storage_type(struct nv50_miptree *mt, boolean compressed)
       else
          tile_flags = 0x7b;
       break;
+   case PIPE_FORMAT_X32_S8X24_UINT:
    case PIPE_FORMAT_Z32_FLOAT_S8X24_UINT:
       if (compressed)
          tile_flags = 0xce + ms;
-- 
1.8.5.5
