From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/3] nv50: fix layerid to be the fp input number
	rather than vp output number
Date: Tue,  4 Feb 2014 02:06:57 -0500
Message-ID: <1391497618-4275-2-git-send-email-imirkin@alum.mit.edu>
References: <1391497618-4275-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1391497618-4275-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>, mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, "10.1" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

In the tests they were the same so it didn't matter, but indications are
that this is the correct behaviour. Also take this opportunity to
(trivially) support using gl_Layer in fp.

Cc: 10.1 <mesa-stable@lists.freedesktop.org>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

No regressions in piglit. Pretty sure that rewriting some of the
gl_Layer-using tests to have gp out's would have caused failures. Also this
gets rid of C99 stuff.

 src/gallium/drivers/nouveau/nv50/nv50_program.c      |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_program.h      |  2 +-
 src/gallium/drivers/nouveau/nv50/nv50_shader_state.c | 12 +++++++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.c b/src/gallium/drivers/nouveau/nv50/nv50_program.c
index f14d3ef..e506438 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.c
@@ -104,7 +104,7 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
          prog->vp.bfc[info->out[i].si] = i;
          break;
       case TGSI_SEMANTIC_LAYER:
-         prog->gp.has_layer = true;
+         prog->gp.has_layer = TRUE;
          prog->gp.layerid = n;
          break;
       default:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_program.h b/src/gallium/drivers/nouveau/nv50/nv50_program.h
index 75de007..8c1b327 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_program.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_program.h
@@ -89,7 +89,7 @@ struct nv50_program {
    struct {
       uint32_t vert_count;
       uint8_t prim_type; /* point, line strip or tri strip */
-      bool has_layer;
+      uint8_t has_layer;
       ubyte layerid; /* hw value of layer output */
    } gp;
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
index f8b1c1b..129ed2a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_shader_state.c
@@ -346,7 +346,7 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
    struct nv50_varying dummy;
    int i, n, c, m;
    uint32_t primid = 0;
-   uint32_t layerid = vp->gp.layerid;
+   uint32_t layerid = 0;
    uint32_t psiz = 0x000;
    uint32_t interp = fp->fp.interp;
    uint32_t colors = fp->fp.colors;
@@ -405,15 +405,17 @@ nv50_fp_linkage_validate(struct nv50_context *nv50)
       case TGSI_SEMANTIC_PRIMID:
          primid = m;
          break;
+      case TGSI_SEMANTIC_LAYER:
+         layerid = m;
+         break;
       }
       m = nv50_vec4_map(map, m, lin,
                         &fp->in[i], (n < vp->out_nr) ? &vp->out[n] : &dummy);
    }
 
-   if (vp->gp.has_layer) {
-      // In GL4.x, layer can be an fp input, but not in 3.x. Make sure to add
-      // it to the output map.
-      map[m++] = layerid;
+   if (vp->gp.has_layer && !layerid) {
+      layerid = m;
+      map[m++] = vp->gp.layerid;
    }
 
    if (nv50->rast->pipe.point_size_per_vertex) {
-- 
1.8.3.2
