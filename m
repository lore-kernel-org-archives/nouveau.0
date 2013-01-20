From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: put cursor BO in GART
Date: Mon, 21 Jan 2013 00:15:38 +0100
Message-ID: <20130120231538.GA5327@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Keeping it in VRAM wastes CPU time, because cursor_set ioctl reads
handed BO back to RAM, just to write it to actual cursor BO.

Here (nv92/core i7), this patch decreases overall cpu usage of
drmmode_load_cursor_argb from 4.6ms to ~90us and lets nv50_crtc_cursor_set
disappear from perf traces.
---
I considered accelerating kernel-side copying with GPU, but it turns out that:
- it's slower (120-150us), with frequent bursts (up to 5ms)
- not applicable to <nv50 hw, which needs to transform cursor data

Putting cursor BO in GART does not conflict with accelarating kernel side
copying - times do not change, so it's safe to apply it.
---
 src/drmmode_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 4d2d09d..ee0805d 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -567,7 +567,7 @@ drmmode_crtc_init(ScrnInfoPtr pScrn, drmmode_ptr drmmode, int num)
 						 drmmode->mode_res->crtcs[num]);
 	drmmode_crtc->drmmode = drmmode;
 
-	ret = nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_MAP, 0,
+	ret = nouveau_bo_new(pNv->dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0,
 			     64*64*4, NULL, &drmmode_crtc->cursor);
 	assert(ret == 0);
 
-- 
