From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: RFC: gallium/nv50: get rid of the screen_init stateobj
Date: Sun, 14 Mar 2010 11:32:04 +0100
Message-ID: <4B9CBB24.60202@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090405030603010107030606"
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
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------090405030603010107030606
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.
There's not much to say here, just replacing the screen_init
stateobj with direct pushbuffer emission.

We don't need to store all the usless state from init, and the
constant buffer relocations which currently don't work if the
addresses change (because the method CB_DEF_SET isn't
among them (not an address)) become effective.

Thoughts, ack / nack ?
Thanks,
  Christoph


--------------090405030603010107030606
Content-Type: text/plain;
 name="0001-nv50-get-rid-of-the-screen_init-stateobj.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-nv50-get-rid-of-the-screen_init-stateobj.patch"

From f37dea43c705683a89e31da78200872cc00ac967 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 14 Mar 2010 11:19:27 +0100
Subject: [PATCH] nv50: get rid of the screen_init stateobj

Relocations of per-screen buffers are now emitted directly,
and include the necessary method to get changes in constbuf
addresses committed to the hw.

It should also be a bit cheaper than the way stateobjs emit
relocation markers, use a little less pushbuf space.
---
 src/gallium/drivers/nv50/nv50_screen.c         |  275 ++++++++++++------------
 src/gallium/drivers/nv50/nv50_screen.h         |    2 +
 src/gallium/drivers/nv50/nv50_state_validate.c |    2 +-
 3 files changed, 141 insertions(+), 138 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index adf0d3b..2b0c9fd 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -204,16 +204,62 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
 	FREE(screen);
 }
 
+void
+nv50_screen_relocs(struct nv50_screen *screen)
+{
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *tesla = screen->tesla;
+	unsigned i;
+	const unsigned rl = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_DUMMY;
+
+	/* cause grobj autobind */
+	BEGIN_RING(chan, tesla, 0x0100, 1);
+	OUT_RING  (chan, 0);
+
+	OUT_RELOC (chan, screen->tic, (tesla->subc << 13) |
+		   NV50TCL_TIC_ADDRESS_HIGH | (2 << 18), rl, 0, 0);
+	OUT_RELOCh(chan, screen->tic, 0, rl);
+	OUT_RELOCl(chan, screen->tic, 0, rl);
+
+	OUT_RELOC (chan, screen->tsc, (tesla->subc << 13) |
+		   NV50TCL_TSC_ADDRESS_HIGH | (2 << 18), rl, 0, 0);
+	OUT_RELOCh(chan, screen->tsc, 0, rl);
+	OUT_RELOCl(chan, screen->tsc, 0, rl);
+
+	OUT_RELOC (chan, screen->constbuf_misc[0], (tesla->subc << 13) |
+		   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+	OUT_RELOCh(chan, screen->constbuf_misc[0], 0, rl);
+	OUT_RELOCl(chan, screen->constbuf_misc[0], 0, rl);
+	OUT_RELOC (chan, screen->constbuf_misc[0],
+		   (NV50_CB_PMISC << 16) | 0x0200, rl, 0, 0);
+
+	OUT_RELOC (chan, screen->constbuf_misc[0], (tesla->subc << 13) |
+		   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+	OUT_RELOCh(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RELOCl(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RELOC (chan, screen->constbuf_misc[0],
+		   (NV50_CB_AUX << 16) | 0x0200, rl, 0, 0);
+
+	for (i = 0; i < 3; ++i) {
+		OUT_RELOC (chan, screen->constbuf_parm[i], (tesla->subc << 13) |
+			   NV50TCL_CB_DEF_ADDRESS_HIGH | (3 << 18), rl, 0, 0);
+		OUT_RELOCh(chan, screen->constbuf_parm[i], 0, rl);
+		OUT_RELOCl(chan, screen->constbuf_parm[i], 0, rl);
+		OUT_RELOC (chan, screen->constbuf_parm[i],
+			   ((NV50_CB_PVP + i) << 16) | 0x0800, rl, 0, 0);
+	}
+}
+
 struct pipe_screen *
 nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
 	struct nv50_screen *screen = CALLOC_STRUCT(nv50_screen);
 	struct nouveau_channel *chan;
 	struct pipe_screen *pscreen;
-	struct nouveau_stateobj *so;
 	unsigned chipset = dev->chipset;
 	unsigned tesla_class = 0;
 	int ret, i;
+	const unsigned rl = NOUVEAU_BO_VRAM | NOUVEAU_BO_RD;
 
 	if (!screen)
 		return NULL;
@@ -296,64 +342,58 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	}
 
 	/* Static M2MF init */
-	so = so_new(1, 3, 0);
-	so_method(so, screen->m2mf, NV04_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 3);
-	so_data  (so, screen->sync->handle);
-	so_data  (so, chan->vram->handle);
-	so_data  (so, chan->vram->handle);
-	so_emit(chan, so);
-	so_ref (NULL, &so);
+	BEGIN_RING(chan, screen->m2mf,
+		   NV04_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 3);
+	OUT_RING  (chan, screen->sync->handle);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->vram->handle);
 
 	/* Static 2D init */
-	so = so_new(4, 7, 0);
-	so_method(so, screen->eng2d, NV50_2D_DMA_NOTIFY, 4);
-	so_data  (so, screen->sync->handle);
-	so_data  (so, chan->vram->handle);
-	so_data  (so, chan->vram->handle);
-	so_data  (so, chan->vram->handle);
-	so_method(so, screen->eng2d, NV50_2D_OPERATION, 1);
-	so_data  (so, NV50_2D_OPERATION_SRCCOPY);
-	so_method(so, screen->eng2d, NV50_2D_CLIP_ENABLE, 1);
-	so_data  (so, 0);
-	so_method(so, screen->eng2d, 0x0888, 1);
-	so_data  (so, 1);
-	so_emit(chan, so);
-	so_ref(NULL, &so);
+	BEGIN_RING(chan, screen->eng2d, NV50_2D_DMA_NOTIFY, 4);
+	OUT_RING  (chan, screen->sync->handle);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->vram->handle);
+	BEGIN_RING(chan, screen->eng2d, NV50_2D_OPERATION, 1);
+	OUT_RING  (chan, NV50_2D_OPERATION_SRCCOPY);
+	BEGIN_RING(chan, screen->eng2d, NV50_2D_CLIP_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, screen->eng2d, 0x0888, 1);
+	OUT_RING  (chan, 1);
 
 	/* Static tesla init */
-	so = so_new(47, 95, 24);
-
-	so_method(so, screen->tesla, NV50TCL_COND_MODE, 1);
-	so_data  (so, NV50TCL_COND_MODE_ALWAYS);
-	so_method(so, screen->tesla, NV50TCL_DMA_NOTIFY, 1);
-	so_data  (so, screen->sync->handle);
-	so_method(so, screen->tesla, NV50TCL_DMA_ZETA, 11);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_COND_MODE, 1);
+	OUT_RING  (chan, NV50TCL_COND_MODE_ALWAYS);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_DMA_NOTIFY, 1);
+	OUT_RING  (chan, screen->sync->handle);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_DMA_ZETA, 11);
 	for (i = 0; i < 11; i++)
