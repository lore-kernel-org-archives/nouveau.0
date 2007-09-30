From: Stephan Schmid <stephan_2303-S0/GAf8tV78@public.gmane.org>
Subject: [Patch] reenable fifos if we get an error while fifos
	disabled
Date: Sun, 30 Sep 2007 20:46:58 +0200
Message-ID: <46FFEF22.8080205@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010606040103020404040001"
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
To: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------010606040103020404040001
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
while playing around with multiple fifo contexts I got fifo hangs when opening glxgears nr.3.
The reason is that in drm/linux_core/nouveau_fifo.c l.342 engine->graph.create_context() returns 
-ENOMEM (I dont know why but I think this problems also appears with other errors).
But the real problem is that then nouveau_fifo alloc() returns without reenabling fifo execution, 
so all fifos hang. 
With this patch glxgears nr.3 only prints scary messages and falls back to software rendering.

Greetings
Stephan Schmid


--------------010606040103020404040001
Content-Type: text/plain;
 name="patch_fifo_reenable"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch_fifo_reenable"

diff --git a/shared-core/nouveau_fifo.c b/shared-core/nouveau_fifo.c
index 437c84f..88a429a 100644
--- a/shared-core/nouveau_fifo.c
+++ b/shared-core/nouveau_fifo.c
@@ -342,6 +342,16 @@ nouveau_fifo_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	ret = engine->graph.create_context(chan);
 	if (ret) {
 		nouveau_fifo_free(chan);
+
+		NV_WRITE(NV04_PFIFO_CACHE1_DMA_PUSH,
+		NV_READ(NV04_PFIFO_CACHE1_DMA_PUSH) | 1);
+		NV_WRITE(NV03_PFIFO_CACHE1_PUSH0, 0x00000001);
+		NV_WRITE(NV04_PFIFO_CACHE1_PULL0, 0x00000001);
+		NV_WRITE(NV04_PFIFO_CACHE1_PULL1, 0x00000001);
+
+		/* reenable the fifo caches */
+		NV_WRITE(NV03_PFIFO_CACHES, 1);
+
 		return ret;
 	}
 
@@ -349,6 +359,16 @@ nouveau_fifo_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	ret = engine->fifo.create_context(chan);
 	if (ret) {
 		nouveau_fifo_free(chan);
+
+		NV_WRITE(NV04_PFIFO_CACHE1_DMA_PUSH,
+		NV_READ(NV04_PFIFO_CACHE1_DMA_PUSH) | 1);
+		NV_WRITE(NV03_PFIFO_CACHE1_PUSH0, 0x00000001);
+		NV_WRITE(NV04_PFIFO_CACHE1_PULL0, 0x00000001);
+		NV_WRITE(NV04_PFIFO_CACHE1_PULL1, 0x00000001);
+
+		/* reenable the fifo caches */
+		NV_WRITE(NV03_PFIFO_CACHES, 1);
+
 		return ret;
 	}
 


--------------010606040103020404040001
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------010606040103020404040001--
