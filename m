From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix ramht wraparound
Date: Thu, 20 Dec 2012 23:37:12 +0100
Message-ID: <1356043034-25739-5-git-send-email-marcin.slusarz@gmail.com>
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
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

When hash collision occurs and it's near ramht object boundary, we could
read and possibly overwrite some memory after ramht object.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpu/drm/nouveau/core/core/ramht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/ramht.c b/drivers/gpu/drm/nouveau/core/core/ramht.c
index 86a6404..6da314c 100644
--- a/drivers/gpu/drm/nouveau/core/core/ramht.c
+++ b/drivers/gpu/drm/nouveau/core/core/ramht.c
@@ -59,7 +59,7 @@ nouveau_ramht_insert(struct nouveau_ramht *ramht, int chid,
 		}
 
 		co += 8;
-		if (co >= nv_gpuobj(ramht)->size)
+		if (co + 8 > nv_gpuobj(ramht)->size)
 			co = 0;
 	} while (co != ho);
 
-- 
1.8.0.2
