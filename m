From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: remove duplicate copy of
	nv44_graph_class
Date: Mon, 29 Jul 2013 19:05:16 -0400
Message-ID: <1375139118-17398-1-git-send-email-imirkin@alum.mit.edu>
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
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.h   |  3 +++
 drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c | 10 ++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
index 7da35a4..ad82093 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
@@ -1,6 +1,9 @@
 #ifndef __NV40_GRAPH_H__
 #define __NV40_GRAPH_H__
 
+#include <core/device.h>
+#include <core/gpuobj.h>
+
 /* returns 1 if device is one of the nv4x using the 0x4497 object class,
  * helpful to determine a number of other hardware features
  */
diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
index 716bf41..b10a143 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
@@ -22,15 +22,9 @@
  * Authors: Ben Skeggs
  */
 
-#include "nv04.h"
+#include <engine/graph/nv40.h>
 
-static inline int
-nv44_graph_class(struct nv04_instmem_priv *priv)
-{
-	if ((nv_device(priv)->chipset & 0xf0) == 0x60)
-		return 1;
-	return !(0x0baf & (1 << (nv_device(priv)->chipset & 0x0f)));
-}
+#include "nv04.h"
 
 static int
 nv40_instmem_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
-- 
1.8.1.5
