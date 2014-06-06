From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/3] nvc0: don't bother trying to set up compute
	for gk110+
Date: Fri,  6 Jun 2014 15:43:43 -0400
Message-ID: <1402083823-23828-3-git-send-email-imirkin@alum.mit.edu>
References: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402083823-23828-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The nouveau fw currently prints a bunch of errors. No point in seeing
those all the time, esp since compute doesn't really work in the first
place.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_screen.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
index 0537542..3e6b011 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
@@ -171,7 +171,7 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_VERTEX_ELEMENT_SRC_OFFSET_4BYTE_ALIGNED_ONLY:
       return 0;
    case PIPE_CAP_COMPUTE:
-      return (class_3d >= NVE4_3D_CLASS) ? 1 : 0;
+      return (class_3d == NVE4_3D_CLASS) ? 1 : 0;
    case PIPE_CAP_PREFER_BLIT_BASED_TEXTURE_TRANSFER:
       return 1;
    case PIPE_CAP_TEXTURE_BORDER_COLOR_QUIRK:
@@ -214,7 +214,7 @@ nvc0_screen_get_shader_param(struct pipe_screen *pscreen, unsigned shader,
    case PIPE_SHADER_FRAGMENT:
       break;
    case PIPE_SHADER_COMPUTE:
-      if (class_3d < NVE4_3D_CLASS)
+      if (class_3d != NVE4_3D_CLASS)
          return 0;
       break;
    default:
@@ -528,9 +528,9 @@ nvc0_screen_init_compute(struct nvc0_screen *screen)
          return nvc0_screen_compute_setup(screen, screen->base.pushbuf);
       return 0;
    case 0xe0:
+      return nve4_screen_compute_setup(screen, screen->base.pushbuf);
    case 0xf0:
    case 0x100:
-      return nve4_screen_compute_setup(screen, screen->base.pushbuf);
    case 0x110:
       return 0;
    default:
-- 
1.8.5.5
