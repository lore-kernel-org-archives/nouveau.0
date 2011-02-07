From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] exa: Flush (S)IFC to the frontbuffer immediately.
Date: Mon,  7 Feb 2011 19:37:47 +0100
Message-ID: <1297103867-5718-1-git-send-email-madman2003@gmail.com>
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

- NV50+: This avoids high latency while typing with core fonts for example.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv04_exa.c |    4 ++++
 src/nv50_exa.c |    4 ++++
 src/nvc0_exa.c |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/src/nv04_exa.c b/src/nv04_exa.c
index 267c7b5..2603bd4 100644
--- a/src/nv04_exa.c
+++ b/src/nv04_exa.c
@@ -340,6 +340,7 @@ NV04EXAUploadIFC(ScrnInfoPtr pScrn, const char *src, int src_pitch,
 		 PixmapPtr pDst, int x, int y, int w, int h, int cpp)
 {
 	NVPtr pNv = NVPTR(pScrn);
+	ScreenPtr pScreen = pDst->drawable.pScreen;
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *clip = pNv->NvClipRectangle;
 	struct nouveau_grobj *ifc = pNv->NvImageFromCpu;
@@ -413,6 +414,9 @@ NV04EXAUploadIFC(ScrnInfoPtr pScrn, const char *src, int src_pitch,
 	}
 
 	chan->flush_notify = NULL;
+
+	if (pDst == pScreen->GetScreenPixmap(pScreen))
+		FIRE_RING(chan);
 	return TRUE;
 }
 
diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index e8ff5aa..85baa68 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -372,6 +372,7 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
 		  PixmapPtr pdpix, int x, int y, int w, int h, int cpp)
 {
 	NV50EXA_LOCALS(pdpix);
+	ScreenPtr pScreen = pdpix->drawable.pScreen;
 	int line_dwords = (w * cpp + 3) / 4;
 	uint32_t sifc_fmt;
 
@@ -428,6 +429,9 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
 	}
 
 	chan->flush_notify = NULL;
+
+	if (pdpix == pScreen->GetScreenPixmap(pScreen))
+		FIRE_RING(chan);
 	return TRUE;
 }
 
diff --git a/src/nvc0_exa.c b/src/nvc0_exa.c
index 45647ce..85cb5d2 100644
--- a/src/nvc0_exa.c
+++ b/src/nvc0_exa.c
@@ -550,6 +550,7 @@ NVC0EXAUploadSIFC(const char *src, int src_pitch,
 		  PixmapPtr pdpix, int x, int y, int w, int h, int cpp)
 {
 	NVC0EXA_LOCALS(pdpix);
+	ScreenPtr pScreen = pdpix->drawable.pScreen;
 	int line_dwords = (w * cpp + 3) / 4;
 	uint32_t sifc_fmt;
 
@@ -608,6 +609,9 @@ NVC0EXAUploadSIFC(const char *src, int src_pitch,
 	}
 
 	chan->flush_notify = NULL;
+
+	if (pdpix == pScreen->GetScreenPixmap(pScreen))
+		FIRE_RING(chan);
 	return TRUE;
 }
 
-- 
1.7.4.rc3
