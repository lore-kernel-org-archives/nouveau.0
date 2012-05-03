From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau/dri2: don't try to page flip pixmaps
Date: Thu, 3 May 2012 14:50:16 +0200
Message-ID: <20120503125016.GA8466@joi.lan>
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
Cc: Michel =?utf-8?Q?D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Port of commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-ati.

Fixes https://bugs.freedesktop.org/show_bug.cgi?id=49351

(Additionally, don't try to pageflip if user disabled it in xorg.conf.
Currently this change is a no-op, because can_exchange returns true only when
page flipping is enabled, but commit 169512fbe91f0671a90dfee5e280357f0a4ef701 -
which changed can_exchange behavior - is due to be reverted)
---
 src/nouveau_dri2.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 588735f..3d8d22f 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -328,7 +328,8 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		type = DRI2_EXCHANGE_COMPLETE;
 		DamageRegionAppend(draw, &reg);
 
-		if (DRI2CanFlip(draw)) {
+		if (DRI2CanFlip(draw) && pNv->has_pageflip &&
+				draw->type == DRAWABLE_WINDOW) {
 			type = DRI2_FLIP_COMPLETE;
 			ret = drmmode_page_flip(draw, src_pix,
 						violate_oml(draw) ? NULL : s,
-- 
1.7.8.5
