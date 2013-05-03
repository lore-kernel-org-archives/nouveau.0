From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH V2] nouveau: Allow 3D accelerators with output
	ports
Date: Fri,  3 May 2013 15:48:55 +0200
Message-ID: <1367588935-8398-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch let's cards with PCI class 0x30200 (3D controller) be
operated by the nouveau driver as well. The nv Quadro NVS 450 is
one such card, where the first GPU has PCI class 0x30000 and the
other GPU has PCI class 0x30200. By ignoring the 1 << 9 bit in
the PCI class mask, displays attached to the other GPU can also
be used now.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

V2: Use 0x00ff0000 PCI device mask instead of 0x00fffdff to align
    the code with the nouveau kernel driver as requested by Ben.

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 2b74fc6..d504d3c 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -60,7 +60,7 @@ static Bool	NVUnmapMem(ScrnInfoPtr pScrn);
 
 #define NOUVEAU_PCI_DEVICE(_vendor_id, _device_id)                             \
 	{ (_vendor_id), (_device_id), PCI_MATCH_ANY, PCI_MATCH_ANY,            \
-	  0x00030000, 0x00ffffff, 0 }
+	  0x00030000, 0x00ff0000, 0 }
 
 static const struct pci_id_match nouveau_device_match[] = {
 	NOUVEAU_PCI_DEVICE(0x12d2, PCI_MATCH_ANY),
-- 
1.7.10.4
