From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nouveau/fb: fix null derefs in nv49 and nv4e
	init
Date: Fri,  9 Aug 2013 17:25:54 -0400
Message-ID: <1376083554-676-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ronald Uitermark <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Commit dceef5d87 (drm/nouveau/fb: initialise vram controller as pfb
sub-object) moved some code around and introduced these null derefs.
pfb->ram is set to the new ram object outside of this ctor.

Reported-by: Ronald Uitermark <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Ronald Uitermark <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnv49.c | 12 ++++++------
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnv4e.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv49.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv49.c
index 19e3a9a..ab7ef0a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv49.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv49.c
@@ -40,15 +40,15 @@ nv49_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	switch (pfb914 & 0x00000003) {
-	case 0x00000000: pfb->ram->type = NV_MEM_TYPE_DDR1; break;
-	case 0x00000001: pfb->ram->type = NV_MEM_TYPE_DDR2; break;
-	case 0x00000002: pfb->ram->type = NV_MEM_TYPE_GDDR3; break;
+	case 0x00000000: ram->type = NV_MEM_TYPE_DDR1; break;
+	case 0x00000001: ram->type = NV_MEM_TYPE_DDR2; break;
+	case 0x00000002: ram->type = NV_MEM_TYPE_GDDR3; break;
 	case 0x00000003: break;
 	}
 
-	pfb->ram->size  =  nv_rd32(pfb, 0x10020c) & 0xff000000;
-	pfb->ram->parts = (nv_rd32(pfb, 0x100200) & 0x00000003) + 1;
-	pfb->ram->tags  =  nv_rd32(pfb, 0x100320);
+	ram->size  =  nv_rd32(pfb, 0x10020c) & 0xff000000;
+	ram->parts = (nv_rd32(pfb, 0x100200) & 0x00000003) + 1;
+	ram->tags  =  nv_rd32(pfb, 0x100320);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv4e.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv4e.c
index 7192aa6..63a6aab 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv4e.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv4e.c
@@ -38,8 +38,8 @@ nv4e_ram_create(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	pfb->ram->size = nv_rd32(pfb, 0x10020c) & 0xff000000;
-	pfb->ram->type = NV_MEM_TYPE_STOLEN;
+	ram->size = nv_rd32(pfb, 0x10020c) & 0xff000000;
+	ram->type = NV_MEM_TYPE_STOLEN;
 	return 0;
 }
 
-- 
1.8.1.5
