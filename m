From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: add some comments about class fields
Date: Mon,  8 Oct 2012 00:49:29 +0200
Message-ID: <1349650171-25045-3-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/core/engine.h | 4 ++++
 drivers/gpu/drm/nouveau/core/include/core/parent.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/include/core/engine.h b/drivers/gpu/drm/nouveau/core/include/core/engine.h
index 666d06d..09b2828 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/engine.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/engine.h
@@ -9,7 +9,11 @@
 
 struct nouveau_engine {
 	struct nouveau_subdev base;
+
+	/* context class */
 	struct nouveau_oclass *cclass;
+
+	/* array of possible subclasses */
 	struct nouveau_oclass *sclass;
 
 	struct list_head contexts;
diff --git a/drivers/gpu/drm/nouveau/core/include/core/parent.h b/drivers/gpu/drm/nouveau/core/include/core/parent.h
index 58bf6b5..31a32b0 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/parent.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/parent.h
@@ -13,6 +13,7 @@ struct nouveau_sclass {
 struct nouveau_parent {
 	struct nouveau_object base;
 
+	/* subclass */
 	struct nouveau_sclass *sclass;
 	u32 engine;
 
-- 
1.7.12