-		so_data(so, chan->vram->handle);
-	so_method(so, screen->tesla, NV50TCL_DMA_COLOR(0),
-				     NV50TCL_DMA_COLOR__SIZE);
+		OUT_RING  (chan, chan->vram->handle);
+	BEGIN_RING(chan, screen->tesla,
+		   NV50TCL_DMA_COLOR(0), NV50TCL_DMA_COLOR__SIZE);
 	for (i = 0; i < NV50TCL_DMA_COLOR__SIZE; i++)
-		so_data(so, chan->vram->handle);
-	so_method(so, screen->tesla, NV50TCL_RT_CONTROL, 1);
-	so_data  (so, 1);
+		OUT_RING  (chan, chan->vram->handle);
+
+	BEGIN_RING(chan, screen->tesla, NV50TCL_RT_CONTROL, 1);
+	OUT_RING  (chan, 1);
 
 	/* activate all 32 lanes (threads) in a warp */
-	so_method(so, screen->tesla, NV50TCL_WARP_HALVES, 1);
-	so_data  (so, 0x2);
-	so_method(so, screen->tesla, 0x1400, 1);
-	so_data  (so, 0xf);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_WARP_HALVES, 1);
+	OUT_RING  (chan, 2);
+	BEGIN_RING(chan, screen->tesla, 0x1400, 1);
+	OUT_RING  (chan, 0xf);
 
 	/* max TIC (bits 4:8) & TSC (ignored) bindings, per program type */
 	for (i = 0; i < 3; ++i) {
-		so_method(so, screen->tesla, NV50TCL_TEX_LIMITS(i), 1);
-		so_data  (so, 0x54);
+		BEGIN_RING(chan, screen->tesla, NV50TCL_TEX_LIMITS(i), 1);
+		OUT_RING  (chan, 0x54);
 	}
 
 	/* origin is top left (set to 1 for bottom left) */
