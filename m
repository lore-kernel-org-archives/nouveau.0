From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] nouveau: fixup scanout enable in nvc0_pm
Date: Mon, 30 Jul 2012 12:03:30 +0200
Message-ID: <50165BF2.2080508@canonical.com>
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

Fixes screen being black after changing performance level.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [3.5+]
---
diff --git a/drivers/gpu/drm/nouveau/nvc0_pm.c b/drivers/gpu/drm/nouveau/nvc0_pm.c
index 7c95c44..4e712b1 100644
--- a/drivers/gpu/drm/nouveau/nvc0_pm.c
+++ b/drivers/gpu/drm/nouveau/nvc0_pm.c
@@ -557,7 +557,7 @@ prog_mem(struct drm_device *dev, struct nvc0_pm_state *info)
 	nouveau_mem_exec(&exec, info->perflvl);
 
 	if (dev_priv->chipset < 0xd0)
-		nv_wr32(dev, 0x611200, 0x00003300);
+		nv_wr32(dev, 0x611200, 0x00003330);
 	else
 		nv_wr32(dev, 0x62c000, 0x03030300);
 }
