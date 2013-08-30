From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] drm/nv84/therm: ack any pending IRQ at init
Date: Sat, 31 Aug 2013 01:58:51 +0200
Message-ID: <1377907131-15099-2-git-send-email-martin.peres@free.fr>
References: <1377907131-15099-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377907131-15099-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

This is safe because ptherm hasn't been configured yet and will be a
little further down the initialization path. Ptherm should be safe
regarding to runtime reconfiguration.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
index 42ba633..8615d62 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
@@ -209,13 +209,30 @@ nv84_therm_ctor(struct nouveau_object *parent,
 	return nouveau_therm_preinit(&priv->base.base);
 }
 
+static int
+nv84_therm_init(struct nouveau_object *object)
+{
+	struct nv84_therm_priv *priv = (void *)object;
+	int ret;
+
+	ret = nouveau_therm_init(&priv->base.base);
+	if (ret)
+		return ret;
+
+	/* ACK ptherm IRQs */
+	nv_wr32(object, 0x20100, 0xffffffff);
+	nv_wr32(object, 0x1100, 0x10000); /* PBUS */
+
+	return 0;
+}
+
 struct nouveau_oclass
 nv84_therm_oclass = {
 	.handle = NV_SUBDEV(THERM, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv84_therm_ctor,
 		.dtor = _nouveau_therm_dtor,
-		.init = _nouveau_therm_init,
+		.init = nv84_therm_init,
 		.fini = _nouveau_therm_fini,
 	},
 };
-- 
1.8.4
