From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv30,nvc0: only claim a single viewport
Date: Tue, 11 Feb 2014 00:42:26 -0500
Message-ID: <1392097346-7483-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It should be possible to make this be 16 on nvc0.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not touching nv50 since I have a patch that actually impelents support for
multiple viewports there.

 src/gallium/drivers/nouveau/nv30/nv30_screen.c | 2 ++
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index 8eee06b..c027a5f 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -84,6 +84,8 @@ nv30_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return 0;
    case PIPE_CAP_CONSTANT_BUFFER_OFFSET_ALIGNMENT:
       return 16;
+   case PIPE_CAP_MAX_VIEWPORTS:
+      return 1;
    /* nv4x capabilities */
    case PIPE_CAP_BLEND_EQUATION_SEPARATE:
    case PIPE_CAP_NPOT_TEXTURES:
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index f84c41b..28d9be2 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -175,6 +175,8 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
       return PIPE_ENDIAN_LITTLE;
    case PIPE_CAP_TGSI_VS_LAYER:
       return 0;
+   case PIPE_CAP_MAX_VIEWPORTS:
+      return 1;
    default:
       NOUVEAU_ERR("unknown PIPE_CAP %d\n", param);
       return 0;
-- 
1.8.3.2
