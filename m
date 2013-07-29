From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] nv50: allow forcing PMPEG use,
	for ease of testing
Date: Mon, 29 Jul 2013 19:39:07 -0400
Message-ID: <1375141147-29058-2-git-send-email-imirkin@alum.mit.edu>
References: <1375141147-29058-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1375141147-29058-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This also allows people who don't want to install the binary blobs
required for VP2 to still get MPEG decoding.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nv50/nv50_context.c | 2 +-
 src/gallium/drivers/nv50/nv50_screen.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index 79a0473..3654a41 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -258,7 +258,7 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
    draw_set_rasterize_stage(nv50->draw, nv50_draw_render_stage(nv50));
 #endif
 
-   if (screen->base.device->chipset < 0x84) {
+   if (screen->base.device->chipset < 0x84 || getenv("XVMC_PMPEG")) {
       /* PMPEG */
       nouveau_context_init_vdec(&nv50->base);
    } else if (screen->base.device->chipset < 0x98 ||
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 2951eb4..959366e 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -647,7 +647,7 @@ nv50_screen_create(struct nouveau_device *dev)
 
    nv50_screen_init_resource_functions(pscreen);
 
-   if (screen->base.device->chipset < 0x84) {
+   if (screen->base.device->chipset < 0x84 || getenv("XVMC_PMPEG")) {
       /* PMPEG */
       nouveau_screen_init_vdec(&screen->base);
    } else if (screen->base.device->chipset < 0x98 ||
-- 
1.8.1.5
