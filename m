From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] change temp sensor defaults to neutral ones
Date: Thu, 06 Jan 2011 20:54:34 +0100
Message-ID: <1294343674.2120.17.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-YrGJNfVzD0pLSe0TS64e"
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
To: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-YrGJNfVzD0pLSe0TS64e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The attached patch deletes some defaults which are not really defaults
and changes the standard values to calculation neutral ones.

I discussed the matter with mupuf on irc and we agreed on this solution.

--lynxeye

--=-YrGJNfVzD0pLSe0TS64e
Content-Disposition: attachment; filename*0=0001-drm-nouveau-change-temp-sensor-defaults-to-neutral-o.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-drm-nouveau-change-temp-sensor-defaults-to-neutral-o.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From c64c67a8abcf03c58442999399874182bc6540a4 Mon Sep 17 00:00:00 2001
From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date: Wed, 5 Jan 2011 22:41:24 +0100
Subject: [PATCH 1/2] drm/nouveau: change temp sensor defaults to neutral ones

The hardcoded slope and offset defaults in nouveau are not really
defaults, as they are retrieved from some random vbioses. So they
are likely wrong for anything except the cards with this
particular vbios.

I checked about 30 vbioses across card generations and couldn't
find one without either slope and offset or offset_constant set,
so i think it should be ok to remove this crude values and just
init slope and offset with some neutral defaults.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_temp.c |   50 +-------------------------------
 1 files changed, 1 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_temp.c b/drivers/gpu/drm/nouveau/nouveau_temp.c
index 7ecc4ad..3870f40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_temp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_temp.c
@@ -43,7 +43,7 @@ nouveau_temp_vbios_parse(struct drm_device *dev, u8 *temp)
 
 	/* Set the default sensor's contants */
 	sensor->offset_constant = 0;
-	sensor->offset_mult = 1;
+	sensor->offset_mult = 0;
 	sensor->offset_div = 1;
 	sensor->slope_mult = 1;
 	sensor->slope_div = 1;
@@ -53,54 +53,6 @@ nouveau_temp_vbios_parse(struct drm_device *dev, u8 *temp)
 	temps->down_clock = 100;
 	temps->fan_boost = 90;
 
-	/* Set the known default values to setup the temperature sensor */
-	if (dev_priv->card_type >= NV_40) {
-		switch (dev_priv->chipset) {
-		case 0x43:
-			sensor->offset_mult = 32060;
-			sensor->offset_div = 1000;
-			sensor->slope_mult = 792;
-			sensor->slope_div = 1000;
-			break;
-
-		case 0x44:
-		case 0x47:
-		case 0x4a:
-			sensor->offset_mult = 27839;
-			sensor->offset_div = 1000;
-			sensor->slope_mult = 780;
-			sensor->slope_div = 1000;
-			break;
-
-		case 0x46:
-			sensor->offset_mult = -24775;
-			sensor->offset_div = 100;
-			sensor->slope_mult = 467;
-			sensor->slope_div = 10000;
-			break;
-
-		case 0x49:
-			sensor->offset_mult = -25051;
-			sensor->offset_div = 100;
-			sensor->slope_mult = 458;
-			sensor->slope_div = 10000;
-			break;
-
-		case 0x4b:
-			sensor->offset_mult = -24088;
-			sensor->offset_div = 100;
-			sensor->slope_mult = 442;
-			sensor->slope_div = 10000;
-			break;
-
-		case 0x50:
-			sensor->offset_mult = -22749;
-			sensor->offset_div = 100;
-			sensor->slope_mult = 431;
-			sensor->slope_div = 10000;
-			break;
-		}
-	}
 
 	headerlen = temp[1];
 	recordlen = temp[2];
-- 
1.7.3.4


--=-YrGJNfVzD0pLSe0TS64e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-YrGJNfVzD0pLSe0TS64e--
