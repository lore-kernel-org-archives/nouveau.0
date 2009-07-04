From: Maxime COSTE <frrrwww-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50: wait for fifo completion in
	nv50_display_init
Date: Sat, 4 Jul 2009 13:38:26 +0200
Message-ID: <20090704113826.GA5445@tchanem>
References: <20090702220653.GA16347@tchanem>
	<6d4bc9fc0907021420i42f22fe4p751e7f5181085b9d@mail.gmail.com>
	<1246571566.2709.2.camel@nisroch> <20090702231915.GA6968@tchanem>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090702231915.GA6968@tchanem>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Actually the only needed RING_WAIT is in nv50_display.

---
 drivers/gpu/drm/nouveau/nouveau_dma.h  |    8 ++++++++
 drivers/gpu/drm/nouveau/nv50_display.c |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 9498c45..399436f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -128,6 +128,14 @@ FIRE_RING(struct nouveau_channel *chan)
 }
 
 static inline void
+RING_WAIT(struct nouveau_channel *chan)
+{
+	nouveau_wait_until(chan->dev, 2000000000ULL, 
+		NV50_PDISPLAY_USER_GET(0), 0xffffffff,
+		(chan->dma.cur << 2) + chan->pushbuf_base);
+}
+
+static inline void
 WIND_RING(struct nouveau_channel *chan)
 {
 	chan->dma.cur = chan->dma.put;
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 5c38c78..16b94d7 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -242,6 +242,7 @@ nv50_display_init(struct drm_device *dev)
 	BEGIN_RING(&evo->chan, 0, NV50_CRTC0_UNK82C, 1);
 	OUT_RING  (&evo->chan, 0);
 	FIRE_RING (&evo->chan);
+	RING_WAIT (&evo->chan);
 
 	/* enable clock change interrupts. */
 	nv_wr32(NV50_PDISPLAY_INTR_EN, (NV50_PDISPLAY_INTR_EN_CLK_UNK10 |
-- 
1.6.3.3
