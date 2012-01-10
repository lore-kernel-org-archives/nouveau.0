From: Lucas Stach <dev@lynxeye.de>
Subject: [PATCH 4/4] nvfx: random cleanups of the state
	validation code
Date: Tue, 10 Jan 2012 12:41:04 +0100
Message-ID: <1326195664-28384-5-git-send-email-dev@lynxeye.de>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 src/gallium/drivers/nvfx/nvfx_state_emit.c |   49 ++++++++++++---------------
 1 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/drivers/nvfx/nvfx_state_emit.c
index e2cfb76..a959015 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_emit.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_emit.c
@@ -200,7 +200,6 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	unsigned dirty;
 	unsigned still_dirty = 0;
 	boolean flush_tex_cache = FALSE;
-	unsigned render_temps;
 
 	if(nvfx != nvfx->screen->cur_ctx)
 	{
@@ -212,14 +211,6 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		nvfx->relocs_needed = NVFX_RELOCATE_ALL;
 	}
 
-	if(nvfx->dirty & NVFX_NEW_SAMPLER) {
-		nvfx->dirty &=~ NVFX_NEW_SAMPLER;
-		nvfx_fragtex_validate(nvfx);
-
-		// TODO: only set this if really necessary
-		flush_tex_cache = TRUE;
-	}
-
 	dirty = nvfx->dirty;
 
 	if(nvfx->render_mode == HW)
@@ -252,6 +243,13 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		}
 	}
 
+	if(dirty & NVFX_NEW_SAMPLER) {
+		nvfx_fragtex_validate(nvfx);
+
+		// TODO: only set this if really necessary
+		flush_tex_cache = TRUE;
+	}
+
 	if(dirty & NVFX_NEW_RAST)
 		sb_emit(chan, nvfx->rasterizer->sb, nvfx->rasterizer->sb_len);
 
@@ -264,10 +262,13 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
        if(nvfx->dirty & (NVFX_NEW_UCP | NVFX_NEW_RAST))
 	       nvfx_ucp_validate(nvfx);
 
-	if(nvfx->use_vp_clipping && (nvfx->dirty & (NVFX_NEW_UCP | NVFX_NEW_VERTPROG | NVFX_NEW_RAST)))
+	if(nvfx->use_vp_clipping && (nvfx->dirty &
+			                     (NVFX_NEW_UCP | NVFX_NEW_VERTPROG |
+			                      NVFX_NEW_RAST)))
 		nvfx_vertprog_ucp_validate(nvfx);
 
-	if(dirty & (NVFX_NEW_FRAGPROG | NVFX_NEW_FRAGCONST | NVFX_NEW_VERTPROG | NVFX_NEW_SPRITE))
+	if(dirty & (NVFX_NEW_FRAGPROG | NVFX_NEW_FRAGCONST |
+			    NVFX_NEW_VERTPROG | NVFX_NEW_SPRITE))
 	{
 		nvfx_fragprog_validate(nvfx);
 		if(dirty & NVFX_NEW_FRAGPROG)
@@ -302,11 +303,7 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	if(dirty & NVFX_NEW_SR)
 		nvfx_state_sr_validate(nvfx);
 
-/* All these dependencies are wrong, but otherwise
-   etracer, neverball, foobillard, glest totally misrender
-   TODO: find the right fix
-*/
-	if(dirty & (NVFX_NEW_VIEWPORT | NVFX_NEW_RAST | NVFX_NEW_ZSA))
+	if(dirty & NVFX_NEW_VIEWPORT)
 	{
 		nvfx_state_viewport_validate(nvfx);
 	}
@@ -314,23 +311,21 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 	if(dirty & (NVFX_NEW_ZSA | NVFX_NEW_FB))
 	{
 		BEGIN_RING(chan, eng3d, NV30_3D_DEPTH_WRITE_ENABLE, 2);
-		OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.writemask);
-	    OUT_RING(chan, nvfx->framebuffer.zsbuf && nvfx->zsa->pipe.depth.enabled);
+		OUT_RING(chan, nvfx->framebuffer.zsbuf &&
+                       nvfx->zsa->pipe.depth.writemask);
+	    OUT_RING(chan, nvfx->framebuffer.zsbuf &&
+                       nvfx->zsa->pipe.depth.enabled);
 	}
 
 	if(dirty & (NVFX_NEW_FRAGPROG | NVFX_NEW_FB))
 		nvfx_coord_conventions_validate(nvfx);
 
-	if(flush_tex_cache)
+	if(flush_tex_cache && nvfx->is_nv4x)
 	{
-		// TODO: what about nv30?
-		if(nvfx->is_nv4x)
-		{
-			BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
-			OUT_RING(chan, 2);
-			BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
-			OUT_RING(chan, 1);
-		}
+		BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
+		OUT_RING(chan, 2);
+		BEGIN_RING(chan, eng3d, NV40_3D_TEX_CACHE_CTL, 1);
+		OUT_RING(chan, 1);
 	}
 
 	nvfx->dirty = dirty & still_dirty;
-- 
1.7.7.5
