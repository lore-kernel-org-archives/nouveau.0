From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Add NOUVEAU_VTXIDX_IN_VRAM variable to put vertex/index
 buffers in VRAM
Date: Wed, 30 Dec 2009 18:14:03 +0100
Message-ID: <1262193243.3768.15.camel@localhost>
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On some systems, putting vertex and index buffers in VRAM instead of
GART memory eliminates massive graphics corruption which is otherwise
present, due to unclear causes.

This patch adds an environment variable that does that, along with
helpful messages, prompting the user the report his configuration if we
got the default setting wrong.

It turns it on by default on NV49, as it is what I am seeing corruption
on.
This needs investigation and user reports to find out which cards are
susceptible.
---
 src/gallium/drivers/nouveau/nouveau_screen.c |   57 +++++++++++++++++++++++--
 src/gallium/drivers/nouveau/nouveau_screen.h |    2 +
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 0437af3..a30c9c6 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -47,11 +47,54 @@ nouveau_screen_bo_skel(struct pipe_screen *pscreen, struct nouveau_bo *bo,
 	return pb;
 }
 
+static void
+nouveau_screen_bo_init(struct nouveau_screen* screen)
+{
+	screen->vertex_buffer_flags = 0;
+	screen->index_buffer_flags = 0;
+	if(screen->base.get_param(&screen->base, NOUVEAU_CAP_HW_VTXBUF) || screen->base.get_param(&screen->base, NOUVEAU_CAP_HW_IDXBUF))
+	{
+		int vram_hack_default = 0;
+		int vram_hack;
+		// TODO: add other cards that may need this hack.
+		// It may also depend on the specific card, CPU or AGP/PCIe chipset.
+		if(screen->device->chipset == 0x49)
+			vram_hack_default = 1;
+		vram_hack = debug_get_bool_option("NOUVEAU_VTXIDX_IN_VRAM", vram_hack_default);
+
+		if(!vram_hack)
+		{
+			printf(
+				"Some systems may experience graphics corruption due to randomly misplaced vertices.\n"
+				"If this is happening, export NOUVEAU_VTXIDX_IN_VRAM=1 may reduce or eliminate the problem\n");
+			if(vram_hack == vram_hack_default)
+				printf("If it helps, please describe your hardware configuration and software versions to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org\n");
+			else
+				printf("If you are not experiencing any corruption in complex 3D applications, please describe your hardware configuration and software versions to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org\n");
+		}
+		else
+		{
+			printf(
+				"A performance reducing hack is being used to help avoid graphics corruption.\n"
+				"You can try export NOUVEAU_VTXIDX_IN_VRAM=0 to disable it.\n");
+			if(vram_hack == vram_hack_default)
+				printf("If it doesn't make things worse, please describe your hardware configuration and software versions to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org\n");
+		}
+
+		if (screen->base.get_param(&screen->base, NOUVEAU_CAP_HW_VTXBUF))
+			screen->vertex_buffer_flags |= vram_hack ? NOUVEAU_BO_VRAM : NOUVEAU_BO_GART;
+
+		if (screen->base.get_param(&screen->base, NOUVEAU_CAP_HW_IDXBUF))
+			screen->index_buffer_flags |= vram_hack ? NOUVEAU_BO_VRAM : NOUVEAU_BO_GART;
+	}
+}
+
 static struct pipe_buffer *
 nouveau_screen_bo_new(struct pipe_screen *pscreen, unsigned alignment,
 		      unsigned usage, unsigned size)
 {
-	struct nouveau_device *dev = nouveau_screen(pscreen)->device;
+	struct nouveau_screen* screen = nouveau_screen(pscreen);
+	struct nouveau_device *dev = screen->device;
 	struct nouveau_bo *bo = NULL;
 	uint32_t flags = NOUVEAU_BO_MAP;
 	int ret;
@@ -60,12 +103,14 @@ nouveau_screen_bo_new(struct pipe_screen *pscreen, unsigned alignment,
 		flags |= NOUVEAU_BO_GART;
 	else
 	if (usage & PIPE_BUFFER_USAGE_VERTEX) {
-		if (pscreen->get_param(pscreen, NOUVEAU_CAP_HW_VTXBUF))
-			flags |= NOUVEAU_BO_GART;
+		if(screen->vertex_buffer_flags < 0)
+			nouveau_screen_bo_init(screen);
+		flags |= screen->vertex_buffer_flags;
 	} else
 	if (usage & PIPE_BUFFER_USAGE_INDEX) {
-		if (pscreen->get_param(pscreen, NOUVEAU_CAP_HW_IDXBUF))
-			flags |= NOUVEAU_BO_GART;
+		if(screen->index_buffer_flags < 0)
+			nouveau_screen_bo_init(screen);
+		flags |= screen->index_buffer_flags;
 	}
 
 	if (usage & PIPE_BUFFER_USAGE_PIXEL) {
@@ -233,6 +278,8 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
 	pscreen->fence_signalled = nouveau_screen_fence_signalled;
 	pscreen->fence_finish = nouveau_screen_fence_finish;
 
+	screen->vertex_buffer_flags = -1;
+	screen->index_buffer_flags = -1;
 	return 0;
 }
 
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index ebfc67a..ed32b35 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -5,6 +5,8 @@ struct nouveau_screen {
 	struct pipe_screen base;
 	struct nouveau_device *device;
 	struct nouveau_channel *channel;
+	int vertex_buffer_flags;
+	int index_buffer_flags;
 };
 
 static inline struct nouveau_screen *
-- 
1.6.3.3
