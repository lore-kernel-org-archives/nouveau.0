From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] fb: default NvMemExec to on,
	turning it off is used for debugging only
Date: Sun, 18 May 2014 01:04:15 -0400
Message-ID: <1400389456-2273-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Hope I understood you correctly wrt the mem exec stuff.

 nvkm/subdev/fb/ramnv50.c | 2 +-
 nvkm/subdev/fb/ramnva3.c | 2 +-
 nvkm/subdev/fb/ramnvc0.c | 2 +-
 nvkm/subdev/fb/ramnve0.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/nvkm/subdev/fb/ramnv50.c b/nvkm/subdev/fb/ramnv50.c
index ef91b6e..e5d12c2 100644
--- a/nvkm/subdev/fb/ramnv50.c
+++ b/nvkm/subdev/fb/ramnv50.c
@@ -211,7 +211,7 @@ nv50_ram_prog(struct nouveau_fb *pfb)
 	struct nv50_ram *ram = (void *)pfb->ram;
 	struct nv50_ramseq *hwsq = &ram->hwsq;
 
-	ram_exec(hwsq, nouveau_boolopt(device->cfgopt, "NvMemExec", false));
+	ram_exec(hwsq, nouveau_boolopt(device->cfgopt, "NvMemExec", true));
 	return 0;
 }
 
diff --git a/nvkm/subdev/fb/ramnva3.c b/nvkm/subdev/fb/ramnva3.c
index 6eb97f1..8076fb1 100644
--- a/nvkm/subdev/fb/ramnva3.c
+++ b/nvkm/subdev/fb/ramnva3.c
@@ -309,7 +309,7 @@ nva3_ram_prog(struct nouveau_fb *pfb)
 	struct nouveau_device *device = nv_device(pfb);
 	struct nva3_ram *ram = (void *)pfb->ram;
 	struct nva3_ramfuc *fuc = &ram->fuc;
-	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", false));
+	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", true));
 	return 0;
 }
 
diff --git a/nvkm/subdev/fb/ramnvc0.c b/nvkm/subdev/fb/ramnvc0.c
index 8edc922..5a6a502 100644
--- a/nvkm/subdev/fb/ramnvc0.c
+++ b/nvkm/subdev/fb/ramnvc0.c
@@ -408,7 +408,7 @@ nvc0_ram_prog(struct nouveau_fb *pfb)
 	struct nouveau_device *device = nv_device(pfb);
 	struct nvc0_ram *ram = (void *)pfb->ram;
 	struct nvc0_ramfuc *fuc = &ram->fuc;
-	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", false));
+	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", true));
 	return 0;
 }
 
diff --git a/nvkm/subdev/fb/ramnve0.c b/nvkm/subdev/fb/ramnve0.c
index 1675219..84c7efb 100644
--- a/nvkm/subdev/fb/ramnve0.c
+++ b/nvkm/subdev/fb/ramnve0.c
@@ -1111,7 +1111,7 @@ nve0_ram_prog(struct nouveau_fb *pfb)
 	struct nouveau_device *device = nv_device(pfb);
 	struct nve0_ram *ram = (void *)pfb->ram;
 	struct nve0_ramfuc *fuc = &ram->fuc;
-	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", false));
+	ram_exec(fuc, nouveau_boolopt(device->cfgopt, "NvMemExec", true));
 	return (ram->base.next == &ram->base.xition);
 }
 
-- 
1.8.5.5
