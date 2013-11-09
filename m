From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau/fifo: Hook up pause methods for
	NV50 and NV84
Date: Sat,  9 Nov 2013 19:51:59 +0100
Message-ID: <1384023120-11958-2-git-send-email-rspliet@eclipso.eu>
References: <1384023120-11958-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384023120-11958-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c | 3 +++
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
index 5f55578..e6352bd 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
@@ -33,6 +33,7 @@
 #include <engine/dmaobj.h>
 #include <engine/fifo.h>
 
+#include "nv04.h"
 #include "nv50.h"
 
 /*******************************************************************************
@@ -460,6 +461,8 @@ nv50_fifo_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->intr = nv04_fifo_intr;
 	nv_engine(priv)->cclass = &nv50_fifo_cclass;
 	nv_engine(priv)->sclass = nv50_fifo_sclass;
+	priv->base.pause = nv04_fifo_pause;
+	priv->base.start = nv04_fifo_start;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
index 0908dc8..fe0f41e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
@@ -35,6 +35,7 @@
 #include <engine/dmaobj.h>
 #include <engine/fifo.h>
 
+#include "nv04.h"
 #include "nv50.h"
 
 /*******************************************************************************
@@ -432,6 +433,8 @@ nv84_fifo_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->intr = nv04_fifo_intr;
 	nv_engine(priv)->cclass = &nv84_fifo_cclass;
 	nv_engine(priv)->sclass = nv84_fifo_sclass;
+	priv->base.pause = nv04_fifo_pause;
+	priv->base.start = nv04_fifo_start;
 	return 0;
 }
 
-- 
1.8.3.1
