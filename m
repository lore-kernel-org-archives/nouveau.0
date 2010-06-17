From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Don't clear AGPCMD completely on
	INIT_RESET.
Date: Thu, 17 Jun 2010 16:28:31 +0200
Message-ID: <1276784911-11630-1-git-send-email-currojerez@riseup.net>
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
List-Id: nouveau.vger.kernel.org

We just need to clear the SBA and ENABLE bits to reset the AGP
controller: If the AGP bridge was configured to use "fast writes",
clearing the FW bit would break the subsequent MMIO writes and
eventually end with a lockup.

Note that all the BIOSes I've seen do the same as we did (it works for
them because they don't use MMIO), OTOH the blob leaves FW untouched.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index ee36f8f..903e72b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2126,7 +2126,8 @@ init_reset(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	/* no iexec->execute check by design */
 
 	pci_nv_19 = bios_rd32(bios, NV_PBUS_PCI_NV_19);
-	bios_wr32(bios, NV_PBUS_PCI_NV_19, 0);
+	bios_wr32(bios, NV_PBUS_PCI_NV_19, pci_nv_19 & ~0xf00);
+
 	bios_wr32(bios, reg, value1);
 
 	udelay(10);
-- 
1.6.4.4
