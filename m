From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Support writing out the pushbuffer in renouveau
	trace format (v3)
Date: Sat, 17 Apr 2010 12:40:25 +0200
Message-ID: <1271500825-14101-1-git-send-email-luca@luca-barbieri.com>
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

Changes in v3:
- NOUVEAU_DUMP now takes a filename, and we dump to that file
- The file is fflushed after every pushbuffer dump

Changes in v2:
- Unmap buffers we mapped, avoid assertion
- Silence warnings

This patch causes libdrm, when NOUVEAU_DUMP=<file> is set, to write the
pushbuffer to stdout instead of submitting it to the card.

renouveau-parse can then be used to parse it and obtain a readable
trace.

This is very useful for debugging and optimizing the Gallium driver.
---
 nouveau/nouveau_private.h |    3 +++
 nouveau/nouveau_pushbuf.c |   39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 5a952f7..53928d2 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -24,6 +24,7 @@
 #define __NOUVEAU_PRIVATE_H__
 
 #include <stdint.h>
+#include <stdio.h>
 #include <xf86drm.h>
 #include <nouveau_drm.h>
 
@@ -40,6 +41,8 @@
 #define CALPB_BUFFERS 4
 #define CALPB_BUFSZ   16384
 struct nouveau_pushbuf_priv {
+	FILE* dump_file;
+	char no_submit;
 	uint32_t cal_suffix0;
 	uint32_t cal_suffix1;
 	struct nouveau_bo *buffer[CALPB_BUFFERS];
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 28b8018..53da8cf 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -119,11 +119,17 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
 	struct nouveau_channel_priv *nvchan = nouveau_channel(chan);
 	struct nouveau_pushbuf_priv *nvpb = &nvchan->pb;
 	int ret;
+	char* dump_filename;
 
 	ret = nouveau_pushbuf_init_call(chan);
 	if (ret)
 		return ret;
 
+	dump_filename = getenv("NOUVEAU_DUMP");
+	if(dump_filename)
+		nvpb->dump_file = fopen(dump_filename, "w");
+	nvpb->no_submit = !!getenv("NOUVEAU_NO_SUBMIT");
+
 	ret = nouveau_pushbuf_space(chan, 0);
 	if (ret)
 		return ret;
@@ -235,6 +241,29 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 	if (!nvpb->nr_push)
 		return 0;
 
+	if(nvpb->dump_file) {
+		unsigned i;
+		for(i = 0; i < nvpb->nr_push; ++i) {
+			uint32_t *p, *pend;
+			struct nouveau_bo *bo = (struct nouveau_bo *)(unsigned long)nvpb->buffers[nvpb->push[i].bo_index].user_priv;
+			int mapped = 0;
+			if(!bo->map)
+			{
+				mapped = 1;
+				nouveau_bo_map(bo, NOUVEAU_BO_RD);
+			}
+			p = (uint32_t*)((char*)bo->map + nvpb->push[i].offset);
+			pend = (uint32_t*)((char*)p + nvpb->push[i].length);
+			fprintf(nvpb->dump_file, "# pb #%i offset %i dwords %i\n", (int)i, (int)nvpb->push[i].offset, (int)(pend - p));
+			for(; p < pend; ++p)
+				fprintf(nvpb->dump_file, "%08x\n", *p);
+			printf(nvpb->dump_file, "# end\n");
+			fflush(nvpb->dump_file);
+			if(mapped)
+				nouveau_bo_unmap(bo);
+		}
+	}
+
 	req.channel = chan->id;
 	req.nr_push = nvpb->nr_push;
 	req.push = (uint64_t)(unsigned long)nvpb->push;
@@ -245,10 +274,12 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
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
