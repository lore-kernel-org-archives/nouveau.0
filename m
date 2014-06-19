From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau: dup fd before passing it to device
Date: Thu, 19 Jun 2014 04:39:38 -0400
Message-ID: <1403167178-17614-1-git-send-email-imirkin@alum.mit.edu>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

nouveau screens are reused for the same device node. However in the
scenario where we create screen 1, screen 2, and then delete screen 1,
the surrounding code might also close the original device node. To
protect against this, dup the fd and use the dup'd fd in the
nouveau_device. Also tell the nouveau_device that it is the owner of the
fd so that it will be closed on destruction.

Also make sure to free the nouveau_device in case of any failure.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=79823
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
index 1dfdaac..833fb9a 100644
--- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
+++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
@@ -1,4 +1,5 @@
 #include <sys/stat.h>
+#include <unistd.h>
 #include "pipe/p_context.h"
 #include "pipe/p_state.h"
 #include "util/u_format.h"
@@ -75,7 +76,14 @@ nouveau_drm_screen_create(int fd)
 		return &screen->base;
 	}
 
-	ret = nouveau_device_wrap(fd, 0, &dev);
+	/* Since the screen re-use is based on the device node and not the fd,
+	 * create a copy of the fd to be owned by the device. Otherwise a
+	 * scenario could occur where two screens are created, and the first
+	 * one is shut down, along with the fd being closed. The second
+	 * (identical) screen would now have a reference to the closed fd. We
+	 * avoid this by duplicating the original fd.
+	 */
+	ret = nouveau_device_wrap(dup(fd), 1, &dev);
 	if (ret)
 		goto err;
 
@@ -115,6 +123,8 @@ nouveau_drm_screen_create(int fd)
 	return &screen->base;
 
 err:
+	if (dev)
+		nouveau_device_del(&dev);
 	pipe_mutex_unlock(nouveau_screen_mutex);
 	return NULL;
 }
-- 
1.8.5.5
