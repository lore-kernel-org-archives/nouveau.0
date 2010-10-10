From: "Emil Velikov" <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>
Subject: [PATCH] Fixes while parsing perf tables on GF5
Date: Sun, 10 Oct 2010 19:26:59 +0100
Message-ID: <op.vkdhi8rttkuz1w@emo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
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
To: martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org, nouveau mailing list <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


 From 3dcc41d053357a93e523f0bcca593ed061fdac57 Mon Sep 17 00:00:00 2001
From: Emil Velikov <eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org>
Date: Sun, 10 Oct 2010 19:21:30 +0100
Subject: [PATCH] Fixes while parsing perf tables on GF5

Perf tables v1.2 & 1.3 does not store voltage
Comment that the fanspeed does not apear to be valid for v1.5

Signed-off-by: Emil Velikov <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>
---
  drivers/gpu/drm/nouveau/nouveau_perf.c |    4 +++-
  1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c  
b/drivers/gpu/drm/nouveau/nouveau_perf.c
index ac62a1b..d3725c1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -133,8 +133,10 @@ nouveau_perf_init(struct drm_device *dev)
  		case 0x12:
  		case 0x13:
  		case 0x15:
+			/* XXX: Cant we really trust fanspeed on 0x15 */
  			perflvl->fanspeed = entry[55];
-			perflvl->voltage = entry[56];
+			/* Table v 1.2 and 1.3 does not have big enough recordlen to store the  
voltage */
+			perflvl->voltage = (recordlen > 56) ? entry[56] : 0;
  			perflvl->core = ROM32(entry[1]) * 10;
  			perflvl->memory = ROM32(entry[5]) * 20;
  			break;
-- 
1.7.2.3
