From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drmmode_display: Resolve missing brackets
Date: Tue, 19 Jul 2011 00:35:38 +0100
Message-ID: <1311032138-10867-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Correct some missing/misplaced brackets in drmmode_pre_init()
The issue was exposed when trying a 4 monitor desktop using two
cards/gpus

Resolves https://bugs.freedesktop.org/show_bug.cgi?id=39099

Reported-By: Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org>
Tested-By: Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/drmmode_display.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index e5e4673..3afef66 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1185,8 +1185,8 @@ Bool drmmode_pre_init(ScrnInfoPtr pScrn, int fd, int cpp)
 	xf86CrtcSetSizeRange(pScrn, 320, 200, drmmode->mode_res->max_width,
 			     drmmode->mode_res->max_height);
 	for (i = 0; i < drmmode->mode_res->count_crtcs; i++) {
-		if (!xf86IsEntityShared(pScrn->entityList[0] ||
-		     pScrn->confScreen->device->screen == i))
+		if (!xf86IsEntityShared(pScrn->entityList[0]) ||
+		     (pScrn->confScreen->device->screen == i))
 			drmmode_crtc_init(pScrn, drmmode, i);
 	}
 
-- 
1.7.6
