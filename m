From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] Fix NVLoadPalette for 15/16 bit depth.
Date: Sun, 11 Oct 2009 20:52:56 +0200
Message-ID: <1255287177-31527-1-git-send-email-currojerez@riseup.net>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv_driver.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index a31ce5d..4255c19 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1419,6 +1419,8 @@ NVLoadPalette(ScrnInfoPtr pScrn, int numColors, int *indices,
 					lut_b[index * 8 + j] = colors[index].blue << 8;
 				}
 			}
+			break;
+
 		case 16:
 			for (i = 0; i < numColors; i++) {
 				index = indices[i];
@@ -1434,6 +1436,8 @@ NVLoadPalette(ScrnInfoPtr pScrn, int numColors, int *indices,
 					lut_g[index * 4 + j] = colors[index].green << 8;
 				}
 			}
+			break;
+
 		default:
 			for (i = 0; i < numColors; i++) {
 				index = indices[i];
-- 
1.6.4.4
