From: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Small patch for nv50_vbo.c
Date: Mon, 19 Oct 2020 10:53:23 +0300
Message-ID: <202010191053.23735.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi all!

I saw TODO comment in nv50_vbo.c and decided to look at similar file, nvc0_vbo.c. I copied those two lines into nv50 with slight name change (nvc0->nv50) and apparently it doesn't fix any OpenGL app I have, but does not broke them further (I have compute pacthes currently applied, so some breakage expected).

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 8d1c8c7665b..29b63a525aa 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -189,8 +189,12 @@ nv50_user_vbuf_range(struct nv50_context *nv50, unsigned vbi,
    assert(vbi < PIPE_MAX_ATTRIBS);
    if (unlikely(nv50->vertex->instance_bufs & (1 << vbi))) {
       /* TODO: use min and max instance divisor to get a proper range */
-      *base = 0;
-      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
+      const uint32_t div = nv50->vertex->min_instance_div[vbi];
+      *base = nv50->instance_off * nv50->vtxbuf[vbi].stride;
+      *size = (nv50->instance_max / div) * nv50->vtxbuf[vbi].stride +
+         nv50->vertex->vb_access_size[vbi];
+//      *base = 0;
+//      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
    } else {
       /* NOTE: if there are user buffers, we *must* have index bounds */
       assert(nv50->vb_elt_limit != ~0);

Does this look correct?
