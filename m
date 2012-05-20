From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/14] drm/nouveau/instmem: Do not handle
	instmem_init during fail path in instmem_fini
Date: Mon, 21 May 2012 00:14:55 +0100
Message-ID: <1337555703-18925-7-git-send-email-emil.l.velikov@gmail.com>
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

This approach is already handled by the subdev system. Remove
unneeded variable in the process

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_instmem.c |   10 +++-------
 drivers/gpu/drm/nouveau/nvc0_instmem.c |   10 +++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
index f954e87..79e78d0 100644
--- a/drivers/gpu/drm/nouveau/nv50_instmem.c
+++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
@@ -201,7 +201,7 @@ static int
 nv50_instmem_init(struct nouveau_device *ndev, int subdev)
 {
 	struct nv50_instmem_priv *priv = nv_subdev(ndev, subdev);
-	int ret = 0, i;
+	int i;
 
 	nv_wr32(ndev, 0x001700, priv->mem->offset >> 16);
 
@@ -224,15 +224,11 @@ nv50_instmem_init(struct nouveau_device *ndev, int subdev)
 	for (i = 0; i < 64 * 1024; i += 4) {
 		if (nv_rd32(ndev, 0x705000 + i) != nv_ri32(ndev, i)) {
 			NV_ERROR(ndev, "INSTMEM: readback failed\n");
-			ret = -EIO;
-			goto error;
+			return -EIO;
 		}
 	}
 
-error:
-	if (ret)
-		priv->base.base.fini(ndev, subdev, false);
-	return ret;
+	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvc0_instmem.c b/drivers/gpu/drm/nouveau/nvc0_instmem.c
index 2df078b..59e28f7 100644
--- a/drivers/gpu/drm/nouveau/nvc0_instmem.c
+++ b/drivers/gpu/drm/nouveau/nvc0_instmem.c
@@ -107,7 +107,7 @@ static int
 nvc0_instmem_init(struct nouveau_device *ndev, int subdev)
 {
 	struct nvc0_instmem_priv *priv = nv_subdev(ndev, subdev);
-	int ret = 0, i;
+	int i;
 
 	nv_wr32(ndev, 0x001700, priv->mem->offset >> 16);
 
@@ -128,15 +128,11 @@ nvc0_instmem_init(struct nouveau_device *ndev, int subdev)
 	for (i = 0; i < 64 * 1024; i += 4) {
 		if (nv_rd32(ndev, 0x702000 + i) != nv_ri32(ndev, i)) {
 			NV_ERROR(ndev, "INSTMEM: readback failed\n");
-			ret = -EIO;
-			goto error;
+			return -EIO;
 		}
 	}
 
-error:
-	if (ret)
-		priv->base.base.fini(ndev, subdev, false);
-	return ret;
+	return 0;
 }
 
 int
-- 
1.7.10.2
