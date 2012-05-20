From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/14] drm/nv50_bar: Remove duplicate assignments
Date: Mon, 21 May 2012 00:14:57 +0100
Message-ID: <1337555703-18925-9-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Both variables are already set in nouveau_subdev_create()

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_bar.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_bar.c b/drivers/gpu/drm/nouveau/nv50_bar.c
index 0dc1895..6499a30 100644
--- a/drivers/gpu/drm/nouveau/nv50_bar.c
+++ b/drivers/gpu/drm/nouveau/nv50_bar.c
@@ -92,8 +92,6 @@ nv50_bar_create(struct nouveau_device *ndev, int subdev)
 	if (ret)
 		return ret;
 
-	priv->base.base.name = "BAR";
-	priv->base.base.device = ndev;
 	priv->base.base.destroy = nv50_bar_destroy;
 	priv->base.base.init = nv50_bar_init;
 	priv->base.map = nv50_bar_map;
-- 
1.7.10.2
