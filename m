From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 02/12] nv50: setup scissors on
	clear_render_target/depth_stencil
Date: Tue, 20 May 2014 19:39:56 -0400
Message-ID: <1400629206-4447-3-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <e0425955@student.tuwien.ac.at>

[imirkin: add logic to also clear the "regular" scissors]
Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_surface.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
index 1f37527..6e68fb8 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
@@ -288,6 +288,14 @@ nv50_clear_render_target(struct pipe_context *pipe,
 
    PUSH_REFN(push, bo, mt->base.domain | NOUVEAU_BO_WR);
 
+   BEGIN_NV04(push, NV50_3D(SCREEN_SCISSOR_HORIZ), 2);
+   PUSH_DATA (push, ( width << 16) | dstx);
+   PUSH_DATA (push, (height << 16) | dsty);
+   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
+   PUSH_DATA (push, 8192 << 16);
+   PUSH_DATA (push, 8192 << 16);
+   nv50->scissors_dirty |= 1;
+
    BEGIN_NV04(push, NV50_3D(RT_CONTROL), 1);
    PUSH_DATA (push, 1);
    BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(0)), 5);
@@ -325,7 +333,7 @@ nv50_clear_render_target(struct pipe_context *pipe,
                  (z << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
    }
 
-   nv50->dirty |= NV50_NEW_FRAMEBUFFER;
+   nv50->dirty |= NV50_NEW_FRAMEBUFFER | NV50_NEW_SCISSOR;
 }
 
 static void
@@ -364,6 +372,14 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
 
    PUSH_REFN(push, bo, mt->base.domain | NOUVEAU_BO_WR);
 
+   BEGIN_NV04(push, NV50_3D(SCREEN_SCISSOR_HORIZ), 2);
+   PUSH_DATA (push, ( width << 16) | dstx);
+   PUSH_DATA (push, (height << 16) | dsty);
+   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
+   PUSH_DATA (push, 8192 << 16);
+   PUSH_DATA (push, 8192 << 16);
+   nv50->scissors_dirty |= 1;
+
    BEGIN_NV04(push, NV50_3D(ZETA_ADDRESS_HIGH), 5);
    PUSH_DATAh(push, bo->offset + sf->offset);
    PUSH_DATA (push, bo->offset + sf->offset);
@@ -390,7 +406,7 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
                  (z << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
    }
 
-   nv50->dirty |= NV50_NEW_FRAMEBUFFER;
+   nv50->dirty |= NV50_NEW_FRAMEBUFFER | NV50_NEW_SCISSOR;
 }
 
 void
-- 
1.8.5.5
