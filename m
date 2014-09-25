From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Allow noaccel to be a pci address
Date: Thu, 25 Sep 2014 11:36:31 +0200
Message-ID: <1411637791-4274-2-git-send-email-pierre.morrow@free.fr>
References: <1411637791-4274-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1411637791-4274-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

noaccel option now defaults to null which has no effect, it can still equal 1,
which disables acceleration for all cards, or be a pci address and disable
acceleration for that card only

Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 244d78f..04bd8f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -61,9 +61,10 @@ MODULE_PARM_DESC(debug, "debug string to pass to driver core");
 static char *nouveau_debug;
 module_param_named(debug, nouveau_debug, charp, 0400);
 
-MODULE_PARM_DESC(noaccel, "disable kernel/abi16 acceleration");
-static int nouveau_noaccel = 0;
-module_param_named(noaccel, nouveau_noaccel, int, 0400);
+MODULE_PARM_DESC(noaccel, "disable kernel/abi16 acceleration for all cards,"
+		          "or only for the card given its pci bus name");
+static char *nouveau_noaccel;
+module_param_named(noaccel, nouveau_noaccel, charp, 0400);
 
 MODULE_PARM_DESC(modeset, "enable driver (default: auto, "
 		          "0 = disabled, 1 = enabled, 2 = headless)");
@@ -149,8 +150,13 @@ nouveau_accel_init(struct nouveau_drm *drm)
 	u32 sclass[16];
 	int ret, i;
 
-	if (nouveau_noaccel)
+	if (nouveau_noaccel != NULL &&
+			(!strcmp(nouveau_noaccel, "1") ||
+			 !strcmp(nouveau_noaccel, nvkm_device(device)->name)))
+	{
+		NV_WARN(drm, "Acceleration disabled for card on bus %s\n", nvkm_device(device)->name);
 		return;
+	}
 
 	/* initialise synchronisation routines */
 	/*XXX: this is crap, but the fence/channel stuff is a little
@@ -1039,7 +1045,7 @@ static void nouveau_display_options(void)
 	DRM_DEBUG_DRIVER("... nofbaccel    : %d\n", nouveau_nofbaccel);
 	DRM_DEBUG_DRIVER("... config       : %s\n", nouveau_config);
 	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
-	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
+	DRM_DEBUG_DRIVER("... noaccel      : %s\n", nouveau_noaccel);
 	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
 	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
 	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
-- 
2.1.0
