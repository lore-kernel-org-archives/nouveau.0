From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [RFC PATCH] nv50: adjust blit_3d logic
Date: Thu,  6 Mar 2014 00:56:18 -0500
Message-ID: <1394085378-21376-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

---

So... this fixes a whole bunch of EXT_framebuffer_multisample tests, and the
ones that still fail appear to do so due to some resolve error, rather than
some "this is the wrong image" type errors. Perhaps it needs a 2d-style "move
coordinates over a sub-texel" logic. But I'm unclear what these vertices are,
I arrived at this through trial-and-error.

 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index dc6d628..216e667 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -1069,7 +1069,7 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
       PUSH_DATAf(push, y0);
       PUSH_DATAf(push, z);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_2F_X(0)), 2);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_x);
+      PUSH_DATAf(push, 16384/* << nv50_miptree(dst)->ms_x*/);
       PUSH_DATAf(push, 0.0f);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_3F_X(1)), 3);
       PUSH_DATAf(push, x0);
@@ -1077,7 +1077,7 @@ nv50_blit_3d(struct nv50_context *nv50, const struct pipe_blit_info *info)
       PUSH_DATAf(push, z);
       BEGIN_NV04(push, NV50_3D(VTX_ATTR_2F_X(0)), 2);
       PUSH_DATAf(push, 0.0f);
-      PUSH_DATAf(push, 16384 << nv50_miptree(dst)->ms_y);
+      PUSH_DATAf(push, 16384/* << nv50_miptree(dst)->ms_y*/);
       BEGIN_NV04(push, NV50_3D(VERTEX_END_GL), 1);
       PUSH_DATA (push, 0);
    }
-- 
1.8.3.2
