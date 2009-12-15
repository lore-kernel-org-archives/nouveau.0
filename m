From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: Kill global state in NvShadowBIOS
Date: Tue, 15 Dec 2009 00:37:30 +0000
Message-ID: <1260837451-2060-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   47 ++++++++++++++-----------------
 1 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 5eec5ed..04ac564 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -181,43 +181,42 @@ struct methods {
 	const char desc[8];
 	void (*loadbios)(struct drm_device *, uint8_t *);
 	const bool rw;
-	int score;
 };
 
 static struct methods nv04_methods[] = {
 	{ "PROM", load_vbios_prom, false },
 	{ "PRAMIN", load_vbios_pramin, true },
 	{ "PCIROM", load_vbios_pci, true },
-	{ }
 };
 
 static struct methods nv50_methods[] = {
 	{ "PRAMIN", load_vbios_pramin, true },
 	{ "PROM", load_vbios_prom, false },
 	{ "PCIROM", load_vbios_pci, true },
-	{ }
 };
 
+#define METHODCNT 3
+
 static bool NVShadowVBIOS(struct drm_device *dev, uint8_t *data)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct methods *methods, *method;
+	struct methods *methods;
+	int i;
 	int testscore = 3;
+	int scores[METHODCNT];
 
 	if (nouveau_vbios) {
-		method = nv04_methods;
-		while (method->loadbios) {
-			if (!strcasecmp(nouveau_vbios, method->desc))
+		methods = nv04_methods;
+		for (i = 0; i < METHODCNT; i++)
+			if (!strcasecmp(nouveau_vbios, methods[i].desc))
 				break;
-			method++;
-		}
 
-		if (method->loadbios) {
+		if (i < METHODCNT) {
 			NV_INFO(dev, "Attempting to use BIOS image from %s\n",
-				method->desc);
+				methods[i].desc);
 
-			method->loadbios(dev, data);
-			if (score_vbios(dev, data, method->rw))
+			methods[i].loadbios(dev, data);
+			if (score_vbios(dev, data, methods[i].rw))
 				return true;
 		}
 
@@ -229,28 +228,24 @@ static bool NVShadowVBIOS(struct drm_device *dev, uint8_t *data)
 	else
 		methods = nv50_methods;
 
-	method = methods;
-	while (method->loadbios) {
+	for (i = 0; i < METHODCNT; i++) {
 		NV_TRACE(dev, "Attempting to load BIOS image from %s\n",
-			 method->desc);
+			 methods[i].desc);
 		data[0] = data[1] = 0;	/* avoid reuse of previous image */
-		method->loadbios(dev, data);
-		method->score = score_vbios(dev, data, method->rw);
-		if (method->score == testscore)
+		methods[i].loadbios(dev, data);
+		scores[i] = score_vbios(dev, data, methods[i].rw);
+		if (scores[i] == testscore)
 			return true;
-		method++;
 	}
 
 	while (--testscore > 0) {
-		method = methods;
-		while (method->loadbios) {
-			if (method->score == testscore) {
+		for (i = 0; i < METHODCNT; i++) {
+			if (scores[i] == testscore) {
 				NV_TRACE(dev, "Using BIOS image from %s\n",
-					 method->desc);
-				method->loadbios(dev, data);
+					 methods[i].desc);
+				methods[i].loadbios(dev, data);
 				return true;
 			}
-			method++;
 		}
 	}
 
-- 
1.6.5.6
