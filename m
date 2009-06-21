From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] nv50/gallium patch series 2
Date: Sun, 21 Jun 2009 19:30:20 +0200
Message-ID: <4A3E6E2C.10505@student.tuwien.ac.at>
References: <4A2FA30B.5080902@defora.org>	<20090610164512.2259da49@daedalus.pq.iki.fi>	<20090613000157.524d8440@laptop64.home>
	<1244857734.3791.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090503050107050804030002"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1244857734.3791.0.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------090503050107050804030002
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Here's some patches for nv50 shaders again, at least the first
two shouldn't be crap.
The changes introduced in 0008 are probably a crazy/dumb idea,
I'd like to have a better implementation of the register setting
stuff.

I haven't extensively tested them yet (probably still need to
make some modifications), but from running some demos nothing
seems to have broken.
The GLSL brick shader demo should work now (except that no normals
are produced, workaround: put gl_Normal to e_z (0, 0, 1) in the
vertex shader).

If I've created too many hacks, I'll be happy when other people
have time to start making better nice & clean Gallium3d code :-)

Now, time to fix some bugs, instead of introducing new stuff like
these patches do.

Christoph

--------------090503050107050804030002
Content-Type: text/plain;
 name="0001-nvXX-format_supported-needs-to-check-DEPTH_STENCIL.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-nvXX-format_supported-needs-to-check-DEPTH_STENCIL.patc";
 filename*1="h"

From 5fd08781d99bb15f0e882fb1fbd20277a4a6b2b6 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 17:28:49 +0200
Subject: [PATCH] nvXX: format_supported needs to check DEPTH_STENCIL usage

See commit 0342229289c3bd5ed7bc595db4fc88003430209e.
An earlier commit also caused us being given an unsupported
depth buffer format.
---
 src/gallium/drivers/nv04/nv04_screen.c |    7 +++++++
 src/gallium/drivers/nv10/nv10_screen.c |    7 +++++++
 src/gallium/drivers/nv20/nv20_screen.c |    7 +++++++
 src/gallium/drivers/nv30/nv30_screen.c |    7 +++++++
 src/gallium/drivers/nv40/nv40_screen.c |    7 +++++++
 src/gallium/drivers/nv50/nv50_screen.c |    7 +++++++
 6 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv04/nv04_screen.c b/src/gallium/drivers/nv04/nv04_screen.c
