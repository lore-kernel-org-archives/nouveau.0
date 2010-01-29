From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 2/2] libdrm/nouveau: support writing out the
	pushbuffer in renouveau trace format
Date: Fri, 29 Jan 2010 09:54:23 +0100
Message-ID: <1264755263-24784-1-git-send-email-luca@luca-barbieri.com>
References: <1264755205-21514-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1264755205-21514-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch causes libdrm, when NOUVEAU_DUMP=1 is set, to write the
pushbuffer to stdout instead of submitting it to the card.

renouveau-parse can then be used to parse it and obtain a readable
trace.

This is very useful for debugging and optimizing the Gallium driver.
---
 nouveau/nouveau_private.h |    1 +
 nouveau/nouveau_pushbuf.c |   13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 0e526a1..bed117a 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -40,6 +40,7 @@
 #define CALPB_BUFSZ   16384
 struct nouveau_pushbuf_priv {
 	int no_aper_update;
+	int use_dump;
 	int use_cal;
 	uint32_t cal_suffix0;
 	uint32_t cal_suffix1;
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index b6af216..4cb8985 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -148,7 +148,10 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
 	struct nouveau_pushbuf_priv *nvpb = &nvchan->pb;
 	int ret;
 
-	nouveau_pushbuf_init_call(chan);
+	if(getenv("NOUVEAU_DUMP"))
+		nvpb->use_dump = 1;
+	if(!nvpb->use_dump)
+		nouveau_pushbuf_init_call(chan);
 
 	ret = nouveau_pushbuf_space(chan, 0);
 	if (ret) {
@@ -190,7 +193,13 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 	if (chan->cur == nvpb->pushbuf)
 		return 0;
 
-	if (nvpb->use_cal) {
+	if (nvpb->use_dump) {
+		uint32_t* p;
+		printf("# begin %i dwords %i buffers %i relocs\n", chan->cur - nvpb->pushbuf, nvpb->nr_buffers, nvpb->nr_relocs);
+		for(p = nvpb->pushbuf; p != chan->cur; ++p)
+			printf("%08x\n", *p);	
+		printf("# end\n");
+	} else if (nvpb->use_cal) {
 		struct drm_nouveau_gem_pushbuf_call req;
 
 		*(chan->cur++) = nvpb->cal_suffix0;
-- 
1.6.6.1.476.g01ddb
