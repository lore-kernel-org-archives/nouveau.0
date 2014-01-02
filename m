From: Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
Subject: [PATCH] Fix hang problem with GeForce GT 560 Ti and
	nouveau in 3.13-rc
Date: Thu, 02 Jan 2014 14:58:31 +0000
Message-ID: <52C57E97.1050602@blueyonder.co.uk>
References: <52C29918.4060102@blueyonder.co.uk>	<CAKb7UvhBunpMC6mzjRg7Zb5gGPPYj99=2jd+Lgnr-qeXFs0w9A@mail.gmail.com>	<52C3644C.9090809@blueyonder.co.uk>	<CAKb7UviLpfZMtZM9X1R0Eaj=5ww2k=T+7x01dZH3ns2Ew1HuFw@mail.gmail.com>	<52C42079.6060604@blueyonder.co.uk>	<CAKb7Uvj97SgHp1b11_MMt1UR-NUpQ_2LuGhwjyk_a7_VLqN+KQ@mail.gmail.com>	<52C4D099.9040507@blueyonder.co.uk>
	<CAKb7UvgiYn9Wy=EsrHWsoGH7Zj2=-8n=qunyzHTLKnSW3RL=iQ@mail.gmail.com>
Reply-To: sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000303030209040800000704"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgiYn9Wy=EsrHWsoGH7Zj2=-8n=qunyzHTLKnSW3RL=iQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, opensuse factory list <opensuse-factory-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>, LKML Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------000303030209040800000704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks


--------------000303030209040800000704
Content-Type: text/x-patch;
 name="GF114_2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="GF114_2.diff"

This patch stops a console hang with VGA compatible controller: NVIDIA Corporation GF114 [GeForce GTX 560 Ti] (rev a1)
3.13-rc defines NVDEV_SUBDEV_MC as nvc3_mc_oclass, it needs to be defined as nvc0_mc_oclass
Signed off by: Sid Boyce (sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org)
Tested by: Sid Boyce (sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org)
---

drivers/gpu/drm/nouveau/core/engine/device/nvc0.c 1 -+
1 file changed, 1 insertion(+), 1 deletion(-)

INDEX: linux/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c
=========================================================================
diff -up  a/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c
--- a/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c	2013-11-23 13:03:23.797604441 +0000
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c	2014-01-02 02:13:32.445643092 +0000
@@ -161,7 +161,7 @@ nvc0_identify(struct nouveau_device *dev
 		device->oclass[NVDEV_SUBDEV_THERM  ] = &nva3_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
 		device->oclass[NVDEV_SUBDEV_DEVINIT] = &nvc0_devinit_oclass;
-		device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
+		device->oclass[NVDEV_SUBDEV_MC     ] =  nvc0_mc_oclass;
 		device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
 		device->oclass[NVDEV_SUBDEV_TIMER  ] = &nv04_timer_oclass;
 		device->oclass[NVDEV_SUBDEV_FB     ] =  nvc0_fb_oclass;

--------------000303030209040800000704
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000303030209040800000704--
