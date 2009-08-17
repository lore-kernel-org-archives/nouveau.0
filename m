From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] kms: Some TV-out fixes.
Date: Mon, 17 Aug 2009 16:54:48 +0200
Message-ID: <1250520888-17611-1-git-send-email-currojerez@riseup.net>
References: <1250036308-28736-4-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036308-28736-4-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

---
 src/drmmode_display.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 9b61da8..f2fe0e8 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -571,8 +571,12 @@ drmmode_output_detect(xf86OutputPtr output)
 }
 
 static Bool
-drmmode_output_mode_valid(xf86OutputPtr output, DisplayModePtr pModes)
+drmmode_output_mode_valid(xf86OutputPtr output, DisplayModePtr mode)
 {
+	if (mode->type & M_T_DEFAULT)
+		/* Default modes are harmful here. */
+		return MODE_BAD;
+
 	return MODE_OK;
 }
 
@@ -922,13 +926,14 @@ const char *output_names[] = { "None",
 			       "DVI-D",
 			       "DVI-A",
 			       "Composite",
-			       "TV",
+			       "SVIDEO",
 			       "LVDS",
 			       "CTV",
 			       "DIN",
 			       "DP",
 			       "HDMI",
 			       "HDMI",
+			       "TV",
 };
 
 
-- 
1.6.3.3
