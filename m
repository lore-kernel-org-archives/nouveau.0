From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: disable dedicated ubo upload method
Date: Mon, 30 Jun 2014 23:29:50 -0400
Message-ID: <1404185390-24628-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: "10.2 10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The hardware allows multiple simultaneous renders with the same
memory-backed constbufs but with each invocation having different
values. However in order for that to work, the data has to be streamed
in via the right constbuf slot. We weren't doing that for UBOs.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2 10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_context.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index f844592..3f3a888 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -253,7 +253,14 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
    nv50->base.screen    = &screen->base;
    nv50->base.copy_data = nv50_m2mf_copy_linear;
    nv50->base.push_data = nv50_sifc_linear_u8;
+   /* FIXME: Make it possible to use this again. The problem is that there is
+    * some clever logic in the card that allows for multiple renders to happen
+    * when there are only constbuf changes. However that relies on the
+    * constbuf updates happening to the right constbuf slots. Currently
+    * implementation just makes it go through a separate slot which doesn't
+    * properly update the right constbuf data.
    nv50->base.push_cb   = nv50_cb_push;
+    */
 
    nv50->screen = screen;
    pipe->screen = pscreen;
-- 
1.8.5.5
