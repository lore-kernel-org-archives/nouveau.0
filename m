From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.9 3/4] drm/nouveau/bios: fix issue
 shadowing expansion ROMs
Date: Tue, 19 Jan 2021 20:28:15 -0500
Message-ID: <20210120012816.770648-3-sashal@kernel.org>
References: <20210120012816.770648-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210120012816.770648-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 402a89660e9dc880710b12773076a336c9dab3d7 ]

This issue has generally been covered up by the presence of additional
expansion ROMs after the ones we're interested in, with header fetches
of subsequent images loading enough of the ROM to hide the issue.

Noticed on GA102, which lacks a type 0x70 image compared to TU102,.

[  906.364197] nouveau 0000:09:00.0: bios: 00000000: type 00, 65024 bytes
[  906.381205] nouveau 0000:09:00.0: bios: 0000fe00: type 03, 91648 bytes
[  906.405213] nouveau 0000:09:00.0: bios: 00026400: type e0, 22016 bytes
[  906.410984] nouveau 0000:09:00.0: bios: 0002ba00: type e0, 366080 bytes

vs

[   22.961901] nouveau 0000:09:00.0: bios: 00000000: type 00, 60416 bytes
[   22.984174] nouveau 0000:09:00.0: bios: 0000ec00: type 03, 71168 bytes
[   23.010446] nouveau 0000:09:00.0: bios: 00020200: type e0, 48128 bytes
[   23.028220] nouveau 0000:09:00.0: bios: 0002be00: type e0, 140800 bytes
[   23.080196] nouveau 0000:09:00.0: bios: 0004e400: type 70, 7168 bytes

Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
index 7deb81b6dbac6..4b571cc6bc70f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
@@ -75,7 +75,7 @@ shadow_image(struct nvkm_bios *bios, int idx, u32 offset, struct shadow *mthd)
 	nvkm_debug(subdev, "%08x: type %02x, %d bytes\n",
 		   image.base, image.type, image.size);
 
-	if (!shadow_fetch(bios, mthd, image.size)) {
+	if (!shadow_fetch(bios, mthd, image.base + image.size)) {
 		nvkm_debug(subdev, "%08x: fetch failed\n", image.base);
 		return 0;
 	}
-- 
2.27.0
