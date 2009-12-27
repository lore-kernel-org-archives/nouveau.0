From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: [PATCH 2/2] libdrm: Unreference pushbuf objects
	on	channel destruction
Date: Sun, 27 Dec 2009 11:02:44 +0100
Message-ID: <4B3730C4.6000903@wp.pl>
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

(resending as git patch)

- unreference pushbuf objects on channel destruction


diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
index 674c5c3..6f71f89 100644
--- a/nouveau/nouveau_channel.c
+++ b/nouveau/nouveau_channel.c
@@ -111,6 +111,8 @@ nouveau_channel_free(struct nouveau_channel **chan)

  	FIRE_RING(&nvchan->base);

+	nouveau_pushbuf_fini(&nvchan->base);
+
  	nouveau_bo_unmap(nvchan->notifier_bo);
  	nouveau_bo_ref(NULL, &nvchan->notifier_bo);

diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 784afc9..de21a6b 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -65,6 +65,9 @@ struct nouveau_pushbuf_priv {
  int
  nouveau_pushbuf_init(struct nouveau_channel *);

+void
+nouveau_pushbuf_fini(struct nouveau_channel *);
+
  struct nouveau_channel_priv {
  	struct nouveau_channel base;

diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index b90e923..c4053ed 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -170,6 +170,12 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
  	return 0;
  }

+void
+nouveau_pushbuf_fini(struct nouveau_channel *chan)
+{
+	nouveau_pushbuf_fini_call(chan);
+}
+
  int
  nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
  {
