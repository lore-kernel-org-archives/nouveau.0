From: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] xf86-video-nouveau: enable backlight toggling for
	Dell Inspiron 8200 GeForce2 Go
Date: Thu, 27 Sep 2007 01:28:21 +0200
Message-ID: <1190849301-9084-2-git-send-email-giuseppe.bilotta@gmail.com>
References: <1190849301-9084-1-git-send-email-giuseppe.bilotta@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1190849301-9084-1-git-send-email-giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

GeForce2 Go and similar cards are explicitly excluded from the
NVBacklightEnable() code (purposedly, as the code used for the other
chipsets on x86 has no effect.) This causes the backlight to remain
active on laptops equipped with such a card, even when DPMS modes were
active.

Fix the issue for Dell Inspiron 8200 by introducing the proper
registry writes to toggle the backlight.

Signed-off-by: Giuseppe Bilotta <giuseppe.bilotta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 2a730ab..0885198 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -2014,8 +2014,16 @@ static void NVBacklightEnable(NVPtr pNv,  Bool on)
 #endif
     
     if(pNv->LVDS) {
-       if(pNv->twoHeads && ((pNv->Chipset & 0x0ff0) != CHIPSET_NV11)) {
-           nvWriteMC(pNv, 0x130C, on ? 3 : 7);
+       if(pNv->twoHeads) {
+           if ((pNv->Chipset & 0x0ff0) != CHIPSET_NV11) {
+               nvWriteMC(pNv, 0x130C, on ? 3 : 7);
+           } else if((PCI_DEV_SUBVENDOR_ID(pNv->PciInfo) == 0x1028) && (PCI_DEV_SUBDEVICE_ID(pNv->PciInfo) == 0xd4)) {
+               // Dell Inspiron 8200, GeForce2 Go
+               CARD32 tmp_pcrt;
+               tmp_pcrt = nvReadCRTC0(pNv, NV_CRTC_081C) & 0xFFFFFFFC;
+               if(on) tmp_pcrt |= 0x1;
+               nvWriteCRTC0(pNv, NV_CRTC_081C, tmp_pcrt);
+           }
        }
     } else {
        CARD32 fpcontrol;
-- 
1.5.3.2
