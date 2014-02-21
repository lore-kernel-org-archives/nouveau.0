From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/4] nv30: remove unused sprite flipping parameter
Date: Fri, 21 Feb 2014 02:37:12 -0500
Message-ID: <1392968233-26889-3-git-send-email-imirkin@alum.mit.edu>
References: <1392968233-26889-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392968233-26889-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

I assume this is some left-over from nvfx -> nv30? That flag certainly doesn't
do anything now...

 src/gallium/drivers/nouveau/nv30/nv30_context.h  | 3 +--
 src/gallium/drivers/nouveau/nv30/nv30_fragprog.c | 2 +-
 src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_context.h b/src/gallium/drivers/nouveau/nv30/nv30_context.h
index 864d97a..6dfab38 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_context.h
+++ b/src/gallium/drivers/nouveau/nv30/nv30_context.h
@@ -214,8 +214,7 @@ nv30_state_release(struct nv30_context *nv30);
 
 //XXX: needed to make it build, clean this up!
 void
-_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp,
-         boolean emulate_sprite_flipping);
+_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp);
 
 boolean
 _nvfx_vertprog_translate(struct nv30_context *nv30, struct nv30_vertprog *vp);
diff --git a/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c b/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
index e8acdfe..3551645 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_fragprog.c
@@ -67,7 +67,7 @@ nv30_fragprog_validate(struct nv30_context *nv30)
    int i;
 
    if (!fp->translated) {
-      _nvfx_fragprog_translate(nv30, fp, FALSE);
+      _nvfx_fragprog_translate(nv30, fp);
       if (!fp->translated)
          return;
 
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
index ae4f789..bee23eb 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
@@ -1114,8 +1114,7 @@ out_err:
 DEBUG_GET_ONCE_BOOL_OPTION(nvfx_dump_fp, "NVFX_DUMP_FP", FALSE)
 
 void
-_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp,
-         boolean emulate_sprite_flipping)
+_nvfx_fragprog_translate(struct nv30_context *nvfx, struct nv30_fragprog *fp)
 {
    struct tgsi_parse_context parse;
    struct nvfx_fpc *fpc = NULL;
-- 
1.8.3.2
