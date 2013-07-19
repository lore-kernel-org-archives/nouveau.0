From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nouveau/xtensa: firmware size needs to be
	0x40000 no matter what
Date: Fri, 19 Jul 2013 06:27:45 -0400
Message-ID: <1374229665-8511-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The current logic is wrong since we send fw->size >> 8 to the
card. Rounding the size up by 0x100 and 0x1000 didn't seem to help,
the card still hung, so go back to what the blob does -- 0x40000.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

What's currently in the tree causes the card to hang.

Looking back at all the patches I sent, I always had the firmware size
at 0x40000. But I never got around to testing what had actually made
it into the tree, so my bad. I tried doing ALING(fw->size, 0x100)
(since we send the size >> 8) and also ALIGN(fw->size, 0x1000) (page
size, who knows), with no effect. Might as well just leave it
hard-coded at 0x40000.

Please make sure that this hits 3.11, otherwise it will not be useable
for video decoding.

 drivers/gpu/drm/nouveau/core/engine/xtensa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/xtensa.c b/drivers/gpu/drm/nouveau/core/engine/xtensa.c
index 0639bc5..5f6ede7 100644
--- a/drivers/gpu/drm/nouveau/core/engine/xtensa.c
+++ b/drivers/gpu/drm/nouveau/core/engine/xtensa.c
@@ -118,7 +118,13 @@ _nouveau_xtensa_init(struct nouveau_object *object)
 			return ret;
 		}
 
-		ret = nouveau_gpuobj_new(object, NULL, fw->size, 0x1000, 0,
+		if (fw->size > 0x40000) {
+			nv_warn(xtensa, "firmware %s too large\n", name);
+			release_firmware(fw);
+			return -EINVAL;
+		}
+
+		ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
 					 &xtensa->gpu_fw);
 		if (ret) {
 			release_firmware(fw);
-- 
1.8.1.5
