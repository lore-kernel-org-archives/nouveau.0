From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Subject: [PATCH] Enable NV96 support
Date: Fri, 06 Mar 2009 14:09:48 +0100
Message-ID: <49B1209C.7020008@haypocalc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010900030506060801060803"
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

This is a multi-part message in MIME format.
--------------010900030506060801060803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Add NV96 in NV9X_GRCLASS8297_CHIPSETS bitmask and remove the test
blocking NV9x (another test is already present above).

--------------010900030506060801060803
Content-Type: text/x-patch;
 name="0003-Enable-NV96-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0003-Enable-NV96-support.patch"

From d6dbc4e172be2d6aa6155b5621f5e9acfa13b12d Mon Sep 17 00:00:00 2001
From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Date: Fri, 6 Mar 2009 14:08:00 +0100
Subject: [PATCH] Enable NV96 support

Add NV96 in NV9X_GRCLASS8297_CHIPSETS bitmask and remove the test
blocking NV9x (another test is already present above)
---
 src/gallium/drivers/nv50/nv50_screen.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 9bf5e8c..4130ede 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -31,7 +31,7 @@
 
 #define NV5X_GRCLASS5097_CHIPSETS 0x00000001
 #define NV8X_GRCLASS8297_CHIPSETS 0x00000050
-#define NV9X_GRCLASS8297_CHIPSETS 0x00000014
+#define NV9X_GRCLASS8297_CHIPSETS 0x00000054
 
 static boolean
 nv50_screen_is_format_supported(struct pipe_screen *pscreen,
@@ -190,12 +190,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_winsys *nvws)
 	}
 
 	/* 3D object */
-	if ((chipset & 0xf0) != 0x50 && (chipset & 0xf0) != 0x80) {
-		NOUVEAU_ERR("Not a G8x chipset\n");
-		nv50_screen_destroy(&screen->pipe);
-		return NULL;
-	}
-
 	switch (chipset & 0xf0) {
 	case 0x50:
 		if (NV5X_GRCLASS5097_CHIPSETS & (1 << (chipset & 0x0f)))
-- 
1.5.6.3


--------------010900030506060801060803
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010900030506060801060803--
