From: Julien PUYDT <julien.puydt-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Subject: About nVidia 8600M GS (10de:0425 (rev a1))
Date: Fri, 21 Sep 2007 13:16:02 +0200
Message-ID: <46F3A7F2.1010007@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I compiled drm & xf86-video-nouveau to test nouveau yesterday -- the X 
server couldn't start. Today, Telek pointed me to 
drm/linux-core/drm_pciids.h, where I added my card. This made nouveau 
detect my card, and the xerver started successfully.

I didn't test further -- for example I didn't compile the mesa nouveau 
code to enable 3D.

So what should I test ?

Snark

PS1: nvidia-glx isn't abi-compatible with my xserver, so I can't provide 
renouveau dumps at the moment.

PS2: the patch to make my card detected.
--- drm_pciids.h.orig   2007-09-21 09:06:41.505406324 +0200
+++ drm_pciids.h        2007-09-21 08:58:09.976255940 +0200
@@ -748,6 +748,7 @@
         {0x10de, 0x0421, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_50}, \
         {0x10de, 0x0422, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_50}, \
         {0x10de, 0x0423, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_50}, \
+        {0x10de, 0x0425, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_50}, \
         {0x10de, 0x0429, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_50}, \
         {0x12d2, 0x0020, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_04}, \
         {0x12d2, 0x0028, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NV_04}, \


PS3: I had to copy my modified file in drm_pciids.h.orig and remove my 
line to make the patch because git didn't see I had changed something... 
if someone knows why, that would help!
