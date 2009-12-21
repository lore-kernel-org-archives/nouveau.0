From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: [PATCH 2/2] libdrm: Unreference pushbuf objects on
	channel destruction
Date: Mon, 21 Dec 2009 15:11:06 +0100
Message-ID: <4B2F81FA.8090905@wp.pl>
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

- unreference pushbuf objects on channel destruction

Index: nouveau/nouveau_pushbuf.c
===================================================================
--- nouveau/nouveau_pushbuf.c	(wersja 32082)
+++ nouveau/nouveau_pushbuf.c	(kopia robocza)
@@ -262,6 +262,12 @@
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
Index: nouveau/nouveau_private.h
===================================================================
--- nouveau/nouveau_private.h	(wersja 32082)
+++ nouveau/nouveau_private.h	(kopia robocza)
@@ -65,6 +65,9 @@
  int
  nouveau_pushbuf_init(struct nouveau_channel *);

+void
+nouveau_pushbuf_fini(struct nouveau_channel *);
+
  struct nouveau_channel_priv {
  	struct nouveau_channel base;

Index: nouveau/nouveau_channel.c
===================================================================
--- nouveau/nouveau_channel.c	(wersja 32002)
+++ nouveau/nouveau_channel.c	(kopia robocza)
@@ -111,6 +111,8 @@

  	FIRE_RING(&nvchan->base);

+	nouveau_pushbuf_fini(&nvchan->base);
+
  	nouveau_bo_unmap(nvchan->notifier_bo);
  	nouveau_bo_ref(NULL, &nvchan->notifier_bo);
