From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 2/2] drm/nouveau: Make the tv_norm parameter
	description more useful.
Date: Tue, 25 Aug 2009 15:41:27 +0200
Message-ID: <1251207687-22835-2-git-send-email-currojerez@riseup.net>
References: <4A9310ED.9020401@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A9310ED.9020401-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index a39a70b..a2375c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -57,7 +57,11 @@ MODULE_PARM_DESC(uscript_tmds, "TMDS output script table ID (>=GeForce 8)");
 int nouveau_uscript_tmds = -1;
 module_param_named(uscript_tmds, nouveau_uscript_tmds, int, 0400);
 
-MODULE_PARM_DESC(tv_norm, "Default TV norm");
+MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
+		 "\t\tSupported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,\n"
+		 "\t\t\thd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.\n"
+		 "\t\tDefault: PAL\n"
+		 "\t\t*NOTE* Ignored for cards with external TV encoders.");
 char *nouveau_tv_norm = NULL;
 module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
 
-- 
1.6.3.3
