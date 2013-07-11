From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/gpio/nv50: post nv92 cards have 32 interrupt
	lines
Date: Thu, 11 Jul 2013 17:28:03 +0100
Message-ID: <1373560083-29776-1-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Since the original merge of nouveau to upstream kernel, we were assuming that
nv90 (and later) cards have 32 lines.

Based on mmio traces of the binary driver, as well as PBUS error messages
during read/write of the e070/e074 registers, we can conclude that nv92 has
only 16 lines whereas nv94 (and later) cards have 32.

Reported-and-tested-by: David M. Lloyd <david.lloyd-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---

Considering that no-one has reported this issue before, I'm rather curious
if we should CC stable

---
 drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
index bf489dc..c4c1d41 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c
@@ -103,7 +103,7 @@ nv50_gpio_intr(struct nouveau_subdev *subdev)
 	int i;
 
 	intr0 = nv_rd32(priv, 0xe054) & nv_rd32(priv, 0xe050);
-	if (nv_device(priv)->chipset >= 0x90)
+	if (nv_device(priv)->chipset > 0x92)
 		intr1 = nv_rd32(priv, 0xe074) & nv_rd32(priv, 0xe070);
 
 	hi = (intr0 & 0x0000ffff) | (intr1 << 16);
@@ -115,7 +115,7 @@ nv50_gpio_intr(struct nouveau_subdev *subdev)
 	}
 
 	nv_wr32(priv, 0xe054, intr0);
-	if (nv_device(priv)->chipset >= 0x90)
+	if (nv_device(priv)->chipset > 0x92)
 		nv_wr32(priv, 0xe074, intr1);
 }
 
@@ -146,7 +146,7 @@ nv50_gpio_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_gpio_create(parent, engine, oclass,
-				  nv_device(parent)->chipset >= 0x90 ? 32 : 16,
+				  nv_device(parent)->chipset > 0x92 ? 32 : 16,
 				  &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -182,7 +182,7 @@ nv50_gpio_init(struct nouveau_object *object)
 	/* disable, and ack any pending gpio interrupts */
 	nv_wr32(priv, 0xe050, 0x00000000);
 	nv_wr32(priv, 0xe054, 0xffffffff);
-	if (nv_device(priv)->chipset >= 0x90) {
+	if (nv_device(priv)->chipset > 0x92) {
 		nv_wr32(priv, 0xe070, 0x00000000);
 		nv_wr32(priv, 0xe074, 0xffffffff);
 	}
@@ -195,7 +195,7 @@ nv50_gpio_fini(struct nouveau_object *object, bool suspend)
 {
 	struct nv50_gpio_priv *priv = (void *)object;
 	nv_wr32(priv, 0xe050, 0x00000000);
-	if (nv_device(priv)->chipset >= 0x90)
+	if (nv_device(priv)->chipset > 0x92)
 		nv_wr32(priv, 0xe070, 0x00000000);
 	return nouveau_gpio_fini(&priv->base, suspend);
 }
-- 
1.8.3.2
