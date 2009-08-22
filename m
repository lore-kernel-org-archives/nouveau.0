From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix up the pixel clocks for some HD
	TV modes.
Date: Sat, 22 Aug 2009 20:00:05 +0200
Message-ID: <1250964005-12958-1-git-send-email-currojerez@riseup.net>
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
 drivers/gpu/drm/nouveau/nv17_tv_modes.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv17_tv_modes.c b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
index 85f55b3..2d1e232 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv_modes.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv_modes.c
@@ -149,7 +149,7 @@ struct nv17_tv_norm_params nv17_tv_norms[NUM_TV_NORMS] = {
 
 	[TV_NORM_HD480P] = { CTV_ENC_MODE, {
 			.ctv_enc_mode = {
-				.mode = { DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 25312,
+				.mode = { DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 27000,
 						   720, 735, 743, 858, 0, 480, 490, 494, 525, 0,
 						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
 				.ctv_regs = { 0x3540000, 0x0, 0x0, 0x314,
@@ -165,7 +165,7 @@ struct nv17_tv_norm_params nv17_tv_norms[NUM_TV_NORMS] = {
 
 	[TV_NORM_HD576P] = { CTV_ENC_MODE, {
 			.ctv_enc_mode = {
-				.mode = { DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 25312,
+				.mode = { DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 27000,
 						   720, 730, 738, 864, 0, 576, 581, 585, 625, 0,
 						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
 				.ctv_regs = { 0x3540000, 0x0, 0x0, 0x314,
@@ -181,7 +181,7 @@ struct nv17_tv_norm_params nv17_tv_norms[NUM_TV_NORMS] = {
 
 	[TV_NORM_HD720P] = { CTV_ENC_MODE, {
 			.ctv_enc_mode = {
-				.mode = { DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 70875,
+				.mode = { DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250,
 						   1280, 1349, 1357, 1650, 0, 720, 725, 730, 750, 0,
 						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
 				.ctv_regs = { 0x1260394, 0x0, 0x0, 0x622,
@@ -197,7 +197,7 @@ struct nv17_tv_norm_params nv17_tv_norms[NUM_TV_NORMS] = {
 
 	[TV_NORM_HD1080I] = { CTV_ENC_MODE, {
 			.ctv_enc_mode = {
-				.mode = { DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 70875,
+				.mode = { DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 74250,
 						   1920, 1961, 2049, 2200, 0, 1080, 1084, 1088, 1125, 0,
 						   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC
 						   | DRM_MODE_FLAG_INTERLACE) },
-- 
1.6.3.3
