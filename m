From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] vga16fb: refuse to load in face of other driver
 controlling primary card
Date: Tue, 20 Jul 2010 21:19:23 +0200
Message-ID: <20100720191923.GA11056@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

We don't want vga16fb to mess with hardware initialized by other driver.
Detect it and refuse to load.
It fixes nouveau interrupt storm on some machines.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/video/vga16fb.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/video/vga16fb.c b/drivers/video/vga16fb.c
index 28ccab4..4505446 100644
--- a/drivers/video/vga16fb.c
+++ b/drivers/video/vga16fb.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
 
+#include <asm/fb.h>
 #include <asm/io.h>
 #include <video/vga.h>
 
@@ -1415,7 +1416,7 @@ static struct platform_device *vga16fb_device;
 
 static int __init vga16fb_init(void)
 {
-	int ret;
+	int ret, i;
 #ifndef MODULE
 	char *option = NULL;
 
@@ -1424,6 +1425,16 @@ static int __init vga16fb_init(void)
 
 	vga16fb_setup(option);
 #endif
+	for (i = 0 ; i < FB_MAX; i++) {
+		if (!registered_fb[i])
+			continue;
+		if (fb_is_primary_device(registered_fb[i])) {
+			printk(KERN_INFO "vga16fb: %s is driving the primary card, refusing to load\n",
+				registered_fb[i]->fix.id);
+			return -EBUSY;
+		}
+	}
+
 	ret = platform_driver_register(&vga16fb_driver);
 
 	if (!ret) {
-- 
1.7.1