-	so_method(so, screen->tesla, NV50TCL_Y_ORIGIN_BOTTOM, 1);
-	so_data  (so, 0);
-	so_method(so, screen->tesla, NV50TCL_VP_REG_ALLOC_RESULT, 1);
-	so_data  (so, 8);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_Y_ORIGIN_BOTTOM, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_VP_REG_ALLOC_RESULT, 1);
+	OUT_RING  (chan, 8);
 
 	/* constant buffers for immediates and VP/FP parameters */
 	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, (32 * 4) * 4,
@@ -362,6 +402,14 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
+	BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
+	OUT_RELOCh(chan, screen->constbuf_misc[0], 0, rl);
+	OUT_RELOCl(chan, screen->constbuf_misc[0], 0, rl);
+	OUT_RING  (chan, (NV50_CB_PMISC << 16) | 0x0200);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
+	OUT_RELOCh(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RELOCl(chan, screen->constbuf_misc[0], 0x200, rl);
+	OUT_RING  (chan, (NV50_CB_AUX << 16) | 0x0200);
 
 	for (i = 0; i < 3; i++) {
 		ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, (256 * 4) * 4,
@@ -370,6 +418,10 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 			nv50_screen_destroy(pscreen);
 			return NULL;
 		}
+		BEGIN_RING(chan, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
+		OUT_RELOCh(chan, screen->constbuf_parm[i], 0, rl);
+		OUT_RELOCl(chan, screen->constbuf_parm[i], 0, rl);
+		OUT_RING  (chan, ((NV50_CB_PVP + i) << 16) | 0x0800);
 	}
 
 	if (nouveau_resource_init(&screen->immd_heap[0], 0, 128) ||
@@ -381,118 +433,67 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 
-	/*
-	// map constant buffers:
-	//  B = buffer ID (maybe more than 1 byte)
-	//  N = CB index used in shader instruction
-	//  P = program type (0 = VP, 2 = GP, 3 = FP)
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x000BBNP1);
-	*/
-
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf_misc[0], 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PMISC << 16) | 0x00000200);
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000001 | (NV50_CB_PMISC << 12));
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000021 | (NV50_CB_PMISC << 12));
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000031 | (NV50_CB_PMISC << 12));
-
-	/* bind auxiliary constbuf to immediate data bo */
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->constbuf_misc[0], (128 * 4) * 4,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf_misc[0], (128 * 4) * 4,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_AUX << 16) | 0x00000200);
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000201 | (NV50_CB_AUX << 12));
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000221 | (NV50_CB_AUX << 12));
-
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_VERTEX], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_VERTEX], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PVP << 16) | 0x00000800);
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000101 | (NV50_CB_PVP << 12));
-
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_GEOMETRY], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_GEOMETRY], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PGP << 16) | 0x00000800);
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000121 | (NV50_CB_PGP << 12));
-
-	so_method(so, screen->tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_FRAGMENT], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->constbuf_parm[PIPE_SHADER_FRAGMENT], 0,
-		  NOUVEAU_BO_VRAM | NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PFP << 16) | 0x00000800);
-	so_method(so, screen->tesla, NV50TCL_SET_PROGRAM_CB, 1);
-	so_data  (so, 0x00000131 | (NV50_CB_PFP << 12));
-
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, PIPE_SHADER_TYPES*32*32,
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 3 * 32 * 32,
 			     &screen->tic);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
