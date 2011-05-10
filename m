From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: A little typo in mesa git results in OpenGL 1.3 only on
 NV50 class cards
Date: Tue, 10 May 2011 03:03:36 +0300
Message-ID: <1304985816.32286.3.camel@maxim-laptop>
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
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi folks,
I noticed that latest mesa git, reports OpenGL 1.3 on my NV86 class
card.
It due to small typo in nouveau driver when support for seamless
cubemaps were added (but my card doesn't support them?).

Something like that patch fixes that issue for me.

diff --git a/src/gallium/drivers/nv50/nv50_screen.c
b/src/gallium/drivers/nv50/nv50_screen.c
index 4dad859..a5a45a6 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -89,6 +89,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen,
enum pipe_cap param)
    case PIPE_CAP_TEXTURE_SHADOW_MAP:
    case PIPE_CAP_NPOT_TEXTURES:
    case PIPE_CAP_ANISOTROPIC_FILTER:
+      return 1;
    case PIPE_CAP_SEAMLESS_CUBE_MAP:
       return nv50_screen(pscreen)->tesla->grclass >= NVA0_3D;
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:


-- 
Best regards,
        Maxim Levitsky

Visit my blog: http://maximlevitsky.wordpress.com
Warning: Above blog contains rants.
