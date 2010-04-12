From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Support writing out the pushbuffer in renouveau
	trace format
Date: Mon, 12 Apr 2010 17:46:23 +0200
Message-ID: <1271087183-30350-1-git-send-email-luca@luca-barbieri.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch causes libdrm, when NOUVEAU_DUMP=1 is set, to write the
pushbuffer to stdout instead of submitting it to the card.

renouveau-parse can then be used to parse it and obtain a readable
trace.

This is very useful for debugging and optimizing the Gallium driver.
---
 nouveau/nouveau_private.h |    2 ++
 nouveau/nouveau_pushbuf.c |   29 +++++++++++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 5a952f7..aa8a9c8 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -40,6 +40,8 @@
 #define CALPB_BUFFERS 4
 #define CALPB_BUFSZ   16384
 struct nouveau_pushbuf_priv {
+	char dump;
+	char no_submit;
 	uint32_t cal_suffix0;
 	uint32_t cal_suffix1;
 	struct nouveau_bo *buffer[CALPB_BUFFERS];
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 28b8018..8afdfdc 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -124,6 +124,9 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	nvpb->dump = !!getenv("NOUVEAU_DUMP");
+	nvpb->no_submit = !!getenv("NOUVEAU_NO_SUBMIT");
+
 	ret = nouveau_pushbuf_space(chan, 0);
 	if (ret)
 		return ret;
@@ -235,6 +238,22 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 	if (!nvpb->nr_push)
 		return 0;
 
+	if(nvpb->dump) {
+		unsigned i;
+		for(i = 0; i < nvpb->nr_push; ++i) {
+			uint32_t *p, *pend;
+			struct nouveau_bo *bo = (struct nouveau_bo *)nvpb->buffers[nvpb->push[i].bo_index].user_priv;
+			if(!bo->map)
+				nouveau_bo_map(bo, NOUVEAU_BO_RD);
+			p = bo->map + nvpb->push[i].offset;
+			pend = (char*)p + nvpb->push[i].length;
+			printf("# pb #%i offset %i dwords %i\n", (int)i, (int)nvpb->push[i].offset, (int)(pend - p));
+			for(; p != pend; ++p)
+				printf("%08x\n", *p);
+			printf("# end\n");
+		}
+	}
+
 	req.channel = chan->id;
 	req.nr_push = nvpb->nr_push;
 	req.push = (uint64_t)(unsigned long)nvpb->push;
@@ -245,10 +264,12 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 	req.suffix0 = nvpb->cal_suffix0;
 	req.suffix1 = nvpb->cal_suffix1;
 
-	do {
-		ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_GEM_PUSHBUF,
-					  &req, sizeof(req));
-	} while (ret == -EAGAIN);
+	if(!nvpb->no_submit) {
+		do {
+			ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_GEM_PUSHBUF,
+						  &req, sizeof(req));
+		} while (ret == -EAGAIN);
+	}
 	nvpb->cal_suffix0 = req.suffix0;
 	nvpb->cal_suffix1 = req.suffix1;
 	nvdev->base.vm_vram_size = req.vram_available;
-- 
1.7.0.1.147.g6d84b
