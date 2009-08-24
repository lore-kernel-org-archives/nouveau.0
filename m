From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] drm/i2c/ch7006: Make some parameter
	descriptions more useful.
Date: Mon, 24 Aug 2009 16:02:06 +0200
Message-ID: <1251122527-17900-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
 drivers/gpu/drm/i2c/ch7006_drv.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 47421ba..ff0369c 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -515,11 +515,11 @@ MODULE_PARM_DESC(debug, "Enable debug output.");
 
 char *ch7006_tv_norm = NULL;
 module_param_named(tv_norm, ch7006_tv_norm, charp, 0600);
-MODULE_PARM_DESC(tv_norm, "Default TV norm.");
+MODULE_PARM_DESC(tv_norm, "Default TV norm (one of: PAL, PAL-M, PAL-N, PAL-Nc, PAL-60, NTSC-M, NTSC-J).");
 
 int ch7006_scale = 0;
 module_param_named(scale, ch7006_scale, int, 0600);
-MODULE_PARM_DESC(scale, "Default scale.");
+MODULE_PARM_DESC(scale, "Default scale (integer between 0 and 2).");
 
 MODULE_AUTHOR("Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>");
 MODULE_DESCRIPTION("Chrontel ch7006 TV encoder driver");
-- 
1.6.3.3
