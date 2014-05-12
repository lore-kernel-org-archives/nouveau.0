From: John Rowley <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] device/nvf0: enable video decoding engines on
	gk110/gk208
Date: Mon, 12 May 2014 21:34:57 +0000
Message-ID: <1399930497-6636-2-git-send-email-john.rowley08@gmail.com>
References: <1399930497-6636-1-git-send-email-john.rowley08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1399930497-6636-1-git-send-email-john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Only tested on nvf1, was advised to enable on all.

Signed-off-by: John Rowley <john.rowley08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nvkm/engine/device/nve0.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/nvkm/engine/device/nve0.c b/nvkm/engine/device/nve0.c
index 6e72f9c..459099e 100644
--- a/nvkm/engine/device/nve0.c
+++ b/nvkm/engine/device/nve0.c
@@ -201,11 +201,9 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nve0_copy0_oclass;
 		device->oclass[NVDEV_ENGINE_COPY1  ] = &nve0_copy1_oclass;
 		device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
-#if 0
 		device->oclass[NVDEV_ENGINE_BSP    ] = &nve0_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_VP     ] = &nve0_vp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
-#endif
 		device->oclass[NVDEV_ENGINE_PERFMON] = &nvf0_perfmon_oclass;
 		break;
 	case 0xf1:
@@ -236,11 +234,9 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nve0_copy0_oclass;
 		device->oclass[NVDEV_ENGINE_COPY1  ] = &nve0_copy1_oclass;
 		device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
-#if 0
 		device->oclass[NVDEV_ENGINE_BSP    ] = &nve0_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_VP     ] = &nve0_vp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
-#endif
 		device->oclass[NVDEV_ENGINE_PERFMON] = &nvf0_perfmon_oclass;
 		break;
 	case 0x108:
@@ -271,11 +267,9 @@ nve0_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nve0_copy0_oclass;
 		device->oclass[NVDEV_ENGINE_COPY1  ] = &nve0_copy1_oclass;
 		device->oclass[NVDEV_ENGINE_COPY2  ] = &nve0_copy2_oclass;
-#if 0
 		device->oclass[NVDEV_ENGINE_BSP    ] = &nve0_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_VP     ] = &nve0_vp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nvc0_ppp_oclass;
-#endif
 		break;
 	default:
 		nv_fatal(device, "unknown Kepler chipset\n");
-- 
1.9.2
