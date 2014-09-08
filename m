From: asd <asd-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
Subject: Extend reserved memory on 0xfc000000
Date: Mon, 8 Sep 2014 12:12:43 +0300
Message-ID: <20140908121243.00080081@marian1000.go.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/0t=OxYKWSTcCgsdYF.jIpT6"
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

--MP_/0t=OxYKWSTcCgsdYF.jIpT6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

This patch correct on usb keyboard acces on number when enter via Ctrl
+ Alt + F12 on vt after Xorg running.Without this patch when enter on
 vt vas unable  to use numbers from NumLock  an only numbers from main
 keyboard.

 nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x046f00a3
 nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)
 nouveau [  DEVICE][0000:01:00.0] Family : NV40
 nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
 nouveau [   VBIOS][0000:01:00.0] ... appears to be valid
 nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
 nouveau  [   VBIOS][0000:01:00.0] BIT signature found
 nouveau
[   VBIOS][0000:01:00.0] version 05.72.22.43.00
--MP_/0t=OxYKWSTcCgsdYF.jIpT6
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=new_instmem_nv40.patch

Index: master_local/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
===================================================================
--- master_local.orig/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c	2014-08-27 19:01:53.000000000 +0300
+++ master_local/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c	2014-09-08 11:51:40.397537299 +0300
@@ -64,14 +64,14 @@
 		bar = 2;
 	else
 		bar = 3;
-
+	printk(KERN_INFO "resource start is %x\n", pci_resource_start(pdev, bar));
 	priv->iomem = ioremap(pci_resource_start(pdev, bar),
 			      pci_resource_len(pdev, bar));
 	if (!priv->iomem) {
 		nv_error(priv, "unable to map PRAMIN BAR\n");
 		return -EFAULT;
 	}
-
+	
 	/* PRAMIN aperture maps over the end of vram, reserve enough space
 	 * to fit graphics contexts for every channel, the magics come
 	 * from engine/graph/nv40.c
@@ -90,11 +90,12 @@
 
 	ret = nouveau_mm_init(&priv->heap, 0, priv->base.reserved, 1);
 	if (ret)
-		return ret;
+			return ret;
 
 	/* 0x00000-0x10000: reserve for probable vbios image */
 	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x10000, 0, 0,
-				&priv->vbios);
+				&priv->vbios); 
+
 	if (ret)
 		return ret;
 
@@ -102,7 +103,7 @@
 	ret = nouveau_ramht_new(nv_object(priv), NULL, 0x08000, 0,
 			       &priv->ramht);
 	if (ret)
-		return ret;
+		return ret; 
 
 	/* 0x18000-0x18200: reserve for RAMRO
 	 * 0x18200-0x20000: padding
@@ -114,11 +115,12 @@
 
 	/* 0x20000-0x21000: reserve for RAMFC
 	 * 0x21000-0x40000: padding and some unknown crap
+	 *  0x50000 is good for keyboard
 	 */
-	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x20000, 0,
+	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x50000, 0,
 				 NVOBJ_FLAG_ZERO_ALLOC, &priv->ramfc);
 	if (ret)
-		return ret;
+		return ret; 
 
 	return 0;
 }

--MP_/0t=OxYKWSTcCgsdYF.jIpT6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--MP_/0t=OxYKWSTcCgsdYF.jIpT6--
