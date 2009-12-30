From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] Correct miptree layout for cubemaps on NV20-NV40
Date: Wed, 30 Dec 2009 20:21:04 +0100
Message-ID: <1262200864.3768.17.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

It seems that the current miptree layout is incorrect because the size
of all the levels of each cube map face must be 64-byte aligned.
This patch fixes piglit cubemap and fbo-cubemap which were broken.
This makes sense since otherwise all the levels would no longer be
64-byte aligned, which the GPU needs for 2D/3D targets.
Note that bin/cubemap and bin/fbo-cubemap still report errors on 2x2 and
1x1 mipmap levels but they also report some of them with softpipe and
swrast.
---
 src/gallium/drivers/nv20/nv20_miptree.c |    1 +
 src/gallium/drivers/nv30/nv30_miptree.c |    1 +
 src/gallium/drivers/nv40/nv40_miptree.c |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv20/nv20_miptree.c b/src/gallium/drivers/nv20/nv20_miptree.c
index 8f7538e..ad61217 100644
--- a/src/gallium/drivers/nv20/nv20_miptree.c
+++ b/src/gallium/drivers/nv20/nv20_miptree.c
@@ -52,6 +52,7 @@ nv20_miptree_layout(struct nv20_miptree *nv20mt)
 
 		nv20mt->level[l].image_offset[f] = offset;
 		offset += nv20mt->level[l].pitch * u_minify(pt->height0, l);
+		offset = align(offset, 64);
 	}
 
 	nv20mt->total_size = offset;
diff --git a/src/gallium/drivers/nv30/nv30_miptree.c b/src/gallium/drivers/nv30/nv30_miptree.c
index 8fbba38..9850de8 100644
--- a/src/gallium/drivers/nv30/nv30_miptree.c
+++ b/src/gallium/drivers/nv30/nv30_miptree.c
@@ -54,6 +54,7 @@ nv30_miptree_layout(struct nv30_miptree *nv30mt)
 
 		nv30mt->level[l].image_offset[f] = offset;
 		offset += nv30mt->level[l].pitch * u_minify(pt->height0, l);
+		offset = align(offset, 64);
 	}
 
 	nv30mt->total_size = offset;
diff --git a/src/gallium/drivers/nv40/nv40_miptree.c b/src/gallium/drivers/nv40/nv40_miptree.c
index 89bd155..f7e8b55 100644
--- a/src/gallium/drivers/nv40/nv40_miptree.c
+++ b/src/gallium/drivers/nv40/nv40_miptree.c
@@ -56,6 +56,7 @@ nv40_miptree_layout(struct nv40_miptree *mt)
 
 		mt->level[l].image_offset[f] = offset;
 		offset += mt->level[l].pitch * u_minify(pt->height0, l);
+		offset = align(offset, 64);
 	}
 
 	mt->total_size = offset;
-- 
1.6.3.3
