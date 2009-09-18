From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2] vgacon: Prevent vgacon_deinit from touching the
	hardware for inactive consoles.
Date: Fri, 18 Sep 2009 16:30:01 +0200
Message-ID: <1253284201-24866-1-git-send-email-currojerez@riseup.net>
References: <1253046897-9981-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1253046897-9981-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Antonino A. Daplas" <adaplas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

fbcon makes the (reasonable) assumption that it only needs to program
the hardware once, when fbcon_init() is called for the foreground
console. This doesn't always play well with vgacon because
vgacon_deinit() is only doing its job when the last console it owns is
closed (when switching from vgacon to fbcon, that's usually *after*
fbcon_init() has set the new mode). Depending on the hardware this can
cause the wrong framebuffer location to be scanned out
(e.g. reproduced on nv05 with the nouveau framebuffer driver).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
Some minor stylistic changes WRT v1.

 drivers/video/console/vgacon.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 59d7d5e..6bd75a9 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -590,12 +590,14 @@ static void vgacon_init(struct vc_data *c, int init)
 
 static void vgacon_deinit(struct vc_data *c)
 {
-	/* When closing the last console, reset video origin */
-	if (!--vgacon_uni_pagedir[1]) {
+	/* When closing the active console, reset video origin */
+	if (CON_IS_VISIBLE(c)) {
 		c->vc_visible_origin = vga_vram_base;
 		vga_set_mem_top(c);
-		con_free_unimap(c);
 	}
+
+	if (!--vgacon_uni_pagedir[1])
+		con_free_unimap(c);
 	c->vc_uni_pagedir_loc = &c->vc_uni_pagedir;
 	con_set_default_unimap(c);
 }
-- 
1.6.3.3
