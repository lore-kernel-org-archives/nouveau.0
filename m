From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] drm/nouveau: provide a way for devinit to
	mark engines as disabled
Date: Thu,  9 Jan 2014 21:19:11 -0500
Message-ID: <1389320353-21375-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

I decided to let the user still specify config=BLA=1 to override the hw
disable in case we get something wrong or for double-checking stuff, but I
suspect it won't really be used much. I'm not terribly fond of the message
text, if you come up with something better, feel free to drop it in.

 drivers/gpu/drm/nouveau/core/core/engine.c         | 21 ++++++++++++++++-----
 drivers/gpu/drm/nouveau/core/include/core/device.h |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/engine.c b/drivers/gpu/drm/nouveau/core/core/engine.c
index c8bed4a..0405fba 100644
--- a/drivers/gpu/drm/nouveau/core/core/engine.c
+++ b/drivers/gpu/drm/nouveau/core/core/engine.c
@@ -34,6 +34,7 @@ nouveau_engine_create_(struct nouveau_object *parent,
 		       int length, void **pobject)
 {
 	struct nouveau_engine *engine;
+	struct nouveau_device *device;
 	int ret;
 
 	ret = nouveau_subdev_create_(parent, engobj, oclass, NV_ENGINE_CLASS,
@@ -42,11 +43,21 @@ nouveau_engine_create_(struct nouveau_object *parent,
 	if (ret)
 		return ret;
 
-	if ( parent &&
-	    !nouveau_boolopt(nv_device(parent)->cfgopt, iname, enable)) {
-		if (!enable)
-			nv_warn(engine, "disabled, %s=1 to enable\n", iname);
-		return -ENODEV;
+	if (parent) {
+		device = nv_device(parent);
+		if (device->disable_mask & (1ULL << (oclass->handle & 0xff))) {
+			if (nouveau_boolopt(device->cfgopt, iname, false)) {
+				nv_warn(engine, "hardware is marked as disabled, but obeying explicit enable\n");
+			} else {
+				nv_info(engine, "hardware is marked as disabled\n");
+				return -ENODEV;
+			}
+		}
+		if (!nouveau_boolopt(device->cfgopt, iname, enable)) {
+			if (!enable)
+				nv_warn(engine, "disabled, %s=1 to enable\n", iname);
+			return -ENODEV;
+		}
 	}
 
 	INIT_LIST_HEAD(&engine->contexts);
diff --git a/drivers/gpu/drm/nouveau/core/include/core/device.h b/drivers/gpu/drm/nouveau/core/include/core/device.h
index ac2881d..d04c523 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/device.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/device.h
@@ -70,6 +70,7 @@ struct nouveau_device {
 	const char *dbgopt;
 	const char *name;
 	const char *cname;
+	u64 disable_mask;
 
 	enum {
 		NV_04    = 0x04,
-- 
1.8.3.2
