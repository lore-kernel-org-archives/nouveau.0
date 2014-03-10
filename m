From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: [PATCH] drm/nouveau: print a message when KMS is disabled
Date: Mon, 10 Mar 2014 03:23:29 +0100
Message-ID: <1394418209-2244-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
---

If KMS is disabled, Nouveau will now announce in the logs that it won't load.

(Adding Nouveau list as recipient.)

 drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 89c484d..bb6409b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -984,8 +984,10 @@ nouveau_drm_init(void)
 #endif
 	}
 
-	if (!nouveau_modeset)
+	if (!nouveau_modeset) {
+		DRM_INFO("Nouveau will not load as KMS was disabled.\n");
 		return 0;
+	}
 
 	nouveau_register_dsm_handler();
 	return drm_pci_init(&driver, &nouveau_drm_pci_driver);
-- 
1.9.0
