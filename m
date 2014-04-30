From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nvc0: treat non-linear 2DRect textures the same
	as 2D
Date: Wed, 30 Apr 2014 00:19:15 -0400
Message-ID: <1398831555-4275-1-git-send-email-imirkin@alum.mit.edu>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This fixes textureGather(2DRect) piglit tests, and does not appear to
have any adverse effects.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not sure why the sampler would care whether it's 2D or 2DRect in the first
place. But I think the only difference between a non-linear RECT texture and a
2D one are the normalized coordinates, which are their own flag.

 src/gallium/drivers/nouveau/nvc0/nvc0_tex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c b/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c
index 765cd2d..1b11bd0 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_tex.c
@@ -173,7 +173,7 @@ nvc0_create_texture_view(struct pipe_context *pipe,
       tic[2] |= NV50_TIC_2_TARGET_2D;
       break;
    case PIPE_TEXTURE_RECT:
-      tic[2] |= NV50_TIC_2_TARGET_RECT;
+      tic[2] |= NV50_TIC_2_TARGET_2D;
       break;
    case PIPE_TEXTURE_3D:
       tic[2] |= NV50_TIC_2_TARGET_3D;
-- 
1.8.3.2