index 4bbedfb..601f1a9 100644
--- a/src/gallium/drivers/nv04/nv04_screen.c
+++ b/src/gallium/drivers/nv04/nv04_screen.c
@@ -79,6 +79,13 @@ nv04_screen_is_format_supported(struct pipe_screen *screen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM: 
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
 		default:
diff --git a/src/gallium/drivers/nv10/nv10_screen.c b/src/gallium/drivers/nv10/nv10_screen.c
index b03c291..dc266dc 100644
--- a/src/gallium/drivers/nv10/nv10_screen.c
+++ b/src/gallium/drivers/nv10/nv10_screen.c
@@ -74,6 +74,13 @@ nv10_screen_is_format_supported(struct pipe_screen *screen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM: 
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z24S8_UNORM:
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
diff --git a/src/gallium/drivers/nv20/nv20_screen.c b/src/gallium/drivers/nv20/nv20_screen.c
index 024356c..55f2f68 100644
--- a/src/gallium/drivers/nv20/nv20_screen.c
+++ b/src/gallium/drivers/nv20/nv20_screen.c
@@ -74,6 +74,13 @@ nv20_screen_is_format_supported(struct pipe_screen *screen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM: 
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z24S8_UNORM:
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 31bc1f3..5266296 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -85,6 +85,13 @@ nv30_screen_surface_format_supported(struct pipe_screen *pscreen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM:
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z24S8_UNORM:
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index b8b2af4..dd36185 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -86,6 +86,13 @@ nv40_screen_surface_format_supported(struct pipe_screen *pscreen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM: 
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z24S8_UNORM:
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index fd39fa7..f42b784 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -37,6 +37,13 @@ nv50_screen_is_format_supported(struct pipe_screen *pscreen,
 		switch (format) {
 		case PIPE_FORMAT_A8R8G8B8_UNORM:
 		case PIPE_FORMAT_R5G6B5_UNORM:
+			return TRUE;
+		default:
+			break;
+		}
+	} else
+	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
+		switch (format) {
 		case PIPE_FORMAT_Z24S8_UNORM:
 		case PIPE_FORMAT_Z16_UNORM:
 			return TRUE;
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0002-nv50-fix-HPOS-mapping-when-there-are-no-FP-attrs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0002-nv50-fix-HPOS-mapping-when-there-are-no-FP-attrs.patch"

From fc699035d9f6f3b616ee4ab997c76f10ffb1f537 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Mon, 15 Jun 2009 14:01:20 +0200
Subject: [PATCH] nv50: fix HPOS mapping when there are no FP attrs

---
 src/gallium/drivers/nv50/nv50_program.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 5f7d06d..32d1bf8 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1796,6 +1796,8 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	if (pc->p->type == PIPE_SHADER_FRAGMENT) {
 		pc->p->cfg.fp.regs[0] = 0x01000404;
 		pc->p->cfg.fp.regs[1] = 0x00000400;
+		pc->p->cfg.fp.map[0] = 0x03020100;
+		pc->p->cfg.fp.high_map = 1;
 	}
 
 	tgsi_parse_init(&p, pc->p->pipe.tokens);
@@ -1954,9 +1956,8 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 						      &mid, &aid, &oid);
 				oid = 0;
 				pc->p->cfg.fp.regs[1] |= (mask << 24);
-				pc->p->cfg.fp.map[0] = 0x04040404 * fcrd;
+				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
 			}
-			pc->p->cfg.fp.map[0] += 0x03020100;
 
 			/* should do MAD fcrd.xy, fcrd, SOME_CONST, fcrd */
 
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0003-nv50-select-shader-program-through-VP-FP_START_ID.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-nv50-select-shader-program-through-VP-FP_START_ID.patch"

From 53d1ed91ed780102b39761cbac7b790a9e906d83 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 18:00:48 +0200
Subject: [PATCH] nv50: select shader program through VP/FP_START_ID

Instead of specifying the program buffer address on every program
change, just set an offset in a shared program buffer, like the
binary driver does.
---
 src/gallium/drivers/nv50/nv50_context.h  |    6 ++
 src/gallium/drivers/nv50/nv50_program.c  |   78 +++++++++++------------------
 src/gallium/drivers/nv50/nv50_program.h  |    1 +
 src/gallium/drivers/nv50/nv50_screen.c   |   27 ++++++++++-
 src/gallium/drivers/nv50/nv50_screen.h   |    2 +
 src/gallium/drivers/nv50/nv50_transfer.c |   12 +++++
 6 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 9b8cc4d..44463d6 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -198,4 +198,10 @@ extern boolean nv50_state_validate(struct nv50_context *nv50);
 /* nv50_tex.c */
 extern void nv50_tex_validate(struct nv50_context *);
 
+/* nv50_transfer.c */
+extern void nv50_transfer_gart_vram(struct pipe_screen *pscreen,
+				    struct nouveau_bo *dst, unsigned dst_off,
+				    struct nouveau_bo *src, unsigned src_off,
+				    unsigned size);
+
 #endif
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 32d1bf8..4ef7748 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2289,19 +2289,22 @@ static void
 nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 {
 	struct nouveau_channel *chan = nv50->screen->base.channel;
-	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program_exec *e;
-	struct nouveau_stateobj *so;
-	const unsigned flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_WR;
-	unsigned start, count, *up, *ptr;
+	struct nouveau_resource *heap;
+	struct nouveau_bo *code;
+	int ret;
+	unsigned size, *ptr;
 	boolean upload = FALSE;
 
 	if (!p->bo) {
-		nouveau_bo_new(chan->device, NOUVEAU_BO_VRAM, 0x100,
-			       p->exec_size * 4, &p->bo);
+		nouveau_bo_new(chan->device, NOUVEAU_BO_GART | NOUVEAU_BO_MAP,
+			       0x100, p->exec_size * 4, &p->bo);
 		upload = TRUE;
 	}
 
+	heap = nv50->screen->code_heap[p->type];
+	code = nv50->screen->sprogbuf_code[p->type];
+
 	if ((p->data[0] && p->data[0]->start != p->data_start[0]) ||
 		(p->data[1] && p->data[1]->start != p->data_start[1])) {
 		for (e = p->exec_head; e; e = e->next) {
@@ -2338,44 +2341,32 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 	}
 #endif
 
-	up = ptr = MALLOC(p->exec_size * 4);
+	ret = nouveau_bo_map(p->bo, NOUVEAU_BO_WR);
+	if (ret) {
+		NOUVEAU_ERR("Failed to map program upload buffer (%i).\n",ret);
+		abort();
+	}
+
+	ptr = (unsigned *)p->bo->map;
 	for (e = p->exec_head; e; e = e->next) {
 		*(ptr++) = e->inst[0];
 		if (is_long(e))
 			*(ptr++) = e->inst[1];
 	}
 
-	so = so_new(4,2);
-	so_method(so, nv50->screen->tesla, 0x1280, 3);
-	so_reloc (so, p->bo, 0, flags | NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, p->bo, 0, flags | NOUVEAU_BO_LOW, 0, 0);
-	so_data  (so, (NV50_CB_PUPLOAD << 16) | 0x0800); //(p->exec_size * 4));
-
-	start = 0; count = p->exec_size;
-	while (count) {
-		struct nouveau_channel *chan = nv50->screen->base.channel;
-		unsigned nr;
-
-		so_emit(chan, so);
+	nouveau_bo_unmap(p->bo);
 
-		nr = MIN2(count, 2047);
-		nr = MIN2(chan->pushbuf->remaining, nr);
-		if (chan->pushbuf->remaining < (nr + 3)) {
-			FIRE_RING(chan);
-			continue;
+	size = align(p->exec_size * 4, 0x100);
+	if (!p->code) {
+		ret = nouveau_resource_alloc(heap, size, p, &p->code);
+		if (ret) {
+			NOUVEAU_ERR("Program VRAM buffer is full.\n");
+			abort();
 		}
-
-		BEGIN_RING(chan, tesla, 0x0f00, 1);
-		OUT_RING  (chan, (start << 8) | NV50_CB_PUPLOAD);
-		BEGIN_RING(chan, tesla, 0x40000f04, nr);	
-		OUT_RINGp (chan, up + start, nr);
-
-		start += nr;
-		count -= nr;
 	}
 
-	FREE(up);
-	so_ref(NULL, &so);
+	nv50_transfer_gart_vram(&nv50->screen->base.base,
+				code, p->code->start, p->bo, 0, size);
 }
 
 void
@@ -2394,12 +2385,7 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(13, 2);
-	so_method(so, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
-	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-		      NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-		      NOUVEAU_BO_LOW, 0, 0);
+	so = so_new(10, 0);
 	so_method(so, tesla, 0x1650, 2);
 	so_data  (so, p->cfg.vp.attr[0]);
 	so_data  (so, p->cfg.vp.attr[1]);
@@ -2409,7 +2395,7 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	so_data  (so, p->cfg.high_result); //8);
 	so_data  (so, p->cfg.high_temp);
 	so_method(so, tesla, 0x140c, 1);
-	so_data  (so, 0); /* program start offset */
+	so_data  (so, p->code->start);
 	so_ref(so, &nv50->state.vertprog);
 	so_ref(NULL, &so);
 }
@@ -2431,12 +2417,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(64, 2);
-	so_method(so, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
-	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-		      NOUVEAU_BO_HIGH, 0, 0);
-	so_reloc (so, p->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_RD |
-		      NOUVEAU_BO_LOW, 0, 0);
+	so = so_new(32, 0);
 	so_method(so, tesla, 0x1904, 4);
 	so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 */
 	so_data  (so, 0x00000004);
@@ -2455,7 +2436,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	so_method(so, tesla, 0x196c, 1);
 	so_data  (so, p->cfg.fp.regs[3]);
 	so_method(so, tesla, 0x1414, 1);
-	so_data  (so, 0); /* program start offset */
+	so_data  (so, p->code->start);
 	so_ref(so, &nv50->state.fragprog);
 	so_ref(NULL, &so);
 }
@@ -2476,6 +2457,7 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 
 	nouveau_resource_free(&p->data[0]);
 	nouveau_resource_free(&p->data[1]);
+	nouveau_resource_free(&p->code);
 
 	p->translated = 0;
 }
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 096e047..ed3f67b 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -27,6 +27,7 @@ struct nv50_program {
 	struct nouveau_resource *data[2];
 	unsigned data_start[2];
 
+	struct nouveau_resource *code;
 	struct nouveau_bo *bo;
 
 	float *immd;
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index f42b784..954b67a 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -266,7 +266,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_ref(NULL, &so);
 
 	/* Static tesla init */
-	so = so_new(256, 20);
+	so = so_new(256, 24);
 
 	so_method(so, screen->tesla, 0x1558, 1);
 	so_data  (so, 1);
@@ -290,6 +290,31 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	so_method(so, screen->tesla, 0x16b8, 1);
 	so_data  (so, 8);
 
+	/* create VRAM buffers for shader programs */
+	for (i = 0; i < 2; i++) {
+		ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0x100, 0x10000,
+				     &screen->sprogbuf_code[i]);
+		if (ret || nouveau_resource_init(
+			    &screen->code_heap[i], 0, 0x10000)) {
+			NOUVEAU_ERR("Failed to initialize program buffers.");
+			nv50_screen_destroy(pscreen);
+			return NULL;
+		}
+	}
+
+	/* set program buffer addresses */
+	so_method(so, screen->tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
+	so_reloc (so, screen->sprogbuf_code[0], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, screen->sprogbuf_code[0], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
+
+	so_method(so, screen->tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
+	so_reloc (so, screen->sprogbuf_code[1], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_HIGH, 0, 0);
+	so_reloc (so, screen->sprogbuf_code[1], 0, NOUVEAU_BO_VRAM |
+		  NOUVEAU_BO_RD | NOUVEAU_BO_LOW, 0, 0);
+
 	/* constant buffers for immediates and VP/FP parameters */
 	ret = nouveau_bo_new(dev, NOUVEAU_BO_VRAM, 0, 128*4*4,
 			     &screen->constbuf_misc[0]);
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index 61e24a5..2481492 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -17,9 +17,11 @@ struct nv50_screen {
 
 	struct nouveau_bo *constbuf_misc[1];
 	struct nouveau_bo *constbuf_parm[2];
+	struct nouveau_bo *sprogbuf_code[2];
 
 	struct nouveau_resource *immd_heap[1];
 	struct nouveau_resource *parm_heap[2];
+	struct nouveau_resource *code_heap[2];
 
 	struct nouveau_bo *tic;
 	struct nouveau_bo *tsc;
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index d0b7f0b..f7f5858 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -99,6 +99,18 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen, struct nouveau_bo *src_bo,
 	}
 }
 
+void
+nv50_transfer_gart_vram(struct pipe_screen *pscreen,
+			struct nouveau_bo *dst, unsigned dst_offset,
+			struct nouveau_bo *src, unsigned src_offset,
+			unsigned size)
+{
+	nv50_transfer_rect_m2mf(pscreen,
+				src, src_offset, size, 0, 0, 0, 0,
+				dst, dst_offset, size, 0, 0, 0, 0,
+				1, size, 1, NOUVEAU_BO_GART, NOUVEAU_BO_VRAM);
+}
+
 static struct pipe_transfer *
 nv50_transfer_new(struct pipe_screen *pscreen, struct pipe_texture *pt,
 		  unsigned face, unsigned level, unsigned zslice,
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0004-nv50-use-ctor_reg-to-initialize-nv50_regs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0004-nv50-use-ctor_reg-to-initialize-nv50_regs.patch"

From 67ab4faa42e5e45f64349a4d0de75dbaafd9f793 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 17:49:08 +0200
Subject: [PATCH] nv50: use ctor_reg to initialize nv50_regs

---
 src/gallium/drivers/nv50/nv50_program.c |  102 ++++++++++++++----------------
 1 files changed, 48 insertions(+), 54 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 4ef7748..c250659 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -124,6 +124,17 @@ struct nv50_pc {
 	boolean allow32;
 };
 
+static inline void
+ctor_reg(struct nv50_reg *reg, unsigned type, int index, int hw)
+{
+	reg->type = type;
+	reg->index = index;
+	reg->hw = hw;
+	reg->neg = 0;
+	reg->rhw = -1;
+	reg->acc = 0;
+}
+
 static void
 alloc_reg(struct nv50_pc *pc, struct nv50_reg *reg)
 {
@@ -184,11 +195,8 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
 
 	for (i = 0; i < NV50_SU_MAX_TEMP; i++) {
 		if (!pc->r_temp[i]) {
-			r = CALLOC_STRUCT(nv50_reg);
-			r->type = P_TEMP;
-			r->index = -1;
-			r->hw = i;
-			r->rhw = -1;
+			r = MALLOC_STRUCT(nv50_reg);
+			ctor_reg(r, P_TEMP, -1, i);
 			pc->r_temp[i] = r;
 			return r;
 		}
@@ -254,10 +262,8 @@ alloc_temp4(struct nv50_pc *pc, struct nv50_reg *dst[4], int idx)
 		return alloc_temp4(pc, dst, idx + 1);
 
 	for (i = 0; i < 4; i++) {
-		dst[i] = CALLOC_STRUCT(nv50_reg);
-		dst[i]->type = P_TEMP;
-		dst[i]->index = -1;
-		dst[i]->hw = idx + i;
+		dst[i] = MALLOC_STRUCT(nv50_reg);
+		ctor_reg(dst[i], P_TEMP, -1, idx + i);
 		pc->r_temp[idx + i] = dst[i];
 	}
 
@@ -309,7 +315,7 @@ ctor_immd(struct nv50_pc *pc, float x, float y, float z, float w)
 static struct nv50_reg *
 alloc_immd(struct nv50_pc *pc, float f)
 {
-	struct nv50_reg *r = CALLOC_STRUCT(nv50_reg);
+	struct nv50_reg *r = MALLOC_STRUCT(nv50_reg);
 	unsigned hw;
 
 	for (hw = 0; hw < pc->immd_nr * 4; hw++)
@@ -319,9 +325,7 @@ alloc_immd(struct nv50_pc *pc, float f)
 	if (hw == pc->immd_nr * 4)
 		hw = ctor_immd(pc, f, -f, 0.5 * f, 0) * 4;
 
-	r->type = P_IMMD;
-	r->hw = hw;
-	r->index = -1;
+	ctor_reg(r, P_IMMD, -1, hw);
 	return r;
 }
 
@@ -1921,16 +1925,13 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	}
 
 	if (pc->temp_nr) {
-		pc->temp = CALLOC(pc->temp_nr * 4, sizeof(struct nv50_reg));
+		pc->temp = MALLOC(pc->temp_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->temp)
 			goto out_err;
 
 		for (i = 0; i < pc->temp_nr; i++) {
 			for (c = 0; c < 4; c++) {
-				pc->temp[i*4+c].type = P_TEMP;
-				pc->temp[i*4+c].hw = -1;
-				pc->temp[i*4+c].rhw = -1;
-				pc->temp[i*4+c].index = i;
+				ctor_reg(&pc->temp[i*4+c], P_TEMP, i, -1);
 				pc->temp[i*4+c].acc = r_usage[0][i*4+c];
 			}
 		}
@@ -2009,74 +2010,67 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			pc->p->cfg.fp.high_map += ((mid % 4) ? 1 : 0);
 		} else {
 			/* vertex program */
-			for (i = 0; i < pc->attr_nr * 4; i++) {
-				pc->p->cfg.vp.attr[aid / 32] |=
-					(1 << (aid % 32));
-				pc->attr[i].type = P_ATTR;
-				pc->attr[i].hw = aid++;
-				pc->attr[i].index = i / 4;
+			for (i = 0; i < pc->attr_nr; i++) {
+				for (c = 0; c < 4; c++) {
+					pc->p->cfg.vp.attr[aid / 32] |=
+						(1 << (aid % 32));
+					ctor_reg(&pc->attr[i*4+c],
+						 P_ATTR, i, aid++);
+				}
 			}
 		}
 	}
 
 	if (pc->result_nr) {
+		unsigned nr = pc->result_nr * 4 /* + nr of clip planes */;
 		int rid = 0;
 
-		pc->result = CALLOC(pc->result_nr * 4, sizeof(struct nv50_reg));
+		pc->result = MALLOC(nr * sizeof(struct nv50_reg));
 		if (!pc->result)
 			goto out_err;
 
-		for (i = 0; i < pc->result_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-					pc->result[i*4+c].type = P_TEMP;
-					pc->result[i*4+c].hw = -1;
-					pc->result[i*4+c].rhw = (i == depr) ?
-						-1 : rid++;
-				} else {
-					pc->result[i*4+c].type = P_RESULT;
-					pc->result[i*4+c].hw = rid++;
+		if (pc->p->type == PIPE_SHADER_VERTEX) {
+			for (i = 0; i < nr; i++)
+				ctor_reg(&pc->result[i], P_RESULT, i / 4, i);
+		} else {
+			/* pc->p->type == PIPE_SHADER_FRAGMENT */
+			for (i = 0; i < pc->result_nr; i++) {
+				for (c = 0; c < 4; c++) {
+					ctor_reg(&pc->result[i*4+c],
+						 P_TEMP, i, -1);
+					if (i != depr)
+						pc->result[i*4+c].rhw = rid++;
 				}
-				pc->result[i*4+c].index = i;
 			}
 
-			if (pc->p->type == PIPE_SHADER_FRAGMENT &&
-			    depr != 0xffff) {
-				pc->result[depr * 4 + 2].rhw =
-					(pc->result_nr - 1) * 4;
-			}
+			if (depr != 0xffff)
+				pc->result[depr*4+2].rhw = rid++;
 		}
 	}
 
 	if (pc->param_nr) {
 		int rid = 0;
 
-		pc->param = CALLOC(pc->param_nr * 4, sizeof(struct nv50_reg));
+		pc->param = MALLOC(pc->param_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->param)
 			goto out_err;
 
 		for (i = 0; i < pc->param_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				pc->param[i*4+c].type = P_CONST;
-				pc->param[i*4+c].hw = rid++;
-				pc->param[i*4+c].index = i;
-			}
+			for (c = 0; c < 4; c++, rid++)
+				ctor_reg(&pc->param[rid], P_CONST, i, rid);
 		}
 	}
 
 	if (pc->immd_nr) {
 		int rid = 0;
 
-		pc->immd = CALLOC(pc->immd_nr * 4, sizeof(struct nv50_reg));
+		pc->immd = MALLOC(pc->immd_nr * 4 * sizeof(struct nv50_reg));
 		if (!pc->immd)
 			goto out_err;
 
 		for (i = 0; i < pc->immd_nr; i++) {
-			for (c = 0; c < 4; c++) {
-				pc->immd[i*4+c].type = P_IMMD;
-				pc->immd[i*4+c].hw = rid++;
-				pc->immd[i*4+c].index = i;
-			}
+			for (c = 0; c < 4; c++, rid++)
+				ctor_reg(&pc->immd[rid], P_IMMD, i, rid);
 		}
 	}
 
@@ -2151,8 +2145,8 @@ nv50_program_tx(struct nv50_program *p)
 
 	if (p->type == PIPE_SHADER_FRAGMENT) {
 		struct nv50_reg out;
+		ctor_reg(&out, P_TEMP, -1, -1);
 
-		out.type = P_TEMP;
 		for (k = 0; k < pc->result_nr * 4; k++) {
 			if (pc->result[k].rhw == -1)
 				continue;
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0005-nv50-use-register-count-from-tgsi-program-info.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0005-nv50-use-register-count-from-tgsi-program-info.patch"

From de5864598aa5b6042a79ca8886d74c6e7027a32c Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 17:50:37 +0200
Subject: [PATCH] nv50: use register count from tgsi program info

---
 src/gallium/drivers/nv50/nv50_program.c |   57 +++++++++++++++++--------------
 1 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index c250659..71a084e 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1695,11 +1695,6 @@ prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 	dst = &insn->FullDstRegisters[0].DstRegister;
 	mask = dst->WriteMask;
 
-	if (!r_usage[0])
-		r_usage[0] = CALLOC(pc->temp_nr * 4, sizeof(unsigned));
-	if (!r_usage[1])
-		r_usage[1] = CALLOC(pc->attr_nr * 4, sizeof(unsigned));
-
 	if (dst->File == TGSI_FILE_TEMPORARY) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
@@ -1792,17 +1787,11 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 	/* track register access for temps and attrs */
 	unsigned *r_usage[2];
-	r_usage[0] = NULL;
-	r_usage[1] = NULL;
 
-	depr = fcol = bcol = fcrd = 0xffff;
+	r_usage[0] = CALLOC(pc->temp_nr * 4, sizeof(unsigned));
+	r_usage[1] = CALLOC(pc->attr_nr * 4, sizeof(unsigned));
 
-	if (pc->p->type == PIPE_SHADER_FRAGMENT) {
-		pc->p->cfg.fp.regs[0] = 0x01000404;
-		pc->p->cfg.fp.regs[1] = 0x00000400;
-		pc->p->cfg.fp.map[0] = 0x03020100;
-		pc->p->cfg.fp.high_map = 1;
-	}
+	depr = fcol = bcol = fcrd = 0xffff;
 
 	tgsi_parse_init(&p, pc->p->pipe.tokens);
 	while (!tgsi_parse_end_of_tokens(&p)) {
@@ -1832,13 +1821,8 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 			switch (d->Declaration.File) {
 			case TGSI_FILE_TEMPORARY:
-				if (pc->temp_nr < (last + 1))
-					pc->temp_nr = last + 1;
 				break;
 			case TGSI_FILE_OUTPUT:
-				if (pc->result_nr < (last + 1))
-					pc->result_nr = last + 1;
-
 				if (!d->Declaration.Semantic)
 					break;
 
@@ -1855,9 +1839,6 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 				break;
 			case TGSI_FILE_INPUT:
 			{
-				if (pc->attr_nr < (last + 1))
-					pc->attr_nr = last + 1;
-
 				if (pc->p->type != PIPE_SHADER_FRAGMENT)
 					break;
 
@@ -1903,8 +1884,6 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			}
 				break;
 			case TGSI_FILE_CONSTANT:
-				if (pc->param_nr < (last + 1))
-					pc->param_nr = last + 1;
 				break;
 			case TGSI_FILE_SAMPLER:
 				break;
@@ -2102,6 +2081,33 @@ free_nv50_pc(struct nv50_pc *pc)
 	FREE(pc);
 }
 
+static void
+ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
+{
+	pc->p = p;
+	p->cfg.high_temp = 4;
+
+	pc->temp_nr = p->info.file_max[TGSI_FILE_TEMPORARY] + 1;
+	pc->attr_nr = p->info.file_max[TGSI_FILE_INPUT] + 1;
+	pc->result_nr = p->info.file_max[TGSI_FILE_OUTPUT] + 1;
+	pc->param_nr = p->info.file_max[TGSI_FILE_CONSTANT] + 1;
+
+	switch (p->type) {
+	case PIPE_SHADER_VERTEX:
+		break;
+	case PIPE_SHADER_FRAGMENT:
+		p->cfg.fp.regs[0] = 0x01000404;
+		p->cfg.fp.regs[1] = 0x00000400;
+
+		p->cfg.fp.map[0] = 0x03020100;
+		p->cfg.fp.high_map = 1;
+		break;
+	default:
+		assert(!"unsupported GPU program type");
+		break;
+	}
+}
+
 static boolean
 nv50_program_tx(struct nv50_program *p)
 {
@@ -2113,8 +2119,7 @@ nv50_program_tx(struct nv50_program *p)
 	pc = CALLOC_STRUCT(nv50_pc);
 	if (!pc)
 		return FALSE;
-	pc->p = p;
-	pc->p->cfg.high_temp = 4;
+	ctor_nv50_pc(pc, p);
 
 	ret = nv50_program_tx_prep(pc);
 	if (ret == FALSE)
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0006-nv50-move-some-stuff-into-nv50_program_tx_postproce.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0006-nv50-move-some-stuff-into-nv50_program_tx_postproce.pat";
 filename*1="ch"

From c79799803e461263373be23592ac861c7b19f018 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 20 Jun 2009 20:48:48 +0200
Subject: [PATCH] nv50: move some stuff into nv50_program_tx_postprocess

The _postprocess function is called in nv50_program_tx and
performs moving of FP outputs, will append clipping distance
calculations, and converts unpaired half insn to long.
---
 src/gallium/drivers/nv50/nv50_program.c |   91 ++++++++++++++++---------------
 1 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 71a084e..7a4bc18 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2024,6 +2024,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 
 			if (depr != 0xffff)
 				pc->result[depr*4+2].rhw = rid++;
+			pc->p->cfg.high_result = rid;
 		}
 	}
 
@@ -2108,12 +2109,57 @@ ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
 	}
 }
 
+static void
+nv50fp_move_outputs(struct nv50_pc *pc)
+{
+	struct nv50_reg out;
+	int i;
+
+	ctor_reg(&out, P_TEMP, -1, -1);
+
+	for (i = 0; i < pc->result_nr * 4; i++) {
+		if (pc->result[i].rhw < 0)
+			continue;
+		out.hw = pc->result[i].rhw;
+		emit_mov(pc, &out, &pc->result[i]);
+	}
+}
+
+static void nv50_program_tx_postprocess(struct nv50_pc *pc)
+{
+	struct nv50_program_exec *e, *e_prev = NULL;
+	unsigned pos;
+
+	if (pc->p->type == PIPE_SHADER_FRAGMENT)
+		nv50fp_move_outputs(pc);
+
+	for (e = pc->p->exec_head, pos = 0; e; e = e->next) {
+		pos += is_long(e) ? 2 : 1;
+
+		if ((!e->next || is_long(e->next)) && (pos & 1)) {
+			convert_to_long(pc, e);
+			pos++;
+		}
+		e_prev = e->next ? e : e_prev;
+	}
+
+	/* last instruction must be long */
+	if (!is_long(pc->p->exec_tail)) {
+		convert_to_long(pc, pc->p->exec_tail);
+		convert_to_long(pc, e_prev);
+	}
+
+	assert(!is_immd(pc->p->exec_head));
+	assert(!is_immd(pc->p->exec_tail));
+
+	pc->p->exec_tail->inst[1] |= 0x00000001;
+}
+
 static boolean
 nv50_program_tx(struct nv50_program *p)
 {
 	struct tgsi_parse_context parse;
 	struct nv50_pc *pc;
-	unsigned k;
 	boolean ret;
 
 	pc = CALLOC_STRUCT(nv50_pc);
@@ -2148,48 +2194,7 @@ nv50_program_tx(struct nv50_program *p)
 		}
 	}
 
-	if (p->type == PIPE_SHADER_FRAGMENT) {
-		struct nv50_reg out;
-		ctor_reg(&out, P_TEMP, -1, -1);
-
-		for (k = 0; k < pc->result_nr * 4; k++) {
-			if (pc->result[k].rhw == -1)
-				continue;
-			if (pc->result[k].hw != pc->result[k].rhw) {
-				out.hw = pc->result[k].rhw;
-				emit_mov(pc, &out, &pc->result[k]);
-			}
-			if (pc->p->cfg.high_result < (pc->result[k].rhw + 1))
-				pc->p->cfg.high_result = pc->result[k].rhw + 1;
-		}
-	}
-
-	/* look for single half instructions and make them long */
-	struct nv50_program_exec *e, *e_prev;
-
-	for (k = 0, e = pc->p->exec_head, e_prev = NULL; e; e = e->next) {
-		if (!is_long(e))
-			k++;
-
-		if (!e->next || is_long(e->next)) {
-			if (k & 1)
-				convert_to_long(pc, e);
-			k = 0;
-		}
-
-		if (e->next)
-			e_prev = e;
-	}
-
-	if (!is_long(pc->p->exec_tail)) {
-		/* this may occur if moving FP results */
-		assert(e_prev && !is_long(e_prev));
-		convert_to_long(pc, e_prev);
-		convert_to_long(pc, pc->p->exec_tail);
-	}
-
-	assert(is_long(pc->p->exec_tail) && !is_immd(pc->p->exec_head));
-	pc->p->exec_tail->inst[1] |= 0x00000001;
+	nv50_program_tx_postprocess(pc);
 
 	p->param_nr = pc->param_nr * 4;
 	p->immd_nr = pc->immd_nr * 4;
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0007-nv50-add-support-for-two-sided-lighting.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0007-nv50-add-support-for-two-sided-lighting.patch"

From 7356ccfe976cb61a30e480a315daf37f84b3f533 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 18:03:29 +0200
Subject: [PATCH] nv50: add support for two-sided lighting

---
 src/gallium/drivers/nv50/nv50_context.h        |    1 +
 src/gallium/drivers/nv50/nv50_program.c        |  171 ++++++++++++++++++------
 src/gallium/drivers/nv50/nv50_program.h        |    1 +
 src/gallium/drivers/nv50/nv50_state_validate.c |    3 +
 4 files changed, 138 insertions(+), 38 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 44463d6..c31c42a 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -190,6 +190,7 @@ extern void nv50_clear(struct pipe_context *pipe, unsigned buffers,
 /* nv50_program.c */
 extern void nv50_vertprog_validate(struct nv50_context *nv50);
 extern void nv50_fragprog_validate(struct nv50_context *nv50);
+extern void nv50_linkage_validate(struct nv50_context *nv50);
 extern void nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p);
 
 /* nv50_state_validate.c */
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 7a4bc18..30a1d32 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1779,7 +1779,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	struct tgsi_parse_context p;
 	boolean ret = FALSE;
 	unsigned i, c;
-	unsigned fcol, bcol, fcrd, depr;
+	unsigned fcol[2], bcol[2], fcrd, depr;
 
 	/* count (centroid) perspective interpolations */
 	unsigned centroid_loads = 0;
@@ -1791,7 +1791,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	r_usage[0] = CALLOC(pc->temp_nr * 4, sizeof(unsigned));
 	r_usage[1] = CALLOC(pc->attr_nr * 4, sizeof(unsigned));
 
-	depr = fcol = bcol = fcrd = 0xffff;
+	fcol[0] = fcol[1] = 0xffff;
+	bcol[0] = bcol[1] = 0xffff;
+	depr = fcrd = 0xffff;
 
 	tgsi_parse_init(&p, pc->p->pipe.tokens);
 	while (!tgsi_parse_end_of_tokens(&p)) {
@@ -1826,12 +1828,21 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 				if (!d->Declaration.Semantic)
 					break;
 
+				c = d->Semantic.SemanticIndex;
 				switch (d->Semantic.SemanticName) {
 				case TGSI_SEMANTIC_POSITION:
 					depr = first;
 					pc->p->cfg.fp.regs[2] |= 0x00000100;
 					pc->p->cfg.fp.regs[3] |= 0x00000011;
 					break;
+				case TGSI_SEMANTIC_COLOR:
+					if (pc->p->type == PIPE_SHADER_VERTEX)
+						fcol[c] = first;
+					break;
+				case TGSI_SEMANTIC_BCOLOR:
+					if (pc->p->type == PIPE_SHADER_VERTEX)
+						bcol[c] = first;
+					break;
 				default:
 					break;
 				}
@@ -1854,17 +1865,14 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 					break;
 				}
 
+				c = d->Semantic.SemanticIndex;
 				if (d->Declaration.Semantic) {
 					switch (d->Semantic.SemanticName) {
 					case TGSI_SEMANTIC_POSITION:
 						fcrd = first;
 						break;
 					case TGSI_SEMANTIC_COLOR:
-						fcol = first;
-						mode = INTERP_PERSPECTIVE;
-						break;
-					case TGSI_SEMANTIC_BCOLOR:
-						bcol = first;
+						fcol[c] = first;
 						mode = INTERP_PERSPECTIVE;
 						break;
 					}
@@ -1931,10 +1939,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			/* position should be loaded first */
 			if (fcrd != 0xffff) {
 				unsigned mask;
-				mid = 0;
+				oid = mid = 0;
 				mask = load_fp_attrib(pc, fcrd, r_usage[1],
 						      &mid, &aid, &oid);
-				oid = 0;
 				pc->p->cfg.fp.regs[1] |= (mask << 24);
 				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
 			}
@@ -1966,16 +1973,24 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 				pc->p->cfg.fp.regs[1] |= 0x08000000;
 			}
 
-			for (c = 0; c < 4; c++) {
-				/* I don't know what these values do, but
-				 * let's set them like the blob does:
-				 */
-				if (fcol != 0xffff && r_usage[1][fcol * 4 + c])
-					pc->p->cfg.fp.regs[0] += 0x00010000;
-				if (bcol != 0xffff && r_usage[1][bcol * 4 + c])
-					pc->p->cfg.fp.regs[0] += 0x00010000;
-			}
+			/* load colors directly after position - XXX: might
+			 * not be necessary if we always get colors first
+			 */
+			oid += fcol[0] * 4;
+			i = mid;
+
+			if (fcol[0] != 0xffff)
+				load_fp_attrib(pc, fcol[0], r_usage[1],
+					       &mid, &aid, &oid);
+			if (fcol[1] != 0xffff)
+				load_fp_attrib(pc, fcol[1], r_usage[1],
+					       &mid, &aid, &oid);
+
+			/* set count of mapped color components */
+			pc->p->cfg.fp.regs[0] |= (mid - i) << 16;
 
+			/* reset oid and load remaining attrs */
+			oid = (fcrd == 0xffff) ? 4 : 0;
 			for (i = 0; i < pc->attr_nr; i++)
 				load_fp_attrib(pc, i, r_usage[1],
 					       &mid, &aid, &oid);
@@ -1985,8 +2000,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			if (pc->iv_c)
 				free_temp(pc, pc->iv_c);
 
-			pc->p->cfg.fp.high_map = (mid / 4);
-			pc->p->cfg.fp.high_map += ((mid % 4) ? 1 : 0);
+			pc->p->cfg.fp.high_map = mid;
 		} else {
 			/* vertex program */
 			for (i = 0; i < pc->attr_nr; i++) {
@@ -2011,6 +2025,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 		if (pc->p->type == PIPE_SHADER_VERTEX) {
 			for (i = 0; i < nr; i++)
 				ctor_reg(&pc->result[i], P_RESULT, i / 4, i);
+
+			/* output id offset bcol from fcol */
+			if (bcol[0] != 0xffff)
+				pc->p->cfg.vp.bcol = bcol[0] - fcol[0];
 		} else {
 			/* pc->p->type == PIPE_SHADER_FRAGMENT */
 			for (i = 0; i < pc->result_nr; i++) {
@@ -2101,7 +2119,7 @@ ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
 		p->cfg.fp.regs[1] = 0x00000400;
 
 		p->cfg.fp.map[0] = 0x03020100;
-		p->cfg.fp.high_map = 1;
+		p->cfg.fp.high_map = 4;
 		break;
 	default:
 		assert(!"unsupported GPU program type");
@@ -2389,15 +2407,12 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(10, 0);
+	so = so_new(32, 0);
 	so_method(so, tesla, 0x1650, 2);
 	so_data  (so, p->cfg.vp.attr[0]);
 	so_data  (so, p->cfg.vp.attr[1]);
 	so_method(so, tesla, 0x16b8, 1);
 	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, 0x16ac, 2);
-	so_data  (so, p->cfg.high_result); //8);
-	so_data  (so, p->cfg.high_temp);
 	so_method(so, tesla, 0x140c, 1);
 	so_data  (so, p->code->start);
 	so_ref(so, &nv50->state.vertprog);
@@ -2410,7 +2425,6 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program *p = nv50->fragprog;
 	struct nouveau_stateobj *so;
-	unsigned i;
 
 	if (!p->translated) {
 		nv50_program_validate(nv50, p);
@@ -2421,18 +2435,7 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(32, 0);
-	so_method(so, tesla, 0x1904, 4);
-	so_data  (so, p->cfg.fp.regs[0]); /* 0x01000404 / 0x00040404 */
-	so_data  (so, 0x00000004);
-	so_data  (so, 0x00000000);
-	so_data  (so, 0x00000000);
-	so_method(so, tesla, 0x16bc, p->cfg.fp.high_map);
-	for (i = 0; i < p->cfg.fp.high_map; i++)
-		so_data(so, p->cfg.fp.map[i]);
-	so_method(so, tesla, 0x1988, 2);
-	so_data  (so, p->cfg.fp.regs[1]); /* 0x08040404 / 0x0f000401 */
-	so_data  (so, p->cfg.high_temp);
+	so = so_new(8, 0);
 	so_method(so, tesla, 0x1298, 1);
 	so_data  (so, p->cfg.high_result);
 	so_method(so, tesla, 0x19a8, 1);
@@ -2445,6 +2448,98 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	so_ref(NULL, &so);
 }
 
+/*
+ * 1510 = bitmask to enable clipping planes
+ * 1688 = two-sided lighting enable
+ * 16ac = entry count of mapping table at [16bc]
+ * 16b0 = count of temporaries used in VP
+ *
+ * 1904 = 0x01CCBBFF (01 is sometimes 00 - ?)
+ *	CC = number of color components in map (primary + secondary)
+ *	BB = first back color's map index (colors should be contiguous)
+ *	FF = first front color's map index
+ *
+ * 1908 = 0x0000HHLL
+ *	LL = first clipping distance map index (4 if no UCPs)
+ *	HH = last clipping distance map index + 1 (0 if no UCPs)
+ *
+ * 1910 = 0x00000SSe
+ *	 e = enable point size output (0 / 1)
+ *	SS = point size map index (0 if disabled)
+ *
+ * 1988 = 0xMMIInnii
+ *	MM = bitmask to un-mask masked VP/GP outputs (i.e. HPOS, generic ?)
+ *	nn = map index of first non-masked output, where to put front color
+ *	II = count of non-masked interpolants
+ *	ii = almost always equal to II (except if II -> 00, why ?)
+ */
+void
+nv50_linkage_validate(struct nv50_context *nv50)
+{
+	/* this is going to be rather complicated at first, but it works
+	 * like this; maybe we can simplify later, though
+	 */
+	struct nouveau_stateobj *so = nv50->state.vertprog;
+	struct nouveau_grobj *tesla = nv50->screen->tesla;
+	struct nv50_program *vp = nv50->vertprog;
+	struct nv50_program *fp = nv50->fragprog;
+
+	uint32_t regs[5];
+	uint32_t map[8], i, n, k, m = 4;
+
+	memset(map, 0, 8 * sizeof(uint32_t));
+	map[0] = fp->cfg.fp.map[0];
+
+	regs[1] /* 1908 */ = 0x00000004;
+	regs[2] /* 190c */ = 0x00000000;
+	regs[3] /* 1910 */ = 0x00000000;
+	regs[0] /* 1904 */ = fp->cfg.fp.regs[0];
+	regs[4] /* 1988 */ = fp->cfg.fp.regs[1];
+
+	so_method(so, tesla, 0x1688, 1);
+
+	if (nv50->rasterizer->pipe.light_twoside) {
+		so_data(so, 1);
+		n = (regs[0] >> 16) & 0xff;
+
+		/* copy front color mappings and add output offset to BFC0 */
+		for (i = 4; i < 4 + n; i++, m++) {
+			k = fp->cfg.fp.map[i / 4] >> (8 * (i % 4));
+			k &= 0xff;
+			map[m / 4] |= (k + vp->cfg.vp.bcol) << (8 * (m % 4));
+		}
+
+		regs[0] += n;
+		regs[2] += (n << 8);
+	} else
+		so_data(so, 0);
+
+	for (i = 4; i < fp->cfg.fp.high_map; i++, m++) {
+		k = fp->cfg.fp.map[i / 4] >> (8 * (i % 4));
+		k &= 0xff;
+		map[m / 4] |= k << (8 * (m % 4));
+	}
+
+	so_method(so, tesla, 0x16ac, 2);
+	so_data  (so, m);
+	so_data  (so, vp->cfg.high_temp);
+
+	so_method(so, tesla, 0x1904, 4);
+	so_data  (so, regs[0]);
+	so_data  (so, regs[1]);
+	so_data  (so, regs[2]);
+	so_data  (so, regs[3]);
+
+	n = (m / 4) + ((m % 4) ? 1 : 0);
+	so_method(so, tesla, 0x16bc, n);
+	for (i = 0; i < n; i++)
+		so_data(so, map[i]);
+
+	so_method(so, tesla, 0x1988, 2);
+        so_data  (so, regs[4]);
+        so_data  (so, fp->cfg.high_temp);
+}
+
 void
 nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 {
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index ed3f67b..b7921ad 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -39,6 +39,7 @@ struct nv50_program {
 		unsigned high_result;
 		struct {
 			unsigned attr[2];
+			unsigned bcol;
 		} vp;
 		struct {
 			unsigned regs[4];
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 0caf4b4..aa02947 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -199,6 +199,9 @@ nv50_state_validate(struct nv50_context *nv50)
 	if (nv50->dirty & (NV50_NEW_FRAGPROG | NV50_NEW_FRAGPROG_CB))
 		nv50_fragprog_validate(nv50);
 
+	if (nv50->dirty & (NV50_NEW_VERTPROG | NV50_NEW_FRAGPROG))
+		nv50_linkage_validate(nv50);
+
 	if (nv50->dirty & NV50_NEW_RASTERIZER)
 		so_ref(nv50->rasterizer->so, &nv50->state.rast);
 
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0008-nv50-introduce-linkage-stateobj.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0008-nv50-introduce-linkage-stateobj.patch"

From 8bd2ef6b2dc165d76b6ad30893bc62d894dafac1 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 18:16:52 +0200
Subject: [PATCH] nv50: introduce linkage stateobj

An attempt to improve performance, since assembling the VP output
to FP input map became a mess.

This probably makes it even worse: It creates VP, FP stateobjs
only once and introduces a third shader related stateobj, called
linkage, which is stored in a list object that is obtained or
created on validation. For each configuration (VP, FP, BFC, PTSZ)
there is an extra object.
---
 src/gallium/drivers/nv50/nv50_context.h        |    1 +
 src/gallium/drivers/nv50/nv50_program.c        |  143 +++++++++++++++++++-----
 src/gallium/drivers/nv50/nv50_program.h        |   10 ++
 src/gallium/drivers/nv50/nv50_state_validate.c |    2 +
 4 files changed, 129 insertions(+), 27 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index c31c42a..aadcfda 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -117,6 +117,7 @@ struct nv50_state {
 	unsigned miptree_nr;
 	struct nouveau_stateobj *vertprog;
 	struct nouveau_stateobj *fragprog;
+	struct nouveau_stateobj *plinkage;
 	struct nouveau_stateobj *vtxfmt;
 	struct nouveau_stateobj *vtxbuf;
 };
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 30a1d32..5fae325 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2407,16 +2407,21 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(32, 0);
-	so_method(so, tesla, 0x1650, 2);
-	so_data  (so, p->cfg.vp.attr[0]);
-	so_data  (so, p->cfg.vp.attr[1]);
-	so_method(so, tesla, 0x16b8, 1);
-	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, 0x140c, 1);
-	so_data  (so, p->code->start);
-	so_ref(so, &nv50->state.vertprog);
-	so_ref(NULL, &so);
+	if (!p->so) {
+		so = so_new(7, 0);
+		so_method(so, tesla, 0x1650, 2);
+		so_data  (so, p->cfg.vp.attr[0]);
+		so_data  (so, p->cfg.vp.attr[1]);
+		so_method(so, tesla, 0x16b8, 1);
+		so_data  (so, p->cfg.high_result);
+		so_method(so, tesla, 0x140c, 1);
+		so_data  (so, p->code->start);
+		so_ref(so, &p->so);
+		so_ref(NULL, &so);
+
+	}
+
+	so_ref(p->so, &nv50->state.vertprog);
 }
 
 void
@@ -2435,17 +2440,64 @@ nv50_fragprog_validate(struct nv50_context *nv50)
 	nv50_program_validate_data(nv50, p);
 	nv50_program_validate_code(nv50, p);
 
-	so = so_new(8, 0);
-	so_method(so, tesla, 0x1298, 1);
-	so_data  (so, p->cfg.high_result);
-	so_method(so, tesla, 0x19a8, 1);
-	so_data  (so, p->cfg.fp.regs[2]);
-	so_method(so, tesla, 0x196c, 1);
-	so_data  (so, p->cfg.fp.regs[3]);
-	so_method(so, tesla, 0x1414, 1);
-	so_data  (so, p->code->start);
-	so_ref(so, &nv50->state.fragprog);
-	so_ref(NULL, &so);
+	if (!p->so) {
+		so = so_new(8, 0);
+		so_method(so, tesla, 0x1298, 1);
+		so_data  (so, p->cfg.high_result);
+		so_method(so, tesla, 0x19a8, 1);
+		so_data  (so, p->cfg.fp.regs[2]);
+		so_method(so, tesla, 0x196c, 1);
+		so_data  (so, p->cfg.fp.regs[3]);
+		so_method(so, tesla, 0x1414, 1);
+		so_data  (so, p->code->start);
+		so_ref(so, &p->so);
+		so_ref(NULL, &so);
+	}
+
+	so_ref(p->so, &nv50->state.fragprog);
+}
+
+static struct nv50_linkage *
+program_add_linkage(struct nv50_program *vp, struct nv50_program *fp)
+{
+	struct nv50_linkage *ln = CALLOC_STRUCT(nv50_linkage);
+	struct nv50_program *pg[2] = { vp, fp };
+	unsigned i;
+
+	for (i = 0; i < 2; i++) {
+		if (pg[i]->ln) {
+			ln->next[i] = pg[i]->ln->next[i];
+			pg[i]->ln->next[i] = ln;
+		} else {
+			pg[i]->ln = ln;
+			ln->next[i] = ln;
+		}
+		ln->prog[i] = (void *)pg[i];
+	}
+
+	return ln;
+}
+
+static void
+program_del_linkage(struct nv50_linkage *ln)
+{
+	struct nv50_linkage *it;
+	struct nv50_program *pg[2];
+	unsigned i;
+
+	pg[0] = (struct nv50_program *)ln->prog[0];
+	pg[1] = (struct nv50_program *)ln->prog[1];
+
+	for (i = 0; i < 2; i++) {
+		for (it = pg[i]->ln; it->next[i] != ln; it = it->next[i]);
+		it->next[i] = ln->next[i];
+		if (pg[i]->ln == ln)
+			pg[i]->ln = (ln->next[i] == ln) ? NULL : ln->next[i];
+	}
+
+	if (ln->so)
+		so_ref(NULL, &ln->so);
+	FREE(ln);
 }
 
 /*
@@ -2473,16 +2525,14 @@ nv50_fragprog_validate(struct nv50_context *nv50)
  *	II = count of non-masked interpolants
  *	ii = almost always equal to II (except if II -> 00, why ?)
  */
-void
-nv50_linkage_validate(struct nv50_context *nv50)
+static struct nv50_linkage *
+nv50_linkage_create(struct nv50_context *nv50)
 {
-	/* this is going to be rather complicated at first, but it works
-	 * like this; maybe we can simplify later, though
-	 */
-	struct nouveau_stateobj *so = nv50->state.vertprog;
+	struct nv50_linkage *ln;
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program *vp = nv50->vertprog;
 	struct nv50_program *fp = nv50->fragprog;
+	struct nouveau_stateobj *so = so_new(32, 0);
 
 	uint32_t regs[5];
 	uint32_t map[8], i, n, k, m = 4;
@@ -2538,6 +2588,42 @@ nv50_linkage_validate(struct nv50_context *nv50)
 	so_method(so, tesla, 0x1988, 2);
         so_data  (so, regs[4]);
         so_data  (so, fp->cfg.high_temp);
+
+	ln = program_add_linkage(vp, fp);
+
+	so_ref(so, &ln->so);
+	so_ref(NULL, &so);
+
+	return ln;
+}
+
+void nv50_linkage_validate(struct nv50_context *nv50)
+{
+	struct nv50_linkage *it, *ln = NULL;
+	struct nv50_program *vp = nv50->vertprog;
+	struct nv50_program *fp = nv50->fragprog;
+	unsigned cfg;
+
+	cfg = nv50->rasterizer->pipe.light_twoside;
+	cfg |= nv50->rasterizer->pipe.point_size_per_vertex << 1;
+
+	if (vp->ln) {
+		it = vp->ln->next[0];
+		do {
+			if (it->prog[1] == (void *)fp && it->cfg == cfg) {
+				ln = it;
+				break;
+			}
+			it = it->next[0];
+		} while (it != vp->ln);
+	}
+
+	if (!ln) {
+		ln = nv50_linkage_create(nv50);
+		ln->cfg = cfg;
+	}
+
+	so_ref(ln->so, &nv50->state.plinkage);
 }
 
 void
@@ -2558,6 +2644,9 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 	nouveau_resource_free(&p->data[1]);
 	nouveau_resource_free(&p->code);
 
+	while (p->ln)
+		program_del_linkage(p->ln);
+
 	p->translated = 0;
 }
 
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index b7921ad..6478338 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -15,6 +15,13 @@ struct nv50_program_exec {
 	} param;
 };
 
+struct nv50_linkage {
+	struct nv50_linkage *next[2];
+	struct nouveau_stateobj *so;
+	void *prog[2];
+	unsigned cfg;
+};
+
 struct nv50_program {
 	struct pipe_shader_state pipe;
 	struct tgsi_shader_info info;
@@ -34,6 +41,9 @@ struct nv50_program {
 	unsigned immd_nr;
 	unsigned param_nr;
 
+	struct nouveau_stateobj *so;
+	struct nv50_linkage *ln;
+
 	struct {
 		unsigned high_temp;
 		unsigned high_result;
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index aa02947..cb9bb76 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -150,6 +150,8 @@ nv50_state_emit(struct nv50_context *nv50)
 		so_emit(chan, nv50->state.vertprog);
 	if (nv50->state.dirty & NV50_NEW_FRAGPROG)
 		so_emit(chan, nv50->state.fragprog);
+	if (nv50->state.dirty & (NV50_NEW_VERTPROG | NV50_NEW_FRAGPROG))
+		so_emit(chan, nv50->state.plinkage);
 	if (nv50->state.dirty & NV50_NEW_RASTERIZER)
 		so_emit(chan, nv50->state.rast);
 	if (nv50->state.dirty & NV50_NEW_BLEND_COLOUR)
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0009-nv50-support-for-user-clip-planes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0009-nv50-support-for-user-clip-planes.patch"

From 9a4c0166cbfff6402e14f79b622357d7228ae3d4 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 18:25:25 +0200
Subject: [PATCH] nv50: support for user clip planes

---
 src/gallium/drivers/nv50/nv50_context.h |    1 +
 src/gallium/drivers/nv50/nv50_program.c |   95 ++++++++++++++++++++++++++++---
 src/gallium/drivers/nv50/nv50_program.h |    2 +
 src/gallium/drivers/nv50/nv50_state.c   |    4 +
 4 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index aadcfda..1738000 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -140,6 +140,7 @@ struct nv50_context {
 	struct pipe_poly_stipple stipple;
 	struct pipe_scissor_state scissor;
 	struct pipe_viewport_state viewport;
+	struct pipe_clip_state clip;
 	struct pipe_framebuffer_state framebuffer;
 	struct nv50_program *vertprog;
 	struct nv50_program *fragprog;
diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 5fae325..74f5cff 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -117,6 +117,8 @@ struct nv50_pc {
 	struct nv50_reg *iv_p;
 	struct nv50_reg *iv_c;
 
+	struct nv50_reg r_hpos[4];
+
 	/* current instruction and total number of insns */
 	unsigned insn_cur;
 	unsigned insn_nr;
@@ -2015,7 +2017,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 	}
 
 	if (pc->result_nr) {
-		unsigned nr = pc->result_nr * 4 /* + nr of clip planes */;
+		unsigned nr = pc->result_nr * 4 + pc->p->cfg.vp.ucp.nr;
 		int rid = 0;
 
 		pc->result = MALLOC(nr * sizeof(struct nv50_reg));
@@ -2026,6 +2028,14 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			for (i = 0; i < nr; i++)
 				ctor_reg(&pc->result[i], P_RESULT, i / 4, i);
 
+			if (pc->p->cfg.vp.ucp.nr) {
+				for (c = 0; c < 4; c++) {
+					pc->r_hpos[c] = pc->result[c];
+					pc->result[c].type = P_TEMP;
+					pc->result[c].hw = -1;
+				}
+			}
+
 			/* output id offset bcol from fcol */
 			if (bcol[0] != 0xffff)
 				pc->p->cfg.vp.bcol = bcol[0] - fcol[0];
@@ -2113,6 +2123,8 @@ ctor_nv50_pc(struct nv50_pc *pc, struct nv50_program *p)
 
 	switch (p->type) {
 	case PIPE_SHADER_VERTEX:
+		pc->param_nr += p->cfg.vp.ucp.nr;
+		pc->p->cfg.vp.clip_ctrl = 0;
 		break;
 	case PIPE_SHADER_FRAGMENT:
 		p->cfg.fp.regs[0] = 0x01000404;
@@ -2143,6 +2155,27 @@ nv50fp_move_outputs(struct nv50_pc *pc)
 	}
 }
 
+static void
+nv50vp_ucp_append(struct nv50_pc *pc)
+{
+	struct nv50_reg clpd, temp, *hpos = &pc->result[0];
+	unsigned i, k = (pc->param_nr - pc->p->cfg.vp.ucp.nr) * 4;
+
+	ctor_reg(&temp, P_TEMP, -1, -1);
+	ctor_reg(&clpd, P_RESULT, -1, pc->result_nr * 4);
+
+	for (i = 0; i < pc->p->cfg.vp.ucp.nr; i++, clpd.hw++) {
+		emit_mul(pc, &temp, &hpos[0], &pc->param[k++]);
+		emit_mad(pc, &temp, &hpos[1], &pc->param[k++], &temp);
+		emit_mad(pc, &temp, &hpos[2], &pc->param[k++], &temp);
+		emit_mad(pc, &clpd, &hpos[3], &pc->param[k++], &temp);
+		pc->p->cfg.vp.clip_ctrl |= (1 << i);
+	}
+
+	for (i = 0; i < 4; i++)
+		emit_mov(pc, &pc->r_hpos[i], &hpos[i]);
+}
+
 static void nv50_program_tx_postprocess(struct nv50_pc *pc)
 {
 	struct nv50_program_exec *e, *e_prev = NULL;
@@ -2150,6 +2183,9 @@ static void nv50_program_tx_postprocess(struct nv50_pc *pc)
 
 	if (pc->p->type == PIPE_SHADER_FRAGMENT)
 		nv50fp_move_outputs(pc);
+	else
+	if (pc->p->type == PIPE_SHADER_VERTEX)
+		nv50vp_ucp_append(pc);
 
 	for (e = pc->p->exec_head, pos = 0; e; e = e->next) {
 		pos += is_long(e) ? 2 : 1;
@@ -2259,6 +2295,7 @@ static void
 nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 {
 	struct pipe_screen *pscreen = nv50->pipe.screen;
+	unsigned cbuf, start, count;
 
 	if (!p->data[0] && p->immd_nr) {
 		struct nouveau_resource *heap = nv50->screen->immd_heap[0];
@@ -2279,7 +2316,10 @@ nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 					 p->immd_nr, NV50_CB_PMISC);
 	}
 
-	if (!p->data[1] && p->param_nr) {
+	if (!p->param_nr)
+		return;
+
+	if (!p->data[1]) {
 		struct nouveau_resource *heap =
 			nv50->screen->parm_heap[p->type];
 
@@ -2295,16 +2335,29 @@ nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 		}
 	}
 
-	if (p->param_nr) {
-		unsigned cbuf = NV50_CB_PVP;
+	start = p->data[1]->start;
+
+	if (p->type == PIPE_SHADER_VERTEX) {
+		count = p->param_nr - p->cfg.vp.ucp.nr * 4;
+		cbuf = NV50_CB_PVP;
+	} else {
+		count = p->param_nr;
+		cbuf = NV50_CB_PFP;
+	}
+
+	if (count) {
 		float *map = pipe_buffer_map(pscreen, nv50->constbuf[p->type],
 					     PIPE_BUFFER_USAGE_CPU_READ);
-		if (p->type == PIPE_SHADER_FRAGMENT)
-			cbuf = NV50_CB_PFP;
-		nv50_program_upload_data(nv50, map, p->data[1]->start,
-					 p->param_nr, cbuf);
+		nv50_program_upload_data(nv50, map, start, count, cbuf);
 		pipe_buffer_unmap(pscreen, nv50->constbuf[p->type]);
 	}
+
+	if (p->param_nr > count) {
+		start += count;
+		count = p->cfg.vp.ucp.nr * 4;
+		nv50_program_upload_data(nv50, &p->cfg.vp.ucp.ucp[0][0],
+					 start, count, cbuf);
+	}
 }
 
 static void
@@ -2398,6 +2451,12 @@ nv50_vertprog_validate(struct nv50_context *nv50)
 	struct nv50_program *p = nv50->vertprog;
 	struct nouveau_stateobj *so;
 
+	if (p->translated && p->cfg.vp.ucp.nr != nv50->clip.nr)
+		nv50_program_destroy(nv50, p);
+
+	if (nv50->clip.nr)
+		memcpy(&p->cfg.vp.ucp, &nv50->clip, sizeof(nv50->clip));
+
 	if (!p->translated) {
 		nv50_program_validate(nv50, p);
 		if (!p->translated)
@@ -2532,6 +2591,7 @@ nv50_linkage_create(struct nv50_context *nv50)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_program *vp = nv50->vertprog;
 	struct nv50_program *fp = nv50->fragprog;
+	struct pipe_clip_state *ucp = &vp->cfg.vp.ucp;
 	struct nouveau_stateobj *so = so_new(32, 0);
 
 	uint32_t regs[5];
@@ -2546,6 +2606,21 @@ nv50_linkage_create(struct nv50_context *nv50)
 	regs[0] /* 1904 */ = fp->cfg.fp.regs[0];
 	regs[4] /* 1988 */ = fp->cfg.fp.regs[1];
 
+	if (ucp->nr) {
+		n = vp->cfg.high_result - ucp->nr;
+		m += ucp->nr;
+
+		map[1] = 0x03020100 + (0x01010101 * n);
+		map[2] = 0x07060504 + (0x01010101 * n);
+
+		regs[1] |= (m << 8);
+		regs[0] += (ucp->nr << 8) + ucp->nr;
+		regs[4] += (ucp->nr << 8);
+	}
+
+	so_method(so, tesla, 0x1510, 1);
+	so_data  (so, vp->cfg.vp.clip_ctrl);
+
 	so_method(so, tesla, 0x1688, 1);
 
 	if (nv50->rasterizer->pipe.light_twoside) {
@@ -2606,6 +2681,8 @@ void nv50_linkage_validate(struct nv50_context *nv50)
 
 	cfg = nv50->rasterizer->pipe.light_twoside;
 	cfg |= nv50->rasterizer->pipe.point_size_per_vertex << 1;
+	if (nv50->clip.nr)
+		cfg |= (1 << 2);
 
 	if (vp->ln) {
 		it = vp->ln->next[0];
@@ -2647,6 +2724,8 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 	while (p->ln)
 		program_del_linkage(p->ln);
 
+	p->cfg.vp.ucp.nr = 0;
+
 	p->translated = 0;
 }
 
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 6478338..bd28d21 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -50,6 +50,8 @@ struct nv50_program {
 		struct {
 			unsigned attr[2];
 			unsigned bcol;
+			unsigned clip_ctrl;
+			struct pipe_clip_state ucp;
 		} vp;
 		struct {
 			unsigned regs[4];
diff --git a/src/gallium/drivers/nv50/nv50_state.c b/src/gallium/drivers/nv50/nv50_state.c
index 116866a..4fab820 100644
--- a/src/gallium/drivers/nv50/nv50_state.c
+++ b/src/gallium/drivers/nv50/nv50_state.c
@@ -549,6 +549,10 @@ static void
 nv50_set_clip_state(struct pipe_context *pipe,
 		    const struct pipe_clip_state *clip)
 {
+	struct nv50_context *nv50 = nv50_context(pipe);
+
+	nv50->clip = *clip;
+	nv50->dirty |= NV50_NEW_VERTPROG_CB;
 }
 
 static void
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0010-nv50-support-point_size_per_vertex.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0010-nv50-support-point_size_per_vertex.patch"

From fd28b304a8cc49eb97955b820f84bb8c76a08dd1 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 14:22:43 +0200
Subject: [PATCH] nv50: support point_size_per_vertex

---
 src/gallium/drivers/nv50/nv50_program.c |    9 +++++++++
 src/gallium/drivers/nv50/nv50_program.h |    1 +
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 74f5cff..d7ab28a 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1845,6 +1845,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 					if (pc->p->type == PIPE_SHADER_VERTEX)
 						bcol[c] = first;
 					break;
+				case TGSI_SEMANTIC_PSIZE:
+					pc->p->cfg.vp.ptsz = first * 4;
+					break;
 				default:
 					break;
 				}
@@ -2645,6 +2648,12 @@ nv50_linkage_create(struct nv50_context *nv50)
 		map[m / 4] |= k << (8 * (m % 4));
 	}
 
+	if (nv50->rasterizer->pipe.point_size_per_vertex) {
+		map[m / 4] |= vp->cfg.vp.ptsz << (8 * (m % 4));
+		regs[3] |= (m << 4) | 1;
+		m++;
+	}
+
 	so_method(so, tesla, 0x16ac, 2);
 	so_data  (so, m);
 	so_data  (so, vp->cfg.high_temp);
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index bd28d21..1206aab 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -50,6 +50,7 @@ struct nv50_program {
 		struct {
 			unsigned attr[2];
 			unsigned bcol;
+			unsigned ptsz;
 			unsigned clip_ctrl;
 			struct pipe_clip_state ucp;
 		} vp;
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0011-nv50-better-insn-generation.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0011-nv50-better-insn-generation.patch"

From 3f4008a60551335324d9b9a874e9df31c57e415c Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 19:07:09 +0200
Subject: [PATCH] nv50: better insn generation

Don't use extra TEMPs unnecessarily in some cases.
---
 src/gallium/drivers/nv50/nv50_program.c |  120 +++++++++++++++---------------
 1 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index d7ab28a..5594560 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -1294,18 +1294,20 @@ static boolean
 nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 {
 	const struct tgsi_full_instruction *inst = &tok->FullInstruction;
-	struct nv50_reg *rdst[4], *dst[4], *src[3][4], *temp;
-	unsigned mask, sat, unit;
+	struct nv50_reg *rdst[4], *dst[4], *src[3][4];
+	struct nv50_reg **pp_rtmp, *rtmp = NULL, *temp = NULL;
+	unsigned mask, sat, unit = 0;
 	boolean assimilate = FALSE;
-	int i, c;
+	int i, c, nr_dst = 0;
 
 	mask = inst->FullDstRegisters[0].DstRegister.WriteMask;
 	sat = inst->Instruction.Saturate == TGSI_SAT_ZERO_ONE;
 
 	for (c = 0; c < 4; c++) {
-		if (mask & (1 << c))
+		if (mask & (1 << c)) {
 			dst[c] = tgsi_dst(pc, c, &inst->FullDstRegisters[0]);
-		else
+			++nr_dst;
+		} else
 			dst[c] = NULL;
 		rdst[c] = NULL;
 		src[0][c] = NULL;
@@ -1313,8 +1315,13 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		src[2][c] = NULL;
 	}
 
+	pp_rtmp = &dst[ffs(mask) - 1];
+	if (*pp_rtmp && (*pp_rtmp)->type != P_TEMP && (nr_dst > 1 || sat))
+		pp_rtmp = &temp;
+
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
-		const struct tgsi_full_src_register *fs = &inst->FullSrcRegisters[i];
+		const struct tgsi_full_src_register *fs =
+			&inst->FullSrcRegisters[i];
 
 		if (fs->SrcRegister.File == TGSI_FILE_SAMPLER)
 			unit = fs->SrcRegister.Index;
@@ -1327,10 +1334,15 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	if (sat) {
 		for (c = 0; c < 4; c++) {
 			rdst[c] = dst[c];
-			dst[c] = temp_temp(pc);
+			if (dst[c] && dst[c]->type != P_TEMP)
+				dst[c] = temp_temp(pc);
 		}
-	} else
-	if (direct2dest_op(inst)) {
+	}
+
+	if (direct2dest_op(inst) && (*pp_rtmp)) {
+		/* We really don't lose the real dst as we do not
+		 * get here if sat overwrites dst with temp.
+		 */
 		for (c = 0; c < 4; c++) {
 			if (!dst[c] || dst[c]->type != P_TEMP)
 				continue;
@@ -1341,7 +1353,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 				    dst[c] == src[2][i])
 					break;
 			}
-			if (i == 4)
+			if (i == 4 || !dst[i])
 				continue;
 
 			assimilate = TRUE;
@@ -1367,48 +1379,32 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		break;
 	case TGSI_OPCODE_COS:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_precossin(pc, temp, src[0][0]);
-		emit_flop(pc, 5, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_flop(pc, 5, rtmp, temp);
 		break;
 	case TGSI_OPCODE_DP3:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
-		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_mad(pc, rtmp, src[0][2], src[1][2], temp);
 		break;
 	case TGSI_OPCODE_DP4:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		emit_mad(pc, temp, src[0][3], src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_mad(pc, rtmp, src[0][3], src[1][3], temp);
 		break;
 	case TGSI_OPCODE_DPH:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_mul(pc, temp, src[0][0], src[1][0]);
 		emit_mad(pc, temp, src[0][1], src[1][1], temp);
 		emit_mad(pc, temp, src[0][2], src[1][2], temp);
-		emit_add(pc, temp, src[1][3], temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_add(pc, rtmp, src[1][3], temp);
 		break;
 	case TGSI_OPCODE_DST:
 	{
@@ -1426,13 +1422,9 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		break;
 	case TGSI_OPCODE_EX2:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_preex2(pc, temp, src[0][0]);
-		emit_flop(pc, 6, temp, temp);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		emit_flop(pc, 6, rtmp, temp);
 		break;
 	case TGSI_OPCODE_FLR:
 		for (c = 0; c < 4; c++) {
@@ -1461,13 +1453,10 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		emit_lit(pc, &dst[0], mask, &src[0][0]);
 		break;
 	case TGSI_OPCODE_LG2:
-		temp = temp_temp(pc);
-		emit_flop(pc, 3, temp, src[0][0]);
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_mov(pc, dst[c], temp);
-		}
+		rtmp = *pp_rtmp;
+		if (!rtmp)
+			rtmp = temp_temp(pc);
+		emit_flop(pc, 3, rtmp, src[0][0]);
 		break;
 	case TGSI_OPCODE_LRP:
 		temp = temp_temp(pc);
@@ -1523,18 +1512,16 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_RCP:
-		for (c = 3; c >= 0; c--) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_flop(pc, 0, dst[c], src[0][0]);
-		}
+		rtmp = *pp_rtmp;
+		if (!rtmp)
+			rtmp = temp_temp(pc);
+		emit_flop(pc, 0, rtmp, src[0][0]);
 		break;
 	case TGSI_OPCODE_RSQ:
-		for (c = 3; c >= 0; c--) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_flop(pc, 2, dst[c], src[0][0]);
-		}
+		rtmp = *pp_rtmp;
+		if (!rtmp)
+			rtmp = temp_temp(pc);
+		emit_flop(pc, 2, rtmp, src[0][0]);
 		break;
 	case TGSI_OPCODE_SCS:
 		temp = temp_temp(pc);
@@ -1557,6 +1544,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		break;
 	case TGSI_OPCODE_SIN:
 		temp = temp_temp(pc);
+		rtmp = *pp_rtmp;
 		emit_precossin(pc, temp, src[0][0]);
 		emit_flop(pc, 4, temp, temp);
 		for (c = 0; c < 4; c++) {
@@ -1611,14 +1599,26 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		return FALSE;
 	}
 
+	if (rtmp) {
+		if (sat)
+			dst[0] = dst[1] = dst[2] = dst[3] = rtmp;
+		else {
+			for (c = 0; c < 4; c++) {
+				if (mask & (1 << c))
+					emit_mov(pc, dst[c], rtmp);
+			}
+		}
+	}
+
 	if (sat) {
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_cvt(pc, rdst[c], dst[c], -1, CVTOP_SAT,
-				 CVT_F32_F32);
+			emit_cvt(pc, rdst[c], dst[c], -1, CVTOP_SAT, 0xc4);
 		}
-	} else if (assimilate) {
+	}
+
+	if (assimilate) {
 		for (c = 0; c < 4; c++)
 			if (rdst[c])
 				assimilate_temp(pc, rdst[c], dst[c]);
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0012-nv50-initial-support-for-IF-ELSE-ENDIF-insns.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0012-nv50-initial-support-for-IF-ELSE-ENDIF-insns.patch"

From 406a4f6d0f59190c8695763ece51fbf631abece4 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 18:40:39 +0200
Subject: [PATCH] nv50: initial support for IF, ELSE, ENDIF insns

---
 src/gallium/drivers/nv50/nv50_program.c |  162 +++++++++++++++++++++++++------
 src/gallium/drivers/nv50/nv50_program.h |    1 +
 2 files changed, 132 insertions(+), 31 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 5594560..16bf2f1 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -90,6 +90,8 @@ struct nv50_reg {
 	int acc; /* instruction where this reg is last read (first insn == 1) */
 };
 
+#define MAX_IF_LEVEL 4 /* arbitrary value */
+
 struct nv50_pc {
 	struct nv50_program *p;
 
@@ -119,11 +121,17 @@ struct nv50_pc {
 
 	struct nv50_reg r_hpos[4];
 
+	struct nv50_program_exec *if_cond;
+	struct nv50_program_exec *if_insn[MAX_IF_LEVEL];
+	struct nv50_program_exec *if_join[MAX_IF_LEVEL];
+	unsigned if_lvl;
+
 	/* current instruction and total number of insns */
 	unsigned insn_cur;
 	unsigned insn_nr;
 
 	boolean allow32;
+	boolean join_on;
 };
 
 static inline void
@@ -208,22 +216,6 @@ alloc_temp(struct nv50_pc *pc, struct nv50_reg *dst)
 	return NULL;
 }
 
-/* Assign the hw of the discarded temporary register src
- * to the tgsi register dst and free src.
- */
-static void
-assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
-{
-	assert(src->index == -1 && src->hw != -1);
-
-	if (dst->hw != -1)
-		pc->r_temp[dst->hw] = NULL;
-	pc->r_temp[src->hw] = dst;
-	dst->hw = src->hw;
-
-	FREE(src);
-}
-
 /* release the hardware resource held by r */
 static void
 release_hw(struct nv50_pc *pc, struct nv50_reg *r)
@@ -351,6 +343,11 @@ emit(struct nv50_pc *pc, struct nv50_program_exec *e)
 		p->exec_head = e;
 	p->exec_tail = e;
 	p->exec_size += (e->inst[0] & 1) ? 2 : 1;
+
+	if (pc->join_on) {
+		e->inst[1] |= 0x00000002;
+		pc->join_on = FALSE;
+	}
 }
 
 static INLINE void set_long(struct nv50_pc *, struct nv50_program_exec *);
@@ -524,6 +521,28 @@ emit_mov_immdval(struct nv50_pc *pc, struct nv50_reg *dst, float f)
 	FREE(imm);
 }
 
+/* Assign the hw of the discarded temporary register src
+ * to the tgsi register dst and free src.
+ */
+static void
+assimilate_temp(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
+{
+	assert(src->index == -1 && src->hw != -1);
+
+	if (pc->if_lvl > 0) {
+		emit_mov(pc, dst, src);
+		free_temp(pc, src);
+		return;
+	}
+
+	if (dst->hw != -1)
+		pc->r_temp[dst->hw] = NULL;
+	pc->r_temp[src->hw] = dst;
+	dst->hw = src->hw;
+
+	FREE(src);
+}
+
 static boolean
 check_swap_src_0_1(struct nv50_pc *pc,
 		   struct nv50_reg **s0, struct nv50_reg **s1)
@@ -866,6 +885,8 @@ emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
 	set_src_0(pc, dst, e);
 	emit(pc, e);
 
+	pc->if_cond = e;
+
 	if (dst != rdst)
 		free_temp(pc, dst);
 }
@@ -1098,6 +1119,39 @@ emit_tex(struct nv50_pc *pc, struct nv50_reg **dst, unsigned mask,
 }
 
 static void
+emit_branch(struct nv50_pc *pc, int pred, unsigned cc, void *join)
+{
+	struct nv50_program_exec *e = exec(pc);
+
+	if (join) {
+		set_long(pc, e);
+		e->inst[0] |= 0xa0000002;
+		emit(pc, e);
+		*(struct nv50_program_exec **)join = e;
+		e = exec(pc);
+	}
+
+	set_long(pc, e);
+	e->inst[0] |= 0x10000002;
+	if (pred >= 0)
+		set_pred(pc, cc, pred, e);
+	emit(pc, e);
+}
+
+static void
+emit_nop(struct nv50_pc *pc, boolean full)
+{
+	struct nv50_program_exec *e = exec(pc);
+
+	e->inst[0] = 0xf0000000;
+	if (full) {
+		set_long(pc, e);
+		e->inst[1] = 0xe0000000;
+	}
+	emit(pc, e);
+}
+
+static void
 convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)
 {
 	unsigned q = 0, m = ~0;
@@ -1420,6 +1474,22 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		FREE(one);
 	}
 		break;
+	case TGSI_OPCODE_ELSE:
+		emit_branch(pc, -1, 0, NULL);
+		pc->if_insn[--pc->if_lvl]->bra = (1 << 31) | pc->p->exec_size;
+		pc->if_insn[pc->if_lvl++] = pc->p->exec_tail;
+		break;
+	case TGSI_OPCODE_ENDIF:
+		i = pc->p->exec_size | (1 << 31);
+		pc->if_insn[--pc->if_lvl]->bra = i;
+		if (pc->if_join[pc->if_lvl]) {
+			pc->if_join[pc->if_lvl]->bra = i;
+			pc->if_join[pc->if_lvl] = NULL;
+			pc->join_on = TRUE;
+		}
+		if (pc->insn_cur == (pc->insn_nr - 1))
+			emit_nop(pc, TRUE);
+		break;
 	case TGSI_OPCODE_EX2:
 		temp = temp_temp(pc);
 		rtmp = *pp_rtmp;
@@ -1442,6 +1512,12 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 			emit_sub(pc, dst[c], src[0][c], temp);
 		}
 		break;
+	case TGSI_OPCODE_IF:
+		assert(pc->if_lvl < MAX_IF_LEVEL);
+		set_pred_wr(pc, 1, 0, pc->if_cond);
+		emit_branch(pc, 0, 2, &pc->if_join[pc->if_lvl]);
+		pc->if_insn[pc->if_lvl++] = pc->p->exec_tail;
+		break;
 	case TGSI_OPCODE_KIL:
 		emit_kil(pc, src[0][0]);
 		emit_kil(pc, src[0][1]);
@@ -2181,8 +2257,8 @@ nv50vp_ucp_append(struct nv50_pc *pc)
 
 static void nv50_program_tx_postprocess(struct nv50_pc *pc)
 {
-	struct nv50_program_exec *e, *e_prev = NULL;
-	unsigned pos;
+	struct nv50_program_exec *e, **e_list, *e_prev = NULL;
+	unsigned i, n, pos;
 
 	if (pc->p->type == PIPE_SHADER_FRAGMENT)
 		nv50fp_move_outputs(pc);
@@ -2190,15 +2266,31 @@ static void nv50_program_tx_postprocess(struct nv50_pc *pc)
 	if (pc->p->type == PIPE_SHADER_VERTEX)
 		nv50vp_ucp_append(pc);
 
+	/* collect branching instructions, we need to adjust their target
+	 * offsets when converting half insns
+	 */
+	e_list = MALLOC(pc->p->exec_size * sizeof(struct nv50_program_exec *));
+
+	for (n = 0, e = pc->p->exec_head; e; e = e->next) {
+		if (e->bra) {
+			e_list[n++] = e;
+			e->bra &= ~(1 << 31);
+		}
+	}
+
 	for (e = pc->p->exec_head, pos = 0; e; e = e->next) {
 		pos += is_long(e) ? 2 : 1;
 
 		if ((!e->next || is_long(e->next)) && (pos & 1)) {
+			for (i = 0; i < n; i++)
+				if (e_list[i]->bra > (pos - 1))
+					e_list[i]->bra++;
 			convert_to_long(pc, e);
 			pos++;
 		}
 		e_prev = e->next ? e : e_prev;
 	}
+	FREE(e_list);
 
 	/* last instruction must be long */
 	if (!is_long(pc->p->exec_tail)) {
@@ -2234,7 +2326,8 @@ nv50_program_tx(struct nv50_program *p)
 
 		/* don't allow half insn/immd on first and last instruction */
 		pc->allow32 = TRUE;
-		if (pc->insn_cur == 0 || pc->insn_cur + 2 == pc->insn_nr)
+		if (pc->insn_cur == 0 || pc->insn_cur + 2 == pc->insn_nr ||
+		    pc->join_on)
 			pc->allow32 = FALSE;
 
 		tgsi_parse_token(&parse);
@@ -2383,11 +2476,29 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 	heap = nv50->screen->code_heap[p->type];
 	code = nv50->screen->sprogbuf_code[p->type];
 
+	size = align(p->exec_size * 4, 0x100);
+
+	if (!p->code) {
+		ret = nouveau_resource_alloc(heap, size, p, &p->code);
+		if (ret)
+			assert(!"No more space in program VRAM buffer.");
+	}
+
 	if ((p->data[0] && p->data[0]->start != p->data_start[0]) ||
-		(p->data[1] && p->data[1]->start != p->data_start[1])) {
+	    (p->data[1] && p->data[1]->start != p->data_start[1]))
+		upload = TRUE;
+
+	if (upload) {
 		for (e = p->exec_head; e; e = e->next) {
 			unsigned ei, ci, bs;
 
+			if (e->bra) {
+				assert(!(e->bra & 1));
+				bs = (e->bra >> 1) + (p->code->start >> 3);
+				e->inst[0] &= 0xF0000FFF;
+				e->inst[0] |= (bs << 12);
+			}
+
 			if (e->param.index < 0)
 				continue;
 			bs = (e->inst[1] >> 22) & 0x07;
@@ -2403,8 +2514,6 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 			p->data_start[0] = p->data[0]->start;
 		if (p->data[1])
 			p->data_start[1] = p->data[1]->start;
-
-		upload = TRUE;
 	}
 
 	if (!upload)
@@ -2434,15 +2543,6 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 
 	nouveau_bo_unmap(p->bo);
 
-	size = align(p->exec_size * 4, 0x100);
-	if (!p->code) {
-		ret = nouveau_resource_alloc(heap, size, p, &p->code);
-		if (ret) {
-			NOUVEAU_ERR("Program VRAM buffer is full.\n");
-			abort();
-		}
-	}
-
 	nv50_transfer_gart_vram(&nv50->screen->base.base,
 				code, p->code->start, p->bo, 0, size);
 }
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index 1206aab..ac5230d 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -13,6 +13,7 @@ struct nv50_program_exec {
 		unsigned mask;
 		unsigned shift;
 	} param;
+	unsigned bra;
 };
 
 struct nv50_linkage {
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0013-nv50-support-for-SLE-SNE-SEQ-SGT.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0013-nv50-support-for-SLE-SNE-SEQ-SGT.patch"

From 77789c8ef0bc2271d2bfa1b4c961d32261b3b87d Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 16:14:29 +0200
Subject: [PATCH] nv50: support for SLE, SNE, SEQ, SGT

---
 src/gallium/drivers/nv50/nv50_program.c |  118 +++++++++++++++++++++----------
 1 files changed, 80 insertions(+), 38 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 16bf2f1..75c5cea 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -810,7 +810,11 @@ emit_precossin(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 #define CVTOP_TRUNC	0x07
 #define CVTOP_SAT	0x08
 #define CVTOP_ABS	0x10
+#define CVTOP_ABSRN	0x11
 
+/* 0x04 == 32 bit */
+/* 0x40 == dst is float */
+/* 0x80 == src is float */
 #define CVT_F32_F32 0xc4
 #define CVT_F32_S32 0x44
 #define CVT_F32_U32 0x64
@@ -819,8 +823,8 @@ emit_precossin(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 #define CVT_F32_F32_ROP 0xcc
 
 static void
-emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
-	 int wp, unsigned cop, unsigned fmt)
+emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, int wp,
+	 struct nv50_reg *src, unsigned cvn, unsigned fmt)
 {
 	struct nv50_program_exec *e;
 
@@ -829,7 +833,7 @@ emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
 
 	e->inst[0] |= 0xa0000000;
 	e->inst[1] |= 0x00004000;
-	e->inst[1] |= (cop << 16);
+	e->inst[1] |= (cvn << 16);
 	e->inst[1] |= (fmt << 24);
 	set_src_0(pc, src, e);
 
@@ -846,55 +850,94 @@ emit_cvt(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src,
 	emit(pc, e);
 }
 
+static inline unsigned
+map_opcode_ccode(unsigned op)
+{
+	switch (op) {
+	case TGSI_OPCODE_SLT: return TGSI_CC_LT;
+	case TGSI_OPCODE_SGE: return TGSI_CC_GE;
+	case TGSI_OPCODE_SEQ: return TGSI_CC_EQ;
+	case TGSI_OPCODE_SGT: return TGSI_CC_GT;
+	case TGSI_OPCODE_SLE: return TGSI_CC_LE;
+	case TGSI_OPCODE_SNE: return TGSI_CC_NE;
+	default:
+		assert(0);
+		return 0;
+	}
+}
+
+static inline unsigned
+map_ccode_nv50(unsigned cc)
+{
+	assert(cc < 16);
+
+	switch (cc) {
+	case TGSI_CC_GT: return 0x4;
+	case TGSI_CC_EQ: return 0x2;
+	case TGSI_CC_LT: return 0x1;
+	case TGSI_CC_GE: return 0x6;
+	case TGSI_CC_LE: return 0x3;
+	case TGSI_CC_NE: return 0xd;
+
+	case TGSI_CC_GT + 8: return 0x3;
+	case TGSI_CC_EQ + 8: return 0xd;
+	case TGSI_CC_LT + 8: return 0x6;
+	case TGSI_CC_GE + 8: return 0x1;
+	case TGSI_CC_LE + 8: return 0x4;
+	case TGSI_CC_NE + 8: return 0x2;
+
+	default:
+		assert(!"invalid condition code");
+		return 0x0;
+	}
+}
+
 static void
-emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst,
+emit_set(struct nv50_pc *pc, unsigned c_op, struct nv50_reg *dst, int wp,
 	 struct nv50_reg *src0, struct nv50_reg *src1)
 {
 	struct nv50_program_exec *e = exec(pc);
-	unsigned inv_cop[8] = { 0, 4, 2, 6, 1, 5, 3, 7 };
 	struct nv50_reg *rdst;
 
-	assert(c_op <= 7);
 	if (check_swap_src_0_1(pc, &src0, &src1))
-		c_op = inv_cop[c_op];
+		c_op += 8;
 
 	rdst = dst;
-	if (dst->type != P_TEMP)
-		dst = alloc_temp(pc, NULL);
+	if (dst && dst->type != P_TEMP)
+		dst = temp_temp(pc);
 
 	/* set.u32 */
 	set_long(pc, e);
 	e->inst[0] |= 0xb0000000;
-	e->inst[1] |= (3 << 29);
-	e->inst[1] |= (c_op << 14);
-	/*XXX: breaks things, .u32 by default?
-	 *     decuda will disasm as .u16 and use .lo/.hi regs, but this
-	 *     doesn't seem to match what the hw actually does.
-	inst[1] |= 0x04000000; << breaks things.. .u32 by default?
-	 */
-	set_dst(pc, dst, e);
+	e->inst[1] |= 0x60000000;
+	/* XXX: decuda will disasm .u16 lo/hi,
+	 *      but 32 bit flag breaks things: */
+	/* e->inst[1] |= 0x04000000; */
+	e->inst[1] |= (map_ccode_nv50(c_op) << 14);
+
+	if (wp >= 0)
+		set_pred_wr(pc, 1, wp, e);
+	if (dst)
+		set_dst(pc, dst, e);
+	else {
+		e->inst[0] |= 0x000001fc;
+		e->inst[1] |= 0x00000008;
+	}
+
 	set_src_0(pc, src0, e);
 	set_src_1(pc, src1, e);
-	emit(pc, e);
 
-	/* cvt.f32.u32 */
-	e = exec(pc);
-	e->inst[0] = 0xa0000001;
-	e->inst[1] = 0x64014780;
-	set_dst(pc, rdst, e);
-	set_src_0(pc, dst, e);
 	emit(pc, e);
-
 	pc->if_cond = e;
 
-	if (dst != rdst)
-		free_temp(pc, dst);
+	if (rdst)
+		emit_cvt(pc, rdst, -1, dst, CVTOP_ABSRN, CVT_F32_S32);
 }
 
 static INLINE void
 emit_flr(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
-	emit_cvt(pc, dst, src, -1, CVTOP_FLOOR, CVT_F32_F32_ROP);
+	emit_cvt(pc, dst, -1, src, CVTOP_FLOOR, CVT_F32_F32_ROP);
 }
 
 static void
@@ -914,7 +957,7 @@ emit_pow(struct nv50_pc *pc, struct nv50_reg *dst,
 static INLINE void
 emit_abs(struct nv50_pc *pc, struct nv50_reg *dst, struct nv50_reg *src)
 {
-	emit_cvt(pc, dst, src, -1, CVTOP_ABS, CVT_F32_F32);
+	emit_cvt(pc, dst, -1, src, CVTOP_ABS, CVT_F32_F32);
 }
 
 static void
@@ -1611,13 +1654,6 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		if (mask & (1 << 3))
 			emit_mov_immdval(pc, dst[3], 1.0);
 		break;
-	case TGSI_OPCODE_SGE:
-		for (c = 0; c < 4; c++) {
-			if (!(mask & (1 << c)))
-				continue;
-			emit_set(pc, 6, dst[c], src[0][c], src[1][c]);
-		}
-		break;
 	case TGSI_OPCODE_SIN:
 		temp = temp_temp(pc);
 		rtmp = *pp_rtmp;
@@ -1630,10 +1666,16 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		}
 		break;
 	case TGSI_OPCODE_SLT:
+	case TGSI_OPCODE_SGE:
+	case TGSI_OPCODE_SEQ:
+	case TGSI_OPCODE_SGT:
+	case TGSI_OPCODE_SLE:
+	case TGSI_OPCODE_SNE:
+		i = map_opcode_ccode(inst->Instruction.Opcode);
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_set(pc, 1, dst[c], src[0][c], src[1][c]);
+			emit_set(pc, i, dst[c], -1, src[0][c], src[1][c]);
 		}
 		break;
 	case TGSI_OPCODE_SUB:
@@ -1690,7 +1732,7 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 		for (c = 0; c < 4; c++) {
 			if (!(mask & (1 << c)))
 				continue;
-			emit_cvt(pc, rdst[c], dst[c], -1, CVTOP_SAT, 0xc4);
+			emit_cvt(pc, rdst[c], -1, dst[c], CVTOP_SAT, 0xc4);
 		}
 	}
 
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0014-nv50-don-t-allocate-in-the-param-buffer.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0014-nv50-don-t-allocate-in-the-param-buffer.patch"

From 5773a80dad3041a7a9c10579b8045c09c618f519 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 19:01:33 +0200
Subject: [PATCH] nv50: don't allocate in the param buffer

Since we upload all parameters on every program / constbuf change,
we don't have to reserve space and can just use the whole buffer.

Doesn't apply to the buffer holding immediates.
---
 src/gallium/drivers/nv50/nv50_program.c |   39 ++++++++----------------------
 src/gallium/drivers/nv50/nv50_program.h |    6 ++--
 2 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 75c5cea..28a9f2a 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -2433,7 +2433,7 @@ static void
 nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 {
 	struct pipe_screen *pscreen = nv50->pipe.screen;
-	unsigned cbuf, start, count;
+	unsigned cbuf, count;
 
 	if (!p->data[0] && p->immd_nr) {
 		struct nouveau_resource *heap = nv50->screen->immd_heap[0];
@@ -2457,23 +2457,10 @@ nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 	if (!p->param_nr)
 		return;
 
-	if (!p->data[1]) {
-		struct nouveau_resource *heap =
-			nv50->screen->parm_heap[p->type];
-
-		if (nouveau_resource_alloc(heap, p->param_nr, p, &p->data[1])) {
-			while (heap->next && heap->size < p->param_nr) {
-				struct nv50_program *evict = heap->next->priv;
-				nouveau_resource_free(&evict->data[1]);
-			}
-
-			if (nouveau_resource_alloc(heap, p->param_nr, p,
-						   &p->data[1]))
-				assert(0);
-		}
-	}
-
-	start = p->data[1]->start;
+	/* we can use the whole buffer for parameters as we upload them
+	 * all everytime anyway
+	 */
+	assert(p->param_nr <= 128);
 
 	if (p->type == PIPE_SHADER_VERTEX) {
 		count = p->param_nr - p->cfg.vp.ucp.nr * 4;
@@ -2486,15 +2473,13 @@ nv50_program_validate_data(struct nv50_context *nv50, struct nv50_program *p)
 	if (count) {
 		float *map = pipe_buffer_map(pscreen, nv50->constbuf[p->type],
 					     PIPE_BUFFER_USAGE_CPU_READ);
-		nv50_program_upload_data(nv50, map, start, count, cbuf);
+		nv50_program_upload_data(nv50, map, 0, count, cbuf);
 		pipe_buffer_unmap(pscreen, nv50->constbuf[p->type]);
 	}
 
 	if (p->param_nr > count) {
-		start += count;
-		count = p->cfg.vp.ucp.nr * 4;
 		nv50_program_upload_data(nv50, &p->cfg.vp.ucp.ucp[0][0],
-					 start, count, cbuf);
+					 count, p->cfg.vp.ucp.nr * 4, cbuf);
 	}
 }
 
@@ -2526,8 +2511,7 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 			assert(!"No more space in program VRAM buffer.");
 	}
 
-	if ((p->data[0] && p->data[0]->start != p->data_start[0]) ||
-	    (p->data[1] && p->data[1]->start != p->data_start[1]))
+	if (p->data[0] && p->data[0]->start != p->data_start[0])
 		upload = TRUE;
 
 	if (upload) {
@@ -2546,7 +2530,9 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 			bs = (e->inst[1] >> 22) & 0x07;
 			assert(bs < 2);
 			ei = e->param.shift >> 5;
-			ci = e->param.index + p->data[bs]->start;
+			ci = e->param.index;
+			if (bs == 0)
+				ci += p->data[bs]->start;
 
 			e->inst[ei] &= ~e->param.mask;
 			e->inst[ei] |= (ci << e->param.shift);
@@ -2554,8 +2540,6 @@ nv50_program_validate_code(struct nv50_context *nv50, struct nv50_program *p)
 
 		if (p->data[0])
 			p->data_start[0] = p->data[0]->start;
-		if (p->data[1])
-			p->data_start[1] = p->data[1]->start;
 	}
 
 	if (!upload)
@@ -2869,7 +2853,6 @@ nv50_program_destroy(struct nv50_context *nv50, struct nv50_program *p)
 	nouveau_bo_ref(NULL, &p->bo);
 
 	nouveau_resource_free(&p->data[0]);
-	nouveau_resource_free(&p->data[1]);
 	nouveau_resource_free(&p->code);
 
 	while (p->ln)
diff --git a/src/gallium/drivers/nv50/nv50_program.h b/src/gallium/drivers/nv50/nv50_program.h
index ac5230d..2b7cffd 100644
--- a/src/gallium/drivers/nv50/nv50_program.h
+++ b/src/gallium/drivers/nv50/nv50_program.h
@@ -32,11 +32,11 @@ struct nv50_program {
 	struct nv50_program_exec *exec_head;
 	struct nv50_program_exec *exec_tail;
 	unsigned exec_size;
-	struct nouveau_resource *data[2];
-	unsigned data_start[2];
 
-	struct nouveau_resource *code;
 	struct nouveau_bo *bo;
+	struct nouveau_resource *code;
+	struct nouveau_resource *data[1];
+	unsigned data_start[1];
 
 	float *immd;
 	unsigned immd_nr;
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0015-nv50-defer-FP-attribute-loading.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0015-nv50-defer-FP-attribute-loading.patch"

From fcd949f5771fe47ae1af11e53998d97fa43aa695 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 16:54:43 +0200
Subject: [PATCH] nv50: defer FP attribute loading

This might keep the number of used TEMPs down.
---
 src/gallium/drivers/nv50/nv50_program.c |   59 ++++++++++++++++++++-----------
 1 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 28a9f2a..249f069 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -132,6 +132,7 @@ struct nv50_pc {
 
 	boolean allow32;
 	boolean join_on;
+	boolean preload;
 };
 
 static inline void
@@ -1242,6 +1243,23 @@ convert_to_long(struct nv50_pc *pc, struct nv50_program_exec *e)
 	e->inst[1] |= q;
 }
 
+static void
+load_interpolant(struct nv50_pc *pc, struct nv50_reg *r)
+{
+	struct nv50_reg *iv = pc->iv_p;
+	int rhw = r->rhw;
+
+	if (pc->interp_mode[r->index] & INTERP_CENTROID)
+		iv = pc->iv_c;
+
+	r->rhw = -1;
+	alloc_reg(pc, r);
+	r->rhw = rhw;
+
+	if (pc->preload)
+		emit_interp(pc, r, iv, pc->interp_mode[r->index]);
+}
+
 static boolean
 negate_supported(const struct tgsi_full_instruction *insn, int i)
 {
@@ -1297,6 +1315,8 @@ tgsi_src(struct nv50_pc *pc, int chan, const struct tgsi_full_src_register *src,
 		switch (src->SrcRegister.File) {
 		case TGSI_FILE_INPUT:
 			r = &pc->attr[src->SrcRegister.Index * 4 + c];
+			if (r->hw == -1 && r->rhw >= 0)
+				load_interpolant(pc, r);
 			break;
 		case TGSI_FILE_TEMPORARY:
 			r = &pc->temp[src->SrcRegister.Index * 4 + c];
@@ -1416,6 +1436,8 @@ nv50_program_tx_insn(struct nv50_pc *pc, const union tgsi_full_token *tok)
 	if (*pp_rtmp && (*pp_rtmp)->type != P_TEMP && (nr_dst > 1 || sat))
 		pp_rtmp = &temp;
 
+	pc->preload = (inst->Instruction.Opcode != TGSI_OPCODE_TXP);
+
 	for (i = 0; i < inst->Instruction.NumSrcRegs; i++) {
 		const struct tgsi_full_src_register *fs =
 			&inst->FullSrcRegisters[i];
@@ -1860,18 +1882,15 @@ prep_inspect_insn(struct nv50_pc *pc, const union tgsi_full_token *tok,
 }
 
 static unsigned
-load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
+prep_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *p_mid,
 	       int *aid, int *p_oid)
 {
-	struct nv50_reg *iv;
-	int oid, c, n;
+	int c, n, oid = *p_oid, mid = *p_mid;
 	unsigned mask = 0;
 
-	iv = (pc->interp_mode[i] & INTERP_CENTROID) ? pc->iv_c : pc->iv_p;
-
 	for (c = 0, n = i * 4; c < 4; c++, n++) {
-		oid = (*p_oid)++;
 		pc->attr[n].type = P_TEMP;
+		pc->attr[n].hw = -1;
 		pc->attr[n].index = i;
 
 		if (pc->attr[n].acc == acc[n])
@@ -1879,17 +1898,15 @@ load_fp_attrib(struct nv50_pc *pc, int i, unsigned *acc, int *mid,
 		mask |= (1 << c);
 
 		pc->attr[n].acc = acc[n];
-		pc->attr[n].rhw = pc->attr[n].hw = -1;
-		alloc_reg(pc, &pc->attr[n]);
-
 		pc->attr[n].rhw = (*aid)++;
-		emit_interp(pc, &pc->attr[n], iv, pc->interp_mode[i]);
 
-		pc->p->cfg.fp.map[(*mid) / 4] |= oid << (8 * ((*mid) % 4));
-		(*mid)++;
+		pc->p->cfg.fp.map[mid / 4] |= (oid + c) << (8 * (mid % 4));
+		mid++;
 		pc->p->cfg.fp.regs[1] += 0x00010001;
 	}
 
+	*p_mid = mid;
+	*p_oid = oid + 4;
 	return mask;
 }
 
@@ -2063,7 +2080,7 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			if (fcrd != 0xffff) {
 				unsigned mask;
 				oid = mid = 0;
-				mask = load_fp_attrib(pc, fcrd, r_usage[1],
+				mask = prep_fp_attrib(pc, fcrd, r_usage[1],
 						      &mid, &aid, &oid);
 				pc->p->cfg.fp.regs[1] |= (mask << 24);
 				pc->p->cfg.fp.map[0] += 0x04040404 * fcrd;
@@ -2103,10 +2120,10 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			i = mid;
 
 			if (fcol[0] != 0xffff)
-				load_fp_attrib(pc, fcol[0], r_usage[1],
+				prep_fp_attrib(pc, fcol[0], r_usage[1],
 					       &mid, &aid, &oid);
 			if (fcol[1] != 0xffff)
-				load_fp_attrib(pc, fcol[1], r_usage[1],
+				prep_fp_attrib(pc, fcol[1], r_usage[1],
 					       &mid, &aid, &oid);
 
 			/* set count of mapped color components */
@@ -2115,14 +2132,9 @@ nv50_program_tx_prep(struct nv50_pc *pc)
 			/* reset oid and load remaining attrs */
 			oid = (fcrd == 0xffff) ? 4 : 0;
 			for (i = 0; i < pc->attr_nr; i++)
-				load_fp_attrib(pc, i, r_usage[1],
+				prep_fp_attrib(pc, i, r_usage[1],
 					       &mid, &aid, &oid);
 
-			if (pc->iv_p)
-				free_temp(pc, pc->iv_p);
-			if (pc->iv_c)
-				free_temp(pc, pc->iv_c);
-
 			pc->p->cfg.fp.high_map = mid;
 		} else {
 			/* vertex program */
@@ -2228,6 +2240,11 @@ free_nv50_pc(struct nv50_pc *pc)
 	if (pc->temp)
 		FREE(pc->temp);
 
+	if (pc->iv_p)
+		free_temp(pc, pc->iv_p);
+	if (pc->iv_c)
+		free_temp(pc, pc->iv_c);
+
 	FREE(pc);
 }
 
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain;
 name="0016-nv50-update-comments.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0016-nv50-update-comments.patch"

From 1acebc04bb3c0fd562763a777217f88f828be626 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sun, 21 Jun 2009 17:11:40 +0200
Subject: [PATCH] nv50: update comments

---
 src/gallium/drivers/nv50/nv50_program.c |   92 ++++++++++++++-----------------
 1 files changed, 41 insertions(+), 51 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
index 249f069..4b05075 100644
--- a/src/gallium/drivers/nv50/nv50_program.c
+++ b/src/gallium/drivers/nv50/nv50_program.c
@@ -36,42 +36,57 @@
 
 /* ARL - gallium craps itself on progs/vp/arl.txt
  *
- * MSB - Like MAD, but MUL+SUB
- * 	- Fuck it off, introduce a way to negate args for ops that
- * 	  support it.
- *
- * Look into inlining IMMD for ops other than MOV (make it general?)
+ * Look into inlining IMMD for ops other than MOV (make it general ?)
  * 	- Maybe even relax restrictions a bit, can't do P_RESULT + P_IMMD,
- * 	  but can emit to P_TEMP first - then MOV later. NVIDIA does this
+ * 	  but can emit to P_TEMP first - then MOV later. NVIDIA does this.
  *
  * In ops such as ADD it's possible to construct a bad opcode in the !is_long()
  * case, if the emit_src() causes the inst to suddenly become long.
  *
- * Verify half-insns work where expected - and force disable them where they
- * don't work - MUL has it forcibly disabled atm as it fixes POW..
+ * Verify half-insns work where expected - if they are used, they have to
+ * come in pairs. We cannot branch to between two half insns.
  *
- * FUCK! watch dst==src vectors, can overwrite components that are needed.
- * 	ie. SUB R0, R0.yzxw, R0
+ * Watch dst == src vectors, can overwrite components that are needed:
+ *	p.e. SUB R0, R0.yzxw, R0
+ * This should mostly be taken care of (if maybe not optimally) now,
+ * some cases (notably XPD) may still be bad though.
  *
  * Things to check with renouveau:
- * 	FP attr/result assignment - how?
- * 		attrib
- * 			- 0x16bc maps vp output onto fp hpos
- * 			- 0x16c0 maps vp output onto fp col0
- * 		result
- * 			- colr always 0-3
- * 			- depr always 4
- * 0x16bc->0x16e8 --> some binding between vp/fp regs
- * 0x16b8 --> VP output count
+ *	FP results: can DEPR be mapped to another registers
+ *	(currently it goes after all color outputs)
+ *
+ * 1298 = 0x00000004; or 0x00000005 if DEPR is written
+ *
+ * 19a8 = 0x00000000
+ *	| 0x00000100 if DEPR is written
+ *	| 0x00100000 if KIL is used
+ *
+ * 196c = 0x00000000
+ *	| 0x00000011 if DEPR is used
+ *
+ * 1510 = bitmask to enable clipping planes
+ * 1688 = two-sided lighting enable
+ * 16ac = entry count of mapping table at [16bc]
+ * 16b0 = count of temporaries used in VP
+ *
+ * 1904 = 0x01CCBBFF (01 is sometimes 00 - ?)
+ *	CC = number of color components in map (primary + secondary)
+ *	BB = first back color's map index (colors should be contiguous)
+ *	FF = first front color's map index
  *
- * 0x1298 --> "MOV rcol.x, fcol.y" "MOV depr, fcol.y" = 0x00000005
- * 	      "MOV rcol.x, fcol.y" = 0x00000004
- * 0x19a8 --> as above but 0x00000100 and 0x00000000
- * 	- 0x00100000 used when KIL used
- * 0x196c --> as above but 0x00000011 and 0x00000000
+ * 1908 = 0x0000HHLL
+ *	LL = first clipping distance map index (4 if no UCPs)
+ *	HH = last clipping distance map index + 1 (0 if no UCPs)
  *
- * 0x1988 --> 0xXXNNNNNN
- * 	- XX == FP high something
+ * 1910 = 0x00000SSe
+ *	 e = enable point size output (0 / 1)
+ *	SS = point size map index (0 if disabled)
+ *
+ * 1988 = 0xMMIInnii
+ *	MM = bitmask to un-mask masked VP/GP outputs (i.e. HPOS, generic ?)
+ *	nn = map index of first non-masked output, where to put front color
+ *	II = count of non-masked interpolants
+ *	ii = almost always equal to II (except if II -> 00, why ?)
  */
 struct nv50_reg {
 	enum {
@@ -2705,31 +2720,6 @@ program_del_linkage(struct nv50_linkage *ln)
 	FREE(ln);
 }
 
-/*
- * 1510 = bitmask to enable clipping planes
- * 1688 = two-sided lighting enable
- * 16ac = entry count of mapping table at [16bc]
- * 16b0 = count of temporaries used in VP
- *
- * 1904 = 0x01CCBBFF (01 is sometimes 00 - ?)
- *	CC = number of color components in map (primary + secondary)
- *	BB = first back color's map index (colors should be contiguous)
- *	FF = first front color's map index
- *
- * 1908 = 0x0000HHLL
- *	LL = first clipping distance map index (4 if no UCPs)
- *	HH = last clipping distance map index + 1 (0 if no UCPs)
- *
- * 1910 = 0x00000SSe
- *	 e = enable point size output (0 / 1)
- *	SS = point size map index (0 if disabled)
- *
- * 1988 = 0xMMIInnii
- *	MM = bitmask to un-mask masked VP/GP outputs (i.e. HPOS, generic ?)
- *	nn = map index of first non-masked output, where to put front color
- *	II = count of non-masked interpolants
- *	ii = almost always equal to II (except if II -> 00, why ?)
- */
 static struct nv50_linkage *
 nv50_linkage_create(struct nv50_context *nv50)
 {
-- 
1.6.0.6


--------------090503050107050804030002
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090503050107050804030002--
