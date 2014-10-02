From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 1/9] bios/ramcfg: 10_02_40 -> DLLoff
Date: Thu,  2 Oct 2014 18:01:50 +0200
Message-ID: <1412265718-1215-2-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
 <1412265718-1215-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412265718-1215-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h | 2 +-
 drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c         | 2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c            | 2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
index a685bbd..ae3f17d 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
@@ -43,7 +43,7 @@ struct nvbios_ramcfg {
 			unsigned ramcfg_10_02_08:1;
 			unsigned ramcfg_10_02_10:1;
 			unsigned ramcfg_10_02_20:1;
-			unsigned ramcfg_10_02_40:1;
+			unsigned ramcfg_10_DLLoff:1;
 			unsigned ramcfg_10_03_0f:4;
 			unsigned ramcfg_10_05:8;
 			unsigned ramcfg_10_06:8;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
index 585e693..24dc9b3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/rammap.c
@@ -162,7 +162,7 @@ nvbios_rammapSp(struct nouveau_bios *bios, u32 data,
 		p->ramcfg_10_02_08 = (nv_ro08(bios, data + 0x02) & 0x08) >> 3;
 		p->ramcfg_10_02_10 = (nv_ro08(bios, data + 0x02) & 0x10) >> 4;
 		p->ramcfg_10_02_20 = (nv_ro08(bios, data + 0x02) & 0x20) >> 5;
-		p->ramcfg_10_02_40 = (nv_ro08(bios, data + 0x02) & 0x40) >> 6;
+		p->ramcfg_10_DLLoff = (nv_ro08(bios, data + 0x02) & 0x40) >> 6;
 		p->ramcfg_10_03_0f = (nv_ro08(bios, data + 0x03) & 0x0f) >> 0;
 		p->ramcfg_10_05    = (nv_ro08(bios, data + 0x05) & 0xff) >> 0;
 		p->ramcfg_10_06    = (nv_ro08(bios, data + 0x06) & 0xff) >> 0;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
index bb1eb8f..252575f 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
@@ -66,7 +66,7 @@ nouveau_sddr2_calc(struct nouveau_ram *ram)
 	case 0x10:
 		CL  = ram->next->bios.timing_10_CL;
 		WR  = ram->next->bios.timing_10_WR;
-		DLL = !ram->next->bios.ramcfg_10_02_40;
+		DLL = !ram->next->bios.ramcfg_10_DLLoff;
 		ODT = ram->next->bios.timing_10_ODT & 3;
 		break;
 	case 0x20:
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
index 83949b1..a2dca48 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr3.c
@@ -80,7 +80,7 @@ nouveau_sddr3_calc(struct nouveau_ram *ram)
 		CWL = ram->next->bios.timing_10_CWL;
 		CL  = ram->next->bios.timing_10_CL;
 		WR  = ram->next->bios.timing_10_WR;
-		DLL = !ram->next->bios.ramcfg_10_02_40;
+		DLL = !ram->next->bios.ramcfg_10_DLLoff;
 		ODT = ram->next->bios.timing_10_ODT;
 		break;
 	case 0x20:
-- 
1.9.3
