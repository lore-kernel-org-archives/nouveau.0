From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 1/2] drm/i2c/ch7006: Make some parameter
	descriptions more useful.
Date: Tue, 25 Aug 2009 15:41:26 +0200
Message-ID: <1251207687-22835-1-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/i2c/ch7006_drv.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 47421ba..76570d6 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -515,11 +515,16 @@ MODULE_PARM_DESC(debug, "Enable debug output.");
 
 char *ch7006_tv_norm = NULL;
 module_param_named(tv_norm, ch7006_tv_norm, charp, 0600);
-MODULE_PARM_DESC(tv_norm, "Default TV norm.");
+MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
+		 "\t\tSupported: PAL, PAL-M, PAL-N, PAL-Nc, PAL-60, NTSC-M, NTSC-J.\n"
+		 "\t\tDefault: PAL");
 
 int ch7006_scale = 0;
 module_param_named(scale, ch7006_scale, int, 0600);
-MODULE_PARM_DESC(scale, "Default scale.");
+MODULE_PARM_DESC(scale, "Default scale.\n"
+		 "\t\tSupported: 0 -> Select video modes with a higher blanking ratio.\n"
+		 "\t\t\t1 -> Select default video modes.\n"
+		 "\t\t\t2 -> Select video modes with a lower blanking ratio.");
 
 MODULE_AUTHOR("Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>");
 MODULE_DESCRIPTION("Chrontel ch7006 TV encoder driver");
-- 
1.6.3.3
