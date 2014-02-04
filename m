From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: only over-allocate by a page for code
Date: Tue,  4 Feb 2014 02:32:09 -0500
Message-ID: <1391499129-11438-1-git-send-email-imirkin@alum.mit.edu>
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
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The pre-fetching doesn't go too far. Tested with over-allocating by only
a page, and didn't see any errors in dmesg. Saves ~512KB of VRAM.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: 10.1 <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_screen.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index bdfb931..b02b6f8 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -747,12 +747,13 @@ nv50_screen_create(struct nouveau_device *dev)
       goto fail;
    }
 
-   /* This over-allocates by a whole code BO. The GP, which would execute at
-    * the end of the last page, would trigger faults. The going theory is that
-    * it prefetches up to a certain amount. This avoids dmesg spam.
+   /* This over-allocates by a page. The GP, which would execute at the end of
+    * the last page, would trigger faults. The going theory is that it
+    * prefetches up to a certain amount. This avoids dmesg spam.
     */
    ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 1 << 16,
-                        4 << NV50_CODE_BO_SIZE_LOG2, NULL, &screen->code);
+                        (3 << NV50_CODE_BO_SIZE_LOG2) + 0x1000,
+                        NULL, &screen->code);
    if (ret) {
       NOUVEAU_ERR("Failed to allocate code bo: %d\n", ret);
       goto fail;
-- 
1.8.3.2
