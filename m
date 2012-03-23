From: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: Unregister switcheroo client on
	exit
Date: Fri, 23 Mar 2012 22:57:07 +0100
Message-ID: <1332539827-13047-4-git-send-email-andreas@meetr.de>
References: <1332539827-13047-1-git-send-email-andreas@meetr.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1332539827-13047-1-git-send-email-andreas-nJONrVjOgt4@public.gmane.org>
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

Currently nouveau only registers as a vga_switcheroo client, but never
unregisters. This patch adds the necessary unregister calls.
---
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 9da6a74..2e11361 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -912,6 +912,7 @@ out_bios:
 out_display_early:
 	engine->display.late_takedown(dev);
 out:
+	vga_switcheroo_unregister_client(dev->pdev);
 	vga_client_register(dev->pdev, NULL, NULL, NULL);
 	return ret;
 }
@@ -969,6 +970,7 @@ static void nouveau_card_takedown(struct drm_device *dev)
 
 	nouveau_irq_fini(dev);
 
+	vga_switcheroo_unregister_client(dev->pdev);
 	vga_client_register(dev->pdev, NULL, NULL, NULL);
 }
 
-- 
1.7.9.1
