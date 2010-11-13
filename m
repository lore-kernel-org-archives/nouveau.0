From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: [PATCH] mesa: nouveau/nvfx primitive restart
Date: Sat, 13 Nov 2010 11:20:06 +0100
Message-ID: <20101113112006.e161abe1.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart=_Sat__13_Nov_2010_11_20_06_+0100_ROVB9yMfI0OhlApy"
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

This is a multi-part message in MIME format.

--Multipart=_Sat__13_Nov_2010_11_20_06_+0100_ROVB9yMfI0OhlApy
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

As nv30/nv40 supports primitive restart in hardware, here is a patch.

I still did not manage to get piglit working to check for correctness,
so I would like to know if it's ok as is.

--=20
Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"

--Multipart=_Sat__13_Nov_2010_11_20_06_+0100_ROVB9yMfI0OhlApy
Content-Type: text/x-diff;
 name="0001-nouveau-nvfx-primitive-restart-support.patch"
Content-Disposition: attachment;
 filename="0001-nouveau-nvfx-primitive-restart-support.patch"
Content-Transfer-Encoding: 7bit

From 39edccdb5ac0d72eff8c6d0441028a5e201a002c Mon Sep 17 00:00:00 2001
From: Patrice Mandin <patmandin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 13 Nov 2010 11:07:14 +0100
Subject: [PATCH] nouveau/nvfx: primitive restart support

Signed-off-by: Patrice Mandin <patmandin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nvfx/nv30-40_3d.xml.h |    3 ++-
 src/gallium/drivers/nvfx/nvfx_push.c      |   18 ++++++------------
 src/gallium/drivers/nvfx/nvfx_screen.c    |    2 +-
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nv30-40_3d.xml.h b/src/gallium/drivers/nvfx/nv30-40_3d.xml.h
index a705a6b..3ed3e53 100644
--- a/src/gallium/drivers/nvfx/nv30-40_3d.xml.h
+++ b/src/gallium/drivers/nvfx/nv30-40_3d.xml.h
@@ -1942,7 +1942,8 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define NV30_3D_CLEAR_BUFFERS_COLOR_B				0x00000040
 #define NV30_3D_CLEAR_BUFFERS_COLOR_A				0x00000080
 
-#define NV30_3D_DO_VERTICES					0x00001dac
+#define NV30_3D_PRIMITIVE_RESTART_ENABLE			0x00001dac
+#define NV30_3D_PRIMITIVE_RESTART_INDEX				0x00001db0
 
 #define NV30_3D_LINE_STIPPLE_ENABLE				0x00001db4
 
diff --git a/src/gallium/drivers/nvfx/nvfx_push.c b/src/gallium/drivers/nvfx/nvfx_push.c
index ebf47e6..eeba225 100644
--- a/src/gallium/drivers/nvfx/nvfx_push.c
+++ b/src/gallium/drivers/nvfx/nvfx_push.c
@@ -337,6 +337,12 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 		nvfx_emit_vtx_attr(chan, nvfx->vtxelt->per_instance[i].base.idx, v, nvfx->vtxelt->per_instance[i].base.ncomp);
 	}
 
+	/* Primitive restart */
+	WAIT_RING(chan, 2);
+	OUT_RING(chan, RING_3D(NV30_3D_PRIMITIVE_RESTART_ENABLE, 2));
+	OUT_RING(chan, info->primitive_restart ? 1 : 0);
+	OUT_RING(chan, info->restart_index);
+
 	/* per-instance loop */
 	while (instances_left--) {
 		int max_verts;
@@ -367,18 +373,6 @@ nvfx_push_vbo(struct pipe_context *pipe, const struct pipe_draw_info *info)
 
 			if(max_verts >= 16)
 			{
-				/* XXX: any command a lot of times seems to (mostly) fix corruption that would otherwise happen */
-				/* this seems to cause issues on nv3x, and also be unneeded there */
-				if(nvfx->is_nv4x)
-				{
-					int i;
-					for(i = 0; i < 32; ++i)
-					{
-						OUT_RING(chan, RING_3D(0x1dac, 1));
-						OUT_RING(chan, 0);
-					}
-				}
-
 				OUT_RING(chan, RING_3D(NV30_3D_VERTEX_BEGIN_END, 1));
 				OUT_RING(chan, hw_mode);
 				done = util_split_prim_next(&s, max_verts);
diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index 8bf0907..8981377 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -78,7 +78,7 @@ nvfx_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
 	case PIPE_CAP_DEPTH_CLAMP:
 		return 0; // TODO: implement depth clamp
 	case PIPE_CAP_PRIMITIVE_RESTART:
-		return 0; // TODO: implement primitive restart
+		return 1;
 	case PIPE_CAP_SHADER_STENCIL_EXPORT:
 		return 0;
 	default:
-- 
1.7.2.3


--Multipart=_Sat__13_Nov_2010_11_20_06_+0100_ROVB9yMfI0OhlApy
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Multipart=_Sat__13_Nov_2010_11_20_06_+0100_ROVB9yMfI0OhlApy--
