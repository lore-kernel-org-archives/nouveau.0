From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 1/4] nvfx: say no to stream output caps
Date: Tue, 10 Jan 2012 12:41:01 +0100
Message-ID: <1326195664-28384-2-git-send-email-dev@lynxeye.de>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326195664-28384-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

nvfx doesn't support any kind of stream out, so silence the
unused cap warnings.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nvfx/nvfx_screen.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index b4a1b3a..938d67b 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -88,8 +88,12 @@ nvfx_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
 	case PIPE_CAP_MAX_TEXEL_OFFSET:
 	case PIPE_CAP_CONDITIONAL_RENDER:
 	case PIPE_CAP_TEXTURE_BARRIER:
-                return 0;
 	case PIPE_CAP_MIXED_COLORBUFFER_FORMATS:
+	case PIPE_CAP_MAX_STREAM_OUTPUT_BUFFERS:
+	case PIPE_CAP_MAX_STREAM_OUTPUT_SEPARATE_COMPONENTS:
+	case PIPE_CAP_MAX_STREAM_OUTPUT_INTERLEAVED_COMPONENTS:
+	case PIPE_CAP_TGSI_CAN_COMPACT_VARYINGS:
+	case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
                 return 0;
 	default:
 		NOUVEAU_ERR("Warning: unknown PIPE_CAP %d\n", param);
-- 
1.7.7.5
