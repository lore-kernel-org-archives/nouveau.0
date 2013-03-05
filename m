From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH 2/2] nouveau: add a way to override single
	pushbuffer vram/gart limits
Date: Tue,  5 Mar 2013 21:14:54 +0100
Message-ID: <1362514494-3918-2-git-send-email-marcin.slusarz@gmail.com>
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

Add environment variables:
NOUVEAU_LIBDRM_VRAM_LIMIT_PERCENT
NOUVEAU_LIBDRM_GART_LIMIT_PERCENT
which will allow override how much VRAM/GART single pushbuffer can take.
Default to 80.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nouveau/nouveau.c | 18 ++++++++++++++++--
 nouveau/private.h |  1 +
 nouveau/pushbuf.c |  6 ++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
index 9b32e31..ee7893b 100644
--- a/nouveau/nouveau.c
+++ b/nouveau/nouveau.c
@@ -77,6 +77,7 @@ nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
 	uint64_t chipset, vram, gart, bousage;
 	drmVersionPtr ver;
 	int ret;
+	char *tmp;
 
 #ifdef DEBUG
 	debug_init(getenv("NOUVEAU_LIBDRM_DEBUG"));
@@ -114,14 +115,27 @@ nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
 		nvdev->have_bo_usage = (bousage != 0);
 
 	nvdev->close = close;
+
+	tmp = getenv("NOUVEAU_LIBDRM_VRAM_LIMIT_PERCENT");
+	if (tmp)
+		nvdev->vram_limit_percent = atoi(tmp);
+	else
+		nvdev->vram_limit_percent = 80;
+	tmp = getenv("NOUVEAU_LIBDRM_GART_LIMIT_PERCENT");
+	if (tmp)
+		nvdev->gart_limit_percent = atoi(tmp);
+	else
+		nvdev->gart_limit_percent = 80;
 	DRMINITLISTHEAD(&nvdev->bo_list);
 	nvdev->base.object.oclass = NOUVEAU_DEVICE_CLASS;
 	nvdev->base.lib_version = 0x01000000;
 	nvdev->base.chipset = chipset;
 	nvdev->base.vram_size = vram;
 	nvdev->base.gart_size = gart;
-	nvdev->base.vram_limit = (nvdev->base.vram_size * 80) / 100;
-	nvdev->base.gart_limit = (nvdev->base.gart_size * 80) / 100;
+	nvdev->base.vram_limit =
+		(nvdev->base.vram_size * nvdev->vram_limit_percent) / 100;
+	nvdev->base.gart_limit =
+		(nvdev->base.gart_size * nvdev->gart_limit_percent) / 100;
 
 	*pdev = &nvdev->base;
 	return 0;
diff --git a/nouveau/private.h b/nouveau/private.h
index 8a5cb26..60714b8 100644
--- a/nouveau/private.h
+++ b/nouveau/private.h
@@ -99,6 +99,7 @@ struct nouveau_device_priv {
 	uint32_t *client;
 	int nr_client;
 	bool have_bo_usage;
+	int gart_limit_percent, vram_limit_percent;
 };
 
 static inline struct nouveau_device_priv *
diff --git a/nouveau/pushbuf.c b/nouveau/pushbuf.c
index e720a08..0fd0c47 100644
--- a/nouveau/pushbuf.c
+++ b/nouveau/pushbuf.c
@@ -347,8 +347,10 @@ pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 					  &req, sizeof(req));
 		nvpb->suffix0 = req.suffix0;
 		nvpb->suffix1 = req.suffix1;
-		dev->vram_limit = (req.vram_available * 80) / 100;
-		dev->gart_limit = (req.gart_available * 80) / 100;
+		dev->vram_limit = (req.vram_available *
+				nouveau_device(dev)->vram_limit_percent) / 100;
+		dev->gart_limit = (req.gart_available *
+				nouveau_device(dev)->gart_limit_percent) / 100;
 #else
 		if (dbg_on(31))
 			ret = -EINVAL;
-- 
1.8.1.4
