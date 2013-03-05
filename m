From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50/disp: ignore encoder initialization
	failures
Date: Tue,  5 Mar 2013 19:57:13 +0100
Message-ID: <1362509833-28968-6-git-send-email-marcin.slusarz@gmail.com>
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

Nouveau does not support all encoder types, so failure to handle one should
not stop module initialization. And because of other bug, it lead to oops
in nv50_crtc_destroy (nv50_display_destroy sets nouveau_display->priv to NULL,
which is used by nv50_crtc_destroy).

Fixes regression from eb6313add6dddf07ea3e50c4caa33a9c3b2379f1
("drm/nv50: initial kms support for off-chip TMDS/DP encoders").

Reported-by: Richard Yao <ryao-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Tested-by: Richard Yao <ryao-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 87a5a56..2db5799 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -2276,6 +2276,7 @@ nv50_display_create(struct drm_device *dev)
 			NV_WARN(drm, "failed to create encoder %d/%d/%d: %d\n",
 				     dcbe->location, dcbe->type,
 				     ffs(dcbe->or) - 1, ret);
+			ret = 0;
 		}
 	}
 
-- 
1.8.1.4
