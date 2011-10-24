From: Adel Gadllah <adel.gadllah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Fix max texture levels on nv50
Date: Mon, 24 Oct 2011 19:50:18 +0200
Message-ID: <CAD5qFUnXW2c97FbOnOOBTp64+2r-gKonHQ0Oj_+PyPm0gKnxhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi,

The attached patch fixes the texture limits on nv50 to match what the
hardware is actually capable off.

-----

From: Adel Gadllah <adel.gadllah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, 24 Oct 2011 19:41:03 +0200
Subject: [PATCH] Fix max texture levels on nv50

MAX_TEXTURE_2D_LEVELS and MAX_TEXTURE_CUBE_LEVELS are supposed to be
14 not 13, while MAX_TEXTURE_3D_LEVELS should be 12 not 10.
---
 src/gallium/drivers/nv50/nv50_screen.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c
b/src/gallium/drivers/nv50/nv50_screen.c
index 0bd6057..1270c83 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -80,11 +80,11 @@ nv50_screen_get_param(struct pipe_screen *pscreen,
enum pipe_cap param)
    case PIPE_CAP_MAX_COMBINED_SAMPLERS:
       return 64;
    case PIPE_CAP_MAX_TEXTURE_2D_LEVELS:
-      return 13;
+      return 14;
    case PIPE_CAP_MAX_TEXTURE_3D_LEVELS:
-      return 10;
+      return 12;
    case PIPE_CAP_MAX_TEXTURE_CUBE_LEVELS:
-      return 13;
+      return 14;
    case PIPE_CAP_MAX_TEXTURE_ARRAY_LAYERS: /* shader support missing */
       return 0;
    case PIPE_CAP_MIN_TEXEL_OFFSET:
-- 
1.7.6.4
