From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nv30: hack to avoid errors on unexpected
	color/zeta combinations
Date: Tue, 17 Jun 2014 23:55:21 -0400
Message-ID: <1403063721-28896-2-git-send-email-imirkin@alum.mit.edu>
References: <1403063721-28896-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403063721-28896-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is just a hack, it should be possible to create a temporary zeta
surface and render to that instead. However that's more complicated and
this avoids the render being entirely broken and errors being reported
by the card.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv30/nv30_state.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_state.c b/src/gallium/drivers/nouveau/nv30/nv30_state.c
index 64be1b7..708ba34 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_state.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_state.c
@@ -23,6 +23,7 @@
  *
  */
 
+#include "util/u_format.h"
 #include "util/u_helpers.h"
 #include "util/u_inlines.h"
 
@@ -360,6 +361,22 @@ nv30_set_framebuffer_state(struct pipe_context *pipe,
 
     nv30->framebuffer = *fb;
     nv30->dirty |= NV30_NEW_FRAMEBUFFER;
+
+   /* Hardware can't handle different swizzled-ness or different blocksizes
+    * for zs and cbufs. If both are supplied and something doesn't match,
+    * blank out the zs for now so that at least *some* rendering can occur.
+    */
+    if (fb->nr_cbufs > 0 && fb->zsbuf) {
+       struct nv30_miptree *color_mt = nv30_miptree(fb->cbufs[0]->texture);
+       struct nv30_miptree *zeta_mt = nv30_miptree(fb->zsbuf->texture);
+
+       if (color_mt->swizzled != zeta_mt->swizzled ||
+           (util_format_get_blocksize(fb->zsbuf->format) > 2) !=
+           (util_format_get_blocksize(fb->cbufs[0]->format) > 2)) {
+          nv30->framebuffer.zsbuf = NULL;
+          debug_printf("Mismatched color and zeta formats, ignoring zeta.\n");
+       }
+    }
 }
 
 static void
-- 
1.8.5.5
