From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau/therm: enable fan management by
	default
Date: Mon,  9 Sep 2013 00:43:28 +0200
Message-ID: <1378680208-11431-2-git-send-email-martin.peres@free.fr>
References: <1378680208-11431-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378680208-11431-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

This should enable automatic fan management for all cards by default, at
boot time. However, this commit actually affects only nv40-c0 as nvc0+
cards already have vbios's PDAEMON fw already taking care of fan management.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
index f1de7a9..aaf8285 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/base.c
@@ -335,7 +335,7 @@ nouveau_therm_preinit(struct nouveau_therm *therm)
 	nouveau_therm_ic_ctor(therm);
 	nouveau_therm_fan_ctor(therm);
 
-	nouveau_therm_fan_mode(therm, NOUVEAU_THERM_CTRL_NONE);
+	nouveau_therm_fan_mode(therm, NOUVEAU_THERM_CTRL_AUTO);
 	nouveau_therm_sensor_preinit(therm);
 	return 0;
 }
-- 
1.8.4
