From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/10] nouveau: restore performance mode a bit
	later.
Date: Sun,  9 Oct 2011 22:58:35 +0200
Message-ID: <1318193920-27461-6-git-send-email-maximlevitsky@gmail.com>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Otherwice code that responsible for idling the card can't work.
BIOS init tables are supposed to init the clocks to correct values,
so that shouldn't cause any problems (we don't reclock by default anyway)

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 0d6a199..12ce793 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -303,8 +303,6 @@ nouveau_pci_resume(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
-	nouveau_pm_resume(dev);
-
 	if (dev_priv->gart_info.type == NOUVEAU_GART_AGP) {
 		ret = nouveau_mem_init_agp(dev);
 		if (ret) {
@@ -344,6 +342,8 @@ nouveau_pci_resume(struct pci_dev *pdev)
 		}
 	}
 
+	nouveau_pm_resume(dev);
+
 	NV_INFO(dev, "Restoring mode...\n");
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct nouveau_framebuffer *nouveau_fb;
-- 
1.7.4.1
