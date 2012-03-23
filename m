From: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: Check dsm on switcheroo
	unregister
Date: Fri, 23 Mar 2012 22:57:06 +0100
Message-ID: <1332539827-13047-3-git-send-email-andreas@meetr.de>
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

Currently vga_switcheroo_unregister_handler is called unconditionally when
nouveau is unloaded, even when nouveau never registered a handler. This
interferes with other switcheroo handlers, as vga_switcheroo doesn't check who
called unregister_handler, but simply unregisters the current handler. This
patch adds a check so unregister is only called if a handler was registered by
nouveau before.

Signed-off-by: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 284bd25..fc841e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -338,7 +338,8 @@ void nouveau_switcheroo_optimus_dsm(void)
 
 void nouveau_unregister_dsm_handler(void)
 {
-	vga_switcheroo_unregister_handler();
+	if (nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.dsm_detected)
+		vga_switcheroo_unregister_handler();
 }
 
 /* retrieve the ROM in 4k blocks */
-- 
1.7.9.1
