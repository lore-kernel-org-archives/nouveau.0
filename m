From: John Rowley <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] device/nvf1: add support for 0xf1 (gk110b)
Date: Mon, 12 May 2014 21:34:56 +0000
Message-ID: <1399930497-6636-1-git-send-email-john.rowley08@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: John Rowley <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: John Rowley <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nvkm/engine/device/nve0.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/nvkm/engine/device/nve0.c b/nvkm/engine/device/nve0.c
index 964c183..6e72f9c 100644
--- a/nvkm/engine/device/nve0.c
+++ b/nvkm/engine/device/nve0.c
@@ -208,6 +208,41 @@ nve0_identify(struct nouveau_device *device)
 #endif
 		device->oclass[NVDEV_ENGINE_PERFMON] = &nvf0_perfmon_oclass;
 		break;
+	case 0xf1:
+		device->cname = "GK110B";
+		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] = &nve0_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_I2C    ] = &nvd0_i2c_oclass;
+		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
+		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
+		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
+		device->oclass[NVDEV_SUBDEV_DEVINIT] =  nvc0_devinit_oclass;
+		device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
+		device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
+		device->oclass[NVDEV_SUBDEV_TIMER  ] = &nv04_timer_oclass;
+		device->oclass[NVDEV_SUBDEV_FB     ] =  nve0_fb_oclass;
+		device->oclass[NVDEV_SUBDEV_LTCG   ] =  gf100_ltcg_oclass;
+		device->oclass[NVDEV_SUBDEV_IBUS   ] = &nve0_ibus_oclass;
+		device->oclass[NVDEV_SUBDEV_INSTMEM] =  nv50_instmem_oclass;
+		device->oclass[NVDEV_SUBDEV_VM     ] = &nvc0_vmmgr_oclass;
+		device->oclass[NVDEV_SUBDEV_BAR    ] = &nvc0_bar_oclass;
+		device->oclass[NVDEV_SUBDEV_PWR    ] = &nvd0_pwr_oclass;
+		device->oclass[NVDEV_SUBDEV_VOLT   ] = &nv40_volt_oclass;
+		device->oclass[NVDEV_ENGINE_DMAOBJ ] = &nvd0_dmaeng_oclass;
+		device->oclass[NVDEV_ENGINE_FIFO   ] =  nve0_fifo_oclass;
+		device->oclass[NVDEV_ENGINE_SW     ] =  nvc0_software_oclass;
+		device->oclass[NVDEV_ENGINE_GR     ] =  nvf0_graph_oclass;
+		device->oclass[NVDEV_ENGINE_DISP   ] =  nvf0_disp_oclass;
+		device->oclass[NVDEV_ENGINE_COPY0  ] = &nve0_copy0_oclass;
+		device->oclass[NVDEV_ENGINE_COPY1  ] = &nve0_copy1_oclass;
+		device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
+#if 0
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nve0_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nve0_vp_oclass;
+		device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
+#endif
+		device->oclass[NVDEV_ENGINE_PERFMON] = &nvf0_perfmon_oclass;
+		break;
 	case 0x108:
 		device->cname = "GK208";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-- 
1.9.2
