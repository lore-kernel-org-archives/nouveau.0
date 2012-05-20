From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/14] drm/nv30_fb: Purge optional variable
Date: Mon, 21 May 2012 00:14:59 +0100
Message-ID: <1337555703-18925-11-git-send-email-emil.l.velikov@gmail.com>
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

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv30_fb.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv30_fb.c b/drivers/gpu/drm/nouveau/nv30_fb.c
index ce08f08..bc1c65b 100644
--- a/drivers/gpu/drm/nouveau/nv30_fb.c
+++ b/drivers/gpu/drm/nouveau/nv30_fb.c
@@ -113,7 +113,6 @@ nv30_fb_init(struct nouveau_device *ndev, int subdev)
 int
 nv30_fb_create(struct nouveau_device *ndev, int subdev)
 {
-	u32 mem_size = nv_rd32(ndev, 0x10020c);
 	u32 pbus1218 = nv_rd32(ndev, 0x001218);
 	struct nv30_fb_priv *priv;
 	int ret;
@@ -128,7 +127,7 @@ nv30_fb_create(struct nouveau_device *ndev, int subdev)
 	case 0x00000200: ndev->vram_type = NV_MEM_TYPE_GDDR3; break;
 	case 0x00000300: ndev->vram_type = NV_MEM_TYPE_GDDR2; break;
 	}
-	ndev->vram_size = mem_size & 0xff000000;
+	ndev->vram_size = nv_rd32(ndev, 0x10020c) & 0xff000000;
 
 	priv->base.base.destroy = nv10_fb_destroy;
 	priv->base.base.init = nv30_fb_init;
-- 
1.7.10.2