+	BEGIN_RING(chan, screen->tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
+	OUT_RELOCh(chan, screen->tic, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RELOCl(chan, screen->tic, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RING  (chan, 3 * 32 - 1);
 
-	so_method(so, screen->tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->tic, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, PIPE_SHADER_TYPES * 32 - 1);
-
-	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, PIPE_SHADER_TYPES*32*32,
+	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 3 * 32 * 32,
 			     &screen->tsc);
 	if (ret) {
 		nv50_screen_destroy(pscreen);
 		return NULL;
 	}
-
-	so_method(so, screen->tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
-	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, screen->tsc, 0, NOUVEAU_BO_VRAM |
-		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, 0x00000000); /* ignored if TSC_LINKED (0x1234) = 1 */
-
+	BEGIN_RING(chan, screen->tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
+	OUT_RELOCh(chan, screen->tsc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RELOCl(chan, screen->tsc, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD);
+	OUT_RING  (chan, 0); /* ignored if TSC_LINKED (0x1234) == 1 */
+
+	/* map constant buffers:
+	 *  B = buffer ID (maybe more than 1 byte)
+	 *  N = CB index used in shader instruction
+	 *  P = program type (0 = VP, 2 = GP, 3 = FP)
+	 * SET_PROGRAM_CB = 0x000BBNP1
+	 */
+	BEGIN_RING_NI(chan, screen->tesla, NV50TCL_SET_PROGRAM_CB, 8);
+	/* bind immediate buffer */
+	OUT_RING  (chan, 0x001 | (NV50_CB_PMISC << 12));
+	OUT_RING  (chan, 0x021 | (NV50_CB_PMISC << 12));
+	OUT_RING  (chan, 0x031 | (NV50_CB_PMISC << 12));
+	/* bind auxiliary constbuf to immediate data bo */
+	OUT_RING  (chan, 0x201 | (NV50_CB_AUX << 12));
+	OUT_RING  (chan, 0x221 | (NV50_CB_AUX << 12));
+	/* bind parameter buffers */
+	OUT_RING  (chan, 0x101 | (NV50_CB_PVP << 12));
+	OUT_RING  (chan, 0x121 | (NV50_CB_PGP << 12));
+	OUT_RING  (chan, 0x131 | (NV50_CB_PFP << 12));
 
 	/* Vertex array limits - max them out */
 	for (i = 0; i < 16; i++) {
-		so_method(so, screen->tesla, NV50TCL_VERTEX_ARRAY_LIMIT_HIGH(i), 2);
-		so_data  (so, 0x000000ff);
-		so_data  (so, 0xffffffff);
+		BEGIN_RING(chan, screen->tesla,
+			   NV50TCL_VERTEX_ARRAY_LIMIT_HIGH(i), 2);
+		OUT_RING  (chan, 0x000000ff);
+		OUT_RING  (chan, 0xffffffff);
 	}
 
-	so_method(so, screen->tesla, NV50TCL_DEPTH_RANGE_NEAR(0), 2);
-	so_data  (so, fui(0.0));
-	so_data  (so, fui(1.0));
+	BEGIN_RING(chan, screen->tesla, NV50TCL_DEPTH_RANGE_NEAR(0), 2);
+	OUT_RINGf (chan, 0.0f);
+	OUT_RINGf (chan, 1.0f);
 
 	/* no dynamic combination of TIC & TSC entries => only BIND_TIC used */
-	so_method(so, screen->tesla, NV50TCL_LINKED_TSC, 1);
-	so_data  (so, 1);
+	BEGIN_RING(chan, screen->tesla, NV50TCL_LINKED_TSC, 1);
+	OUT_RING  (chan, 1);
 
-	so_method(so, screen->tesla, NV50TCL_EDGEFLAG_ENABLE, 1);
-	so_data  (so, 1); /* default edgeflag to TRUE */
+	BEGIN_RING(chan, screen->tesla, NV50TCL_EDGEFLAG_ENABLE, 1);
+	OUT_RING  (chan, 1); /* default edgeflag to TRUE */
 
-	so_emit(chan, so);
-	so_ref (so, &screen->static_init);
-	so_ref (NULL, &so);
-	nouveau_pushbuf_flush(chan, 0);
+	FIRE_RING (chan);
 
 	screen->force_push = debug_get_bool_option("NV50_ALWAYS_PUSH", FALSE);
 	return pscreen;
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index ec19ea6..c39c5cc 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -38,4 +38,6 @@ nv50_screen(struct pipe_screen *screen)
 	return (struct nv50_screen *)screen;
 }
 
+extern void nv50_screen_relocs(struct nv50_screen *);
+
 #endif
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 2c8e7ca..a1e6446 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -437,7 +437,7 @@ nv50_state_validate(struct nv50_context *nv50, unsigned wait_dwords)
 	so_emit_reloc_markers(chan, nv50->state.hw[3]); /* vp */
 	so_emit_reloc_markers(chan, nv50->state.hw[4]); /* fp */
 	so_emit_reloc_markers(chan, nv50->state.hw[17]); /* vb */
-	so_emit_reloc_markers(chan, nv50->screen->static_init);
+	nv50_screen_relocs(nv50->screen);
 
 	/* No idea.. */
 	BEGIN_RING(chan, tesla, 0x142c, 1);
-- 
1.6.4.4


--------------090405030603010107030606
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090405030603010107030606--
