From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/5] drm/nv31/mpeg: no need to set compat mode
	differently for nv44 gr
Date: Sat,  7 Sep 2013 21:04:08 -0400
Message-ID: <1378602252-11521-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index c190043..5c54aa1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -34,7 +34,6 @@
 
 #include <engine/fifo.h>
 #include <engine/mpeg.h>
-#include <engine/graph/nv40.h>
 
 struct nv31_mpeg_priv {
 	struct nouveau_mpeg base;
@@ -284,10 +283,7 @@ nv31_mpeg_init(struct nouveau_object *object)
 	/* PMPEG init */
 	nv_wr32(priv, 0x00b32c, 0x00000000);
 	nv_wr32(priv, 0x00b314, 0x00000100);
-	if (nv_device(priv)->chipset >= 0x40 && nv44_graph_class(priv))
-		nv_wr32(priv, 0x00b220, 0x00000044);
-	else
-		nv_wr32(priv, 0x00b220, 0x00000031);
+	nv_wr32(priv, 0x00b220, 0x00000031);
 	nv_wr32(priv, 0x00b300, 0x02001ec1);
 	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000001);
 
-- 
1.8.1.5
