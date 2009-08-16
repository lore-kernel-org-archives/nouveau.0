From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] nv50: fix thinko in nv50_vbo_validate
Date: Sun, 16 Aug 2009 04:14:18 +0200
Message-ID: <1250388860-11109-2-git-send-email-madman2003@gmail.com>
References: <1250388860-11109-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250388860-11109-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

---
 src/gallium/drivers/nv50/nv50_vbo.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index 17283f3..018354a 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -265,8 +265,6 @@ nv50_vbo_validate(struct nv50_context *nv50)
 
 	vtxbuf = so_new(nv50->vtxelt_nr * 4, nv50->vtxelt_nr * 2);
 	vtxfmt = so_new(nv50->vtxelt_nr + 1, 0);
-	so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(0),
-		nv50->vtxelt_nr);
 
 	for (i = 0; i < nv50->vtxelt_nr; i++) {
 		struct pipe_vertex_element *ve = &nv50->vtxelt[i];
@@ -274,6 +272,7 @@ nv50_vbo_validate(struct nv50_context *nv50)
 			&nv50->vtxbuf[ve->vertex_buffer_index];
 		struct nouveau_bo *bo = nouveau_bo(vb->buffer);
 
+		so_method(vtxfmt, tesla, NV50TCL_VERTEX_ARRAY_ATTRIB(i), 1);
 		so_data(vtxfmt, nv50_vtxeltfmt(ve->src_format) | i);
 
 		so_method(vtxbuf, tesla, NV50TCL_VERTEX_ARRAY_FORMAT(i), 3);
-- 
1.6.4
