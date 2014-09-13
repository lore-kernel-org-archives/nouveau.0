From: asd <asd-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
Subject: (no subject)
Date: Sat, 13 Sep 2014 18:24:52 +0300
Message-ID: <20140913182452.45609099@marian1000.go.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/pLYB+8TqiHehOpfD4.1woH4"
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
List-Id: nouveau.vger.kernel.org

--MP_/pLYB+8TqiHehOpfD4.1woH4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi
On NV_40 on driver is sent instructions from NVE0 series
not right
I inspected register  9012c with nvtools
and appear instructions to start unneeded engines 
NVE0_CHANNEL_IND_ENGINE_PPP 
NVE0_CHANNEL_IND_ENGINE_BSP 
NVE0_CHANNEL_IND_ENGINE_ENC  

I put one barrier but not start dri.

--MP_/pLYB+8TqiHehOpfD4.1woH4
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=nouveau_abi.patch

Index: master_local/drivers/gpu/drm/nouveau/nouveau_abi16.c
===================================================================
--- master_local.orig/drivers/gpu/drm/nouveau/nouveau_abi16.c	2014-08-01 00:51:43.000000000 +0300
+++ master_local/drivers/gpu/drm/nouveau/nouveau_abi16.c	2014-09-13 17:16:19.881489054 +0300
@@ -252,7 +252,12 @@
 	device = nv_device(abi16->device);
 	imem   = nouveau_instmem(device);
 	pfb    = nouveau_fb(device);
-
+	printk(KERN_INFO "fb_ctxdma_handle %x\n", init->fb_ctxdma_handle);
+	printk(KERN_INFO "tt_ctxdma_handle %x\n", init->tt_ctxdma_handle);
+	printk(KERN_INFO "channel %x\n", init->channel);
+	printk(KERN_INFO "pushbuf_domains %x\n", init->pushbuf_domains);
+	printk(KERN_INFO "notifier_handle %x\n", init->notifier_handle);
+	printk(KERN_INFO "nr_subchan %x\n", init->nr_subchan);
 	/* hack to allow channel engine type specification on kepler */
 	if (device->card_type >= NV_E0) {
 		if (init->fb_ctxdma_handle != ~0)
@@ -265,6 +270,18 @@
 		if (init->fb_ctxdma_handle == NVE0_CHANNEL_IND_ENGINE_GR)
 			init->tt_ctxdma_handle = 1;
 	}
+	
+	if (device->card_type < NV_50) {
+		if (init->fb_ctxdma_handle = 0x00000008)
+			return nouveau_abi16_put(abi16, -EINVAL);
+
+		if (init->fb_ctxdma_handle = 0x00000004)
+			return nouveau_abi16_put(abi16, -EINVAL);
+
+		if (init->fb_ctxdma_handle = 0x00000040)
+			return nouveau_abi16_put(abi16, -EINVAL);
+	}
+		 
 
 	if (init->fb_ctxdma_handle == ~0 || init->tt_ctxdma_handle == ~0)
 		return nouveau_abi16_put(abi16, -EINVAL);

--MP_/pLYB+8TqiHehOpfD4.1woH4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_/pLYB+8TqiHehOpfD4.1woH4--
