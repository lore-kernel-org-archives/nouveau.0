From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH mesa/nvfx] fill PIPE_CAP_PRIMITIVE_RESTART and
 PIPE_CAP_SHADER_STENCIL_EXPORT
Date: Wed, 10 Nov 2010 23:10:25 +0100
Message-ID: <1289427026.2219.3.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-cSaEvSdpdLcl8mF92Z5i"
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
To: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-cSaEvSdpdLcl8mF92Z5i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Attached a trivial fix for mesa/nvfx to shut up warnings about unknown
pipe caps.

-- Lucas

--=-cSaEvSdpdLcl8mF92Z5i
Content-Disposition: attachment; filename*0=0001-nvfx-fill-PIPE_CAP_PRIMITIVE_RESTART-and-PIPE_CAP_SH.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-nvfx-fill-PIPE_CAP_PRIMITIVE_RESTART-and-PIPE_CAP_SH.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From da05bfedcf0e26c454fe227b33f20875666fdda6 Mon Sep 17 00:00:00 2001
From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date: Wed, 10 Nov 2010 23:03:03 +0100
Subject: [PATCH] nvfx: fill PIPE_CAP_PRIMITIVE_RESTART and PIPE_CAP_SHADER_STENCIL_EXPORT


Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nvfx/nvfx_screen.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index 8024800..3949cda 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -77,6 +77,10 @@ nvfx_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
 		return 1;
 	case PIPE_CAP_DEPTH_CLAMP:
 		return 0; // TODO: implement depth clamp
+	case PIPE_CAP_PRIMITIVE_RESTART:
+		return 0; // TODO: implement primitive restart
+	case PIPE_CAP_SHADER_STENCIL_EXPORT:
+		return 0;
 	default:
 		NOUVEAU_ERR("Warning: unknown PIPE_CAP %d\n", param);
 		return 0;
-- 
1.7.2.3


--=-cSaEvSdpdLcl8mF92Z5i
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-cSaEvSdpdLcl8mF92Z5i--
