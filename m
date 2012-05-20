From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/14] drm/nouveau: Unregister switcheroo client
	on exit
Date: Mon, 21 May 2012 00:14:51 +0100
Message-ID: <1337555703-18925-3-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

From: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>

Currently nouveau only registers as a vga_switcheroo client, but never
unregisters. This patch adds the necessary unregister calls.

Signed-off-by: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
---
v2: Rebased on top of master

 drivers/gpu/drm/nouveau/nouveau_state.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 1a70d07..b84db66 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -344,6 +344,7 @@ out_device_init:
 out_display_early:
 	engine->display.late_takedown(ndev);
 out:
+	vga_switcheroo_unregister_client(dev->pdev);
 	vga_client_register(dev->pdev, NULL, NULL, NULL);
 	return ret;
 }
@@ -387,6 +388,7 @@ static void nouveau_card_takedown(struct nouveau_device *ndev)
 
 	nouveau_irq_fini(ndev);
 
+	vga_switcheroo_unregister_client(dev->pdev);
 	vga_client_register(dev->pdev, NULL, NULL, NULL);
 }
 
-- 
1.7.10.2
