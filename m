From: Maxime COSTE <frrrwww-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50: wait for fifo completion when needed
Date: Fri, 3 Jul 2009 00:06:53 +0200
Message-ID: <20090702220653.GA16347@tchanem>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

This fixes kms for 9800M and possibly 9600M

Signed-off-by: Maxime COSTE <frrrwww-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.h  |    8 ++++++++
 drivers/gpu/drm/nouveau/nv50_crtc.c    |    5 +++++
 drivers/gpu/drm/nouveau/nv50_cursor.c  |    2 ++
 drivers/gpu/drm/nouveau/nv50_display.c |    2 ++
 4 files changed, 17 insertions(+), 0 deletions(-)

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
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index d8e8f1b..dba8b93 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -176,6 +176,7 @@ static int nv50_crtc_set_dither(struct nouveau_crtc *crtc, bool update)
 		BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 		OUT_RING  (evo, 0);
 		FIRE_RING (evo);
+		RING_WAIT (evo);
 	}
 
 	return 0;
@@ -294,6 +295,7 @@ nv50_crtc_set_scale(struct nouveau_crtc *crtc, int scaling_mode, bool update)
 		BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 		OUT_RING  (evo, 0);
 		FIRE_RING (evo);
+		RING_WAIT (evo);
 	}
 
 	return 0;
@@ -520,6 +522,7 @@ static void nv50_crtc_commit(struct drm_crtc *drm_crtc)
 	BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 	OUT_RING  (evo, 0);
 	FIRE_RING (evo);
+	RING_WAIT (evo);
 }
 
 static bool nv50_crtc_mode_fixup(struct drm_crtc *drm_crtc,
@@ -612,6 +615,7 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *drm_crtc, int x, int y,
 		BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 		OUT_RING  (evo, 0);
 		FIRE_RING (evo);
+		RING_WAIT (evo);
 	}
 
 	return 0;
@@ -726,6 +730,7 @@ nv50_crtc_mode_set(struct drm_crtc *drm_crtc, struct drm_display_mode *mode,
 	crtc->set_scale(crtc, connector->scaling_mode, false);
 
 	FIRE_RING (evo);
+	RING_WAIT (evo);
 	return nv50_crtc_do_mode_set_base(drm_crtc, x, y, old_fb, false);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv50_cursor.c b/drivers/gpu/drm/nouveau/nv50_cursor.c
index 23234e5..9d69888 100644
--- a/drivers/gpu/drm/nouveau/nv50_cursor.c
+++ b/drivers/gpu/drm/nouveau/nv50_cursor.c
@@ -60,6 +60,7 @@ nv50_cursor_show(struct nouveau_crtc *crtc, bool update)
 		BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 		OUT_RING  (evo, 0);
 		FIRE_RING (evo);
+		RING_WAIT (evo);
 		crtc->cursor.visible = true;
 	}
 }
@@ -92,6 +93,7 @@ nv50_cursor_hide(struct nouveau_crtc *crtc, bool update)
 		BEGIN_RING(evo, 0, NV50_UPDATE_DISPLAY, 1);
 		OUT_RING  (evo, 0);
 		FIRE_RING (evo);
+		RING_WAIT (evo);
 		crtc->cursor.visible = false;
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 5c38c78..f264bae 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -242,6 +242,7 @@ nv50_display_init(struct drm_device *dev)
 	BEGIN_RING(&evo->chan, 0, NV50_CRTC0_UNK82C, 1);
 	OUT_RING  (&evo->chan, 0);
 	FIRE_RING (&evo->chan);
+	RING_WAIT (&evo->chan);
 
 	/* enable clock change interrupts. */
 	nv_wr32(NV50_PDISPLAY_INTR_EN, (NV50_PDISPLAY_INTR_EN_CLK_UNK10 |
@@ -274,6 +275,7 @@ static int nv50_display_disable(struct drm_device *dev)
 	BEGIN_RING(&dev_priv->evo.chan, 0, NV50_UPDATE_DISPLAY, 1);
 	OUT_RING  (&dev_priv->evo.chan, 0);
 	FIRE_RING (&dev_priv->evo.chan);
+	RING_WAIT (&dev_priv->evo.chan);
 
 	/* Almost like ack'ing a vblank interrupt, maybe in the spirit of
 	 * cleaning up?
-- 
1.6.3.3
