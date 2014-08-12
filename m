From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gk20a: add LTC device
Date: Tue, 12 Aug 2014 15:16:52 -0700
Message-ID: <1407881813-18713-1-git-send-email-acourbot@nvidia.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

LTC device is now required for PGRAPH to work, add it.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 nvkm/engine/device/nve0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nvkm/engine/device/nve0.c b/nvkm/engine/device/nve0.c
index 54ec53bc6252..cdf9147f32a1 100644
--- a/nvkm/engine/device/nve0.c
+++ b/nvkm/engine/device/nve0.c
@@ -163,6 +163,7 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
 		device->oclass[NVDEV_SUBDEV_TIMER  ] = &gk20a_timer_oclass;
 		device->oclass[NVDEV_SUBDEV_FB     ] =  gk20a_fb_oclass;
+		device->oclass[NVDEV_SUBDEV_LTC    ] =  gk104_ltc_oclass;
 		device->oclass[NVDEV_SUBDEV_IBUS   ] = &gk20a_ibus_oclass;
 		device->oclass[NVDEV_SUBDEV_INSTMEM] = nv50_instmem_oclass;
 		device->oclass[NVDEV_SUBDEV_VM     ] = &nvc0_vmmgr_oclass;
-- 
2.0.4
